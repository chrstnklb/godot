extends Area2D

signal hit

func _on_Player_body_entered(body):
    $Sprite.hide() # Player disappears after being hit.
    emit_signal("hit")
    $CollisionShape2D.disabled = true