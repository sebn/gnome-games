// This file is part of GNOME Games. License: GPLv3

private class Games.GameBoyPlugin : Object, Plugin {
	private const string FINGERPRINT_PREFIX = "game-boy";
	private const string MIME_TYPE = "application/x-gameboy-rom";
	private const string MODULE_BASENAME = "libretro-game-boy.so";
	private const bool SUPPORTS_SNAPSHOTTING = true;

	public GameSource get_game_source () throws Error {
		var game_uri_adapter = new GenericSyncGameUriAdapter (game_for_uri);
		var query = new MimeTypeTrackerQuery (MIME_TYPE, game_uri_adapter);
		var connection = Tracker.Sparql.Connection.@get ();
		var source = new TrackerGameSource (connection);
		source.add_query (query);

		return source;
	}

	private static Game game_for_uri (string uri) throws Error {
		var file = File.new_for_uri (uri);
		var header = new GameBoyHeader (file);
		header.check_validity ();

		var uid = new FingerprintUid (uri, FINGERPRINT_PREFIX);
		var title = new FilenameTitle (uri);
		var icon = new DummyIcon ();
		var media = new GriloMedia (title, MIME_TYPE);
		var cover = new CompositeCover ({
			new LocalCover (uri),
			new GriloCover (media, uid)});
		var runner = new RetroRunner.with_mime_types (uri, uid, { MIME_TYPE }, MODULE_BASENAME, SUPPORTS_SNAPSHOTTING);

		return new GenericGame (title, icon, cover, runner);
	}
}

[ModuleInit]
public Type register_games_plugin (TypeModule module) {
	return typeof(Games.GameBoyPlugin);
}
