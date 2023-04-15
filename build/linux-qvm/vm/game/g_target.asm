export Use_Target_Give
code
proc Use_Target_Give 64 12
file "../../../../code/game/g_target.c"
line 10
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5://==========================================================
;6:
;7:/*QUAKED target_give (1 0 0) (-8 -8 -8) (8 8 8)
;8:Gives the activator all the items pointed to.
;9:*/
;10:void Use_Target_Give( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 14
;11:	gentity_t	*t;
;12:	trace_t		trace;
;13:
;14:	if ( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $55
line 15
;15:		return;
ADDRGP4 $54
JUMPV
LABELV $55
line 18
;16:	}
;17:
;18:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $57
line 19
;19:		return;
ADDRGP4 $54
JUMPV
LABELV $57
line 22
;20:	}
;21:
;22:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 23
;23:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $60
JUMPV
LABELV $59
line 24
;24:	while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 25
;25:		if ( !t->item ) {
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $62
line 26
;26:			continue;
ADDRGP4 $60
JUMPV
LABELV $62
line 28
;27:		}
;28:		Touch_Item( t, activator, &trace );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 31
;29:
;30:		// make sure it isn't going to respawn or show any events
;31:		t->tag = TAG_DONTSPAWN;
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 1
ASGNI4
line 32
;32:		t->nextthink = 0;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 33
;33:		trap_UnlinkEntity( t );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 34
;34:	}
LABELV $60
line 24
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $59
line 35
;35:}
LABELV $54
endproc Use_Target_Give 64 12
export SP_target_give
proc SP_target_give 0 0
line 37
;36:
;37:void SP_target_give( gentity_t *ent ) {
line 38
;38:	ent->use = Use_Target_Give;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Give
ASGNP4
line 39
;39:}
LABELV $64
endproc SP_target_give 0 0
export Use_target_remove_powerups
proc Use_target_remove_powerups 0 12
line 48
;40:
;41:
;42://==========================================================
;43:
;44:/*QUAKED target_remove_powerups (1 0 0) (-8 -8 -8) (8 8 8)
;45:takes away all the activators powerups.
;46:Used to drop flight powerups into death puts.
;47:*/
;48:void Use_target_remove_powerups( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 49
;49:	if( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $66
line 50
;50:		return;
ADDRGP4 $65
JUMPV
LABELV $66
line 53
;51:	}
;52:
;53:	if( activator->client->ps.powerups[PW_REDFLAG] ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $68
line 54
;54:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 55
;55:	} else if( activator->client->ps.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $69
JUMPV
LABELV $68
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $70
line 56
;56:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 57
;57:	} else if( activator->client->ps.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $71
JUMPV
LABELV $70
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $72
line 58
;58:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 59
;59:	}
LABELV $72
LABELV $71
LABELV $69
line 61
;60:
;61:	memset( activator->client->ps.powerups, 0, sizeof( activator->client->ps.powerups ) );
ADDRFP4 8
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
line 62
;62:}
LABELV $65
endproc Use_target_remove_powerups 0 12
export SP_target_remove_powerups
proc SP_target_remove_powerups 0 0
line 64
;63:
;64:void SP_target_remove_powerups( gentity_t *ent ) {
line 65
;65:	ent->use = Use_target_remove_powerups;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_target_remove_powerups
ASGNP4
line 66
;66:}
LABELV $74
endproc SP_target_remove_powerups 0 0
export Think_Target_Delay
proc Think_Target_Delay 4 8
line 75
;67:
;68:
;69://==========================================================
;70:
;71:/*QUAKED target_delay (1 0 0) (-8 -8 -8) (8 8 8)
;72:"wait" seconds to pause before firing targets.
;73:"random" delay variance, total delay = delay +/- random seconds
;74:*/
;75:void Think_Target_Delay( gentity_t *ent ) {
line 76
;76:	G_UseTargets( ent, ent->activator );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 77
;77:}
LABELV $75
endproc Think_Target_Delay 4 8
export Use_Target_Delay
proc Use_Target_Delay 8 0
line 79
;78:
;79:void Use_Target_Delay( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 80
;80:	ent->nextthink = level.time + ( ent->wait + ent->random * crandom() ) * 1000;
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
MULF4
ADDF4
CNSTF4 1148846080
MULF4
ADDF4
CVFI4 4
ASGNI4
line 81
;81:	ent->think = Think_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_Target_Delay
ASGNP4
line 82
;82:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 83
;83:}
LABELV $76
endproc Use_Target_Delay 8 0
export SP_target_delay
proc SP_target_delay 4 12
line 85
;84:
;85:void SP_target_delay( gentity_t *ent ) {
line 87
;86:	// check delay for backwards compatability
;87:	if ( !G_SpawnFloat( "delay", "0", &ent->wait ) ) {
ADDRGP4 $81
ARGP4
ADDRGP4 $82
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $79
line 88
;88:		G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $83
ARGP4
ADDRGP4 $84
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 89
;89:	}
LABELV $79
line 91
;90:
;91:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $85
line 92
;92:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1065353216
ASGNF4
line 93
;93:	}
LABELV $85
line 94
;94:	ent->use = Use_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Delay
ASGNP4
line 95
;95:}
LABELV $78
endproc SP_target_delay 4 12
export Use_Target_Score
proc Use_Target_Score 4 12
line 105
;96:
;97:
;98://==========================================================
;99:
;100:/*QUAKED target_score (1 0 0) (-8 -8 -8) (8 8 8)
;101:"count" number of points to add, default 1
;102:
;103:The activator is given this many points.
;104:*/
;105:void Use_Target_Score (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 106
;106:	if ( !activator )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $88
line 107
;107:		return;
ADDRGP4 $87
JUMPV
LABELV $88
line 108
;108:	AddScore( activator, ent->r.currentOrigin, ent->count );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 109
;109:}
LABELV $87
endproc Use_Target_Score 4 12
export SP_target_score
proc SP_target_score 0 0
line 111
;110:
;111:void SP_target_score( gentity_t *ent ) {
line 112
;112:	if ( !ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $91
line 113
;113:		ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 114
;114:	}
LABELV $91
line 115
;115:	ent->use = Use_Target_Score;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Score
ASGNP4
line 116
;116:}
LABELV $90
endproc SP_target_score 0 0
export Use_Target_Print
proc Use_Target_Print 8 8
line 125
;117:
;118:
;119://==========================================================
;120:
;121:/*QUAKED target_print (1 0 0) (-8 -8 -8) (8 8 8) redteam blueteam private
;122:"message"	text to print
;123:If "private", only the activator gets the message.  If no checks, all clients get the message.
;124:*/
;125:void Use_Target_Print (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 126
;126:	if ( activator && activator->client && ( ent->spawnflags & 4 ) ) {
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $94
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $94
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $94
line 127
;127:		trap_SendServerCommand( activator-g_entities, va("cp \"%s\"", ent->message ));
ADDRGP4 $96
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 128
;128:		return;
ADDRGP4 $93
JUMPV
LABELV $94
line 131
;129:	}
;130:
;131:	if ( ent->spawnflags & 3 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $97
line 132
;132:		if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $99
line 133
;133:			G_TeamCommand( TEAM_RED, va("cp \"%s\"", ent->message) );
ADDRGP4 $96
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 134
;134:		}
LABELV $99
line 135
;135:		if ( ent->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $93
line 136
;136:			G_TeamCommand( TEAM_BLUE, va("cp \"%s\"", ent->message) );
ADDRGP4 $96
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 137
;137:		}
line 138
;138:		return;
ADDRGP4 $93
JUMPV
LABELV $97
line 141
;139:	}
;140:
;141:	G_BroadcastServerCommand( -1, va("cp \"%s\"", ent->message ));
ADDRGP4 $96
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 142
;142:}
LABELV $93
endproc Use_Target_Print 8 8
export SP_target_print
proc SP_target_print 0 0
line 144
;143:
;144:void SP_target_print( gentity_t *ent ) {
line 145
;145:	ent->use = Use_Target_Print;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Print
ASGNP4
line 146
;146:}
LABELV $103
endproc SP_target_print 0 0
export Use_Target_Speaker
proc Use_Target_Speaker 4 12
line 164
;147:
;148:
;149://==========================================================
;150:
;151:
;152:/*QUAKED target_speaker (1 0 0) (-8 -8 -8) (8 8 8) looped-on looped-off global activator
;153:"noise"		wav file to play
;154:
;155:A global sound will play full volume throughout the level.
;156:Activator sounds will play on the player that activated the target.
;157:Global and activator sounds can't be combined with looping.
;158:Normal sounds play each time the target is used.
;159:Looped sounds will be toggled by use functions.
;160:Multiple identical looping sounds will just increase volume without any speed cost.
;161:"wait" : Seconds between auto triggerings, 0 = don't auto trigger
;162:"random"	wait variance, default is 0
;163:*/
;164:void Use_Target_Speaker (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 165
;165:	if (ent->spawnflags & 3) {	// looping sound toggles
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $105
line 166
;166:		if (ent->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $107
line 167
;167:			ent->s.loopSound = 0;	// turn it off
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $107
line 169
;168:		else
;169:			ent->s.loopSound = ent->noise_index;	// start it
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
line 170
;170:	}else {	// normal sound
ADDRGP4 $106
JUMPV
LABELV $105
line 171
;171:		if ( ent->spawnflags & 8 && activator ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $109
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $109
line 172
;172:			G_AddEvent( activator, EV_GENERAL_SOUND, ent->noise_index );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 173
;173:		} else if (ent->spawnflags & 4) {
ADDRGP4 $110
JUMPV
LABELV $109
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $111
line 174
;174:			G_AddEvent( ent, EV_GLOBAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 175
;175:		} else {
ADDRGP4 $112
JUMPV
LABELV $111
line 176
;176:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 177
;177:		}
LABELV $112
LABELV $110
line 179
;178://qlone - grapple hook
;179:		if ( activator->client && activator->client->hook ) {
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $113
line 180
;180:			Weapon_HookFree( activator->client->hook );
ADDRFP4 8
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
line 181
;181:		}
LABELV $113
line 183
;182://qlone - grapple hook
;183:	}
LABELV $106
line 184
;184:}
LABELV $104
endproc Use_Target_Speaker 4 12
export SP_target_speaker
proc SP_target_speaker 100 16
line 186
;185:
;186:void SP_target_speaker( gentity_t *ent ) {
line 190
;187:	char	buffer[MAX_QPATH];
;188:	char	*s;
;189:
;190:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $83
ARGP4
ADDRGP4 $82
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 191
;191:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $116
ARGP4
ADDRGP4 $82
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 193
;192:
;193:	if ( !G_SpawnString( "noise", "NOSOUND", &s ) ) {
ADDRGP4 $119
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $117
line 194
;194:		G_Error( "target_speaker without a noise key at %s", vtos( ent->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $121
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 195
;195:	}
LABELV $117
line 199
;196:
;197:	// force all client relative sounds to be "activator" speakers that
;198:	// play on the entity that activates it
;199:	if ( s[0] == '*' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $122
line 200
;200:		ent->spawnflags |= 8;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 528
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
line 201
;201:	}
LABELV $122
line 203
;202:
;203:	if (!strstr( s, ".wav" )) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 72
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $124
line 204
;204:		Com_sprintf (buffer, sizeof(buffer), "%s.wav", s );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $127
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 205
;205:	} else {
ADDRGP4 $125
JUMPV
LABELV $124
line 206
;206:		Q_strncpyz( buffer, s, sizeof(buffer) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 207
;207:	}
LABELV $125
line 208
;208:	ent->noise_index = G_SoundIndex(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 211
;209:
;210:	// a repeating speaker can be done completely client side
;211:	ent->s.eType = ET_SPEAKER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 212
;212:	ent->s.eventParm = ent->noise_index;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
line 213
;213:	ent->s.frame = ent->wait * 10;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 1092616192
MULF4
CVFI4 4
ASGNI4
line 214
;214:	ent->s.clientNum = ent->random * 10;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 1092616192
MULF4
CVFI4 4
ASGNI4
line 218
;215:
;216:
;217:	// check for prestarted looping sound
;218:	if ( ent->spawnflags & 1 )
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $128
line 219
;219:		ent->s.loopSound = ent->noise_index;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $129
JUMPV
LABELV $128
line 221
;220:	else
;221:		ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
LABELV $129
line 223
;222:
;223:	ent->use = Use_Target_Speaker;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Speaker
ASGNP4
line 225
;224:
;225:	if (ent->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $130
line 226
;226:		ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 227
;227:	}
LABELV $130
line 229
;228:
;229:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 96
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 233
;230:
;231:	// must link the entity so we get areas and clusters so
;232:	// the server can determine who to send updates to
;233:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 234
;234:}
LABELV $115
endproc SP_target_speaker 100 16
export target_laser_think
proc target_laser_think 104 32
line 243
;235:
;236:
;237:
;238://==========================================================
;239:
;240:/*QUAKED target_laser (0 .5 .8) (-8 -8 -8) (8 8 8) START_ON
;241:When triggered, fires a laser.  You can either set a target or a direction.
;242:*/
;243:void target_laser_think (gentity_t *self) {
line 249
;244:	vec3_t	end;
;245:	trace_t	tr;
;246:	vec3_t	point;
;247:
;248:	// if pointed at another entity, set movedir to point at it
;249:	if ( self->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $133
line 250
;250:		VectorMA (self->enemy->s.origin, 0.5, self->enemy->r.mins, point);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 84
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 251
;251:		VectorMA (point, 0.5, self->enemy->r.maxs, point);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 252
;252:		VectorSubtract (point, self->s.origin, self->movedir);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 684
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 253
;253:		VectorNormalize (self->movedir);
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 254
;254:	}
LABELV $133
line 257
;255:
;256:	// fire forward and see what we hit
;257:	VectorMA (self->s.origin, 2048, self->movedir, end);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
CNSTF4 1157627904
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
CNSTF4 1157627904
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 84
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
CNSTF4 1157627904
MULF4
ADDF4
ASGNF4
line 259
;258:
;259:	trap_Trace( &tr, self->s.origin, NULL, NULL, end, self->s.number, CONTENTS_SOLID|CONTENTS_BODY|CONTENTS_CORPSE);
ADDRLP4 24
ARGP4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 88
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 261
;260:
;261:	if ( tr.entityNum ) {
ADDRLP4 24+52
INDIRI4
CNSTI4 0
EQI4 $145
line 263
;262:		// hurt it if we can
;263:		G_Damage ( &g_entities[tr.entityNum], self, self->activator, self->movedir, 
ADDRLP4 24+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 24+12
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 265
;264:			tr.endpos, self->damage, DAMAGE_NO_KNOCKBACK, MOD_TARGET_LASER);
;265:	}
LABELV $145
line 267
;266:
;267:	VectorCopy (tr.endpos, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 24+12
INDIRB
ASGNB 12
line 269
;268:
;269:	trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 270
;270:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 271
;271:}
LABELV $132
endproc target_laser_think 104 32
export target_laser_on
proc target_laser_on 4 4
line 274
;272:
;273:void target_laser_on (gentity_t *self)
;274:{
line 275
;275:	if (!self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $153
line 276
;276:		self->activator = self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $153
line 277
;277:	target_laser_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_think
CALLV
pop
line 278
;278:}
LABELV $152
endproc target_laser_on 4 4
export target_laser_off
proc target_laser_off 0 4
line 281
;279:
;280:void target_laser_off (gentity_t *self)
;281:{
line 282
;282:	trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 283
;283:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 284
;284:}
LABELV $155
endproc target_laser_off 0 4
export target_laser_use
proc target_laser_use 0 4
line 287
;285:
;286:void target_laser_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;287:{
line 288
;288:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 289
;289:	if ( self->nextthink > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $157
line 290
;290:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
ADDRGP4 $158
JUMPV
LABELV $157
line 292
;291:	else
;292:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
LABELV $158
line 293
;293:}
LABELV $156
endproc target_laser_use 0 4
export target_laser_start
proc target_laser_start 16 16
line 296
;294:
;295:void target_laser_start (gentity_t *self)
;296:{
line 299
;297:	gentity_t *ent;
;298:
;299:	self->s.eType = ET_BEAM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 301
;300:
;301:	if (self->target) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $160
line 302
;302:		ent = G_Find (NULL, FOFS(targetname), self->target);
CNSTP4 0
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 303
;303:		if (!ent) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $162
line 304
;304:			G_Printf ("%s at %s: %s is a bad target\n", self->classname, vtos(self->s.origin), self->target);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $164
ARGP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 305
;305:		}
LABELV $162
line 306
;306:		self->enemy = ent;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 307
;307:	} else {
ADDRGP4 $161
JUMPV
LABELV $160
line 308
;308:		G_SetMovedir (self->s.angles, self->movedir);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 309
;309:	}
LABELV $161
line 311
;310:
;311:	self->use = target_laser_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_laser_use
ASGNP4
line 312
;312:	self->think = target_laser_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_laser_think
ASGNP4
line 314
;313:
;314:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $165
line 315
;315:		self->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 1
ASGNI4
line 316
;316:	}
LABELV $165
line 318
;317:
;318:	if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $167
line 319
;319:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
ADDRGP4 $168
JUMPV
LABELV $167
line 321
;320:	else
;321:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
LABELV $168
line 322
;322:}
LABELV $159
endproc target_laser_start 16 16
export SP_target_laser
proc SP_target_laser 0 0
line 325
;323:
;324:void SP_target_laser (gentity_t *self)
;325:{
line 327
;326:	// let everything else get spawned before we start firing
;327:	self->think = target_laser_start;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_laser_start
ASGNP4
line 328
;328:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 329
;329:}
LABELV $169
endproc SP_target_laser 0 0
export target_teleporter_use
proc target_teleporter_use 16 12
line 334
;330:
;331:
;332://==========================================================
;333:
;334:void target_teleporter_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 337
;335:	gentity_t	*dest;
;336:
;337:	if ( !activator || !activator->client )
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $172
LABELV $174
line 338
;338:		return;
ADDRGP4 $171
JUMPV
LABELV $172
line 339
;339:	dest = 	G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 340
;340:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 341
;341:		G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $177
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 342
;342:		return;
ADDRGP4 $171
JUMPV
LABELV $175
line 345
;343:	}
;344:
;345:	TeleportPlayer( activator, dest->s.origin, dest->s.angles );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 346
;346:}
LABELV $171
endproc target_teleporter_use 16 12
export SP_target_teleporter
proc SP_target_teleporter 4 12
line 351
;347:
;348:/*QUAKED target_teleporter (1 0 0) (-8 -8 -8) (8 8 8)
;349:The activator will be teleported away.
;350:*/
;351:void SP_target_teleporter( gentity_t *self ) {
line 352
;352:	if (!self->targetname)
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $179
line 353
;353:		G_Printf("untargeted %s at %s\n", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $181
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $179
line 355
;354:
;355:	self->use = target_teleporter_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_teleporter_use
ASGNP4
line 356
;356:}
LABELV $178
endproc SP_target_teleporter 4 12
export target_relay_use
proc target_relay_use 24 12
line 366
;357:
;358://==========================================================
;359:
;360:
;361:/*QUAKED target_relay (.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY RANDOM
;362:This doesn't perform any actions except fire its targets.
;363:The activator can be forced to be from a certain team.
;364:if RANDOM is checked, only one of the targets will be fired, not all of them
;365:*/
;366:void target_relay_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 368
;367:
;368:	if ( ( self->spawnflags & 1 ) && activator && activator->client 
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $183
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $183
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $183
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
EQI4 $183
line 369
;369:		&& activator->client->sess.sessionTeam != TEAM_RED ) {
line 370
;370:		return;
ADDRGP4 $182
JUMPV
LABELV $183
line 372
;371:	}
;372:	if ( ( self->spawnflags & 2 ) && activator && activator->client 
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $185
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $185
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $185
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
EQI4 $185
line 373
;373:		&& activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 374
;374:		return;
ADDRGP4 $182
JUMPV
LABELV $185
line 376
;375:	}
;376:	if ( self->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $187
line 379
;377:		gentity_t	*ent;
;378:
;379:		ent = G_PickTarget( self->target );
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 380
;380:		if ( ent && ent->use ) {
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $182
ADDRLP4 16
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $182
line 381
;381:			ent->use( ent, self, activator );
ADDRLP4 20
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CALLV
pop
line 382
;382:		}
line 383
;383:		return;
ADDRGP4 $182
JUMPV
LABELV $187
line 385
;384:	}
;385:	G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 386
;386:}
LABELV $182
endproc target_relay_use 24 12
export SP_target_relay
proc SP_target_relay 0 0
line 388
;387:
;388:void SP_target_relay (gentity_t *self) {
line 389
;389:	self->use = target_relay_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_relay_use
ASGNP4
line 390
;390:}
LABELV $191
endproc SP_target_relay 0 0
export target_kill_use
proc target_kill_use 0 32
line 398
;391:
;392:
;393://==========================================================
;394:
;395:/*QUAKED target_kill (.5 .5 .5) (-8 -8 -8) (8 8 8)
;396:Kills the activator.
;397:*/
;398:void target_kill_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 399
;399:	if ( !activator )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $193
line 400
;400:		return;
ADDRGP4 $192
JUMPV
LABELV $193
line 401
;401:	G_Damage ( activator, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
ADDRFP4 8
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
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 402
;402:}
LABELV $192
endproc target_kill_use 0 32
export SP_target_kill
proc SP_target_kill 0 0
line 404
;403:
;404:void SP_target_kill( gentity_t *self ) {
line 405
;405:	self->use = target_kill_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_kill_use
ASGNP4
line 406
;406:}
LABELV $195
endproc SP_target_kill 0 0
export SP_target_position
proc SP_target_position 4 8
line 411
;407:
;408:/*QUAKED target_position (0 0.5 0) (-4 -4 -4) (4 4 4)
;409:Used as a positional target for in-game calculation, like jumppad targets.
;410:*/
;411:void SP_target_position( gentity_t *self ){
line 412
;412:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 413
;413:}
LABELV $196
endproc SP_target_position 4 8
proc target_location_linkup 20 8
line 416
;414:
;415:static void target_location_linkup(gentity_t *ent)
;416:{
line 419
;417:	int i;
;418:	int n;
;419:	qboolean modified = qfalse; //qlone - freezetag
ADDRLP4 8
CNSTI4 0
ASGNI4
line 421
;420:
;421:	if (level.locationLinked) 
ADDRGP4 level+7644
INDIRI4
CNSTI4 0
EQI4 $198
line 422
;422:		return;
ADDRGP4 $197
JUMPV
LABELV $198
line 425
;423:
;424://qlone - freezetag
;425:	if ( g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $201
line 426
;426:		for ( i = 0, ent = g_entities; i < level.num_entities; i++, ent++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $207
JUMPV
LABELV $204
line 427
;427:			if ( ent->classname && !Q_stricmp( ent->classname, "target_location" ) ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $211
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $209
line 428
;428:				if ( ent->count != 255 ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 255
EQI4 $212
line 429
;429:					modified = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 430
;430:					break;
ADDRGP4 $206
JUMPV
LABELV $212
line 432
;431:				}
;432:			}
LABELV $209
line 433
;433:		}
LABELV $205
line 426
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $207
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $204
LABELV $206
line 434
;434:	}
LABELV $201
line 437
;435://qlone - freezetag
;436:
;437:	level.locationLinked = qtrue;
ADDRGP4 level+7644
CNSTI4 1
ASGNI4
line 439
;438:
;439:	level.locationHead = NULL;
ADDRGP4 level+7648
CNSTP4 0
ASGNP4
line 441
;440:
;441:	trap_SetConfigstring( CS_LOCATIONS, "unknown" );
CNSTI4 608
ARGI4
ADDRGP4 $216
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 443
;442:
;443:	for (i = 0, ent = g_entities, n = 1;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $217
line 445
;444:			i < level.num_entities;
;445:			i++, ent++) {
line 446
;446:		if (ent->classname && !Q_stricmp(ent->classname, "target_location")) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $222
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $211
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $222
line 448
;447://qlone - freezetag
;448:			if ( g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $224
line 449
;449:				if ( ent->count == 255 ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 255
NEI4 $227
line 450
;450:					if ( modified ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $229
line 451
;451:						ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 452
;452:						ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 454
;453:
;454:						continue;
ADDRGP4 $218
JUMPV
LABELV $229
line 456
;455:					}
;456:					ent->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 457
;457:				}
LABELV $227
line 458
;458:			}
LABELV $224
line 461
;459://qlone - freezetag
;460:			// lets overload some variables!
;461:			ent->health = n; // use for location marking
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 462
;462:			trap_SetConfigstring( CS_LOCATIONS + n, ent->message );
ADDRLP4 4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 463
;463:			n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 464
;464:			ent->nextTrain = level.locationHead;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 level+7648
INDIRP4
ASGNP4
line 465
;465:			level.locationHead = ent;
ADDRGP4 level+7648
ADDRFP4 0
INDIRP4
ASGNP4
line 466
;466:		}
LABELV $222
line 467
;467:	}
LABELV $218
line 445
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $220
line 444
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $217
line 470
;468:
;469:	// All linked together now
;470:}
LABELV $197
endproc target_location_linkup 20 8
export SP_target_location
proc SP_target_location 4 8
line 480
;471:
;472:/*QUAKED target_location (0 0.5 0) (-8 -8 -8) (8 8 8)
;473:Set "message" to the name of this location.
;474:Set "count" to 0-7 for color.
;475:0:white 1:red 2:green 3:yellow 4:blue 5:cyan 6:magenta 7:white
;476:
;477:Closest target_location in sight used for the location, if none
;478:in site, closest in distance
;479:*/
;480:void SP_target_location( gentity_t *self ){
line 481
;481:	self->think = target_location_linkup;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_location_linkup
ASGNP4
line 482
;482:	self->nextthink = level.time + 200;  // Let them all spawn first
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 484
;483:
;484:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 485
;485:}
LABELV $234
endproc SP_target_location 4 8
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
LABELV $216
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $211
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $181
byte 1 117
byte 1 110
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $164
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $127
byte 1 37
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $126
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $121
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $120
byte 1 78
byte 1 79
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $119
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $96
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $84
byte 1 49
byte 1 0
align 1
LABELV $83
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $82
byte 1 48
byte 1 0
align 1
LABELV $81
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
