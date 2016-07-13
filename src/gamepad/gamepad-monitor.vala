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

	/**
	 * Emitted when a gamepad is unplugged
	 * @param  gamepad    The gamepad
	 */
	public signal void gamepad_unplugged (Gamepad gamepad);

	public delegate void GamepadCallback (Gamepad gamepad);

	private static HashTable<string, RawGamepad> identifier_to_raw_gamepad;
	private static HashTable<string, string> guid_to_raw_name;

	private RawGamepadMonitor raw_gamepad_monitor;

	public GamepadMonitor () {
		init_static_if_not ();

		raw_gamepad_monitor = new LinuxRawGamepadMonitor ();

		raw_gamepad_monitor.gamepad_plugged.connect (on_raw_gamepad_plugged);
		raw_gamepad_monitor.gamepad_unplugged.connect (on_raw_gamepad_unplugged);

		raw_gamepad_monitor.foreach_gamepad ((raw_gamepad) => {
			add_gamepad (raw_gamepad);
		});

	}

	private static void init_static_if_not () {
		if (identifier_to_raw_gamepad == null)
			identifier_to_raw_gamepad = new HashTable<string, RawGamepad> (str_hash, str_equal);
		if (guid_to_raw_name == null)
			guid_to_raw_name = new HashTable<string, string> (str_hash, str_equal);
	}

	/**
	 * This function allows to iterate over all gamepads
	 * @param    callback          The callback
	 */
	public void foreach_gamepad (GamepadCallback callback) {
		identifier_to_raw_gamepad.foreach ((identifier, raw_gamepad) => {
			callback (new Gamepad (raw_gamepad));
		});
	}

	private void add_gamepad (RawGamepad raw_gamepad) {
		identifier_to_raw_gamepad.replace (raw_gamepad.identifier, raw_gamepad);
		guid_to_raw_name.replace (raw_gamepad.guid.to_string (), raw_gamepad.name);
	}

	private void on_raw_gamepad_plugged (RawGamepad raw_gamepad) {
		add_gamepad (raw_gamepad);
		gamepad_plugged (new Gamepad (raw_gamepad));
	}

	private void on_raw_gamepad_unplugged (RawGamepad raw_gamepad) {
		gamepad_unplugged (new Gamepad (raw_gamepad));
		/*var raw_gamepad = identifier_to_raw_gamepad.get (identifier);
		if (raw_gamepad == null)
			return;
		guid_to_raw_name.remove (raw_gamepad.guid.to_string ());
		gamepad_unplugged (raw_gamepad.identifier, raw_gamepad.guid,
		                   MappingsManager.get_name (raw_gamepad.guid) ?? raw_gamepad.name);*/
	}
}
