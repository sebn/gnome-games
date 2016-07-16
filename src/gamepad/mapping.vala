// This file is part of GNOME Games. License: GPLv3

public class LibGamepad.Mapping : Object {
	private InputType[] buttons_type;
	private int[] buttons_value;
	private InputType[] axes_type;
	private int[] axes_value;
	private DPad[] dpads;

	public Mapping.from_sdl_string (string? mapping_string) throws MappingError {
		if (mapping_string == null)
			throw new MappingError.NOT_A_MAPPING ("The mapping string can't be null.");

		if (mapping_string == "")
			throw new MappingError.NOT_A_MAPPING ("The mapping string can't be empty.");

		var mappings = mapping_string.split (",");
		foreach (var mapping in mappings) {
			var splitted_mapping = mapping.split (":");
			if (splitted_mapping.length != 2)
				continue;

			var mapping_key = mapping.split (":")[0];
			var mapping_value = mapping.split (":")[1];
			var type = parse_input_type (mapping_key);
			if (type == InputType.INVALID) {
				if (mapping_key != "platform")
					debug ("Invalid token : %s", mapping_key);

				continue;
			}
			int parsed_key;
			switch (type) {
			case InputType.BUTTON:
				parsed_key = parse_button (mapping_key);

				break;
			case InputType.AXIS:
				parsed_key = parse_axis (mapping_key);

				break;
			default:
				continue;
			}

			switch (mapping_value[0]) {
			case 'h':
				parse_dpad_value (mapping_value, parsed_key);

				break;
			case 'b':
				parse_button_value (mapping_value, parsed_key);

				break;
			case 'a':
				parse_axis_value (mapping_value, parsed_key);

				break;
			}
		}
	}

	public MappedEvent get_dpad_mapping (int dpad_index, int dpad_axis, int dpad_value) {
		var event = MappedEvent ();
		int dpad_position;
		var dpad = dpads[dpad_index];
		if (dpad_value == 0)
			dpad_position = (dpad.axis_values[dpad_axis] + dpad_axis + 4) % 4;
		else
			dpad_position = (dpad_value + dpad_axis + 4) % 4;
		dpad.axis_values[dpad_axis] = dpad_value;
		event.type = dpad.types[dpad_position];
		switch (event.type) {
		case InputType.AXIS:
			event.axis = (StandardGamepadAxis) dpad.values[dpad_position];

			break;
		case InputType.BUTTON:
			event.button = (StandardGamepadButton) dpad.values[dpad_position];

			break;
		}

		return event;
	}

	public MappedEvent get_axis_mapping (int axis_number) {
		var event = MappedEvent ();
		event.type = axes_type[axis_number];
		switch (event.type) {
		case InputType.AXIS:
			event.axis = (StandardGamepadAxis) axes_value[axis_number];

			break;
		case InputType.BUTTON:
			event.button = (StandardGamepadButton) axes_value[axis_number];

			break;
		}

		return event;
	}

	public MappedEvent get_button_mapping (int button_number) {
		var event = MappedEvent ();
		event.type = buttons_type[button_number];
		switch (event.type) {
		case InputType.AXIS:
			event.axis = (StandardGamepadAxis) buttons_value[button_number];

			break;
		case InputType.BUTTON:
			event.button = (StandardGamepadButton) buttons_value[button_number];

			break;
		}

		return event;
	}

	private void parse_dpad_value (string mapping_value, int parsed_key) {
		var dpad_parse_array = mapping_value[1:mapping_value.length].split (".");
		var dpad_index = int.parse (dpad_parse_array[0]);
		var dpad_position_2pow = int.parse (dpad_parse_array[1]);
		int dpad_position = 0;
		while (dpad_position_2pow > 1) {
			dpad_position_2pow >>= 1;
			dpad_position++;
		}
		while (dpads.length <= dpad_index)
			dpads += new DPad ();
		dpads[dpad_index].types[dpad_position] = type;
		dpads[dpad_index].values[dpad_position] = parsed_key;
	}

	private void parse_button_value (string mapping_value, int parsed_key) {
		var button = int.parse (mapping_value[1:mapping_value.length]);
		while (buttons_type.length <= button)
			buttons_type += InputType.INVALID;
		if (buttons_value.length <= button)
			buttons_value.resize (button + 1);
		buttons_type[button] = type;
		buttons_value[button] = parsed_key;
	}

	private void parse_axis_value (string mapping_value, int parsed_key) {
		var axis = int.parse (mapping_value[1:mapping_value.length]);
		while (axes_type.length <= axis)
			axes_type += InputType.INVALID;
		if (axes_value.length <= axis)
			axes_value.resize (axis + 1);
		axes_type[axis] = type;
		axes_value[axis] = parsed_key;
	}

	public static InputType parse_input_type (string mapping_string) {
		switch (mapping_string) {
		case "leftx":
		case "lefty":
		case "rightx":
		case "righty":
			return InputType.AXIS;
		case "a":
		case "b":
		case "back":
		case "dpdown":
		case "dpleft":
		case "dpright":
		case "dpup":
		case "guide":
		case "leftshoulder":
		case "leftstick":
		case "lefttrigger":
		case "rightshoulder":
		case "rightstick":
		case "righttrigger":
		case "start":
		case "x":
		case "y":
			return InputType.BUTTON;
		default:
			return InputType.INVALID;
		}
	}

	public static StandardGamepadAxis parse_axis (string mapping_string) {
		switch (mapping_string) {
		case "leftx":
			return StandardGamepadAxis.LEFT_X;
		case "lefty":
			return StandardGamepadAxis.LEFT_Y;
		case "rightx":
			return StandardGamepadAxis.RIGHT_X;
		case "righty":
			return StandardGamepadAxis.RIGHT_Y;
		default:
			return StandardGamepadAxis.UNKNOWN;
		}
	}

	public static StandardGamepadButton parse_button (string mapping_string) {
		switch (mapping_string) {
		case "a":
			return StandardGamepadButton.A;
		case "b":
			return StandardGamepadButton.B;
		case "back":
			return StandardGamepadButton.SELECT;
		case "dpdown":
			return StandardGamepadButton.DPAD_DOWN;
		case "dpleft":
			return StandardGamepadButton.DPAD_LEFT;
		case "dpright":
			return StandardGamepadButton.DPAD_RIGHT;
		case "dpup":
			return StandardGamepadButton.DPAD_UP;
		case "guide":
			return StandardGamepadButton.HOME;
		case "leftshoulder":
			return StandardGamepadButton.SHOULDER_L;
		case "leftstick":
			return StandardGamepadButton.STICK_L;
		case "lefttrigger":
			return StandardGamepadButton.TRIGGER_L;
		case "rightshoulder":
			return StandardGamepadButton.SHOULDER_R;
		case "rightstick":
			return StandardGamepadButton.STICK_R;
		case "righttrigger":
			return StandardGamepadButton.TRIGGER_R;
		case "start":
			return StandardGamepadButton.START;
		case "x":
			return StandardGamepadButton.X;
		case "y":
			return StandardGamepadButton.Y;
		default:
			return StandardGamepadButton.UNKNOWN;
		}
	}
}
