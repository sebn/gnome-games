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

	private static SList <Gamepad> gamepads;

	private RawGamepadMonitor raw_gamepad_monitor;

	public GamepadMonitor () {
		init_static_if_not ();

		raw_gamepad_monitor = new LinuxRawGamepadMonitor ();

		raw_gamepad_monitor.gamepad_plugged.connect (on_raw_gamepad_plugged);

		raw_gamepad_monitor.foreach_gamepad ((raw_gamepad) => add_gamepad (raw_gamepad));
	}

	private static void init_static_if_not () {
		if (gamepads == null)
			gamepads = new SList <Gamepad> ();
	}

	/**
	 * This function allows to iterate over all gamepads
	 * @param    callback          The callback
	 */
	public void foreach_gamepad (GamepadCallback callback) {
		gamepads.foreach ((gamepad) => callback (gamepad));
	}

	private Gamepad add_gamepad (RawGamepad raw_gamepad) {
		var gamepad = new Gamepad (raw_gamepad);
		gamepads.append (gamepad);
		gamepad.unplugged.connect (() => gamepads.remove (gamepad));

		return gamepad;
	}

	private void on_raw_gamepad_plugged (RawGamepad raw_gamepad) {
		gamepad_plugged (add_gamepad (raw_gamepad));
	}
}
