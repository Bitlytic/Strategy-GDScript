class_name Hitbox 
extends Area2D

signal damaged(attack: Attack)


func damage(attack: Attack):
	damaged.emit(attack)
	print(attack.damage)
