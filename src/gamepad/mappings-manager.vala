// This file is part of GNOME Games. License: GPLv3

/**
 * This class gives methods to set/update the mappings
 *
 * The client interfaces with this class primarily
 */
public class LibGamepad.MappingsManager {
	private static HashTable<string, string> names;
	private static HashTable<string, string> mappings;

	private static bool? inited;

	/**
	 * Adds mappings from a file
	 * @param file_name          The file name
	 */
	public static void add_from_file (string file_name) throws IOError {
		init_if_not ();

		var file = File.new_for_path (file_name);
		add_from_input_stream (file.read ());
	}

	/**
	 * Adds mappings from a resource path
	 * @param path          The path
	 */
	public static void add_from_resource (string path) throws IOError {
		init_if_not ();

		add_from_input_stream (resources_open_stream (path, ResourceLookupFlags.NONE));
	}

	/**
	 * Adds mappings from an InputStream
	 * @param input_stream          The input stream
	 */
	public static void add_from_input_stream (InputStream input_stream) {
		init_if_not ();

		var data_stream = new DataInputStream (input_stream);
		var mappingstr = data_stream.read_line ();
		while (mappingstr != null) {
			add_mapping (mappingstr);
			mappingstr = data_stream.read_line ();
		}
	}


	/**
	 * Adds a mapping from a string (only one gamepad)
	 */
	public static void add_mapping (string mappingstr) {
		init_if_not ();

		if (mappingstr == "" || mappingstr[0] == '#')
			return;

		if (mappingstr.index_of ("platform") == -1 || mappingstr.index_of ("platform:Linux") != -1) {
			var split = mappingstr.split (",", 3);
			names.replace (split[0], split[1]);
			mappings.replace (split[0], split[2]);
		}
	}


	/**
	 * Gets the name of a gamepad from the database
	 * @param  guid          The guid of the wanted gamepad
	 * @return The name if present in the database
	 */
	public static string? get_name (string guid) {
		init_if_not ();

		return names.get (guid);
	}


	/**
	 * Gets the current mapping from the databse
	 * @param  guid          The guid of the wanted gamepad
	 * @return The mapping if present in the database
	 */
	public static string? get_mapping (string guid) {
		init_if_not ();

		return mappings.get (guid);
	}

	private static void init_if_not () {
		if (inited == null || inited == false) {
			inited = true;
			if (names == null)
				names = new HashTable<string, string> (str_hash, str_equal);
			if (mappings == null)
				mappings = new HashTable<string, string> (str_hash, str_equal);
			MappingsManager.add_from_resource ("/org/gnome/Games/gamepads/gamecontrollerdb.txt");
		}
	}
}
