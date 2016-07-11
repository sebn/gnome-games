// This file is part of GNOME Games. License: GPLv3

public enum LibGamepad.InputType {
	AXIS,
	BUTTON,
	INVALID;

	public static uint length () {
		return InputType.INVALID + 1;
	}
}
