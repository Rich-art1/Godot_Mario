tool
extends Button

export(String, FILE) var next_scene_path: = ""

func _on_SoundSettingsButton_button_up():
	get_tree().change_scene(next_scene_path)

func _get_configuration_warning() -> String:
	return "next_scene_path is null" if next_scene_path =="" else ""
