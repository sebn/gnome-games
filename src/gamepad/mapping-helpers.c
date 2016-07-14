/* mapping-helpers.c generated by valac 0.32.0.45-49b63, the Vala compiler
 * generated from mapping-helpers.vala, do not modify */

/* This file is part of GNOME Games. License: GPLv3*/

#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>
#include <gobject/gvaluecollector.h>


#define LIB_GAMEPAD_TYPE_MAPPING_HELPERS (lib_gamepad_mapping_helpers_get_type ())
#define LIB_GAMEPAD_MAPPING_HELPERS(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), LIB_GAMEPAD_TYPE_MAPPING_HELPERS, LibGamepadMappingHelpers))
#define LIB_GAMEPAD_MAPPING_HELPERS_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), LIB_GAMEPAD_TYPE_MAPPING_HELPERS, LibGamepadMappingHelpersClass))
#define LIB_GAMEPAD_IS_MAPPING_HELPERS(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), LIB_GAMEPAD_TYPE_MAPPING_HELPERS))
#define LIB_GAMEPAD_IS_MAPPING_HELPERS_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), LIB_GAMEPAD_TYPE_MAPPING_HELPERS))
#define LIB_GAMEPAD_MAPPING_HELPERS_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), LIB_GAMEPAD_TYPE_MAPPING_HELPERS, LibGamepadMappingHelpersClass))

typedef struct _LibGamepadMappingHelpers LibGamepadMappingHelpers;
typedef struct _LibGamepadMappingHelpersClass LibGamepadMappingHelpersClass;
typedef struct _LibGamepadMappingHelpersPrivate LibGamepadMappingHelpersPrivate;

#define LIB_GAMEPAD_TYPE_INPUT_TYPE (lib_gamepad_input_type_get_type ())

#define LIB_GAMEPAD_TYPE_STANDARD_GAMEPAD_AXIS (lib_gamepad_standard_gamepad_axis_get_type ())

#define LIB_GAMEPAD_TYPE_STANDARD_GAMEPAD_BUTTON (lib_gamepad_standard_gamepad_button_get_type ())
typedef struct _LibGamepadParamSpecMappingHelpers LibGamepadParamSpecMappingHelpers;

struct _LibGamepadMappingHelpers {
	GTypeInstance parent_instance;
	volatile int ref_count;
	LibGamepadMappingHelpersPrivate * priv;
};

struct _LibGamepadMappingHelpersClass {
	GTypeClass parent_class;
	void (*finalize) (LibGamepadMappingHelpers *self);
};

typedef enum  {
	LIB_GAMEPAD_INPUT_TYPE_AXIS,
	LIB_GAMEPAD_INPUT_TYPE_BUTTON,
	LIB_GAMEPAD_INPUT_TYPE_INVALID
} LibGamepadInputType;

typedef enum  {
	LIB_GAMEPAD_STANDARD_GAMEPAD_AXIS_LEFT_X,
	LIB_GAMEPAD_STANDARD_GAMEPAD_AXIS_LEFT_Y,
	LIB_GAMEPAD_STANDARD_GAMEPAD_AXIS_RIGHT_X,
	LIB_GAMEPAD_STANDARD_GAMEPAD_AXIS_RIGHT_Y
} LibGamepadStandardGamepadAxis;

typedef enum  {
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_A,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_B,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_X,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_Y,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_SHOULDER_L,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_SHOULDER_R,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_TRIGGER_L,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_TRIGGER_R,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_SELECT,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_START,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_STICK_L,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_STICK_R,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_DPAD_UP,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_DPAD_DOWN,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_DPAD_LEFT,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_DPAD_RIGHT,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_HOME,
	LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_UNKNOWN
} LibGamepadStandardGamepadButton;

struct _LibGamepadParamSpecMappingHelpers {
	GParamSpec parent_instance;
};


static gpointer lib_gamepad_mapping_helpers_parent_class = NULL;

gpointer lib_gamepad_mapping_helpers_ref (gpointer instance);
void lib_gamepad_mapping_helpers_unref (gpointer instance);
GParamSpec* lib_gamepad_param_spec_mapping_helpers (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags);
void lib_gamepad_value_set_mapping_helpers (GValue* value, gpointer v_object);
void lib_gamepad_value_take_mapping_helpers (GValue* value, gpointer v_object);
gpointer lib_gamepad_value_get_mapping_helpers (const GValue* value);
GType lib_gamepad_mapping_helpers_get_type (void) G_GNUC_CONST;
enum  {
	LIB_GAMEPAD_MAPPING_HELPERS_DUMMY_PROPERTY
};
GType lib_gamepad_input_type_get_type (void) G_GNUC_CONST;
LibGamepadInputType lib_gamepad_mapping_helpers_map_type (const gchar* str);
gint lib_gamepad_mapping_helpers_map_value (const gchar* str);
GType lib_gamepad_standard_gamepad_axis_get_type (void) G_GNUC_CONST;
GType lib_gamepad_standard_gamepad_button_get_type (void) G_GNUC_CONST;
LibGamepadMappingHelpers* lib_gamepad_mapping_helpers_new (void);
LibGamepadMappingHelpers* lib_gamepad_mapping_helpers_construct (GType object_type);
static void lib_gamepad_mapping_helpers_finalize (LibGamepadMappingHelpers* obj);


LibGamepadInputType lib_gamepad_mapping_helpers_map_type (const gchar* str) {
	LibGamepadInputType result = 0;
	const gchar* _tmp0_ = NULL;
	const gchar* _tmp1_ = NULL;
	GQuark _tmp3_ = 0U;
	static GQuark _tmp2_label0 = 0;
	static GQuark _tmp2_label1 = 0;
	static GQuark _tmp2_label2 = 0;
	static GQuark _tmp2_label3 = 0;
	static GQuark _tmp2_label4 = 0;
	static GQuark _tmp2_label5 = 0;
	static GQuark _tmp2_label6 = 0;
	static GQuark _tmp2_label7 = 0;
	static GQuark _tmp2_label8 = 0;
	static GQuark _tmp2_label9 = 0;
	static GQuark _tmp2_label10 = 0;
	static GQuark _tmp2_label11 = 0;
	static GQuark _tmp2_label12 = 0;
	static GQuark _tmp2_label13 = 0;
	static GQuark _tmp2_label14 = 0;
	static GQuark _tmp2_label15 = 0;
	static GQuark _tmp2_label16 = 0;
	static GQuark _tmp2_label17 = 0;
	static GQuark _tmp2_label18 = 0;
	static GQuark _tmp2_label19 = 0;
	static GQuark _tmp2_label20 = 0;
	g_return_val_if_fail (str != NULL, 0);
	_tmp0_ = str;
	_tmp1_ = _tmp0_;
	_tmp3_ = (NULL == _tmp1_) ? 0 : g_quark_from_string (_tmp1_);
	if ((((_tmp3_ == ((0 != _tmp2_label0) ? _tmp2_label0 : (_tmp2_label0 = g_quark_from_static_string ("leftx")))) || (_tmp3_ == ((0 != _tmp2_label1) ? _tmp2_label1 : (_tmp2_label1 = g_quark_from_static_string ("lefty"))))) || (_tmp3_ == ((0 != _tmp2_label2) ? _tmp2_label2 : (_tmp2_label2 = g_quark_from_static_string ("rightx"))))) || (_tmp3_ == ((0 != _tmp2_label3) ? _tmp2_label3 : (_tmp2_label3 = g_quark_from_static_string ("righty"))))) {
		switch (0) {
			default:
			{
				result = LIB_GAMEPAD_INPUT_TYPE_AXIS;
				return result;
			}
		}
	} else if (((((((((((((((((_tmp3_ == ((0 != _tmp2_label4) ? _tmp2_label4 : (_tmp2_label4 = g_quark_from_static_string ("a")))) || (_tmp3_ == ((0 != _tmp2_label5) ? _tmp2_label5 : (_tmp2_label5 = g_quark_from_static_string ("b"))))) || (_tmp3_ == ((0 != _tmp2_label6) ? _tmp2_label6 : (_tmp2_label6 = g_quark_from_static_string ("back"))))) || (_tmp3_ == ((0 != _tmp2_label7) ? _tmp2_label7 : (_tmp2_label7 = g_quark_from_static_string ("dpdown"))))) || (_tmp3_ == ((0 != _tmp2_label8) ? _tmp2_label8 : (_tmp2_label8 = g_quark_from_static_string ("dpleft"))))) || (_tmp3_ == ((0 != _tmp2_label9) ? _tmp2_label9 : (_tmp2_label9 = g_quark_from_static_string ("dpright"))))) || (_tmp3_ == ((0 != _tmp2_label10) ? _tmp2_label10 : (_tmp2_label10 = g_quark_from_static_string ("dpup"))))) || (_tmp3_ == ((0 != _tmp2_label11) ? _tmp2_label11 : (_tmp2_label11 = g_quark_from_static_string ("guide"))))) || (_tmp3_ == ((0 != _tmp2_label12) ? _tmp2_label12 : (_tmp2_label12 = g_quark_from_static_string ("leftshoulder"))))) || (_tmp3_ == ((0 != _tmp2_label13) ? _tmp2_label13 : (_tmp2_label13 = g_quark_from_static_string ("leftstick"))))) || (_tmp3_ == ((0 != _tmp2_label14) ? _tmp2_label14 : (_tmp2_label14 = g_quark_from_static_string ("lefttrigger"))))) || (_tmp3_ == ((0 != _tmp2_label15) ? _tmp2_label15 : (_tmp2_label15 = g_quark_from_static_string ("rightshoulder"))))) || (_tmp3_ == ((0 != _tmp2_label16) ? _tmp2_label16 : (_tmp2_label16 = g_quark_from_static_string ("rightstick"))))) || (_tmp3_ == ((0 != _tmp2_label17) ? _tmp2_label17 : (_tmp2_label17 = g_quark_from_static_string ("righttrigger"))))) || (_tmp3_ == ((0 != _tmp2_label18) ? _tmp2_label18 : (_tmp2_label18 = g_quark_from_static_string ("start"))))) || (_tmp3_ == ((0 != _tmp2_label19) ? _tmp2_label19 : (_tmp2_label19 = g_quark_from_static_string ("x"))))) || (_tmp3_ == ((0 != _tmp2_label20) ? _tmp2_label20 : (_tmp2_label20 = g_quark_from_static_string ("y"))))) {
		switch (0) {
			default:
			{
				result = LIB_GAMEPAD_INPUT_TYPE_BUTTON;
				return result;
			}
		}
	} else {
		switch (0) {
			default:
			{
				result = LIB_GAMEPAD_INPUT_TYPE_INVALID;
				return result;
			}
		}
	}
}


gint lib_gamepad_mapping_helpers_map_value (const gchar* str) {
	gint result = 0;
	const gchar* _tmp0_ = NULL;
	const gchar* _tmp1_ = NULL;
	GQuark _tmp3_ = 0U;
	static GQuark _tmp2_label0 = 0;
	static GQuark _tmp2_label1 = 0;
	static GQuark _tmp2_label2 = 0;
	static GQuark _tmp2_label3 = 0;
	static GQuark _tmp2_label4 = 0;
	static GQuark _tmp2_label5 = 0;
	static GQuark _tmp2_label6 = 0;
	static GQuark _tmp2_label7 = 0;
	static GQuark _tmp2_label8 = 0;
	static GQuark _tmp2_label9 = 0;
	static GQuark _tmp2_label10 = 0;
	static GQuark _tmp2_label11 = 0;
	static GQuark _tmp2_label12 = 0;
	static GQuark _tmp2_label13 = 0;
	static GQuark _tmp2_label14 = 0;
	static GQuark _tmp2_label15 = 0;
	static GQuark _tmp2_label16 = 0;
	static GQuark _tmp2_label17 = 0;
	static GQuark _tmp2_label18 = 0;
	static GQuark _tmp2_label19 = 0;
	static GQuark _tmp2_label20 = 0;
	g_return_val_if_fail (str != NULL, 0);
	_tmp0_ = str;
	_tmp1_ = _tmp0_;
	_tmp3_ = (NULL == _tmp1_) ? 0 : g_quark_from_string (_tmp1_);
	if (_tmp3_ == ((0 != _tmp2_label0) ? _tmp2_label0 : (_tmp2_label0 = g_quark_from_static_string ("leftx")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_AXIS_LEFT_X;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label1) ? _tmp2_label1 : (_tmp2_label1 = g_quark_from_static_string ("lefty")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_AXIS_LEFT_Y;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label2) ? _tmp2_label2 : (_tmp2_label2 = g_quark_from_static_string ("rightx")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_AXIS_RIGHT_X;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label3) ? _tmp2_label3 : (_tmp2_label3 = g_quark_from_static_string ("righty")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_AXIS_RIGHT_Y;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label4) ? _tmp2_label4 : (_tmp2_label4 = g_quark_from_static_string ("a")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_A;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label5) ? _tmp2_label5 : (_tmp2_label5 = g_quark_from_static_string ("b")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_B;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label6) ? _tmp2_label6 : (_tmp2_label6 = g_quark_from_static_string ("back")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_SELECT;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label7) ? _tmp2_label7 : (_tmp2_label7 = g_quark_from_static_string ("dpdown")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_DPAD_DOWN;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label8) ? _tmp2_label8 : (_tmp2_label8 = g_quark_from_static_string ("dpleft")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_DPAD_LEFT;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label9) ? _tmp2_label9 : (_tmp2_label9 = g_quark_from_static_string ("dpright")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_DPAD_RIGHT;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label10) ? _tmp2_label10 : (_tmp2_label10 = g_quark_from_static_string ("dpup")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_DPAD_UP;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label11) ? _tmp2_label11 : (_tmp2_label11 = g_quark_from_static_string ("guide")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_HOME;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label12) ? _tmp2_label12 : (_tmp2_label12 = g_quark_from_static_string ("leftshoulder")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_SHOULDER_L;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label13) ? _tmp2_label13 : (_tmp2_label13 = g_quark_from_static_string ("leftstick")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_STICK_L;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label14) ? _tmp2_label14 : (_tmp2_label14 = g_quark_from_static_string ("lefttrigger")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_TRIGGER_L;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label15) ? _tmp2_label15 : (_tmp2_label15 = g_quark_from_static_string ("rightshoulder")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_SHOULDER_R;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label16) ? _tmp2_label16 : (_tmp2_label16 = g_quark_from_static_string ("rightstick")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_STICK_R;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label17) ? _tmp2_label17 : (_tmp2_label17 = g_quark_from_static_string ("righttrigger")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_TRIGGER_R;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label18) ? _tmp2_label18 : (_tmp2_label18 = g_quark_from_static_string ("start")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_START;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label19) ? _tmp2_label19 : (_tmp2_label19 = g_quark_from_static_string ("x")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_X;
				return result;
			}
		}
	} else if (_tmp3_ == ((0 != _tmp2_label20) ? _tmp2_label20 : (_tmp2_label20 = g_quark_from_static_string ("y")))) {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_Y;
				return result;
			}
		}
	} else {
		switch (0) {
			default:
			{
				result = (gint) LIB_GAMEPAD_STANDARD_GAMEPAD_BUTTON_UNKNOWN;
				return result;
			}
		}
	}
}


LibGamepadMappingHelpers* lib_gamepad_mapping_helpers_construct (GType object_type) {
	LibGamepadMappingHelpers* self = NULL;
	self = (LibGamepadMappingHelpers*) g_type_create_instance (object_type);
	return self;
}


LibGamepadMappingHelpers* lib_gamepad_mapping_helpers_new (void) {
	return lib_gamepad_mapping_helpers_construct (LIB_GAMEPAD_TYPE_MAPPING_HELPERS);
}


static void lib_gamepad_value_mapping_helpers_init (GValue* value) {
	value->data[0].v_pointer = NULL;
}


static void lib_gamepad_value_mapping_helpers_free_value (GValue* value) {
	if (value->data[0].v_pointer) {
		lib_gamepad_mapping_helpers_unref (value->data[0].v_pointer);
	}
}


static void lib_gamepad_value_mapping_helpers_copy_value (const GValue* src_value, GValue* dest_value) {
	if (src_value->data[0].v_pointer) {
		dest_value->data[0].v_pointer = lib_gamepad_mapping_helpers_ref (src_value->data[0].v_pointer);
	} else {
		dest_value->data[0].v_pointer = NULL;
	}
}


static gpointer lib_gamepad_value_mapping_helpers_peek_pointer (const GValue* value) {
	return value->data[0].v_pointer;
}


static gchar* lib_gamepad_value_mapping_helpers_collect_value (GValue* value, guint n_collect_values, GTypeCValue* collect_values, guint collect_flags) {
	if (collect_values[0].v_pointer) {
		LibGamepadMappingHelpers* object;
		object = collect_values[0].v_pointer;
		if (object->parent_instance.g_class == NULL) {
			return g_strconcat ("invalid unclassed object pointer for value type `", G_VALUE_TYPE_NAME (value), "'", NULL);
		} else if (!g_value_type_compatible (G_TYPE_FROM_INSTANCE (object), G_VALUE_TYPE (value))) {
			return g_strconcat ("invalid object type `", g_type_name (G_TYPE_FROM_INSTANCE (object)), "' for value type `", G_VALUE_TYPE_NAME (value), "'", NULL);
		}
		value->data[0].v_pointer = lib_gamepad_mapping_helpers_ref (object);
	} else {
		value->data[0].v_pointer = NULL;
	}
	return NULL;
}


static gchar* lib_gamepad_value_mapping_helpers_lcopy_value (const GValue* value, guint n_collect_values, GTypeCValue* collect_values, guint collect_flags) {
	LibGamepadMappingHelpers** object_p;
	object_p = collect_values[0].v_pointer;
	if (!object_p) {
		return g_strdup_printf ("value location for `%s' passed as NULL", G_VALUE_TYPE_NAME (value));
	}
	if (!value->data[0].v_pointer) {
		*object_p = NULL;
	} else if (collect_flags & G_VALUE_NOCOPY_CONTENTS) {
		*object_p = value->data[0].v_pointer;
	} else {
		*object_p = lib_gamepad_mapping_helpers_ref (value->data[0].v_pointer);
	}
	return NULL;
}


GParamSpec* lib_gamepad_param_spec_mapping_helpers (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags) {
	LibGamepadParamSpecMappingHelpers* spec;
	g_return_val_if_fail (g_type_is_a (object_type, LIB_GAMEPAD_TYPE_MAPPING_HELPERS), NULL);
	spec = g_param_spec_internal (G_TYPE_PARAM_OBJECT, name, nick, blurb, flags);
	G_PARAM_SPEC (spec)->value_type = object_type;
	return G_PARAM_SPEC (spec);
}


gpointer lib_gamepad_value_get_mapping_helpers (const GValue* value) {
	g_return_val_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, LIB_GAMEPAD_TYPE_MAPPING_HELPERS), NULL);
	return value->data[0].v_pointer;
}


void lib_gamepad_value_set_mapping_helpers (GValue* value, gpointer v_object) {
	LibGamepadMappingHelpers* old;
	g_return_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, LIB_GAMEPAD_TYPE_MAPPING_HELPERS));
	old = value->data[0].v_pointer;
	if (v_object) {
		g_return_if_fail (G_TYPE_CHECK_INSTANCE_TYPE (v_object, LIB_GAMEPAD_TYPE_MAPPING_HELPERS));
		g_return_if_fail (g_value_type_compatible (G_TYPE_FROM_INSTANCE (v_object), G_VALUE_TYPE (value)));
		value->data[0].v_pointer = v_object;
		lib_gamepad_mapping_helpers_ref (value->data[0].v_pointer);
	} else {
		value->data[0].v_pointer = NULL;
	}
	if (old) {
		lib_gamepad_mapping_helpers_unref (old);
	}
}


void lib_gamepad_value_take_mapping_helpers (GValue* value, gpointer v_object) {
	LibGamepadMappingHelpers* old;
	g_return_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, LIB_GAMEPAD_TYPE_MAPPING_HELPERS));
	old = value->data[0].v_pointer;
	if (v_object) {
		g_return_if_fail (G_TYPE_CHECK_INSTANCE_TYPE (v_object, LIB_GAMEPAD_TYPE_MAPPING_HELPERS));
		g_return_if_fail (g_value_type_compatible (G_TYPE_FROM_INSTANCE (v_object), G_VALUE_TYPE (value)));
		value->data[0].v_pointer = v_object;
	} else {
		value->data[0].v_pointer = NULL;
	}
	if (old) {
		lib_gamepad_mapping_helpers_unref (old);
	}
}


static void lib_gamepad_mapping_helpers_class_init (LibGamepadMappingHelpersClass * klass) {
	lib_gamepad_mapping_helpers_parent_class = g_type_class_peek_parent (klass);
	((LibGamepadMappingHelpersClass *) klass)->finalize = lib_gamepad_mapping_helpers_finalize;
}


static void lib_gamepad_mapping_helpers_instance_init (LibGamepadMappingHelpers * self) {
	self->ref_count = 1;
}


static void lib_gamepad_mapping_helpers_finalize (LibGamepadMappingHelpers* obj) {
	LibGamepadMappingHelpers * self;
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, LIB_GAMEPAD_TYPE_MAPPING_HELPERS, LibGamepadMappingHelpers);
	g_signal_handlers_destroy (self);
}


GType lib_gamepad_mapping_helpers_get_type (void) {
	static volatile gsize lib_gamepad_mapping_helpers_type_id__volatile = 0;
	if (g_once_init_enter (&lib_gamepad_mapping_helpers_type_id__volatile)) {
		static const GTypeValueTable g_define_type_value_table = { lib_gamepad_value_mapping_helpers_init, lib_gamepad_value_mapping_helpers_free_value, lib_gamepad_value_mapping_helpers_copy_value, lib_gamepad_value_mapping_helpers_peek_pointer, "p", lib_gamepad_value_mapping_helpers_collect_value, "p", lib_gamepad_value_mapping_helpers_lcopy_value };
		static const GTypeInfo g_define_type_info = { sizeof (LibGamepadMappingHelpersClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) lib_gamepad_mapping_helpers_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (LibGamepadMappingHelpers), 0, (GInstanceInitFunc) lib_gamepad_mapping_helpers_instance_init, &g_define_type_value_table };
		static const GTypeFundamentalInfo g_define_type_fundamental_info = { (G_TYPE_FLAG_CLASSED | G_TYPE_FLAG_INSTANTIATABLE | G_TYPE_FLAG_DERIVABLE | G_TYPE_FLAG_DEEP_DERIVABLE) };
		GType lib_gamepad_mapping_helpers_type_id;
		lib_gamepad_mapping_helpers_type_id = g_type_register_fundamental (g_type_fundamental_next (), "LibGamepadMappingHelpers", &g_define_type_info, &g_define_type_fundamental_info, 0);
		g_once_init_leave (&lib_gamepad_mapping_helpers_type_id__volatile, lib_gamepad_mapping_helpers_type_id);
	}
	return lib_gamepad_mapping_helpers_type_id__volatile;
}


gpointer lib_gamepad_mapping_helpers_ref (gpointer instance) {
	LibGamepadMappingHelpers* self;
	self = instance;
	g_atomic_int_inc (&self->ref_count);
	return instance;
}


void lib_gamepad_mapping_helpers_unref (gpointer instance) {
	LibGamepadMappingHelpers* self;
	self = instance;
	if (g_atomic_int_dec_and_test (&self->ref_count)) {
		LIB_GAMEPAD_MAPPING_HELPERS_GET_CLASS (self)->finalize (self);
		g_type_free_instance ((GTypeInstance *) self);
	}
}



