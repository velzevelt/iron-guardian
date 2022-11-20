extends Node

signal language_changed

var locale

func _ready() -> void:
	locale = OS.get_locale_language()
	if locale in TranslationServer.get_loaded_locales():
		TranslationServer.set_locale(locale)

func change_locale(_locale):
	TranslationServer.set_locale(_locale)
	emit_signal("language_changed")
