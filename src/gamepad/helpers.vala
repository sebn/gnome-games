// This file is part of GNOME Games. License: GPLv3

namespace LibGamepad {
	private const int GUID_LENGTH = 8;

	private string uint16s_to_hex_string (uint16[] data)
	               requires (data.length == GUID_LENGTH)
	{
		const string hex_to_ascii_map = "0123456789abcdef";

		var builder = new StringBuilder ();
		foreach (uint16 el in data) {
			uint8 c = (uint8) el;
			builder.append_unichar (hex_to_ascii_map[c >> 4]);
			builder.append_unichar (hex_to_ascii_map[c & 0x0F]);

			c = (uint8) (el >> 8);
			builder.append_unichar (hex_to_ascii_map[c >> 4]);
			builder.append_unichar (hex_to_ascii_map[c & 0x0F]);
		}
		return builder.str;
	}
}
