// This file is part of GNOME Games. License: GPLv3

[GtkTemplate (ui = "/org/gnome/Games/ui/resume-dialog.ui")]
private class Games.ResumeDialog : Gtk.Dialog {
	construct {
		use_header_bar = 1; // FIXME: Why doesn't this work from UI file?
	}
}
