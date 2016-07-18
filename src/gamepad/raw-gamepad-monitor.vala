// This file is part of GNOME Games. License: GPLv3

/**
 * This is one of the interfaces that needs to be implemented by the driver.
 */
public interface LibGamepad.RawGamepadMonitor : Object {
	/**
	 * This signal should be emmited when a gamepad is plugged in.
	 * @param   raw_gamepad   The raw gamepad
	 */
	public abstract signal void gamepad_plugged (RawGamepad raw_gamepad);

	/**
	 * This function allows to iterate over all gamepads
	 * @param   callback            The callback
	 */
	public abstract void foreach_gamepad (RawGamepadCallback callback);
}
