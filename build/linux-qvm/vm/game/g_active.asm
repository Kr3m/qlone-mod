export P_DamageFeedback
code
proc P_DamageFeedback 36 12
file "../../../../code/game/g_active.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:
;7:/*
;8:===============
;9:G_DamageFeedback
;10:
;11:Called just before a snapshot is sent to the given player.
;12:Totals up all damage and generates both the player_state_t
;13:damage values to that client for pain blends and kicks, and
;14:global pain sound events for all clients.
;15:===============
;16:*/
;17:void P_DamageFeedback( gentity_t *player ) {
line 22
;18:	gclient_t	*client;
;19:	float	count;
;20:	vec3_t	angles;
;21:
;22:	client = player->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 23
;23:	if ( client->ps.pm_type == PM_DEAD ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $55
line 24
;24:		return;
ADDRGP4 $54
JUMPV
LABELV $55
line 28
;25:	}
;26:
;27:	// total points of damage shot at the player this frame
;28:	count = client->damage_blood + client->damage_armor;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 29
;29:	if ( count == 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $57
line 30
;30:		return;		// didn't take any damage
ADDRGP4 $54
JUMPV
LABELV $57
line 33
;31:	}
;32:
;33:	if ( count > 255 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1132396544
LEF4 $59
line 34
;34:		count = 255;
ADDRLP4 4
CNSTF4 1132396544
ASGNF4
line 35
;35:	}
LABELV $59
line 41
;36:
;37:	// send the information to the client
;38:
;39:	// world damage (falling, slime, etc) uses a special code
;40:	// to make the blend blob centered instead of positional
;41:	if ( client->damage_fromWorld ) {
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $61
line 42
;42:		client->ps.damagePitch = 255;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 43
;43:		client->ps.damageYaw = 255;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 255
ASGNI4
line 45
;44:
;45:		client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 0
ASGNI4
line 46
;46:	} else {
ADDRGP4 $62
JUMPV
LABELV $61
line 47
;47:		vectoangles( client->damage_from, angles );
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 48
;48:		client->ps.damagePitch = angles[PITCH]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 8
INDIRF4
CNSTF4 1060506465
MULF4
CVFI4 4
ASGNI4
line 49
;49:		client->ps.damageYaw = angles[YAW]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 8+4
INDIRF4
CNSTF4 1060506465
MULF4
CVFI4 4
ASGNI4
line 50
;50:	}
LABELV $62
line 53
;51:
;52:	// play an apropriate pain sound
;53:	if ( (level.time > player->pain_debounce_time) && !(player->flags & FL_GODMODE) ) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
LEI4 $64
ADDRLP4 24
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $64
line 54
;54:		player->pain_debounce_time = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 55
;55:		G_AddEvent( player, EV_PAIN, player->health );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 56
;56:		client->ps.damageEvent++;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 57
;57:	}
LABELV $64
line 60
;58:
;59:
;60:	client->ps.damageCount = count;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 65
;61:
;62:	//
;63:	// clear totals
;64:	//
;65:	client->damage_blood = 0;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 66
;66:	client->damage_armor = 0;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 67
;67:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 0
ASGNI4
line 68
;68:}
LABELV $54
endproc P_DamageFeedback 36 12
export P_WorldEffects
proc P_WorldEffects 24 32
line 79
;69:
;70:
;71:
;72:/*
;73:=============
;74:P_WorldEffects
;75:
;76:Check for lava / slime contents and drowning
;77:=============
;78:*/
;79:void P_WorldEffects( gentity_t *ent ) {
line 83
;80:	qboolean	envirosuit;
;81:	int			waterlevel;
;82:
;83:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $69
line 84
;84:		ent->client->airOutTime = level.time + 12000;	// don't need air
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 85
;85:		return;
ADDRGP4 $68
JUMPV
LABELV $69
line 88
;86:	}
;87:
;88:	waterlevel = ent->waterlevel;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ASGNI4
line 90
;89:
;90:	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $74
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $75
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 95
;91:
;92:	//
;93:	// check for drowning
;94:	//
;95:	if ( waterlevel == 3 ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $76
line 97
;96:		// envirosuit give air
;97:		if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $78
line 98
;98:			ent->client->airOutTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 99
;99:		}
LABELV $78
line 102
;100:
;101:		// if out of air, start drowning
;102:		if ( ent->client->airOutTime < level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $77
line 104
;103:			// drown!
;104:			ent->client->airOutTime += 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 105
;105:			if ( ent->health > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
LEI4 $77
line 107
;106:				// take more damage the longer underwater
;107:				ent->damage += 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 108
;108:				if (ent->damage > 15)
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 15
LEI4 $86
line 109
;109:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 15
ASGNI4
LABELV $86
line 112
;110:
;111:				// don't play a normal pain sound
;112:				ent->pain_debounce_time = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 114
;113:
;114:				G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 14
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 116
;115:					ent->damage, DAMAGE_NO_ARMOR, MOD_WATER);
;116:			}
line 117
;117:		}
line 118
;118:	} else {
ADDRGP4 $77
JUMPV
LABELV $76
line 119
;119:		ent->client->airOutTime = level.time + 12000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 120
;120:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 2
ASGNI4
line 121
;121:	}
LABELV $77
line 126
;122:
;123:	//
;124:	// check for sizzle damage (move to pmove?)
;125:	//
;126:	if (waterlevel && 
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $90
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $90
line 127
;127:		(ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
line 128
;128:		if (ent->health > 0
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
LEI4 $92
ADDRLP4 12
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $92
line 129
;129:			&& ent->pain_debounce_time <= level.time	) {
line 131
;130:
;131:			if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $95
line 132
;132:				G_AddEvent( ent, EV_POWERUP_BATTLESUIT, 0 );
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
line 133
;133:			} else {
ADDRGP4 $96
JUMPV
LABELV $95
line 134
;134:				if (ent->watertype & CONTENTS_LAVA) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $97
line 135
;135:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 30
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 137
;136:						30*waterlevel, 0, MOD_LAVA);
;137:				}
LABELV $97
line 139
;138:
;139:				if (ent->watertype & CONTENTS_SLIME) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $99
line 140
;140:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 15
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 142
;141:						10*waterlevel, 0, MOD_SLIME);
;142:				}
LABELV $99
line 143
;143:			}
LABELV $96
line 144
;144:		}
LABELV $92
line 145
;145:	}
LABELV $90
line 146
;146:}
LABELV $68
endproc P_WorldEffects 24 32
export G_SetClientSound
proc G_SetClientSound 4 0
line 155
;147:
;148:
;149:
;150:/*
;151:===============
;152:G_SetClientSound
;153:===============
;154:*/
;155:void G_SetClientSound( gentity_t *ent ) {
line 162
;156:#ifdef MISSIONPACK
;157:	if( ent->s.eFlags & EF_TICKING ) {
;158:		ent->client->ps.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav");
;159:	}
;160:	else
;161:#endif
;162:	if (ent->waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CNSTI4 0
EQI4 $102
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $102
line 163
;163:		ent->client->ps.loopSound = level.snd_fry;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 level+352
INDIRI4
ASGNI4
line 164
;164:	} else {
ADDRGP4 $103
JUMPV
LABELV $102
line 165
;165:		ent->client->ps.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 444
ADDP4
CNSTI4 0
ASGNI4
line 166
;166:	}
LABELV $103
line 167
;167:}
LABELV $101
endproc G_SetClientSound 4 0
export ClientImpacts
proc ClientImpacts 76 12
line 178
;168:
;169:
;170:
;171://==============================================================
;172:
;173:/*
;174:==============
;175:ClientImpacts
;176:==============
;177:*/
;178:void ClientImpacts( gentity_t *ent, pmove_t *pm ) {
line 183
;179:	int		i, j;
;180:	trace_t	trace;
;181:	gentity_t	*other;
;182:
;183:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 184
;184:	for (i=0 ; i<pm->numtouch ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $106
line 185
;185:		for (j=0 ; j<i ; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $110
line 186
;186:			if (pm->touchents[j] == pm->touchents[i] ) {
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 48
ADDP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 48
ADDP4
ADDP4
INDIRI4
NEI4 $114
line 187
;187:				break;
ADDRGP4 $112
JUMPV
LABELV $114
line 189
;188:			}
;189:		}
LABELV $111
line 185
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $113
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $110
LABELV $112
line 190
;190:		if (j != i) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $116
line 191
;191:			continue;	// duplicated
ADDRGP4 $107
JUMPV
LABELV $116
line 193
;192:		}
;193:		other = &g_entities[ pm->touchents[i] ];
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 195
;194:
;195:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $118
ADDRLP4 68
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 196
;196:			ent->touch( ent, other, &trace );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 197
;197:		}
LABELV $118
line 199
;198:
;199:		if ( !other->touch ) {
ADDRLP4 8
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $120
line 200
;200:			continue;
ADDRGP4 $107
JUMPV
LABELV $120
line 203
;201:		}
;202:
;203:		other->touch( other, ent, &trace );
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 204
;204:	}
LABELV $107
line 184
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $109
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LTI4 $106
line 206
;205:
;206:}
LABELV $105
endproc ClientImpacts 76 12
data
align 4
LABELV $123
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_TouchTriggers
code
proc G_TouchTriggers 4228 16
line 216
;207:
;208:/*
;209:============
;210:G_TouchTriggers
;211:
;212:Find all trigger entities that ent's current position touches.
;213:Spectators will only interact with teleporters.
;214:============
;215:*/
;216:void	G_TouchTriggers( gentity_t *ent ) {
line 224
;217:	int			i, num;
;218:	int			touch[MAX_GENTITIES];
;219:	gentity_t	*hit;
;220:	trace_t		trace;
;221:	vec3_t		mins, maxs;
;222:	static vec3_t	range = { 40, 40, 52 };
;223:
;224:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $124
line 225
;225:		return;
ADDRGP4 $122
JUMPV
LABELV $124
line 229
;226:	}
;227:
;228:	// dead clients don't activate triggers!
;229:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $126
line 230
;230:		return;
ADDRGP4 $122
JUMPV
LABELV $126
line 233
;231:	}
;232:
;233:	VectorSubtract( ent->client->ps.origin, range, mins );
ADDRLP4 4188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 4188
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $123
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4188
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $123+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $123+8
INDIRF4
SUBF4
ASGNF4
line 234
;234:	VectorAdd( ent->client->ps.origin, range, maxs );
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 4192
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $123
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4192
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $123+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $123+8
INDIRF4
ADDF4
ASGNF4
line 236
;235:
;236:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4196
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 4196
INDIRI4
ASGNI4
line 239
;237:
;238:	// can't use ent->absmin, because that has a one unit pad
;239:	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
ADDRLP4 4200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 4200
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4200
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64+8
ADDRLP4 4204
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4204
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 240
;240:	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );
ADDRLP4 4208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 4208
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4208
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4208
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4208
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76+8
ADDRLP4 4212
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4212
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
line 242
;241:
;242:	for ( i=0 ; i<num ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $140
line 243
;243:		hit = &g_entities[touch[i]];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 92
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 245
;244:
;245:		if ( !hit->touch && !ent->touch ) {
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $144
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $144
line 246
;246:			continue;
ADDRGP4 $141
JUMPV
LABELV $144
line 248
;247:		}
;248:		if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 1073741824
BANDI4
CNSTI4 0
NEI4 $146
line 249
;249:			continue;
ADDRGP4 $141
JUMPV
LABELV $146
line 254
;250:		}
;251:
;252:		// ignore most entities if a spectator
;253://qlone - freezetag
;254:		if ( /*ent->client->sess.sessionTeam == TEAM_SPECTATOR*/ is_spectator( ent->client ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 4216
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 4216
INDIRI4
CNSTI4 0
EQI4 $148
line 256
;255://qlone - freezetag
;256:			if ( hit->s.eType != ET_TELEPORT_TRIGGER &&
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
EQI4 $150
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 Touch_DoorTrigger
CVPU4 4
EQU4 $150
line 259
;257:				// this is ugly but adding a new ET_? type will
;258:				// most likely cause network incompatibilities
;259:				hit->touch != Touch_DoorTrigger) {
line 260
;260:				continue;
ADDRGP4 $141
JUMPV
LABELV $150
line 262
;261:			}
;262:		}
LABELV $148
line 266
;263:
;264:		// use seperate code for determining if an item is picked up
;265:		// so you don't have to actually contact its bounding box
;266:		if ( hit->s.eType == ET_ITEM ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $152
line 267
;267:			if ( !BG_PlayerTouchesItem( &ent->client->ps, &hit->s, level.time ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 4220
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 4220
INDIRI4
CNSTI4 0
NEI4 $153
line 268
;268:				continue;
ADDRGP4 $141
JUMPV
line 270
;269:			}
;270:		} else {
LABELV $152
line 271
;271:			if ( !trap_EntityContact( mins, maxs, hit ) ) {
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4220
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 4220
INDIRI4
CNSTI4 0
NEI4 $157
line 272
;272:				continue;
ADDRGP4 $141
JUMPV
LABELV $157
line 274
;273:			}
;274:		}
LABELV $153
line 276
;275:
;276:		memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 278
;277:
;278:		if ( hit->touch ) {
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $159
line 279
;279:			hit->touch (hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 280
;280:		}
LABELV $159
line 282
;281:
;282:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $161
ADDRLP4 4220
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $161
line 283
;283:			ent->touch( ent, hit, &trace );
ADDRLP4 4224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4224
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 284
;284:		}
LABELV $161
line 285
;285:	}
LABELV $141
line 242
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $143
ADDRLP4 4
INDIRI4
ADDRLP4 88
INDIRI4
LTI4 $140
line 288
;286:
;287:	// if we didn't touch a jump pad this pmove frame
;288:	if ( ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount ) {
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 4216
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
EQI4 $163
line 289
;289:		ent->client->ps.jumppad_frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 290
;290:		ent->client->ps.jumppad_ent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 291
;291:	}
LABELV $163
line 292
;292:}
LABELV $122
endproc G_TouchTriggers 4228 16
export SpectatorThink
proc SpectatorThink 236 12
line 299
;293:
;294:/*
;295:=================
;296:SpectatorThink
;297:=================
;298:*/
;299:void SpectatorThink( gentity_t *ent, usercmd_t *ucmd ) {
line 303
;300:	pmove_t	pm;
;301:	gclient_t	*client;
;302:
;303:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 305
;304:
;305:	if ( client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
EQI4 $166
line 306
;306:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 307
;307:		client->ps.speed = g_speed.value * 1.25f; // faster than normal
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CNSTF4 1067450368
MULF4
CVFI4 4
ASGNI4
line 310
;308:
;309:		// set up for pmove
;310:		memset( &pm, 0, sizeof( pm ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 224
ARGI4
ADDRGP4 memset
CALLP4
pop
line 311
;311:		pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 312
;312:		pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 24
line 313
;313:		if ( client->noclip )
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $170
line 314
;314:			pm.tracemask = 0;
ADDRLP4 4+28
CNSTI4 0
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $170
line 316
;315:		else
;316:			pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
LABELV $171
line 318
;317://qlone - freezetag
;318:		if ( g_freezeTag.integer && g_dmflags.integer & 512 ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $174
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $174
line 319
;319:			pm.tracemask &= ~CONTENTS_PLAYERCLIP;
ADDRLP4 4+28
ADDRLP4 4+28
INDIRI4
CNSTI4 -65537
BANDI4
ASGNI4
line 320
;320:		}
LABELV $174
line 322
;321://qlone - freezetag
;322:		pm.trace = trap_Trace;
ADDRLP4 4+216
ADDRGP4 trap_Trace
ASGNP4
line 323
;323:		pm.pointcontents = trap_PointContents;
ADDRLP4 4+220
ADDRGP4 trap_PointContents
ASGNP4
line 326
;324:
;325:		// perform a pmove
;326:		Pmove( &pm );
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 328
;327:		// save results of pmove
;328:		VectorCopy( client->ps.origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 330
;329:
;330:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 331
;331:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 332
;332:	}
LABELV $166
line 334
;333:
;334:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ASGNI4
line 335
;335:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 338
;336:
;337:	// attack button cycles through spectators
;338:	if ( ( client->buttons & BUTTON_ATTACK ) && ! ( client->oldbuttons & BUTTON_ATTACK ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $181
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $181
line 339
;339:		Cmd_FollowCycle_f( ent, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 340
;340:	}
ADDRGP4 $182
JUMPV
LABELV $181
line 342
;341://qlone - freezetag
;342:	else if ( g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $183
line 343
;343:		respawnSpectator( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawnSpectator
CALLV
pop
line 344
;344:	}
LABELV $183
LABELV $182
line 346
;345://qlone - freezetag
;346:}
LABELV $165
endproc SpectatorThink 236 12
export ClientInactivityTimer
proc ClientInactivityTimer 8 8
line 357
;347:
;348:
;349:
;350:/*
;351:=================
;352:ClientInactivityTimer
;353:
;354:Returns qfalse if the client is dropped
;355:=================
;356:*/
;357:qboolean ClientInactivityTimer( gclient_t *client ) {
line 358
;358:	if ( ! g_inactivity.integer ) {
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 0
NEI4 $187
line 361
;359:		// give everyone some time, so if the operator sets g_inactivity during
;360:		// gameplay, everyone isn't kicked
;361:		client->inactivityTime = level.time + 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 362
;362:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 363
;363:	} else if ( client->pers.cmd.forwardmove || 
ADDRGP4 $188
JUMPV
LABELV $187
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 493
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $195
ADDRLP4 0
INDIRP4
CNSTI4 494
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $195
ADDRLP4 0
INDIRP4
CNSTI4 495
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $195
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $191
LABELV $195
line 366
;364:		client->pers.cmd.rightmove || 
;365:		client->pers.cmd.upmove ||
;366:		(client->pers.cmd.buttons & BUTTON_ATTACK) ) {
line 367
;367:		client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 368
;368:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 369
;369:	} else if ( !client->pers.localClient ) {
ADDRGP4 $192
JUMPV
LABELV $191
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
NEI4 $198
line 371
;370://qlone - freezetag
;371:		if ( g_freezeTag.integer && g_entities[ client->ps.clientNum ].freezeState ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $200
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $200
line 372
;372:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $186
JUMPV
LABELV $200
line 375
;373:		}
;374://qlone - freezetag
;375:		if ( level.time > client->inactivityTime ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
LEI4 $204
line 376
;376:			trap_DropClient( client - level.clients, "Dropped due to inactivity" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1568
DIVI4
ARGI4
ADDRGP4 $207
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 377
;377:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $186
JUMPV
LABELV $204
line 379
;378:		}
;379:		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $208
ADDRLP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $208
line 380
;380:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 1
ASGNI4
line 381
;381:			trap_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1568
DIVI4
ARGI4
ADDRGP4 $211
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 382
;382:		}
LABELV $208
line 383
;383:	}
LABELV $198
LABELV $192
LABELV $188
line 384
;384:	return qtrue;
CNSTI4 1
RETI4
LABELV $186
endproc ClientInactivityTimer 8 8
export ClientTimerActions
proc ClientTimerActions 20 12
line 394
;385:}
;386:
;387:/*
;388:==================
;389:ClientTimerActions
;390:
;391:Actions that happen once a second
;392:==================
;393:*/
;394:void ClientTimerActions( gentity_t *ent, int msec ) {
line 400
;395:	gclient_t	*client;
;396:#ifdef MISSIONPACK
;397:	int			maxHealth;
;398:#endif
;399:
;400:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 401
;401:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $213
line 403
;402:
;403:	while ( client->timeResidual >= 1000 ) {
line 404
;404:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 432
;405:
;406:		// regenerate
;407:#ifdef MISSIONPACK
;408:		if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;409:			maxHealth = client->ps.stats[STAT_MAX_HEALTH] / 2;
;410:		}
;411:		else if ( client->ps.powerups[PW_REGEN] ) {
;412:			maxHealth = client->ps.stats[STAT_MAX_HEALTH];
;413:		}
;414:		else {
;415:			maxHealth = 0;
;416:		}
;417:		if( maxHealth ) {
;418:			if ( ent->health < maxHealth ) {
;419:				ent->health += 15;
;420:				if ( ent->health > maxHealth * 1.1 ) {
;421:					ent->health = maxHealth * 1.1;
;422:				}
;423:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;424:			} else if ( ent->health < maxHealth * 2) {
;425:				ent->health += 5;
;426:				if ( ent->health > maxHealth * 2 ) {
;427:					ent->health = maxHealth * 2;
;428:				}
;429:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
;430:			}
;431:#else
;432:		if ( client->ps.powerups[PW_REGEN] ) {
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $216
line 433
;433:			if ( ent->health < client->ps.stats[STAT_MAX_HEALTH]) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $218
line 434
;434:				ent->health += 15;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 435
;435:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 1.1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
LEF4 $220
line 436
;436:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 1.1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
CVFI4 4
ASGNI4
line 437
;437:				}
LABELV $220
line 438
;438:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 439
;439:			} else if ( ent->health < client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRGP4 $217
JUMPV
LABELV $218
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
GEI4 $217
line 440
;440:				ent->health += 5;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 441
;441:				if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $224
line 442
;442:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 443
;443:				}
LABELV $224
line 444
;444:				G_AddEvent( ent, EV_POWERUP_REGEN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 445
;445:			}
line 447
;446:#endif
;447:		} else {
ADDRGP4 $217
JUMPV
LABELV $216
line 449
;448:			// count down health when over max
;449:			if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $226
line 450
;450:				ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 451
;451:			}
LABELV $226
line 452
;452:		}
LABELV $217
line 455
;453:
;454:		// count down armor when over max
;455:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $228
line 456
;456:			client->ps.stats[STAT_ARMOR]--;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 457
;457:		}
LABELV $228
line 458
;458:	}
LABELV $214
line 403
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $213
line 497
;459:#ifdef MISSIONPACK
;460:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;461:		int w, max, inc, t, i;
;462:    int weapList[]={WP_MACHINEGUN,WP_SHOTGUN,WP_GRENADE_LAUNCHER,WP_ROCKET_LAUNCHER,WP_LIGHTNING,WP_RAILGUN,WP_PLASMAGUN,WP_BFG,WP_NAILGUN,WP_PROX_LAUNCHER,WP_CHAINGUN};
;463:    int weapCount = ARRAY_LEN( weapList );
;464:		//
;465:    for (i = 0; i < weapCount; i++) {
;466:		  w = weapList[i];
;467:
;468:		  switch(w) {
;469:			  case WP_MACHINEGUN: max = 50; inc = 4; t = 1000; break;
;470:			  case WP_SHOTGUN: max = 10; inc = 1; t = 1500; break;
;471:			  case WP_GRENADE_LAUNCHER: max = 10; inc = 1; t = 2000; break;
;472:			  case WP_ROCKET_LAUNCHER: max = 10; inc = 1; t = 1750; break;
;473:			  case WP_LIGHTNING: max = 50; inc = 5; t = 1500; break;
;474:			  case WP_RAILGUN: max = 10; inc = 1; t = 1750; break;
;475:			  case WP_PLASMAGUN: max = 50; inc = 5; t = 1500; break;
;476:			  case WP_BFG: max = 10; inc = 1; t = 4000; break;
;477:			  case WP_NAILGUN: max = 10; inc = 1; t = 1250; break;
;478:			  case WP_PROX_LAUNCHER: max = 5; inc = 1; t = 2000; break;
;479:			  case WP_CHAINGUN: max = 100; inc = 5; t = 1000; break;
;480:			  default: max = 0; inc = 0; t = 1000; break;
;481:		  }
;482:		  client->ammoTimes[w] += msec;
;483:		  if ( client->ps.ammo[w] >= max ) {
;484:			  client->ammoTimes[w] = 0;
;485:		  }
;486:		  if ( client->ammoTimes[w] >= t ) {
;487:			  while ( client->ammoTimes[w] >= t )
;488:				  client->ammoTimes[w] -= t;
;489:			  client->ps.ammo[w] += inc;
;490:			  if ( client->ps.ammo[w] > max ) {
;491:				  client->ps.ammo[w] = max;
;492:			  }
;493:		  }
;494:    }
;495:	}
;496:#endif
;497:}
LABELV $212
endproc ClientTimerActions 20 12
export ClientIntermissionThink
proc ClientIntermissionThink 20 0
line 504
;498:
;499:/*
;500:====================
;501:ClientIntermissionThink
;502:====================
;503:*/
;504:void ClientIntermissionThink( gclient_t *client ) {
line 505
;505:	client->ps.eFlags &= ~EF_TALK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 506
;506:	client->ps.eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 511
;507:
;508:	// the level will exit when everyone wants to or after timeouts
;509:
;510:	// swap and latch button actions
;511:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 668
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ASGNI4
line 512
;512:	client->buttons = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 664
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 513
;513:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $231
line 515
;514:		// this used to be an ^1 but once a player says ready, it should stick
;515:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 1
ASGNI4
line 516
;516:	}
LABELV $231
line 517
;517:}
LABELV $230
endproc ClientIntermissionThink 20 0
export ClientEvents
proc ClientEvents 68 32
line 528
;518:
;519:
;520:/*
;521:================
;522:ClientEvents
;523:
;524:Events will be passed on to the clients for presentation,
;525:but any server game effects are handled here
;526:================
;527:*/
;528:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 538
;529:	int		i, j;
;530:	int		event;
;531:	gclient_t *client;
;532:	int		damage;
;533:	vec3_t	origin, angles;
;534://	qboolean	fired;
;535:	gitem_t *item;
;536:	gentity_t *drop;
;537:
;538:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 540
;539:
;540:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $234
line 541
;541:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 542
;542:	}
LABELV $234
line 543
;543:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $239
JUMPV
LABELV $236
line 544
;544:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 546
;545:
;546:		switch ( event ) {
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $242
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $242
ADDRLP4 4
INDIRI4
CNSTI4 11
LTI4 $241
LABELV $265
ADDRLP4 4
INDIRI4
CNSTI4 23
EQI4 $251
ADDRLP4 4
INDIRI4
CNSTI4 25
EQI4 $252
ADDRLP4 4
INDIRI4
CNSTI4 26
EQI4 $264
ADDRGP4 $241
JUMPV
LABELV $242
line 549
;547:		case EV_FALL_MEDIUM:
;548:		case EV_FALL_FAR:
;549:			if ( ent->s.eType != ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $243
line 550
;550:				break;		// not in the player model
ADDRGP4 $241
JUMPV
LABELV $243
line 552
;551:			}
;552:			if ( g_dmflags.integer & DF_NO_FALLING ) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $245
line 553
;553:				break;
ADDRGP4 $241
JUMPV
LABELV $245
line 555
;554:			}
;555:			if ( event == EV_FALL_FAR ) {
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $248
line 556
;556:				damage = 10;
ADDRLP4 24
CNSTI4 10
ASGNI4
line 557
;557:			} else {
ADDRGP4 $249
JUMPV
LABELV $248
line 558
;558:				damage = 5;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 559
;559:			}
LABELV $249
line 560
;560:			ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 561
;561:			G_Damage (ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 19
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 562
;562:			break;
ADDRGP4 $241
JUMPV
LABELV $251
line 565
;563:
;564:		case EV_FIRE_WEAPON:
;565:			FireWeapon( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 566
;566:			break;
ADDRGP4 $241
JUMPV
LABELV $252
line 570
;567:
;568:		case EV_USE_ITEM1:		// teleporter
;569:			// drop flags in CTF
;570:			item = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 571
;571:			j = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 573
;572:
;573:			if ( ent->client->ps.powerups[ PW_REDFLAG ] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $253
line 574
;574:				item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
line 575
;575:				j = PW_REDFLAG;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 576
;576:			} else if ( ent->client->ps.powerups[ PW_BLUEFLAG ] ) {
ADDRGP4 $254
JUMPV
LABELV $253
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $255
line 577
;577:				item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
line 578
;578:				j = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 8
ASGNI4
line 579
;579:			} else if ( ent->client->ps.powerups[ PW_NEUTRALFLAG ] ) {
ADDRGP4 $256
JUMPV
LABELV $255
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $257
line 580
;580:				item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
line 581
;581:				j = PW_NEUTRALFLAG;
ADDRLP4 16
CNSTI4 9
ASGNI4
line 582
;582:			}
LABELV $257
LABELV $256
LABELV $254
line 584
;583:
;584:			if ( item ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $259
line 585
;585:				drop = Drop_Item( ent, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 60
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 60
INDIRP4
ASGNP4
line 587
;586:				// decide how many seconds it has left
;587:				drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
ADDRLP4 20
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 16
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
line 588
;588:				if ( drop->count < 1 ) {
ADDRLP4 20
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 1
GEI4 $262
line 589
;589:					drop->count = 1;
ADDRLP4 20
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 590
;590:				}
LABELV $262
line 592
;591:				// for pickup prediction
;592:				drop->s.time2 = drop->count;
ADDRLP4 64
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 594
;593:
;594:				ent->client->ps.powerups[ j ] = 0;
ADDRLP4 16
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
CNSTI4 0
ASGNI4
line 595
;595:			}
LABELV $259
line 619
;596:
;597:#ifdef MISSIONPACK
;598:			if ( g_gametype.integer == GT_HARVESTER ) {
;599:				if ( ent->client->ps.generic1 > 0 ) {
;600:					if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;601:						item = BG_FindItem( "Blue Cube" );
;602:					} else {
;603:						item = BG_FindItem( "Red Cube" );
;604:					}
;605:					if ( item ) {
;606:						for ( j = 0; j < ent->client->ps.generic1; j++ ) {
;607:							drop = Drop_Item( ent, item, 0 );
;608:							if ( ent->client->sess.sessionTeam == TEAM_RED ) {
;609:								drop->spawnflags = TEAM_BLUE;
;610:							} else {
;611:								drop->spawnflags = TEAM_RED;
;612:							}
;613:						}
;614:					}
;615:					ent->client->ps.generic1 = 0;
;616:				}
;617:			}
;618:#endif
;619:			SelectSpawnPoint( ent, ent->client->ps.origin, origin, angles );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 620
;620:			TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 621
;621:			break;
ADDRGP4 $241
JUMPV
LABELV $264
line 624
;622:
;623:		case EV_USE_ITEM2:		// medkit
;624:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 626
;625:
;626:			break;
line 650
;627:
;628:#ifdef MISSIONPACK
;629:		case EV_USE_ITEM3:		// kamikaze
;630:			// make sure the invulnerability is off
;631:			ent->client->invulnerabilityTime = 0;
;632:			// start the kamikze
;633:			G_StartKamikaze( ent );
;634:			break;
;635:
;636:		case EV_USE_ITEM4:		// portal
;637:			if( ent->client->portalID ) {
;638:				DropPortalSource( ent );
;639:			}
;640:			else {
;641:				DropPortalDestination( ent );
;642:			}
;643:			break;
;644:		case EV_USE_ITEM5:		// invulnerability
;645:			ent->client->invulnerabilityTime = level.time + 10000;
;646:			break;
;647:#endif
;648:
;649:		default:
;650:			break;
LABELV $241
line 652
;651:		}
;652:	}
LABELV $237
line 543
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $239
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $236
line 654
;653:
;654:}
LABELV $233
endproc ClientEvents 68 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 40 12
line 706
;655:
;656:#ifdef MISSIONPACK
;657:/*
;658:==============
;659:StuckInOtherClient
;660:==============
;661:*/
;662:static int StuckInOtherClient(gentity_t *ent) {
;663:	int i;
;664:	gentity_t	*ent2;
;665:
;666:	ent2 = &g_entities[0];
;667:	for ( i = 0; i < MAX_CLIENTS; i++, ent2++ ) {
;668:		if ( ent2 == ent ) {
;669:			continue;
;670:		}
;671:		if ( !ent2->inuse ) {
;672:			continue;
;673:		}
;674:		if ( !ent2->client ) {
;675:			continue;
;676:		}
;677:		if ( ent2->health <= 0 ) {
;678:			continue;
;679:		}
;680:		//
;681:		if (ent2->r.absmin[0] > ent->r.absmax[0])
;682:			continue;
;683:		if (ent2->r.absmin[1] > ent->r.absmax[1])
;684:			continue;
;685:		if (ent2->r.absmin[2] > ent->r.absmax[2])
;686:			continue;
;687:		if (ent2->r.absmax[0] < ent->r.absmin[0])
;688:			continue;
;689:		if (ent2->r.absmax[1] < ent->r.absmin[1])
;690:			continue;
;691:		if (ent2->r.absmax[2] < ent->r.absmin[2])
;692:			continue;
;693:		return qtrue;
;694:	}
;695:	return qfalse;
;696:}
;697:#endif
;698:
;699:void BotTestSolid(vec3_t origin);
;700:
;701:/*
;702:==============
;703:SendPendingPredictableEvents
;704:==============
;705:*/
;706:void SendPendingPredictableEvents( playerState_t *ps ) {
line 712
;707:	gentity_t *t;
;708:	int event, seq;
;709:	int extEvent, number;
;710:
;711:	// if there are still events pending
;712:	if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $267
line 715
;713:		// create a temporary entity for this event which is sent to everyone
;714:		// except the client who generated the event
;715:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 716
;716:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 718
;717:		// set external event to zero before calling BG_PlayerStateToEntityState
;718:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 719
;719:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 721
;720:		// create temporary entity for event
;721:		t = G_TempEntity( ps->origin, event );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 722
;722:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 723
;723:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 724
;724:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 725
;725:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 726
;726:		t->s.eFlags |= EF_PLAYER_EVENT;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 727
;727:		t->s.otherEntityNum = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 729
;728:		// send to everyone except the client who generated the event
;729:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 730
;730:		t->r.singleClient = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 732
;731:		// set back external event
;732:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 733
;733:	}
LABELV $267
line 734
;734:}
LABELV $266
endproc SendPendingPredictableEvents 40 12
export ClientThink_real
proc ClientThink_real 292 12
line 747
;735:
;736:/*
;737:==============
;738:ClientThink
;739:
;740:This will be called once for each client frame, which will
;741:usually be a couple times for each server frame on fast clients.
;742:
;743:If "g_synchronousClients 1" is set, this will be called exactly
;744:once for each server frame, which makes for smooth demo recording.
;745:==============
;746:*/
;747:void ClientThink_real( gentity_t *ent ) {
line 754
;748:	gclient_t	*client;
;749:	pmove_t		pm;
;750:	int			oldEventSequence;
;751:	int			msec;
;752:	usercmd_t	*ucmd;
;753:
;754:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 757
;755:
;756:	// don't think if the client is not yet connected (and thus not yet spawned in)
;757:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $270
line 758
;758:		return;
ADDRGP4 $269
JUMPV
LABELV $270
line 761
;759:	}
;760:	// mark the time, so the connection sprite can be removed
;761:	ucmd = &ent->client->pers.cmd;
ADDRLP4 228
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
line 764
;762:
;763:	// sanity check the command time to prevent speedup cheating
;764:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 228
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $272
line 765
;765:		ucmd->serverTime = level.time + 200;
ADDRLP4 228
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 767
;766://		G_Printf("serverTime <<<<<\n" );
;767:	} else
ADDRGP4 $273
JUMPV
LABELV $272
line 768
;768:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 228
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $276
line 769
;769:		ucmd->serverTime = level.time - 1000;
ADDRLP4 228
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 771
;770://		G_Printf("serverTime >>>>>\n" );
;771:	}
LABELV $276
LABELV $273
line 774
;772:
;773:	// unlagged
;774:	client->frameOffset = trap_Milliseconds() - level.frameStartTime;
ADDRLP4 240
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1548
ADDP4
ADDRLP4 240
INDIRI4
ADDRGP4 level+11800
INDIRI4
SUBI4
ASGNI4
line 775
;775:	client->lastCmdTime = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRLP4 228
INDIRP4
INDIRI4
ASGNI4
line 776
;776:	client->lastUpdateFrame = level.framenum;
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 778
;777:
;778:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 232
ADDRLP4 228
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 781
;779:	// following others may result in bad times, but we still want
;780:	// to check for follow toggles
;781:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 232
INDIRI4
CNSTI4 1
GEI4 $282
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
EQI4 $282
line 782
;782:		return;
ADDRGP4 $269
JUMPV
LABELV $282
line 784
;783:	}
;784:	if ( msec > 200 ) {
ADDRLP4 232
INDIRI4
CNSTI4 200
LEI4 $284
line 785
;785:		msec = 200;
ADDRLP4 232
CNSTI4 200
ASGNI4
line 786
;786:	}
LABELV $284
line 788
;787:
;788:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $286
line 789
;789:		trap_Cvar_Set( "pmove_msec", "8" );
ADDRGP4 $289
ARGP4
ADDRGP4 $290
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 790
;790:		trap_Cvar_Update( &pmove_msec );
ADDRGP4 pmove_msec
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 791
;791:	} else if ( pmove_msec.integer > 33 ) {
ADDRGP4 $287
JUMPV
LABELV $286
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $291
line 792
;792:		trap_Cvar_Set( "pmove_msec", "33" );
ADDRGP4 $289
ARGP4
ADDRGP4 $294
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 793
;793:		trap_Cvar_Update( &pmove_msec );
ADDRGP4 pmove_msec
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 794
;794:	}
LABELV $291
LABELV $287
line 796
;795:
;796:	if ( pmove_fixed.integer ) {
ADDRGP4 pmove_fixed+12
INDIRI4
CNSTI4 0
EQI4 $295
line 797
;797:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 800
;798:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;799:		//	return;
;800:	}
LABELV $295
line 805
;801:
;802:	//
;803:	// check for exiting intermission
;804:	//
;805:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $301
line 806
;806:		ClientIntermissionThink( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 807
;807:		return;
ADDRGP4 $269
JUMPV
LABELV $301
line 812
;808:	}
;809:
;810:	// spectators don't do much
;811://qlone - freezetag
;812:	if ( /*client->sess.sessionTeam == TEAM_SPECTATOR*/ is_spectator( client ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 244
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
EQI4 $304
line 814
;813://qlone - freezetag
;814:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
NEI4 $306
line 815
;815:			return;
ADDRGP4 $269
JUMPV
LABELV $306
line 817
;816:		}
;817:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 228
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 818
;818:		return;
ADDRGP4 $269
JUMPV
LABELV $304
line 822
;819:	}
;820:
;821:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;822:	if ( !ClientInactivityTimer( client ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 248
ADDRGP4 ClientInactivityTimer
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
NEI4 $308
line 823
;823:		return;
ADDRGP4 $269
JUMPV
LABELV $308
line 827
;824:	}
;825:
;826:	// clear the rewards if time
;827:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
LEI4 $310
line 828
;828:		client->ps.eFlags &= ~EF_AWARDS;
ADDRLP4 252
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
ADDRLP4 252
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 829
;829:	}
LABELV $310
line 831
;830:
;831:	if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $313
line 832
;832:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 833
;833:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $314
JUMPV
LABELV $313
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $315
line 834
;834:		client->ps.pm_type = PM_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 835
;835:	} else {
ADDRGP4 $316
JUMPV
LABELV $315
line 836
;836:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 837
;837:	}
LABELV $316
LABELV $314
line 839
;838:
;839:	client->ps.gravity = g_gravity.value;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 842
;840:
;841:	// set speed
;842:	client->ps.speed = g_speed.value;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 850
;843:
;844:#ifdef MISSIONPACK
;845:	if( bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;846:		client->ps.speed *= 1.5;
;847:	}
;848:	else
;849:#endif
;850:	if ( client->ps.powerups[PW_HASTE] ) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $319
line 851
;851:		client->ps.speed *= 1.3;
ADDRLP4 252
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
ADDRLP4 252
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1067869798
MULF4
CVFI4 4
ASGNI4
line 852
;852:	}
LABELV $319
line 855
;853:
;854:	// Let go of the hook if we aren't firing
;855:	if ( client->ps.weapon == WP_GRAPPLING_HOOK &&
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 10
NEI4 $321
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $321
ADDRLP4 228
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $321
line 856
;856:		client->hook && !( ucmd->buttons & BUTTON_ATTACK ) ) {
line 857
;857:		Weapon_HookFree(client->hook);
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 858
;858:	}
LABELV $321
line 861
;859:
;860://qlone - grapple hook
;861:	Hook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Hook_Fire
CALLV
pop
line 865
;862://qlone - grapple hook
;863:
;864:	// set up for pmove
;865:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 236
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 867
;866:
;867:	memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 224
ARGI4
ADDRGP4 memset
CALLP4
pop
line 871
;868:
;869:	// check for the hit-scan gauntlet, don't let the action
;870:	// go through as an attack unless it actually hits something
;871:	if ( client->ps.weapon == WP_GAUNTLET && !( ucmd->buttons & BUTTON_TALK ) &&
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $323
ADDRLP4 228
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $323
ADDRLP4 228
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $323
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $323
line 872
;872:		( ucmd->buttons & BUTTON_ATTACK ) && client->ps.weaponTime <= 0 ) {
line 873
;873:		pm.gauntletHit = CheckGauntletAttack( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 CheckGauntletAttack
CALLI4
ASGNI4
ADDRLP4 4+36
ADDRLP4 264
INDIRI4
ASGNI4
line 874
;874:	}
LABELV $323
line 876
;875:
;876:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $326
line 877
;877:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 878
;878:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 268
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 879
;879:	}
LABELV $326
line 908
;880:
;881:#ifdef MISSIONPACK
;882:	// check for invulnerability expansion before doing the Pmove
;883:	if (client->ps.powerups[PW_INVULNERABILITY] ) {
;884:		if ( !(client->ps.pm_flags & PMF_INVULEXPAND) ) {
;885:			vec3_t mins = { -42, -42, -42 };
;886:			vec3_t maxs = { 42, 42, 42 };
;887:			vec3_t oldmins, oldmaxs;
;888:
;889:			VectorCopy (ent->r.mins, oldmins);
;890:			VectorCopy (ent->r.maxs, oldmaxs);
;891:			// expand
;892:			VectorCopy (mins, ent->r.mins);
;893:			VectorCopy (maxs, ent->r.maxs);
;894:			trap_LinkEntity(ent);
;895:			// check if this would get anyone stuck in this player
;896:			if ( !StuckInOtherClient(ent) ) {
;897:				// set flag so the expanded size will be set in PM_CheckDuck
;898:				client->ps.pm_flags |= PMF_INVULEXPAND;
;899:			}
;900:			// set back
;901:			VectorCopy (oldmins, ent->r.mins);
;902:			VectorCopy (oldmaxs, ent->r.maxs);
;903:			trap_LinkEntity(ent);
;904:		}
;905:	}
;906:#endif
;907:
;908:	pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 909
;909:	pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRLP4 228
INDIRP4
INDIRB
ASGNB 24
line 910
;910:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $329
line 911
;911:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 912
;912:	}
ADDRGP4 $330
JUMPV
LABELV $329
line 913
;913:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $332
line 914
;914:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 4+28
CNSTI4 37814273
ASGNI4
line 915
;915:	}
ADDRGP4 $333
JUMPV
LABELV $332
line 916
;916:	else {
line 917
;917:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 4+28
CNSTI4 33619969
ASGNI4
line 919
;918://qlone - freezetag
;919:		if ( g_freezeTag.integer && g_dmflags.integer & 512 ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $336
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $336
line 920
;920:			pm.tracemask &= ~CONTENTS_PLAYERCLIP;
ADDRLP4 4+28
ADDRLP4 4+28
INDIRI4
CNSTI4 -65537
BANDI4
ASGNI4
line 921
;921:		}
LABELV $336
line 923
;922://qlone - freezetag
;923:	}
LABELV $333
LABELV $330
line 925
;924:
;925:	pm.trace = trap_Trace;
ADDRLP4 4+216
ADDRGP4 trap_Trace
ASGNP4
line 926
;926:	pm.pointcontents = trap_PointContents;
ADDRLP4 4+220
ADDRGP4 trap_PointContents
ASGNP4
line 927
;927:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 4+32
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 929
;928:
;929:	pm.pmove_fixed = pmove_fixed.integer;
ADDRLP4 4+208
ADDRGP4 pmove_fixed+12
INDIRI4
ASGNI4
line 930
;930:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 4+212
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 932
;931:
;932:	VectorCopy( client->ps.origin, client->oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 949
;933:
;934:#ifdef MISSIONPACK
;935:		if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
;936:			if ( level.time - level.intermissionQueued >= 1000  ) {
;937:				pm.cmd.buttons = 0;
;938:				pm.cmd.forwardmove = 0;
;939:				pm.cmd.rightmove = 0;
;940:				pm.cmd.upmove = 0;
;941:				if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
;942:					trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
;943:				}
;944:				ent->client->ps.pm_type = PM_SPINTERMISSION;
;945:			}
;946:		}
;947:		Pmove (&pm);
;948:#else
;949:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 953
;950:#endif
;951:
;952:	// save results of pmove
;953:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
EQI4 $349
line 954
;954:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 955
;955:	}
LABELV $349
line 957
;956:
;957:	BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 959
;958:
;959:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 961
;960:
;961:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $352
line 962
;962:		client->fireHeld = qfalse;		// for grapple
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 963
;963:	}
LABELV $352
line 966
;964:
;965:	// use the snapped origin for linking so it matches client predicted versions
;966:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 272
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 968
;967:
;968:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 4+176
INDIRB
ASGNB 12
line 969
;969:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 4+188
INDIRB
ASGNB 12
line 971
;970:
;971:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 4+204
INDIRI4
ASGNI4
line 972
;972:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 4+200
INDIRI4
ASGNI4
line 975
;973:
;974:	// execute client events
;975:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 978
;976:
;977:	// link entity now, after any personal teleporters have been used
;978:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 979
;979:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
NEI4 $358
line 980
;980:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 981
;981:	}
LABELV $358
line 984
;982:
;983:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;984:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 276
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 987
;985:
;986:	//test for solid areas in the AAS file
;987:	BotTestAAS(ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 BotTestAAS
CALLV
pop
line 990
;988:
;989:	// touch other objects
;990:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 993
;991:
;992:	// save results of triggers and client events
;993:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
EQI4 $360
line 994
;994:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 995
;995:	}
LABELV $360
line 998
;996:
;997:	// swap and latch button actions
;998:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ASGNI4
line 999
;999:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRLP4 228
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1000
;1000:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 288
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
ASGNP4
ADDRLP4 288
INDIRP4
ADDRLP4 288
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 1003
;1001:
;1002:	// check for respawning
;1003:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $363
line 1005
;1004:		// wait for the attack button to be pressed
;1005:		if ( level.time > client->respawnTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
LEI4 $269
line 1007
;1006:			// forcerespawn is to prevent users from waiting out powerups
;1007:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $368
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
SUBI4
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 1000
MULI4
LEI4 $368
line 1008
;1008:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1009
;1009:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1010
;1010:				return;
ADDRGP4 $269
JUMPV
LABELV $368
line 1014
;1011:			}
;1012:		
;1013:			// pressing attack or use is the normal respawn method
;1014:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 228
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $269
line 1015
;1015:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1016
;1016:			}
line 1017
;1017:		}
line 1018
;1018:		return;
ADDRGP4 $269
JUMPV
LABELV $363
line 1022
;1019:	}
;1020:
;1021:	// perform once-a-second actions
;1022:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1023
;1023:}
LABELV $269
endproc ClientThink_real 292 12
export ClientThink
proc ClientThink 4 8
line 1033
;1024:
;1025:
;1026:/*
;1027:==================
;1028:ClientThink
;1029:
;1030:A new command has arrived from the client
;1031:==================
;1032:*/
;1033:void ClientThink( int clientNum ) {
line 1036
;1034:	gentity_t *ent;
;1035:
;1036:	ent = g_entities + clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1037
;1037:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1045
;1038:
;1039:	// mark the time we got info, so we can display the
;1040:	// phone jack if they don't get any for a while
;1041:#if 0 // unlagged
;1042:	ent->client->lastCmdTime = level.time;
;1043:#endif
;1044:
;1045:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $376
ADDRGP4 g_synchronousClients+12
INDIRI4
CNSTI4 0
NEI4 $376
line 1046
;1046:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1047
;1047:	}
LABELV $376
line 1048
;1048:}
LABELV $375
endproc ClientThink 4 8
export G_RunClient
proc G_RunClient 0 4
line 1051
;1049:
;1050:
;1051:void G_RunClient( gentity_t *ent ) {
line 1052
;1052:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $380
ADDRGP4 g_synchronousClients+12
INDIRI4
CNSTI4 0
NEI4 $380
line 1053
;1053:		return;
ADDRGP4 $379
JUMPV
LABELV $380
line 1055
;1054:	}
;1055:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1056
;1056:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1057
;1057:}
LABELV $379
endproc G_RunClient 0 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 24 8
line 1066
;1058:
;1059:
;1060:/*
;1061:==================
;1062:SpectatorClientEndFrame
;1063:
;1064:==================
;1065:*/
;1066:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1070
;1067:	gclient_t	*cl;
;1068:
;1069:	// if we are doing a chase cam or a remote view, grab the latest info
;1070:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $385
line 1073
;1071:		int		clientNum, flags;
;1072:
;1073:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 1076
;1074:
;1075:		// team follow1 and team follow2 go to whatever clients are playing
;1076:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $387
line 1077
;1077:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+344
INDIRI4
ASGNI4
line 1078
;1078:		} else if ( clientNum == -2 ) {
ADDRGP4 $388
JUMPV
LABELV $387
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $390
line 1079
;1079:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+348
INDIRI4
ASGNI4
line 1080
;1080:		}
LABELV $390
LABELV $388
line 1081
;1081:		if ( (unsigned)clientNum < MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $393
line 1082
;1082:			cl = &level.clients[ clientNum ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1084
;1083://qlone - freezetag
;1084:			if ( cl->pers.connected == CON_CONNECTED && /*cl->sess.sessionTeam != TEAM_SPECTATOR*/ !is_spectator( cl ) ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $395
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $395
line 1086
;1085://qlone - freezetag
;1086:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 -540673
BANDI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540672
BANDI4
BORI4
ASGNI4
line 1089
;1087://qlone - freezetag
;1088:				//ent->client->ps = cl->ps;
;1089:				if ( !g_freezeTag.integer )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
NEI4 $397
line 1090
;1090:					ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 468
ADDRGP4 $398
JUMPV
LABELV $397
line 1092
;1091:				else
;1092:					Persistant_spectator( ent, cl );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Persistant_spectator
CALLV
pop
LABELV $398
line 1094
;1093://qlone - freezetag
;1094:				ent->client->ps.pm_flags |= PMF_FOLLOW;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1095
;1095:				ent->client->ps.eFlags = flags;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1096
;1096:				return;
ADDRGP4 $384
JUMPV
LABELV $395
line 1097
;1097:			} else {
line 1099
;1098:				// drop them to free spectators unless they are dedicated camera followers
;1099:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
LTI4 $400
line 1101
;1100://qlone - freezetag
;1101:					if ( g_freezeTag.integer )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $402
line 1102
;1102:						StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
ADDRGP4 $403
JUMPV
LABELV $402
line 1103
;1103:					else {
line 1105
;1104://qlone - freezetag
;1105:						ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 1
ASGNI4
line 1106
;1106:						ClientBegin( ent->client - level.clients );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1568
DIVI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1107
;1107:					} //qlone - freezetag
LABELV $403
line 1108
;1108:				}
LABELV $400
line 1109
;1109:			}
line 1110
;1110:		}
LABELV $393
line 1111
;1111:	}
LABELV $385
line 1113
;1112:
;1113:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
NEI4 $405
line 1114
;1114:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1115
;1115:	} else {
ADDRGP4 $406
JUMPV
LABELV $405
line 1116
;1116:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1117
;1117:	}
LABELV $406
line 1118
;1118:}
LABELV $384
endproc SpectatorClientEndFrame 24 8
bss
align 4
LABELV $408
skip 824
export ClientEndFrame
code
proc ClientEndFrame 44 12
line 1130
;1119:
;1120:
;1121:/*
;1122:==============
;1123:ClientEndFrame
;1124:
;1125:Called at the end of each server frame for each connected client
;1126:A fast client will have multiple ClientThink for each ClientEdFrame,
;1127:while a slow client may have multiple ClientEndFrame between ClientThink.
;1128:==============
;1129:*/
;1130:void ClientEndFrame( gentity_t *ent ) {
line 1137
;1131:	static gentity_t sent;
;1132:	int			i;
;1133:	gclient_t	*client;
;1134:	// unlagged
;1135:	int			frames;
;1136:
;1137:	if ( !ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $409
line 1138
;1138:		return;
ADDRGP4 $407
JUMPV
LABELV $409
line 1140
;1139:
;1140:	ent->r.svFlags &= ~svf_self_portal2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRGP4 svf_self_portal2
INDIRI4
BCOMI4
BANDI4
ASGNI4
line 1143
;1141:
;1142://qlone - freezetag
;1143:	if ( /*ent->client->sess.sessionTeam == TEAM_SPECTATOR*/ is_spectator( ent->client ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $411
line 1145
;1144://qlone - freezetag
;1145:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1146
;1146:		return;
ADDRGP4 $407
JUMPV
LABELV $411
line 1149
;1147:	}
;1148:
;1149:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1152
;1150:
;1151:	// turn off any expired powerups
;1152:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $413
line 1153
;1153:		if ( client->ps.powerups[ i ] < client->pers.cmd.serverTime ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
GEI4 $417
line 1154
;1154:			client->ps.powerups[ i ] = 0;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1155
;1155:		}
LABELV $417
line 1156
;1156:	}
LABELV $414
line 1152
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $413
line 1189
;1157:
;1158:#ifdef MISSIONPACK
;1159:	// set powerup for player animation
;1160:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1161:		ent->client->ps.powerups[PW_GUARD] = level.time;
;1162:	}
;1163:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;1164:		ent->client->ps.powerups[PW_SCOUT] = level.time;
;1165:	}
;1166:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER ) {
;1167:		ent->client->ps.powerups[PW_DOUBLER] = level.time;
;1168:	}
;1169:	if( bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN ) {
;1170:		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
;1171:	}
;1172:	if ( ent->client->invulnerabilityTime > level.time ) {
;1173:		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
;1174:	}
;1175:#endif
;1176:
;1177:	// save network bandwidth
;1178:#if 0
;1179:	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
;1180:		// FIXME: this must change eventually for non-sync demo recording
;1181:		VectorClear( ent->client->ps.viewangles );
;1182:	}
;1183:#endif
;1184:
;1185:	//
;1186:	// If the end of unit layout is displayed, don't give
;1187:	// the player any normal movement attributes
;1188:	//
;1189:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $419
line 1190
;1190:		client->ps.commandTime = client->pers.cmd.serverTime;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
line 1191
;1191:		return;
ADDRGP4 $407
JUMPV
LABELV $419
line 1195
;1192:	}
;1193:
;1194:	// burn from lava, etc
;1195:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1198
;1196:
;1197:	// apply all the damage taken this frame
;1198:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1200
;1199:
;1200:	client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 1202
;1201:
;1202:	G_SetClientSound( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1205
;1203:
;1204:	// set the latest info
;1205:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1207
;1206:
;1207:	SendPendingPredictableEvents( &client->ps );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1209
;1208:
;1209:	client->ps.eFlags &= ~EF_CONNECTION;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1210
;1210:	ent->s.eFlags &= ~EF_CONNECTION;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1212
;1211:
;1212:	frames = level.framenum - client->lastUpdateFrame - 1;
ADDRLP4 8
ADDRGP4 level+28
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 1215
;1213:
;1214:	// PVS prediction
;1215:	if ( g_predictPVS.integer && svf_self_portal2 ) {
ADDRGP4 g_predictPVS+12
INDIRI4
CNSTI4 0
EQI4 $423
ADDRGP4 svf_self_portal2
INDIRI4
CNSTI4 0
EQI4 $423
line 1217
;1216:		int lag;
;1217:		sent.s = ent->s;
ADDRGP4 $408
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 208
line 1218
;1218:		sent.r = ent->r;
ADDRGP4 $408+208
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRB
ASGNB 308
line 1219
;1219:		sent.clipmask = ent->clipmask;
ADDRGP4 $408+572
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ASGNI4
line 1222
;1220:		//VectorCopy( client->ps.origin, sent.s.pos.trBase );
;1221:		//VectorCopy( client->ps.velocity, sent.s.pos.trDelta );
;1222:		lag = level.time - client->ps.commandTime + 50;
ADDRLP4 28
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
CNSTI4 50
ADDI4
ASGNI4
line 1223
;1223:		if ( lag > 500 )
ADDRLP4 28
INDIRI4
CNSTI4 500
LEI4 $429
line 1224
;1224:			lag = 500;
ADDRLP4 28
CNSTI4 500
ASGNI4
LABELV $429
line 1225
;1225:		G_PredictPlayerMove( &sent, (float)lag * 0.001f );
ADDRGP4 $408
ARGP4
ADDRLP4 28
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRGP4 G_PredictPlayerMove
CALLV
pop
line 1226
;1226:		VectorCopy( sent.s.pos.trBase, ent->r.unused.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDRGP4 $408+12+12
INDIRB
ASGNB 12
line 1227
;1227:		ent->r.unused.origin2[2] += client->ps.viewheight;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1228
;1228:		ent->r.svFlags |= svf_self_portal2;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRGP4 svf_self_portal2
INDIRI4
BORI4
ASGNI4
line 1229
;1229:	}
LABELV $423
line 1231
;1230:
;1231:	if ( frames > 2 ) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LEI4 $433
line 1233
;1232:		// limit lagged player prediction to 2 server frames
;1233:		frames = 2;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 1235
;1234:		// and add the EF_CONNECTION flag if we haven't gotten commands recently
;1235:		if ( !( ent->r.svFlags & SVF_BOT ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $435
line 1236
;1236:			client->ps.eFlags |= EF_CONNECTION;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1237
;1237:			ent->s.eFlags |= EF_CONNECTION;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1238
;1238:		}
LABELV $435
line 1239
;1239:	}
LABELV $433
line 1241
;1240:
;1241:	if ( frames > 0 && g_smoothClients.integer ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $437
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $437
line 1242
;1242:		G_PredictPlayerMove( ent, (float)frames / sv_fps.value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 sv_fps+8
INDIRF4
DIVF4
ARGF4
ADDRGP4 G_PredictPlayerMove
CALLV
pop
line 1243
;1243:		SnapVector( ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1244
;1244:	}
LABELV $437
line 1247
;1245:
;1246:	// unlagged
;1247:	G_StoreHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StoreHistory
CALLV
pop
line 1250
;1248:
;1249:	// hitsounds
;1250:	if ( client->damage.enemy && client->damage.amount ) {
ADDRLP4 0
INDIRP4
CNSTI4 1560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $441
ADDRLP4 0
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
CNSTI4 0
EQI4 $441
line 1251
;1251:		client->ps.persistant[PERS_HITS] += client->damage.enemy;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1560
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1252
;1252:		client->damage.enemy = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 0
ASGNI4
line 1254
;1253:		// scale damage by max.health
;1254:		i = client->damage.amount * 100 / client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
CNSTI4 100
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1256
;1255:		// avoid high-byte setup
;1256:		if ( i > 255 )
ADDRLP4 4
INDIRI4
CNSTI4 255
LEI4 $443
line 1257
;1257:			i = 255;
ADDRLP4 4
CNSTI4 255
ASGNI4
LABELV $443
line 1258
;1258:		client->ps.persistant[PERS_ATTACKEE_ARMOR] = i;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1259
;1259:		client->damage.amount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 0
ASGNI4
line 1260
;1260:	} else if ( client->damage.team ) {
ADDRGP4 $442
JUMPV
LABELV $441
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $445
line 1261
;1261:		client->ps.persistant[PERS_HITS] -= client->damage.team;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1262
;1262:		client->damage.team = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 0
ASGNI4
line 1263
;1263:	}
LABELV $445
LABELV $442
line 1268
;1264:
;1265:	// set the bit for the reachability area the client is currently in
;1266://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1267://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1268:}
LABELV $407
endproc ClientEndFrame 44 12
import BotTestSolid
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
import AddScore
import player_die
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
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
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
LABELV $294
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $290
byte 1 56
byte 1 0
align 1
LABELV $289
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $211
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $207
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
