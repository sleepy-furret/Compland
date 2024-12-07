extends TextureButton

@export var text: String = "Text button"
@export var arrow_margin_from_center: int = 100
@export var arrows = false

func _ready():
	setup_text()
	show_arrows()
	set_focus_mode(FOCUS_ALL)
	

func _process(delta):
	if Engine.is_editor_hint():
		setup_text()
		show_arrows()
	if arrows == false:
		hide_arrows()
	
func setup_text():
	$RichTextLabel.bbcode_text = "[center] %s [/center]" % [text]
	
func show_arrows():
	for arrow in [$Sprite2D]:
		arrow.visible = true
		

func hide_arrows():
	$Sprite2D.visible = false

func _on_rich_text_label_focus_entered():
	show_arrows()
	arrows = true

func _on_focus_exited():
	hide_arrows()
	arrows = false
