// This file is part of GNOME Games. License: GPLv3

private class LibGamepad.DPad : Object {
	public InputType types[4];
	public int values[4];
	public int axis_values[2];

	public DPad () {
		axis_values[0] = axis_values[1] = 0;
		types[0] = types[1] = types[2] = types[3] = InputType.INVALID;
	}
}
