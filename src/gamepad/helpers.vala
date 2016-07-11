// This file is part of GNOME Games. License: GPLv3

namespace LibGamepad {
	private const int GUID_LENGTH = 8;

	private string uint16s_to_hex_string (uint16[] data)
	               requires (data.length == GUID_LENGTH)
	{
		const string k_rgchHexToASCII = "0123456789abcdef";

		var builder = new StringBuilder ();
		for (var i = 0; i < GUID_LENGTH; i++) {
			uint8 c = (uint8) data[i];
			builder.append_unichar (k_rgchHexToASCII[c >> 4]);
			builder.append_unichar (k_rgchHexToASCII[c & 0x0F]);

			c = (uint8) (data[i] >> 8);
			builder.append_unichar (k_rgchHexToASCII[c >> 4]);
			builder.append_unichar (k_rgchHexToASCII[c & 0x0F]);
		}
		return builder.str;
	}
}
