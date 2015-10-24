// This file is part of GNOME Games. License: GPLv3

private class Games.SteamRegistry {
	private struct Token {
		string label;
		uint line;
	}

	private SteamRegistryValue tree;

	public SteamRegistry (string appmanifest_path) throws Error {
		var tokens = tokenize (appmanifest_path);
		size_t index = 0;
		tree = parse_tokens (null, tokens, ref index, appmanifest_path);
	}

	public string[] get_children (string[] path) {
		SteamRegistryValue? current_value = tree;
		for (int i = 0 ; i < path.length ; i++) {
			if (current_value == null)
				return {};

			if (current_value.tag != path[i])
				return {};

			var node = current_value as SteamRegistryNode;
			if (node == null)
				return {};

			if (i < path.length -1) {
				current_value = node.get_child (path[i + 1]);
			}
			else {
				return node.get_children ();
			}
		}

		return {};
	}

	public string? get_data (string[] path) {
		SteamRegistryValue? current_value = tree;
		for (int i = 0 ; i < path.length ; i++) {
			if (current_value == null)
				return null;

			if (current_value.tag != path[i])
				return null;

			if (i < path.length -1) {
				var node = current_value as SteamRegistryNode;
				if (node == null)
					return null;

				current_value = node.get_child (path[i + 1]);
			}
			else {
				var data = current_value as SteamRegistryData;
				if (data == null)
					return null;

				return data.data;
			}
		}

		return null;
	}

	private Token[] tokenize (string appmanifest_path) throws Error {
		var file = File.new_for_path (appmanifest_path);

		if (!file.query_exists ())
			throw new IOError.NOT_FOUND ("File '%s' doesn't exist.\n", file.get_path ());

		var dis = new DataInputStream (file.read ());

		Token[] tokens = {};

		var regex = /({|}|(?:".+?"))/;

		string line;
		MatchInfo match_info;
		uint line_number = 0;
		while ((line = dis.read_line (null)) != null) {
			line_number++;

			int start_position = 0;
			while (regex.match_full (line, -1, start_position, 0, out match_info)) {
				tokens += Token () {
					label = match_info.fetch (1),
					line = line_number
				};

				int dummy = 0;
				match_info.fetch_pos (1, out dummy, out start_position);
			}
		}

		return tokens;
	}

	private SteamRegistryValue? parse_tokens (SteamRegistryNode? parent,
	                                          Token[] tokens,
	                                          ref size_t index,
	                                          string appmanifest_path)
	                                          throws SteamRegistryError {
		SteamRegistryValue? to_return = null;

		while (index < tokens.length) {
			if (tokens[index].label == "{")
				throw new SteamRegistryError.UNEXPECTED_TOKEN ("%s:%u: Unexpected token '{'", appmanifest_path, tokens[index].line);

			if (tokens[index].label == "}") {
				index++;

				continue;
			}

			var tag = tokens[index].label;
			tag = tag[1:-1]; // Remove the quotes.

			index++;

			if (index >= tokens.length)
				throw new SteamRegistryError.UNEXPECTED_END ("%s:%u: Unexpected end of tokens", appmanifest_path, tokens[index].line);

			if (tokens[index].label == "}")
				throw new SteamRegistryError.UNEXPECTED_TOKEN ("%s:%u: Unexpected token '}'", appmanifest_path, tokens[index].line);

			if (tokens[index].label == "{") {
				index++;

				var node = new SteamRegistryNode (tag);
				parse_tokens (node, tokens, ref index, appmanifest_path);

				if (parent != null)
					parent.add_child (node);
				to_return = node;
			}
			else {
				var data = tokens[index].label;
				data = data[1:-1]; // Remove the quotes.

				index++;

				var node = new SteamRegistryData (tag, data);

				if (parent != null)
					parent.add_child (node);
				to_return = node;
			}
		}

		return to_return;
	}
}

private abstract class Games.SteamRegistryValue: Object {
	public string tag { construct; get; }
}

private class Games.SteamRegistryNode: SteamRegistryValue {
	private List<SteamRegistryValue> children;

	public SteamRegistryNode (string tag) {
		Object (tag: tag);
	}

	public void add_child (SteamRegistryValue child) {
		children.append (child);
	}

	public SteamRegistryValue? get_child (string tag) {
		foreach (var child in children)
			if (child.tag == tag)
				return child;

		return null;
	}

	public string[] get_children () {
		string[] children_tags = {};
		foreach (var child in children)
			children_tags += child.tag;

		return children_tags;
	}
}

private class Games.SteamRegistryData: SteamRegistryValue {
	public string data { construct; get; }

	public SteamRegistryData (string tag, string data) {
		Object (tag: tag, data: data);
	}
}

errordomain Games.SteamRegistryError {
	UNEXPECTED_TOKEN,
	UNEXPECTED_END,
}
