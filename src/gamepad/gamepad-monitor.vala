// This file is part of GNOME Games. License: GPLv3

/**
 * This class provides a way to the client to monitor gamepads
 *
 * The client interfaces with this class primarily
 */
public class LibGamepad.GamepadMonitor : Object {
	/**
	 * Emitted when a gamepad is plugged in
	 * @param  gamepad    The gamepad
	 */
	public signal void gamepad_plugged (Gamepad gamepad);

	public delegate void GamepadCallback (Gamepad gamepad);
	public delegate void RawGamepadCallback (RawGamepad raw_gamepad);

	private static GamepadMonitor instance;

	private GenericSet<Gamepad?> gamepads;
	private GenericSet<RawGamepad?> unmapped_raw_gamepads;

	private GamepadMonitor () {
		if (gamepads == null)
			gamepads = new GenericSet<Gamepad?> (direct_hash, direct_equal);

		var raw_gamepad_monitor = LinuxRawGamepadMonitor.get_instance ();
		raw_gamepad_monitor.gamepad_plugged.connect (on_raw_gamepad_plugged);
		raw_gamepad_monitor.foreach_gamepad ((raw_gamepad) => add_gamepad (raw_gamepad));
	}

	public static GamepadMonitor get_instance () {
		if (instance == null)
			instance = new GamepadMonitor ();

		return instance;
	}

	/**
	 * This function allows to iterate over all gamepads
	 * @param    callback          The callback
	 */
	public void foreach_gamepad (GamepadCallback callback) {
		foreach (var gamepad in gamepads)
			callback (gamepad);
	}

	/**
	 * This function allows to iterate over all unmapped gamepads
	 * @param    callback          The callback
	 */
	public void foreach_unmapped_gamepad (RawGamepadCallback callback) {
		foreach (var raw_gamepad in unmapped_raw_gamepads)
			callback (raw_gamepad);
	}

	private Gamepad? add_gamepad (RawGamepad raw_gamepad) {
		try {
			var gamepad = new Gamepad (raw_gamepad);
			gamepads.add (gamepad);
			gamepad.unplugged.connect (remove_gamepad);
			return gamepad;
		} catch (MappingError e) {
			unmapped_raw_gamepads.add (raw_gamepad);
			return null;
		}
	}

	private void on_raw_gamepad_plugged (RawGamepad raw_gamepad) {
		var gamepad = add_gamepad (raw_gamepad);
		if (gamepad != null)
			gamepad_plugged (gamepad);
	}

	private void remove_gamepad (Gamepad gamepad) {
		gamepads.remove (gamepad);
	}
}
