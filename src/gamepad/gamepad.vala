// This file is part of GNOME Games. License: GPLv3

/**
 * This class represents a gamepad
 *
 * The client interfaces with this class primarily
 */
public class LibGamepad.Gamepad : Object {

	/**
	 * Emitted when a button is pressed/released
	 * @param  button        The button pressed
	 * @param  value         True if pressed, False if released
	 */
	public signal void button_event (StandardGamepadButton button, bool value);

	/**
	 * Emitted when an axis's value changes
	 * @param  axis          The axis number from 0 to axes_number
	 * @param  value         The value of the axis ranging from -1 to 1
	 */
	public signal void axis_event (StandardGamepadAxis axis, double value);

	/**
	 * Emitted when the gamepad is unplugged
	 */
	public signal void unplugged ();


	/**
	 * The name present in our database
	 */
	public string? name { get; private set; }

	/**
	 * The raw gamepad behind this gamepad
	 */
	public RawGamepad raw_gamepad { get; private set; }

	/**
	 * The mapping object
	 */
	public Mapping? mapping { get; private set; }

	public Gamepad (RawGamepad raw_gamepad) throws FileError, MappingError {
		this.raw_gamepad = raw_gamepad;
		var guid = raw_gamepad.guid;
		var mappings_manager = MappingsManager.get_instance ();
		name = mappings_manager.get_name (guid) ?? raw_gamepad.name;
		mapping = new Mapping.from_sdl_string (mappings_manager.get_mapping (guid));
		raw_gamepad.button_event.connect (on_raw_button_event);
		raw_gamepad.axis_event.connect (on_raw_axis_event);
		raw_gamepad.dpad_event.connect (on_raw_dpad_event);
		raw_gamepad.unplugged.connect (() => unplugged ());
	}

	private void on_raw_button_event (int button, bool value) {
		var event = mapping.get_button_mapping (button);
		switch (event.type) {
		case InputType.AXIS:
			axis_event (event.axis, value ? 1 : 0);

			break;
		case InputType.BUTTON:
			button_event (event.button, value);

			break;
		}
	}

	private void on_raw_axis_event (int axis, double value) {
		var event = mapping.get_axis_mapping (axis);
		switch (event.type) {
		case InputType.AXIS:
			axis_event (event.axis, value);

			break;
		case InputType.BUTTON:
			button_event (event.button, (bool) value);

			break;
		}
	}

	private void on_raw_dpad_event (int dpad_index, int axis, int value) {
		var event = mapping.get_dpad_mapping (dpad_index, axis, value);
		switch (event.type) {
		case InputType.AXIS:
			axis_event (event.axis, value.abs ());

			break;
		case InputType.BUTTON:
			button_event (event.button, (bool) value.abs ());

			break;
		}
	}
}
