export ScorePlum
code
proc ScorePlum 12 8
file "../../../../code/game/g_combat.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_combat.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:/*
;9:============
;10:ScorePlum
;11:============
;12:*/
;13:void ScorePlum( gentity_t *ent, vec3_t origin, int score ) {
line 16
;14:	gentity_t *plum;
;15:
;16:	plum = G_TempEntity( origin, EV_SCOREPLUM );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 65
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 18
;17:	// only send this temp entity to a single client
;18:	plum->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 19
;19:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 21
;20:	//
;21:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 22
;22:	plum->s.time = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 23
;23:}
LABELV $54
endproc ScorePlum 12 8
export AddScore
proc AddScore 4 12
line 32
;24:
;25:/*
;26:============
;27:AddScore
;28:
;29:Adds score to both the client and his team
;30:============
;31:*/
;32:void AddScore( gentity_t *ent, vec3_t origin, int score ) {
line 33
;33:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $56
line 34
;34:		return;
ADDRGP4 $55
JUMPV
LABELV $56
line 37
;35:	}
;36:	// no scoring during pre-match warmup
;37:	if ( level.warmupTime ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $58
line 38
;38:		return;
ADDRGP4 $55
JUMPV
LABELV $58
line 41
;39:	}
;40:	// show score plum
;41:	ScorePlum(ent, origin, score);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 ScorePlum
CALLV
pop
line 43
;42:	//
;43:	ent->client->ps.persistant[PERS_SCORE] += score;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 45
;44://qlone - freezetag
;45:	if ( !g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
NEI4 $61
line 47
;46://qlone - freezetag
;47:		if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $64
line 48
;48:			AddTeamScore( origin, ent->client->ps.persistant[PERS_TEAM], score );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 49
;49:		}
LABELV $64
line 50
;50:	} //qlone - freezetag
LABELV $61
line 51
;51:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 52
;52:}
LABELV $55
endproc AddScore 4 12
export TossClientItems
proc TossClientItems 36 12
line 61
;53:
;54:/*
;55:=================
;56:TossClientItems
;57:
;58:Toss the weapon and powerups for the killed player
;59:=================
;60:*/
;61:void TossClientItems( gentity_t *self ) {
line 68
;62:	gitem_t		*item;
;63:	//int			weapon; //qlone - conditional weapon toss
;64:	float		angle;
;65:	int			i;
;66:	gentity_t	*drop;
;67:
;68:	if ( g_tossWeapon.integer ) { //qlone - conditional weapon toss
ADDRGP4 g_tossWeapon+12
INDIRI4
CNSTI4 0
EQI4 $68
line 71
;69:		int weapon;
;70:		// drop the weapon if not a gauntlet or machinegun
;71:		weapon = self->s.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 77
;72:
;73:		// make a special check to see if they are changing to a new
;74:		// weapon that isn't the mg or gauntlet.  Without this, a client
;75:		// can pick up a weapon, be killed, and not drop the weapon because
;76:		// their weapon change hasn't completed yet and they are still holding the MG.
;77:		if ( weapon == WP_MACHINEGUN || weapon == WP_GRAPPLING_HOOK ) {
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $73
ADDRLP4 16
INDIRI4
CNSTI4 10
NEI4 $71
LABELV $73
line 78
;78:			if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $74
line 79
;79:				weapon = self->client->pers.cmd.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 80
;80:			}
LABELV $74
line 81
;81:			if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 16
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $76
line 82
;82:				weapon = WP_NONE;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 83
;83:			}
LABELV $76
line 84
;84:		}
LABELV $71
line 86
;85:
;86:		if ( weapon > WP_MACHINEGUN && weapon != WP_GRAPPLING_HOOK && 
ADDRLP4 16
INDIRI4
CNSTI4 2
LEI4 $78
ADDRLP4 16
INDIRI4
CNSTI4 10
EQI4 $78
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $78
line 87
;87:				self->client->ps.ammo[ weapon ] ) {
line 89
;88:			// find the item type for this weapon
;89:			item = BG_FindItemForWeapon( weapon );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 92
;90:
;91:			// spawn the item
;92:			drop = Drop_Item( self, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 32
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 95
;93:
;94:			// for pickup prediction
;95:			drop->s.time2 = item->quantity;
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 96
;96:		}
LABELV $78
line 97
;97:	} //qlone - conditional weapon toss
LABELV $68
line 101
;98:
;99:	// drop all the powerups if not in teamplay
;100://qlone - freezetag
;101:	if ( !g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
NEI4 $80
line 103
;102://qlone - freezetag
;103:	if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $81
line 104
;104:		angle = 45;
ADDRLP4 12
CNSTF4 1110704128
ASGNF4
line 105
;105:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $86
line 106
;106:			if ( self->client->ps.powerups[ i ] > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $90
line 107
;107:				item = BG_FindItemForPowerup( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 108
;108:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $93
line 109
;109:					continue;
ADDRGP4 $87
JUMPV
LABELV $93
line 111
;110:				}
;111:				drop = Drop_Item( self, item, angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 113
;112:				// decide how many seconds it has left
;113:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 114
;114:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 1
GEI4 $96
line 115
;115:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 116
;116:				}
LABELV $96
line 118
;117:				// for pickup prediction
;118:				drop->s.time2 = drop->count;
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 119
;119:				angle += 45;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 120
;120:			}
LABELV $90
line 121
;121:		}
LABELV $87
line 105
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $86
line 122
;122:	}
line 124
;123://qlone - freezetag
;124:	} else {
ADDRGP4 $81
JUMPV
LABELV $80
line 125
;125:		for ( i = 1; i < HI_NUM_HOLDABLE; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $98
line 126
;126:			if ( i == HI_KAMIKAZE ) continue;
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $102
ADDRGP4 $99
JUMPV
LABELV $102
line 127
;127:			if ( bg_itemlist[ self->client->ps.stats[ STAT_HOLDABLE_ITEM ] ].giTag == i ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $104
line 128
;128:				item = BG_FindItemForHoldable( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 129
;129:				if ( !item ) break;
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $107
ADDRGP4 $100
JUMPV
LABELV $107
line 130
;130:				drop = Drop_Item( self, item, 45 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 1110704128
ARGF4
ADDRLP4 20
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 131
;131:				break;
ADDRGP4 $100
JUMPV
LABELV $104
line 133
;132:			}
;133:		}
LABELV $99
line 125
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $98
LABELV $100
line 135
;134:
;135:		angle = 45;
ADDRLP4 12
CNSTF4 1110704128
ASGNF4
line 136
;136:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $109
line 137
;137:			if ( self->client->ps.powerups[ i ] > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $113
line 138
;138:				item = BG_FindItemForPowerup( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 139
;139:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $116
line 140
;140:					continue;
ADDRGP4 $110
JUMPV
LABELV $116
line 142
;141:				}
;142:				drop = Drop_Item( self, item, angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 144
;143:				// decide how many seconds it has left
;144:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 145
;145:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 1
GEI4 $119
line 146
;146:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 147
;147:				}
LABELV $119
line 149
;148:				// for pickup prediction
;149:				drop->s.time2 = drop->count;
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 150
;150:				angle += 45;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 151
;151:			}
LABELV $113
line 152
;152:		}
LABELV $110
line 136
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $109
line 153
;153:	}
LABELV $81
line 155
;154://qlone - freezetag
;155:}
LABELV $67
endproc TossClientItems 36 12
export LookAtKiller
proc LookAtKiller 28 4
line 245
;156:
;157:
;158:#ifdef MISSIONPACK
;159:/*
;160:=================
;161:TossClientCubes
;162:=================
;163:*/
;164:extern gentity_t	*neutralObelisk;
;165:
;166:void TossClientCubes( gentity_t *self ) {
;167:	gitem_t		*item;
;168:	gentity_t	*drop;
;169:	vec3_t		velocity;
;170:	vec3_t		angles;
;171:	vec3_t		origin;
;172:
;173:	self->client->ps.generic1 = 0;
;174:
;175:	// this should never happen but we should never
;176:	// get the server to crash due to skull being spawned in
;177:	if (!G_EntitiesFree()) {
;178:		return;
;179:	}
;180:
;181:	if( self->client->sess.sessionTeam == TEAM_RED ) {
;182:		item = BG_FindItem( "Red Cube" );
;183:	}
;184:	else {
;185:		item = BG_FindItem( "Blue Cube" );
;186:	}
;187:
;188:	angles[YAW] = (float)(level.time % 360);
;189:	angles[PITCH] = 0;	// always forward
;190:	angles[ROLL] = 0;
;191:
;192:	AngleVectors( angles, velocity, NULL, NULL );
;193:	VectorScale( velocity, 150, velocity );
;194:	velocity[2] += 200 + crandom() * 50;
;195:
;196:	if( neutralObelisk ) {
;197:		VectorCopy( neutralObelisk->s.pos.trBase, origin );
;198:		origin[2] += 44;
;199:	} else {
;200:		VectorClear( origin ) ;
;201:	}
;202:
;203:	drop = LaunchItem( item, origin, velocity );
;204:
;205:	drop->nextthink = level.time + g_cubeTimeout.integer * 1000;
;206:	drop->think = G_FreeEntity;
;207:	drop->spawnflags = self->client->sess.sessionTeam;
;208:}
;209:
;210:
;211:/*
;212:=================
;213:TossClientPersistantPowerups
;214:=================
;215:*/
;216:void TossClientPersistantPowerups( gentity_t *ent ) {
;217:	gentity_t	*powerup;
;218:
;219:	if( !ent->client ) {
;220:		return;
;221:	}
;222:
;223:	if( !ent->client->persistantPowerup ) {
;224:		return;
;225:	}
;226:
;227:	powerup = ent->client->persistantPowerup;
;228:
;229:	powerup->r.svFlags &= ~SVF_NOCLIENT;
;230:	powerup->s.eFlags &= ~EF_NODRAW;
;231:	powerup->r.contents = CONTENTS_TRIGGER;
;232:	trap_LinkEntity( powerup );
;233:
;234:	ent->client->ps.stats[STAT_PERSISTANT_POWERUP] = 0;
;235:	ent->client->persistantPowerup = NULL;
;236:}
;237:#endif
;238:
;239:
;240:/*
;241:==================
;242:LookAtKiller
;243:==================
;244:*/
;245:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 248
;246:	vec3_t		dir;
;247:
;248:	if ( attacker && attacker != self ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTU4 0
EQU4 $122
ADDRLP4 12
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $122
line 249
;249:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 250
;250:	} else if ( inflictor && inflictor != self ) {
ADDRGP4 $123
JUMPV
LABELV $122
ADDRLP4 16
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $126
ADDRLP4 16
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $126
line 251
;251:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 252
;252:	} else {
ADDRGP4 $127
JUMPV
LABELV $126
line 253
;253:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 254
;254:		return;
ADDRGP4 $121
JUMPV
LABELV $127
LABELV $123
line 257
;255:	}
;256:
;257:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 20
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 258
;258:}
LABELV $121
endproc LookAtKiller 28 4
export GibEntity
proc GibEntity 0 12
line 265
;259:
;260:/*
;261:==================
;262:GibEntity
;263:==================
;264:*/
;265:void GibEntity( gentity_t *self, int killer ) {
line 287
;266:#ifdef MISSIONPACK
;267:	gentity_t *ent;
;268:	int i;
;269:
;270:	//if this entity still has kamikaze
;271:	if (self->s.eFlags & EF_KAMIKAZE) {
;272:		// check if there is a kamikaze timer around for this owner
;273:		for (i = 0; i < level.num_entities; i++) {
;274:			ent = &g_entities[i];
;275:			if (!ent->inuse)
;276:				continue;
;277:			if (ent->activator != self)
;278:				continue;
;279:			if (strcmp(ent->classname, "kamikaze timer"))
;280:				continue;
;281:			G_FreeEntity(ent);
;282:			break;
;283:		}
;284:	}
;285:#endif
;286:
;287:	G_AddEvent( self, EV_GIB_PLAYER, killer );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 288
;288:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 289
;289:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 290
;290:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 291
;291:}
LABELV $130
endproc GibEntity 0 12
export body_die
proc body_die 0 8
line 298
;292:
;293:/*
;294:==================
;295:body_die
;296:==================
;297:*/
;298:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 299
;299:	if ( self->health > GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $132
line 300
;300:		return;
ADDRGP4 $131
JUMPV
LABELV $132
line 302
;301:	}
;302:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $134
line 303
;303:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -39
ASGNI4
line 304
;304:		return;
ADDRGP4 $131
JUMPV
LABELV $134
line 307
;305:	}
;306:
;307:	GibEntity( self, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 308
;308:}
LABELV $131
endproc body_die 0 8
data
export modNames
align 4
LABELV modNames
address $137
address $138
address $139
address $140
address $141
address $142
address $143
address $144
address $145
address $146
address $147
address $148
address $149
address $150
address $151
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
export CheckAlmostCapture
code
proc CheckAlmostCapture 52 12
line 382
;309:
;310:
;311:// these are just for logging, the client prints its own messages
;312:char	*modNames[] = {
;313:	"MOD_UNKNOWN",
;314:	"MOD_SHOTGUN",
;315:	"MOD_GAUNTLET",
;316:	"MOD_MACHINEGUN",
;317:	"MOD_GRENADE",
;318:	"MOD_GRENADE_SPLASH",
;319:	"MOD_ROCKET",
;320:	"MOD_ROCKET_SPLASH",
;321:	"MOD_PLASMA",
;322:	"MOD_PLASMA_SPLASH",
;323:	"MOD_RAILGUN",
;324:	"MOD_LIGHTNING",
;325:	"MOD_BFG",
;326:	"MOD_BFG_SPLASH",
;327:	"MOD_WATER",
;328:	"MOD_SLIME",
;329:	"MOD_LAVA",
;330:	"MOD_CRUSH",
;331:	"MOD_TELEFRAG",
;332:	"MOD_FALLING",
;333:	"MOD_SUICIDE",
;334:	"MOD_TARGET_LASER",
;335:	"MOD_TRIGGER_HURT",
;336:#ifdef MISSIONPACK
;337:	"MOD_NAIL",
;338:	"MOD_CHAINGUN",
;339:	"MOD_PROXIMITY_MINE",
;340:	"MOD_KAMIKAZE",
;341:	"MOD_JUICED",
;342:#endif
;343:	"MOD_GRAPPLE"
;344:};
;345:
;346:#ifdef MISSIONPACK
;347:/*
;348:==================
;349:Kamikaze_DeathActivate
;350:==================
;351:*/
;352:void Kamikaze_DeathActivate( gentity_t *ent ) {
;353:	G_StartKamikaze(ent);
;354:	G_FreeEntity(ent);
;355:}
;356:
;357:/*
;358:==================
;359:Kamikaze_DeathTimer
;360:==================
;361:*/
;362:void Kamikaze_DeathTimer( gentity_t *self ) {
;363:	gentity_t *ent;
;364:
;365:	ent = G_Spawn();
;366:	ent->classname = "kamikaze timer";
;367:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;368:	ent->r.svFlags |= SVF_NOCLIENT;
;369:	ent->think = Kamikaze_DeathActivate;
;370:	ent->nextthink = level.time + 5 * 1000;
;371:
;372:	ent->activator = self;
;373:}
;374:
;375:#endif
;376:
;377:/*
;378:==================
;379:CheckAlmostCapture
;380:==================
;381:*/
;382:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 388
;383:	gentity_t	*ent;
;384:	vec3_t		dir;
;385:	char		*classname;
;386:
;387:	// if this player was carrying a flag
;388:	if ( self->client->ps.powerups[PW_REDFLAG] ||
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $165
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
NEI4 $165
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $162
LABELV $165
line 390
;389:		self->client->ps.powerups[PW_BLUEFLAG] ||
;390:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 392
;391:		// get the goal flag this player should have been going for
;392:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $166
line 393
;393:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $169
line 394
;394:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $171
ASGNP4
line 395
;395:			}
ADDRGP4 $167
JUMPV
LABELV $169
line 396
;396:			else {
line 397
;397:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $172
ASGNP4
line 398
;398:			}
line 399
;399:		}
ADDRGP4 $167
JUMPV
LABELV $166
line 400
;400:		else {
line 401
;401:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $173
line 402
;402:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $172
ASGNP4
line 403
;403:			}
ADDRGP4 $174
JUMPV
LABELV $173
line 404
;404:			else {
line 405
;405:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $171
ASGNP4
line 406
;406:			}
LABELV $174
line 407
;407:		}
LABELV $167
line 408
;408:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $175
line 410
;409:		do
;410:		{
line 411
;411:			ent = G_Find(ent, FOFS(classname), classname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 412
;412:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
LABELV $176
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $175
LABELV $178
line 414
;413:		// if we found the destination flag and it's not picked up
;414:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $179
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $179
line 416
;415:			// if the player was *very* close
;416:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 417
;417:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 8
ARGP4
ADDRLP4 40
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1128792064
GEF4 $183
line 418
;418:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 419
;419:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $185
line 420
;420:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 421
;421:				}
LABELV $185
line 422
;422:			}
LABELV $183
line 423
;423:		}
LABELV $179
line 424
;424:	}
LABELV $162
line 425
;425:}
LABELV $161
endproc CheckAlmostCapture 52 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 432
;426:
;427:/*
;428:==================
;429:CheckAlmostScored
;430:==================
;431:*/
;432:void CheckAlmostScored( gentity_t *self, gentity_t *attacker ) {
line 438
;433:	gentity_t	*ent;
;434:	vec3_t		dir;
;435:	char		*classname;
;436:
;437:	// if the player was carrying cubes
;438:	if ( self->client->ps.generic1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $188
line 439
;439:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $190
line 440
;440:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $192
ASGNP4
line 441
;441:		}
ADDRGP4 $191
JUMPV
LABELV $190
line 442
;442:		else {
line 443
;443:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $193
ASGNP4
line 444
;444:		}
LABELV $191
line 445
;445:		ent = G_Find(NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 447
;446:		// if we found the destination obelisk
;447:		if ( ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $194
line 449
;448:			// if the player was *very* close
;449:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 450
;450:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
GEF4 $198
line 451
;451:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 452
;452:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $200
line 453
;453:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 454
;454:				}
LABELV $200
line 455
;455:			}
LABELV $198
line 456
;456:		}
LABELV $194
line 457
;457:	}
LABELV $188
line 458
;458:}
LABELV $187
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $276
skip 4
export player_die
code
proc player_die 80 28
line 465
;459:
;460:/*
;461:==================
;462:player_die
;463:==================
;464:*/
;465:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 473
;466:	gentity_t	*ent;
;467:	int			anim;
;468:	int			contents;
;469:	int			killer;
;470:	int			i;
;471:	char		*killerName, *obit;
;472:
;473:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $203
line 474
;474:		return;
ADDRGP4 $202
JUMPV
LABELV $203
line 477
;475:	}
;476:
;477:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $205
line 478
;478:		return;
ADDRGP4 $202
JUMPV
LABELV $205
line 482
;479:	}
;480:
;481:	//unlag the client
;482:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 485
;483:
;484:	// check for an almost capture
;485:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 487
;486:	// check for a player that almost brought in cubes
;487:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 489
;488:
;489:	if (self->client && self->client->hook) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $208
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $208
line 490
;490:		Weapon_HookFree(self->client->hook);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 491
;491:	}
LABELV $208
line 499
;492:#ifdef MISSIONPACK
;493:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;494:		self->client->ps.eFlags &= ~EF_TICKING;
;495:		self->activator->think = G_FreeEntity;
;496:		self->activator->nextthink = level.time;
;497:	}
;498:#endif
;499:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 501
;500:
;501:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $210
line 502
;502:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 503
;503:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $212
line 504
;504:			killerName = attacker->client->pers.netname;
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ASGNP4
line 505
;505:		} else {
ADDRGP4 $211
JUMPV
LABELV $212
line 506
;506:			killerName = "<non-client>";
ADDRLP4 16
ADDRGP4 $214
ASGNP4
line 507
;507:		}
line 508
;508:	} else {
ADDRGP4 $211
JUMPV
LABELV $210
line 509
;509:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 510
;510:		killerName = "<world>";
ADDRLP4 16
ADDRGP4 $215
ASGNP4
line 511
;511:	}
LABELV $211
line 513
;512:
;513:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $218
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $216
LABELV $218
line 514
;514:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 515
;515:		killerName = "<world>";
ADDRLP4 16
ADDRGP4 $215
ASGNP4
line 516
;516:	}
LABELV $216
line 518
;517:
;518:	if ( (unsigned)meansOfDeath >= ARRAY_LEN( modNames ) ) {
ADDRFP4 16
INDIRI4
CVIU4 4
CNSTU4 24
LTU4 $219
line 519
;519:		obit = "<bad obituary>";
ADDRLP4 20
ADDRGP4 $221
ASGNP4
line 520
;520:	} else {
ADDRGP4 $220
JUMPV
LABELV $219
line 521
;521:		obit = modNames[ meansOfDeath ];
ADDRLP4 20
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 522
;522:	}
LABELV $220
line 524
;523:
;524:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $222
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 529
;525:		killer, self->s.number, meansOfDeath, killerName, 
;526:		self->client->pers.netname, obit );
;527:
;528:	// broadcast the death event to everyone
;529:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 40
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
ASGNP4
line 530
;530:	ent->s.eventParm = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 531
;531:	ent->s.otherEntityNum = self - g_entities;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ASGNI4
line 532
;532:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 533
;533:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 32
ASGNI4
line 535
;534:
;535:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 537
;536:
;537:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 539
;538:
;539:	if (attacker && attacker->client) {
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $223
ADDRLP4 48
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $223
line 540
;540:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 542
;541:
;542:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
ADDRLP4 56
INDIRP4
CVPU4 4
EQU4 $227
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $227
line 543
;543:			AddScore( attacker, self->r.currentOrigin, -1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 544
;544:		} else {
ADDRGP4 $224
JUMPV
LABELV $225
line 545
;545:			AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 547
;546:
;547:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $228
line 550
;548:				
;549:				// play humiliation on player
;550:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 553
;551:
;552:				// add the sprite over the player's head
;553:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 68
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 554
;554:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 555
;555:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 558
;556:
;557:				// also play humiliation on target
;558:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 559
;559:			}
LABELV $228
line 563
;560:
;561:			// check for two kills in a short amount of time
;562:			// if this is close enough to the last kill, give a reward sound
;563:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $231
line 565
;564:				// play excellent on player
;565:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 568
;566:
;567:				// add the sprite over the player's head
;568:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 68
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 569
;569:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 570
;570:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 571
;571:			}
LABELV $231
line 572
;572:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 574
;573:
;574:		}
line 575
;575:	} else {
ADDRGP4 $224
JUMPV
LABELV $223
line 576
;576:		AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 577
;577:	}
LABELV $224
line 580
;578:
;579:	// Add team bonuses
;580:	Team_FragBonuses(self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_FragBonuses
CALLV
pop
line 583
;581:
;582:	// if I committed suicide, the flag does not fall, it returns.
;583:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $236
line 590
;584:#ifdef MISSIONPACK
;585:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
;586:			Team_ReturnFlag( TEAM_FREE );
;587:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
;588:		} else 
;589:#endif
;590:		if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $238
line 591
;591:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 592
;592:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 593
;593:		}
ADDRGP4 $239
JUMPV
LABELV $238
line 594
;594:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $240
line 595
;595:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 596
;596:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 597
;597:		}
LABELV $240
LABELV $239
line 598
;598:	}
LABELV $236
line 601
;599:
;600:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;601:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 52
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 602
;602:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $242
line 603
;603:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 604
;604:	}
ADDRGP4 $243
JUMPV
LABELV $242
line 605
;605:	else {
line 606
;606:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $244
line 607
;607:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 608
;608:		}
ADDRGP4 $245
JUMPV
LABELV $244
line 609
;609:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $246
line 610
;610:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 611
;611:		}
ADDRGP4 $247
JUMPV
LABELV $246
line 612
;612:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $248
line 613
;613:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 614
;614:		}
LABELV $248
LABELV $247
LABELV $245
line 615
;615:	}
LABELV $243
line 623
;616:#ifdef MISSIONPACK
;617:	TossClientPersistantPowerups( self );
;618:	if( g_gametype.integer == GT_HARVESTER ) {
;619:		TossClientCubes( self );
;620:	}
;621:#endif
;622:
;623:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 626
;624:	// send updated scores to any clients that are following this one,
;625:	// or they would get stale scoreboards
;626:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $253
JUMPV
LABELV $250
line 629
;627:		gclient_t	*client;
;628:
;629:		client = &level.clients[i];
ADDRLP4 56
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 630
;630:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 56
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $255
line 631
;631:			continue;
ADDRGP4 $251
JUMPV
LABELV $255
line 634
;632:		}
;633://qlone - freezetag
;634:		if ( /*client->sess.sessionTeam != TEAM_SPECTATOR*/!is_spectator( client ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $257
line 636
;635://qlone - freezetag
;636:			continue;
ADDRGP4 $251
JUMPV
LABELV $257
line 638
;637:		}
;638:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 56
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $259
line 639
;639:			Cmd_Score_f( g_entities + i );
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 640
;640:		}
LABELV $259
line 641
;641:	}
LABELV $251
line 626
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $253
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $250
line 643
;642:
;643:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 645
;644:
;645:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 646
;646:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 647
;647:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 649
;648:
;649:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 650
;650:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 651
;651:	LookAtKiller (self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 LookAtKiller
CALLV
pop
line 653
;652:
;653:	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 655
;654:
;655:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 658
;656:
;657://qlone - freezetag
;658:	if ( !g_freezeTag.integer )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
NEI4 $261
line 660
;659://qlone - freezetag
;660:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 3238002688
ASGNF4
LABELV $261
line 664
;661:
;662:	// don't allow respawn until the death anim is done
;663:	// g_forcerespawn may force spawning at some later time
;664:	self->client->respawnTime = level.time + 1700;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1700
ADDI4
ASGNI4
line 667
;665:
;666:	// remove powerups
;667:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 670
;668:
;669://qlone - freezetag
;670:	if ( g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $265
line 671
;671:		player_freeze( self, attacker, meansOfDeath );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 player_freeze
CALLV
pop
line 672
;672:		if ( self->freezeState ) {
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $268
line 673
;673:			G_AddEvent( self, EV_DEATH1 + ( rand() % 3 ), killer );
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
INDIRI4
CNSTI4 3
MODI4
CNSTI4 57
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 674
;674:			trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 675
;675:			return;
ADDRGP4 $202
JUMPV
LABELV $268
line 677
;676:		}
;677:		self->r.maxs[ 2 ] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 3238002688
ASGNF4
line 678
;678:	}
LABELV $265
line 682
;679://qlone - freezetag
;680:
;681:	// never gib in a nodrop
;682:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $275
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $275
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $273
LABELV $275
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $270
LABELV $273
line 684
;683:		// gib death
;684:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 685
;685:	} else {
ADDRGP4 $271
JUMPV
LABELV $270
line 689
;686:		// normal death
;687:		static int i;
;688:
;689:		switch ( i ) {
ADDRLP4 60
ADDRGP4 $276
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $279
ADDRLP4 60
INDIRI4
CNSTI4 1
EQI4 $280
ADDRLP4 60
INDIRI4
CNSTI4 2
EQI4 $281
ADDRGP4 $277
JUMPV
LABELV $279
line 691
;690:		case 0:
;691:			anim = BOTH_DEATH1;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 692
;692:			break;
ADDRGP4 $278
JUMPV
LABELV $280
line 694
;693:		case 1:
;694:			anim = BOTH_DEATH2;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 695
;695:			break;
ADDRGP4 $278
JUMPV
LABELV $281
LABELV $277
line 698
;696:		case 2:
;697:		default:
;698:			anim = BOTH_DEATH3;
ADDRLP4 24
CNSTI4 4
ASGNI4
line 699
;699:			break;
LABELV $278
line 704
;700:		}
;701:
;702:		// for the no-blood option, we need to prevent the health
;703:		// from going to gib level
;704:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $282
line 705
;705:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -39
ASGNI4
line 706
;706:		}
LABELV $282
line 708
;707:
;708:		self->client->ps.legsAnim = 
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 710
;709:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;710:		self->client->ps.torsoAnim = 
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 713
;711:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;712:
;713:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $276
INDIRI4
CNSTI4 57
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 716
;714:
;715:		// the body can still be gibbed
;716:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 body_die
ASGNP4
line 719
;717:
;718:		// globally cycle through the different death animations
;719:		i = ( i + 1 ) % 3;
ADDRLP4 72
ADDRGP4 $276
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 726
;720:
;721:#ifdef MISSIONPACK
;722:		if (self->s.eFlags & EF_KAMIKAZE) {
;723:			Kamikaze_DeathTimer( self );
;724:		}
;725:#endif
;726:	}
LABELV $271
line 728
;727:
;728:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 730
;729:
;730:}
LABELV $202
endproc player_die 80 28
export CheckArmor
proc CheckArmor 20 4
line 739
;731:
;732:
;733:/*
;734:================
;735:CheckArmor
;736:================
;737:*/
;738:int CheckArmor (gentity_t *ent, int damage, int dflags)
;739:{
line 744
;740:	gclient_t	*client;
;741:	int			save;
;742:	int			count;
;743:
;744:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $285
line 745
;745:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $285
line 747
;746:
;747:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 749
;748:
;749:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $287
line 750
;750:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $287
line 752
;751:
;752:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $289
line 753
;753:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $289
line 756
;754:
;755:	// armor
;756:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 757
;757:	save = ceil( damage * ARMOR_PROTECTION );
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1059648963
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 758
;758:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $291
line 759
;759:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $291
line 761
;760:
;761:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $293
line 762
;762:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $284
JUMPV
LABELV $293
line 764
;763:
;764:	client->ps.stats[STAT_ARMOR] -= save;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 766
;765:
;766:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $284
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 56 4
line 774
;767:}
;768:
;769:/*
;770:================
;771:RaySphereIntersections
;772:================
;773:*/
;774:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 783
;775:	float b, c, d, t;
;776:
;777:	//	| origin - (point + t * dir) | = radius
;778:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;779:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;780:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;781:
;782:	// normalize dir so a = 1
;783:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 784
;784:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
SUBF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
CNSTF4 1073741824
MULF4
ASGNF4
line 785
;785:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 40
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
SUBF4
ASGNF4
line 790
;786:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;787:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;788:		radius * radius;
;789:
;790:	d = b * b - 4 * c;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
CNSTF4 1082130432
MULF4
SUBF4
ASGNF4
line 791
;791:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $296
line 792
;792:		t = (- b + sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 793
;793:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 794
;794:		t = (- b - sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 795
;795:		VectorMA(point, t, dir, intersections[1]);
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 796
;796:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $295
JUMPV
LABELV $296
line 798
;797:	}
;798:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $298
line 799
;799:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1056964608
MULF4
ASGNF4
line 800
;800:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 801
;801:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $295
JUMPV
LABELV $298
line 803
;802:	}
;803:	return 0;
CNSTI4 0
RETI4
LABELV $295
endproc RaySphereIntersections 56 4
export G_Damage
proc G_Damage 72 24
line 870
;804:}
;805:
;806:#ifdef MISSIONPACK
;807:/*
;808:================
;809:G_InvulnerabilityEffect
;810:================
;811:*/
;812:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;813:	gentity_t	*impact;
;814:	vec3_t		intersections[2], vec;
;815:	int			n;
;816:
;817:	if ( !targ->client ) {
;818:		return qfalse;
;819:	}
;820:	VectorCopy(dir, vec);
;821:	VectorInverse(vec);
;822:	// sphere model radius = 42 units
;823:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;824:	if (n > 0) {
;825:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;826:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;827:		vectoangles(vec, impact->s.angles);
;828:		impact->s.angles[0] += 90;
;829:		if (impact->s.angles[0] > 360)
;830:			impact->s.angles[0] -= 360;
;831:		if ( impactpoint ) {
;832:			VectorCopy( intersections[0], impactpoint );
;833:		}
;834:		if ( bouncedir ) {
;835:			VectorCopy( vec, bouncedir );
;836:			VectorNormalize( bouncedir );
;837:		}
;838:		return qtrue;
;839:	}
;840:	else {
;841:		return qfalse;
;842:	}
;843:}
;844:#endif
;845:/*
;846:============
;847:G_Damage
;848:
;849:targ		entity that is being damaged
;850:inflictor	entity that is causing the damage
;851:attacker	entity that caused the inflictor to damage targ
;852:	example: targ=monster, inflictor=rocket, attacker=player
;853:
;854:dir			direction of the attack for knockback
;855:point		point at which the damage is being inflicted, used for headshots
;856:damage		amount of damage being inflicted
;857:knockback	force to be applied against targ as a result of the damage
;858:
;859:inflictor, attacker, dir, and point can be NULL for environmental effects
;860:
;861:dflags		these flags are used to control how T_Damage works
;862:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;863:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;864:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;865:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;866:============
;867:*/
;868:
;869:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;870:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 880
;871:	gclient_t	*client;
;872:	int			take;
;873:	int			asave;
;874:	int			knockback;
;875:	int			max;
;876:#ifdef MISSIONPACK
;877:	vec3_t		bouncedir, impactpoint;
;878:#endif
;879:
;880:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 881
;881:		return;
ADDRGP4 $300
JUMPV
LABELV $301
line 886
;882:	}
;883:
;884:	// the intermission has allready been qualified for, so don't
;885:	// allow any extra scoring
;886:	if ( level.intermissionQueued ) {
ADDRGP4 level+7600
INDIRI4
CNSTI4 0
EQI4 $303
line 887
;887:		return;
ADDRGP4 $300
JUMPV
LABELV $303
line 899
;888:	}
;889:#ifdef MISSIONPACK
;890:	if ( targ->client && mod != MOD_JUICED) {
;891:		if ( targ->client->invulnerabilityTime > level.time) {
;892:			if ( dir && point ) {
;893:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;894:			}
;895:			return;
;896:		}
;897:	}
;898:#endif
;899:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $306
line 900
;900:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+842128
ASGNP4
line 901
;901:	}
LABELV $306
line 902
;902:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $309
line 903
;903:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+842128
ASGNP4
line 904
;904:	}
LABELV $309
line 907
;905:
;906:	// shootable doors / buttons don't actually have any health
;907:	if ( targ->s.eType == ET_MOVER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $312
line 908
;908:		if ( targ->use && targ->moverState == MOVER_POS1 ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $300
ADDRLP4 20
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $300
line 909
;909:			targ->use( targ, inflictor, attacker );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CALLV
pop
line 910
;910:		}
line 911
;911:		return;
ADDRGP4 $300
JUMPV
LABELV $312
line 920
;912:	}
;913:#ifdef MISSIONPACK
;914:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;915:		return;
;916:	}
;917:#endif
;918:	// reduce damage by the attacker's handicap value
;919:	// unless they are rocket jumping
;920:	if ( attacker->client && attacker != targ ) {
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $316
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $316
line 921
;921:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 927
;922:#ifdef MISSIONPACK
;923:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;924:			max /= 2;
;925:		}
;926:#endif
;927:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 16
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 928
;928:	}
LABELV $316
line 930
;929:
;930:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 932
;931:
;932:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $318
line 933
;933:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $320
line 934
;934:			return;
ADDRGP4 $300
JUMPV
LABELV $320
line 936
;935:		}
;936:	}
LABELV $318
line 938
;937:
;938:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $322
line 939
;939:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 940
;940:	} else {
ADDRGP4 $323
JUMPV
LABELV $322
line 941
;941:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 942
;942:	}
LABELV $323
line 944
;943:
;944:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 945
;945:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $324
line 946
;946:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 947
;947:	}
LABELV $324
line 948
;948:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $326
line 949
;949:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 950
;950:	}
LABELV $326
line 951
;951:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $328
line 952
;952:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 953
;953:	}
LABELV $328
line 956
;954:
;955:	// figure momentum add, even if the damage won't be taken
;956:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $330
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $330
line 960
;957:		vec3_t	kvel;
;958:		float	mass;
;959:
;960:		mass = 200;
ADDRLP4 36
CNSTF4 1128792064
ASGNF4
line 962
;961:
;962:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
ADDRLP4 40
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 48
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 40
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 48
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 48
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 36
INDIRF4
DIVF4
MULF4
ASGNF4
line 963
;963:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 967
;964:
;965:		// set the timer so that the other client can't cancel
;966:		// out the movement immediately
;967:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $339
line 970
;968:			int		t;
;969:
;970:			t = knockback * 2;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 971
;971:			if ( t < 50 ) {
ADDRLP4 64
INDIRI4
CNSTI4 50
GEI4 $341
line 972
;972:				t = 50;
ADDRLP4 64
CNSTI4 50
ASGNI4
line 973
;973:			}
LABELV $341
line 974
;974:			if ( t > 200 ) {
ADDRLP4 64
INDIRI4
CNSTI4 200
LEI4 $343
line 975
;975:				t = 200;
ADDRLP4 64
CNSTI4 200
ASGNI4
line 976
;976:			}
LABELV $343
line 977
;977:			targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 978
;978:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 979
;979:		}
LABELV $339
line 980
;980:	}
LABELV $330
line 983
;981:
;982:	// check for completely getting out of the damage
;983:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $345
line 990
;984:
;985:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;986:		// if the attacker was on the same team
;987:#ifdef MISSIONPACK
;988:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;989:#else	
;990:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRP4
CVPU4 4
EQU4 $347
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $347
line 992
;991:#endif
;992:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $349
line 993
;993:				return;
ADDRGP4 $300
JUMPV
LABELV $349
line 995
;994:			}
;995:		}
LABELV $347
line 1008
;996:#ifdef MISSIONPACK
;997:		if (mod == MOD_PROXIMITY_MINE) {
;998:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;999:				return;
;1000:			}
;1001:			if (targ == attacker) {
;1002:				return;
;1003:			}
;1004:		}
;1005:#endif
;1006:
;1007:		// check for godmode
;1008:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $352
line 1009
;1009:			return;
ADDRGP4 $300
JUMPV
LABELV $352
line 1013
;1010:		}
;1011:
;1012://qlone - freezetag
;1013:		if ( g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $354
line 1014
;1014:			if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $357
line 1015
;1015:				if ( targ != attacker && level.time - client->respawnTime < 1000 ) return;
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $358
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $358
ADDRGP4 $300
JUMPV
line 1016
;1016:			} else {
LABELV $357
line 1017
;1017:				if ( DamageBody( targ, attacker, dir, mod, knockback ) ) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 DamageBody
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $362
ADDRGP4 $300
JUMPV
LABELV $362
line 1018
;1018:			}
LABELV $358
line 1019
;1019:		}
LABELV $354
line 1021
;1020://qlone - freezetag
;1021:	}
LABELV $345
line 1025
;1022:
;1023:	// battlesuit protects from all radius damage (but takes knockback)
;1024:	// and protects 50% against all damage
;1025:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $364
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $364
line 1026
;1026:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 62
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1027
;1027:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $368
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $366
LABELV $368
line 1028
;1028:			return;
ADDRGP4 $300
JUMPV
LABELV $366
line 1030
;1029:		}
;1030:		damage *= 0.5;
ADDRFP4 20
ADDRFP4 20
INDIRI4
CVIF4 4
CNSTF4 1056964608
MULF4
CVFI4 4
ASGNI4
line 1031
;1031:	}
LABELV $364
line 1035
;1032:
;1033:	// always give half damage if hurting self
;1034:	// calculated after knockback, so rocket jumping works
;1035:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $369
line 1036
;1036:		damage *= 0.5;
ADDRFP4 20
ADDRFP4 20
INDIRI4
CVIF4 4
CNSTF4 1056964608
MULF4
CVFI4 4
ASGNI4
line 1037
;1037:	}
LABELV $369
line 1039
;1038:
;1039:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $371
line 1040
;1040:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 1041
;1041:	}
LABELV $371
line 1042
;1042:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 1045
;1043:
;1044:	//qlone - self damages
;1045:	if ( targ == attacker && g_noSelfDamage.integer )
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $373
ADDRGP4 g_noSelfDamage+12
INDIRI4
CNSTI4 0
EQI4 $373
line 1046
;1046:		asave = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $374
JUMPV
LABELV $373
line 1047
;1047:	else {
line 1050
;1048:	//qlone - self damages
;1049:		// save some from armor
;1050:		asave = CheckArmor( targ, take, dflags );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CheckArmor
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1051
;1051:		take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1052
;1052:	} //qlone - self damages
LABELV $374
line 1054
;1053:
;1054:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $376
line 1055
;1055:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $379
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 1057
;1056:			targ->health, take, asave );
;1057:	}
LABELV $376
line 1060
;1058:
;1059:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;1060:	if ( attacker->client && client && targ != attacker && targ->health > 0
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $381
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $381
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRP4
CVPU4 4
EQU4 $381
ADDRLP4 32
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
LEI4 $381
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $381
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $381
line 1062
;1061:			&& targ->s.eType != ET_MISSILE
;1062:			&& targ->s.eType != ET_GENERAL) {
line 1073
;1063:#ifdef MISSIONPACK
;1064:		if ( OnSameTeam( targ, attacker ) ) {
;1065:			attacker->client->ps.persistant[PERS_HITS]--;
;1066:		} else {
;1067:			attacker->client->ps.persistant[PERS_HITS]++;
;1068:		}
;1069:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
;1070:#else
;1071:		// we may hit multiple targets from different teams
;1072:		// so usual PERS_HITS increments/decrements could result in ZERO delta
;1073:		if ( OnSameTeam( targ, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $383
line 1074
;1074:			attacker->client->damage.team++;
ADDRLP4 40
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1075
;1075:		} else {
ADDRGP4 $384
JUMPV
LABELV $383
line 1076
;1076:			attacker->client->damage.enemy++;
ADDRLP4 40
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1078
;1077:			// accumulate damage during server frame
;1078:			attacker->client->damage.amount += take + asave;
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDI4
ASGNI4
line 1079
;1079:		}
LABELV $384
line 1081
;1080:#endif
;1081:	}
LABELV $381
line 1086
;1082:
;1083:	// add to the damage inflicted on a player this frame
;1084:	// the total will be turned into screen blends and view angle kicks
;1085:	// at the end of the frame
;1086:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $385
line 1087
;1087:		if ( attacker ) { // FIXME: always true?
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $387
line 1088
;1088:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1089
;1089:		} else {
ADDRGP4 $388
JUMPV
LABELV $387
line 1090
;1090:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1091
;1091:		}
LABELV $388
line 1092
;1092:		client->damage_armor += asave;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1093
;1093:		client->damage_blood += take;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1094
;1094:		client->damage_knockback += knockback;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1095
;1095:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $389
line 1096
;1096:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1097
;1097:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 0
ASGNI4
line 1098
;1098:		} else {
ADDRGP4 $390
JUMPV
LABELV $389
line 1099
;1099:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1100
;1100:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 1101
;1101:		}
LABELV $390
line 1102
;1102:	}
LABELV $385
line 1108
;1103:
;1104:	// See if it's the player hurting the emeny flag carrier
;1105:#ifdef MISSIONPACK
;1106:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1107:#else	
;1108:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $391
line 1110
;1109:#endif
;1110:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1111
;1111:	}
LABELV $391
line 1113
;1112:
;1113:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $394
line 1115
;1114:		// set the last client who damaged the target
;1115:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1116
;1116:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 736
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1117
;1117:	}
LABELV $394
line 1120
;1118:
;1119:	//qlone - self damages
;1120:	if ( targ == attacker && g_noSelfDamage.integer )
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $396
ADDRGP4 g_noSelfDamage+12
INDIRI4
CNSTI4 0
EQI4 $396
line 1121
;1121:		return;
ADDRGP4 $300
JUMPV
LABELV $396
line 1125
;1122:	//qlone - self damages
;1123:
;1124:	// do the damage
;1125:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $399
line 1126
;1126:		targ->health = targ->health - take;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1127
;1127:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $401
line 1128
;1128:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 1129
;1129:		}
LABELV $401
line 1131
;1130:			
;1131:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $403
line 1132
;1132:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $405
line 1133
;1133:				targ->flags |= FL_NO_KNOCKBACK;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
LABELV $405
line 1135
;1134:
;1135:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $407
line 1136
;1136:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -999
ASGNI4
LABELV $407
line 1138
;1137:
;1138:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1139
;1139:			targ->die (targ, inflictor, attacker, take, mod);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 716
ADDP4
INDIRP4
CALLV
pop
line 1140
;1140:			return;
ADDRGP4 $300
JUMPV
LABELV $403
line 1141
;1141:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $409
line 1142
;1142:			targ->pain (targ, attacker, take);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CALLV
pop
line 1143
;1143:		}
LABELV $409
line 1144
;1144:	}
LABELV $399
line 1146
;1145:
;1146:}
LABELV $300
endproc G_Damage 72 24
export CanDamage
proc CanDamage 144 28
line 1158
;1147:
;1148:
;1149:/*
;1150:============
;1151:CanDamage
;1152:
;1153:Returns qtrue if the inflictor can directly damage the target.  Used for
;1154:explosions and melee attacks.
;1155:============
;1156:*/
;1157:qboolean CanDamage( gentity_t *targ, vec3_t origin )
;1158:{
line 1166
;1159:	//we check if the attacker can damage the target, return qtrue if yes, qfalse if no
;1160:	vec3_t	dest;
;1161:	trace_t	tr;
;1162:	vec3_t	midpoint;
;1163:	vec3_t				size;
;1164:
;1165:	// use the midpoint of the bounds instead of the origin, because bmodels may have their origin 0,0,0
;1166:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 92
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 92
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80+8
ADDRLP4 96
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1167
;1167:	VectorScale( midpoint, 0.5, dest );
ADDRLP4 0
ADDRLP4 80
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1169
;1168:
;1169:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1170
;1170:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $422
ADDRLP4 12+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $418
LABELV $422
line 1171
;1171:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $418
line 1173
;1172:
;1173:	VectorSubtract( targ->r.absmax, targ->r.absmin, size );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 104
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 104
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68+8
ADDRLP4 108
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1179
;1174:	
;1175:	// top quad
;1176:
;1177:	// - +
;1178:	// - -
;1179:	VectorCopy( targ->r.absmax, dest );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 1180
;1180:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1181
;1181:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $425
line 1182
;1182:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $425
line 1186
;1183:
;1184:	// + -
;1185:	// - -
;1186:	dest[0] -= size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
line 1187
;1187:	trap_Trace( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1188
;1188:	if ( tr.fraction == 1.0 )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $428
line 1189
;1189:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $428
line 1193
;1190:
;1191:	// - -
;1192:	// + -
;1193:	dest[1] -= size[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68+4
INDIRF4
SUBF4
ASGNF4
line 1194
;1194:	trap_Trace( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1195
;1195:	if ( tr.fraction == 1.0 )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $433
line 1196
;1196:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $433
line 1200
;1197:
;1198:	// - -
;1199:	// - +
;1200:	dest[0] += size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
line 1201
;1201:	trap_Trace( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1202
;1202:	if ( tr.fraction == 1.0 )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $436
line 1203
;1203:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $436
line 1209
;1204:
;1205:	// bottom quad
;1206:
;1207:	// - -
;1208:	// + -
;1209:	VectorCopy( targ->r.absmin, dest );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 1210
;1210:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1211
;1211:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $439
line 1212
;1212:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $439
line 1216
;1213:
;1214:	// - -
;1215:	// - +
;1216:	dest[0] += size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
line 1217
;1217:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1218
;1218:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $442
line 1219
;1219:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $442
line 1223
;1220:
;1221:	// - +
;1222:	// - -
;1223:	dest[1] += size[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68+4
INDIRF4
ADDF4
ASGNF4
line 1224
;1224:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1225
;1225:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $447
line 1226
;1226:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $447
line 1230
;1227:
;1228:	// + -
;1229:	// - -
;1230:	dest[0] -= size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
line 1231
;1231:	trap_Trace( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1232
;1232:	if ( tr.fraction == 1.0 )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $450
line 1233
;1233:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $411
JUMPV
LABELV $450
line 1235
;1234:
;1235:	return qfalse;
CNSTI4 0
RETI4
LABELV $411
endproc CanDamage 144 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1245
;1236:}
;1237:
;1238:
;1239:/*
;1240:============
;1241:G_RadiusDamage
;1242:============
;1243:*/
;1244:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1245:					 gentity_t *ignore, int mod) {
line 1254
;1246:	float		points, dist;
;1247:	gentity_t	*ent;
;1248:	int			entityList[MAX_GENTITIES];
;1249:	int			numListedEntities;
;1250:	vec3_t		mins, maxs;
;1251:	vec3_t		v;
;1252:	vec3_t		dir;
;1253:	int			i, e;
;1254:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1256
;1255:
;1256:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $454
line 1257
;1257:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1258
;1258:	}
LABELV $454
line 1260
;1259:
;1260:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $456
line 1261
;1261:		mins[i] = origin[i] - radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4144
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 1262
;1262:		maxs[i] = origin[i] + radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4156
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 1263
;1263:	}
LABELV $457
line 1260
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $456
line 1265
;1264:
;1265:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4144
ARGP4
ADDRLP4 4156
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4172
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4140
ADDRLP4 4172
INDIRI4
ASGNI4
line 1267
;1266:
;1267:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $463
JUMPV
LABELV $460
line 1268
;1268:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1270
;1269:
;1270:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $464
line 1271
;1271:			continue;
ADDRGP4 $461
JUMPV
LABELV $464
line 1272
;1272:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $466
line 1273
;1273:			continue;
ADDRGP4 $461
JUMPV
LABELV $466
line 1276
;1274:
;1275:		// find the distance from the edge of the bounding box
;1276:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $468
line 1277
;1277:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
GEF4 $472
line 1278
;1278:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1279
;1279:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $473
JUMPV
LABELV $472
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
LEF4 $474
line 1280
;1280:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1281
;1281:			} else {
ADDRGP4 $475
JUMPV
LABELV $474
line 1282
;1282:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1283
;1283:			}
LABELV $475
LABELV $473
line 1284
;1284:		}
LABELV $469
line 1276
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $468
line 1286
;1285:
;1286:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 4176
INDIRF4
ASGNF4
line 1287
;1287:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $476
line 1288
;1288:			continue;
ADDRGP4 $461
JUMPV
LABELV $476
line 1291
;1289:		}
;1290:
;1291:		points = damage * ( 1.0 - dist / radius );
ADDRLP4 40
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
SUBF4
MULF4
ASGNF4
line 1293
;1292:
;1293:		if( CanDamage (ent, origin) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4180
ADDRGP4 CanDamage
CALLI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
EQI4 $478
line 1294
;1294:			if( LogAccuracyHit( ent, attacker ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4184
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 4184
INDIRI4
CNSTI4 0
EQI4 $480
line 1295
;1295:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1296
;1296:			}
LABELV $480
line 1297
;1297:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1300
;1298:			// push the center of mass higher than the origin so players
;1299:			// get knocked into the air more
;1300:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1301
;1301:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1302
;1302:		}
LABELV $478
line 1303
;1303:	}
LABELV $461
line 1267
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $463
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $460
line 1305
;1304:
;1305:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $453
endproc G_RadiusDamage 4196 32
import svf_self_portal2
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_TraceCapsule
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Print
import g_removeweapon
import g_removepowerup
import g_removeitem
import g_removeammo
import g_wpflags
import g_tossWeapon
import g_startHealth
import g_startArmor
import g_startAmmoCG
import g_startAmmoPL
import g_startAmmoNG
import g_startAmmoBFG
import g_startAmmoPG
import g_startAmmoRG
import g_startAmmoLG
import g_startAmmoRL
import g_startAmmoGL
import g_startAmmoSG
import g_startAmmoMG
import g_specLock
import g_noSelfDamage
import g_grapple
import g_freezeTag
import g_doReady
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_predictPVS
import g_unlagged
import g_rotation
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_autoJoin
import g_allowVote
import g_blood
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import sv_fps
import g_mapname
import g_gametype
import g_entities
import level
import AddTeamScore
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import Hook_Fire
import G_SetInfiniteAmmo
import G_RemoveWeapon
import G_RemovePowerup
import G_RemoveItem
import G_RemoveAmmo
import G_SpawnWeapon
import G_RegisterWeapon
import G_ItemReplaced
import FT_ResetFlags
import Cmd_Ready_f
import Cmd_Drop_f
import locationSpawn
import CheckDelay
import team_wins
import readyCheck
import player_freeze
import is_body_freeze
import is_body
import DamageBody
import Body_free
import Persistant_spectator
import respawnSpectator
import Set_Client
import Set_spectator
import is_spectator
import G_MapExist
import G_LoadMap
import ParseMapRotation
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_ClearClientSessionData
import G_WriteClientSessionData
import G_ReadClientSessionData
import G_InitSessionData
import G_WriteSessionData
import G_InitWorldSession
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_ResetFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_BroadcastServerCommand
import G_Error
import G_Printf
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import MoveClientToIntermission
import DeathmatchScoreboardMessage
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamConnectedCount
import TeamCount
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import G_InvulnerabilityEffect
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import SpawnTime
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Registered
import G_RevertVote
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import BigEndian
import replace1
import Q_stradd
import Q_strcpy
import BG_StripColor
import BG_CleanName
import DecodedString
import EncodedString
import strtok
import Q_stristr
import BG_sprintf
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_ValidateKeyValue
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import locase
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import Com_Split
import COM_ParseSep
import Com_InitSeparators
import SkipTillSeparators
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import Q_sscanf
import ED_vsprintf
import atoi
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $379
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $222
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $221
byte 1 60
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 62
byte 1 0
align 1
LABELV $215
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $214
byte 1 60
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 62
byte 1 0
align 1
LABELV $193
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $192
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $172
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $171
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $160
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $159
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 95
byte 1 72
byte 1 85
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $158
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 65
byte 1 83
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $157
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 85
byte 1 73
byte 1 67
byte 1 73
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $156
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $155
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 70
byte 1 82
byte 1 65
byte 1 71
byte 1 0
align 1
LABELV $154
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 67
byte 1 82
byte 1 85
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $153
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 65
byte 1 86
byte 1 65
byte 1 0
align 1
LABELV $152
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 76
byte 1 73
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $151
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $150
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $149
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $148
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $147
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $146
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $145
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 0
align 1
LABELV $144
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $143
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $142
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $141
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $140
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 77
byte 1 65
byte 1 67
byte 1 72
byte 1 73
byte 1 78
byte 1 69
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $139
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 76
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $138
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $137
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 0
