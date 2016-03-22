// This file is part of GNOME Games. License: GPLv3

private class Games.DoomGame : Object, Game {
	private const string FINGERPRINT_PREFIX = "doom";
	private const string MODULE_BASENAME = "libretro-doom.so";

	private FingerprintUid _uid;
	public FingerprintUid uid {
		get {
			if (_uid != null)
				return _uid;

			_uid = new FingerprintUid (uri, FINGERPRINT_PREFIX);

			return _uid;
		}
	}

	private string _name;
	public string name {
		get { return _name; }
	}

	public Icon? icon {
		get { return null; }
	}

	private string uri;

	public DoomGame (string uri) throws Error {
		this.uri = uri;

		var file = File.new_for_uri (uri);
		var name = file.get_basename ();
		name = /\.(wad|WAD)$/.replace (name, name.length, 0, "");
		name = name.split ("(")[0];
		_name = name.strip ();
	}

	public Runner get_runner () throws Error {
		return new RetroRunner (MODULE_BASENAME, uri, uid);
	}
}
