// This file is part of GNOME Games. License: GPLv3

/**
 * This class gives methods to set/update the mappings
 *
 * The client interfaces with this class primarily
 */
public class LibGamepad.MappingsManager : Object {
	private HashTable<string, string> names;
	private HashTable<string, string> mappings;

	private static MappingsManager? instance;

	private MappingsManager () {
		if (names == null)
			names = new HashTable<string, string> (str_hash, str_equal);
		if (mappings == null)
			mappings = new HashTable<string, string> (str_hash, str_equal);
		add_from_resource ("/org/gnome/Games/gamepads/gamecontrollerdb.txt");
	}

	public static MappingsManager get_instance () {
		if (instance == null)
			instance = new MappingsManager ();
		return instance;
	}

	/**
	 * Adds mappings from a file
	 * @param file_name          The file name
	 */
	public void add_from_file (string file_name) throws IOError {
		var file = File.new_for_path (file_name);
		add_from_input_stream (file.read ());
	}

	/**
	 * Adds mappings from a resource path
	 * @param path          The path
	 */
	public void add_from_resource (string path) throws IOError {
		add_from_input_stream (resources_open_stream (path, ResourceLookupFlags.NONE));
	}

	/**
	 * Adds mappings from an InputStream
	 * @param input_stream          The input stream
	 */
	public void add_from_input_stream (InputStream input_stream) {
		var data_stream = new DataInputStream (input_stream);
		var mappingstr = data_stream.read_line ();
		while (mappingstr != null) {
			add_mapping (mappingstr);
			mappingstr = data_stream.read_line ();
		}
	}


	/**
	 * Adds a mapping from a SDL2 mapping string (only one gamepad)
	 */
	public void add_mapping (string mappingstr) {
		if (mappingstr == "" || mappingstr[0] == '#')
			return;

		if (mappingstr.index_of ("platform") == -1 || mappingstr.index_of ("platform:Linux") != -1) {
			var split = mappingstr.split (",", 3);
			names[split[0]] = split[1];
			mappings[split[0]] = split[2];
		}
	}


	/**
	 * Gets the name of a gamepad from the database
	 * @param  guid          The guid of the wanted gamepad
	 * @return The name if present in the database
	 */
	public string? get_name (string guid) {
		return names[guid];
	}


	/**
	 * Gets the current mapping from the databse
	 * @param  guid          The guid of the wanted gamepad
	 * @return The mapping if present in the database
	 */
	public string? get_mapping (string guid) {
		return mappings[guid];
	}
}
