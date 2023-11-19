extends TextureProgress


export (PackedScene) var playerScene

var player

func _ready():
	player = playerScene.instance()
	get_tree().call_group("Level",'add_child',player)

	player.connect("healthChanged", self, "update")
	update()

func update():
	value = player.currentHealth * 100 / player.maxHealth


