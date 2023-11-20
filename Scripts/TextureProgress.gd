extends TextureProgress

onready var player = get_tree().get_nodes_in_group("Player")[0]

func _ready():
	player.connect("healthChanged", self, "update")
	update()

func update():
	value = player.currentHealth * 100 / player.maxHealth


