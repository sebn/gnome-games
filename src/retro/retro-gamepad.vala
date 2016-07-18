// This file is part of GNOME Games. License: GPLv3

private class Games.RetroGamepad: Object, Retro.InputDevice {
	public LibGamepad.Gamepad gamepad { get; construct; }

	private bool[] buttons;
	private int16[] axes;

	public RetroGamepad (LibGamepad.Gamepad gamepad) {
		Object (gamepad: gamepad);
	}

	construct {
		buttons = new bool[LibGamepad.StandardGamepadButton.HOME + 1];
		axes = new int16[4];

		gamepad.button_event.connect ((button, value) => buttons[button] = value);
		gamepad.axis_event.connect ((axis, value) => axes[axis] = (int16) (value * int16.MAX));
	}

	public void poll () {}

	public int16 get_input_state (Retro.DeviceType device, uint index, uint id) {
		switch (device) {
		case Retro.DeviceType.JOYPAD:
			return get_button_pressed ((Retro.JoypadId) id) ? int16.MAX : 0;
		case Retro.DeviceType.ANALOG:
			return get_analog_value ((Retro.AnalogIndex) index, (Retro.AnalogId) id);
		default:
			return 0;
		}
	}

	public Retro.DeviceType get_device_type () {
		return Retro.DeviceType.ANALOG;
	}

	public uint64 get_device_capabilities () {
		return (1 << Retro.DeviceType.JOYPAD) | (1 << Retro.DeviceType.ANALOG);
	}

	public bool get_button_pressed (Retro.JoypadId button) {
		switch (button) {
		case Retro.JoypadId.B:
			return buttons[LibGamepad.StandardGamepadButton.A];
		case Retro.JoypadId.Y:
			return buttons[LibGamepad.StandardGamepadButton.X];
		case Retro.JoypadId.SELECT:
			return buttons[LibGamepad.StandardGamepadButton.SELECT];
		case Retro.JoypadId.START:
			return buttons[LibGamepad.StandardGamepadButton.START];
		case Retro.JoypadId.UP:
			return buttons[LibGamepad.StandardGamepadButton.DPAD_UP];
		case Retro.JoypadId.DOWN:
			return buttons[LibGamepad.StandardGamepadButton.DPAD_DOWN];
		case Retro.JoypadId.LEFT:
			return buttons[LibGamepad.StandardGamepadButton.DPAD_LEFT];
		case Retro.JoypadId.RIGHT:
			return buttons[LibGamepad.StandardGamepadButton.DPAD_RIGHT];
		case Retro.JoypadId.A:
			return buttons[LibGamepad.StandardGamepadButton.B];
		case Retro.JoypadId.X:
			return buttons[LibGamepad.StandardGamepadButton.Y];
		case Retro.JoypadId.L:
			return buttons[LibGamepad.StandardGamepadButton.SHOULDER_L];
		case Retro.JoypadId.R:
			return buttons[LibGamepad.StandardGamepadButton.SHOULDER_R];
		case Retro.JoypadId.L2:
			return buttons[LibGamepad.StandardGamepadButton.TRIGGER_L];
		case Retro.JoypadId.R2:
			return buttons[LibGamepad.StandardGamepadButton.TRIGGER_R];
		case Retro.JoypadId.L3:
			return buttons[LibGamepad.StandardGamepadButton.STICK_L];
		case Retro.JoypadId.R3:
			return buttons[LibGamepad.StandardGamepadButton.STICK_R];
		default:
			return false;
		}
	}

	public int16 get_analog_value (Retro.AnalogIndex index, Retro.AnalogId id) {
		switch (index) {
		case Retro.AnalogIndex.LEFT:
			switch (id) {
			case Retro.AnalogId.X:
				return axes[LibGamepad.StandardGamepadAxis.LEFT_X];
			case Retro.AnalogId.Y:
				return axes[LibGamepad.StandardGamepadAxis.LEFT_Y];
			default:
				return 0;
			}
		case Retro.AnalogIndex.RIGHT:
			switch (id) {
			case Retro.AnalogId.X:
				return axes[LibGamepad.StandardGamepadAxis.RIGHT_X];
			case Retro.AnalogId.Y:
				return axes[LibGamepad.StandardGamepadAxis.RIGHT_Y];
			default:
				return 0;
			}
		default:
			return 0;
		}
	}
}
