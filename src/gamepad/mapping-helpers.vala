// This file is part of GNOME Games. License: GPLv3

private class LibGamepad.MappingHelpers {
	public static InputType map_type (string str) {
		switch (str) {
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

	public static int map_value (string str) {
		switch (str) {
		case "leftx":
			return StandardGamepadAxis.LEFT_X;
		case "lefty":
			return StandardGamepadAxis.LEFT_Y;
		case "rightx":
			return StandardGamepadAxis.RIGHT_X;
		case "righty":
			return StandardGamepadAxis.RIGHT_Y;
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
