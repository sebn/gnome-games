// This file is part of GNOME Games. License: GPLv3

private class LibGamepad.LinuxGuidHelpers : Object {
	public static string from_dev (Libevdev.Evdev device) {
		uint16 guid[8];
		guid[0] = (uint16) device.id_bustype.to_little_endian ();
		guid[1] = 0;
		guid[2] = (uint16) device.id_vendor.to_little_endian ();
		guid[3] = 0;
		guid[4] = (uint16) device.id_product.to_little_endian ();
		guid[5] = 0;
		guid[6] = (uint16) device.id_version.to_little_endian ();
		guid[7] = 0;
		return uint16s_to_hex_string (guid);
	}

	public static string from_file (string file_name) throws FileError {
		var fd = Posix.open (file_name, Posix.O_RDONLY | Posix.O_NONBLOCK);

		if (fd < 0)
			throw new FileError.FAILED (@"Unable to open file $file_name: $(Posix.strerror (Posix.errno))");

		var device = new Libevdev.Evdev ();
		if (device.set_fd (fd) < 0)
			throw new FileError.FAILED (@"Evdev error on opening file $file_name: $(Posix.strerror (Posix.errno))");

		var guid = from_dev (device);
		Posix.close (fd);
		return guid;
	}
}
