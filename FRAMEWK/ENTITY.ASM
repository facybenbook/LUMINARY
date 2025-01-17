; ============================================================================================
; LUMINARY - a game engine and framework for the SEGA Mega Drive
; ============================================================================================
; Matt Phillips - Big Evil Corporation Ltd - 4th August 2019
; ============================================================================================
; ENTITY.ASM - Component based entity system
; ============================================================================================

PHYSICS_FLAG_NOCOLLISION                equ 4
SPRITE_FLAG_FLIP_X                      equ 3

    ENTITY_COMPONENT_BEGIN PhysicsBody
PhysicsBody_VelocityX                   rs.l 1
PhysicsBody_VelocityY                   rs.l 1
PhysicsBody_Flags                       rs.b 1
    ENTITY_COMPONENT_END

    ENTITY_COMPONENT_BEGIN SpriteComp
SpriteComp_VRAMHndl                     rs.l 1
SpriteComp_DrawFlags                    rs.w 1
SpriteComp_Layout                       rs.b 1
    ENTITY_COMPONENT_END

    ENTITY_BEGIN Player
	ENT_COMPONENT PhysicsBody
    ENT_COMPONENT SpriteComp
    ENTITY_END

PseudoUpdate:

    ENT_GETCOMPONENT Player, PhysicsBody, a0, a1
    move.l #0x00010000, PhysicsBody_VelocityX(a1)
    move.l #0x00008000, PhysicsBody_VelocityX(a1)
    bset   #PHYSICS_FLAG_NOCOLLISION, PhysicsBody_Flags(a1)

    rts

PseudoRender:

    ENT_GETCOMPONENT Player, SpriteComp, a0, a1
    move.b #SPRITE_FLAG_FLIP_X, SpriteComp_DrawFlags(a1)

    rts
