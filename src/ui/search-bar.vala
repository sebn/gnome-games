// This file is part of GNOME Games. License: GPLv3

[GtkTemplate (ui = "/org/gnome/Games/ui/search-bar.ui")]
private class Games.SearchBar : Gtk.SearchBar {
	public string text { private set; get; }

	[GtkChild]
	private Gtk.SearchEntry entry;

	[GtkCallback]
	private void on_search_mode_notify () {
		entry.text = "";
	}

	[GtkCallback]
	private void on_search_changed () {
		text = entry.text;
	}

	[GtkCallback]
	private void on_search_activated () {
		text = entry.text;
	}
}
