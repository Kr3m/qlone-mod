data
export playerMins
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
export playerMaxs
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "../../../../code/game/g_client.c"
line 19
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:// g_client.c -- client functions that don't happen every frame
;6:
;7:const vec3_t	playerMins = {-15, -15, -24};
;8:const vec3_t	playerMaxs = { 15,  15,  32};
;9:
;10:static char	ban_reason[MAX_CVAR_VALUE_STRING];
;11:
;12:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;13:potential spawning position for deathmatch games.
;14:The first time a player enters the game, they will be at an 'initial' spot.
;15:Targets will be fired when someone spawns in on them.
;16:"nobots" will prevent bots from using this spot.
;17:"nohumans" will prevent non-bots from using this spot.
;18:*/
;19:void SP_info_player_deathmatch( gentity_t *ent ) {
line 22
;20:	int		i;
;21:
;22:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $55
ARGP4
ADDRGP4 $56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 23
;23:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $57
line 24
;24:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
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
line 25
;25:	}
LABELV $57
line 26
;26:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $59
ARGP4
ADDRGP4 $56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 27
;27:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $60
line 28
;28:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 29
;29:	}
LABELV $60
line 30
;30:}
LABELV $54
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 35
;31:
;32:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;33:equivelant to info_player_deathmatch
;34:*/
;35:void SP_info_player_start(gentity_t *ent) {
line 36
;36:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $63
ASGNP4
line 37
;37:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 38
;38:}
LABELV $62
endproc SP_info_player_start 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 43
;39:
;40:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;41:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;42:*/
;43:void SP_info_player_intermission( gentity_t *ent ) {
line 45
;44:
;45:}
LABELV $64
endproc SP_info_player_intermission 0 0
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 63
;46:
;47:
;48:
;49:/*
;50:=======================================================================
;51:
;52:  SelectSpawnPoint
;53:
;54:=======================================================================
;55:*/
;56:
;57:/*
;58:================
;59:SpotWouldTelefrag
;60:
;61:================
;62:*/
;63:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 69
;64:	int			i, num;
;65:	int			touch[MAX_GENTITIES];
;66:	gentity_t	*hit;
;67:	vec3_t		mins, maxs;
;68:
;69:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 70
;70:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 71
;71:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 73
;72:
;73:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $77
JUMPV
LABELV $74
line 74
;74:		hit = &g_entities[touch[i]];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 76
;75:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;76:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $78
line 77
;77:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $65
JUMPV
LABELV $78
line 80
;78:		}
;79:
;80:	}
LABELV $75
line 73
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $77
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $74
line 82
;81:
;82:	return qfalse;
CNSTI4 0
RETI4
LABELV $65
endproc SpotWouldTelefrag 4144 16
proc SelectRandomFurthestSpawnPoint 596 4
line 94
;83:}
;84:
;85:
;86:/*
;87:===========
;88:SelectRandomFurthestSpawnPoint
;89:
;90:Chooses a player start, deathmatch start, etc
;91:============
;92:*/
;93:#define	MAX_SPAWN_POINTS 64
;94:static gentity_t *SelectRandomFurthestSpawnPoint( const gentity_t *ent, vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 107
;95:	gentity_t	*spot;
;96:	vec3_t		delta;
;97:	float		dist;
;98:	float		list_dist[MAX_SPAWN_POINTS];
;99:	gentity_t	*list_spot[MAX_SPAWN_POINTS];
;100:	int			numSpots, i, j, n;
;101:	int			selection;
;102:	int			checkTelefrag;
;103:	int			checkType;
;104:	int			checkMask;
;105:	qboolean	isBot;
;106:
;107:	checkType = qtrue;
ADDRLP4 552
CNSTI4 1
ASGNI4
line 108
;108:	checkTelefrag = qtrue;
ADDRLP4 548
CNSTI4 1
ASGNI4
line 110
;109:
;110:	if ( ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $81
line 111
;111:		isBot = ((ent->r.svFlags & SVF_BOT) == SVF_BOT); 
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 8
NEI4 $84
ADDRLP4 568
CNSTI4 1
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $84
ADDRLP4 568
CNSTI4 0
ASGNI4
LABELV $85
ADDRLP4 556
ADDRLP4 568
INDIRI4
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
line 113
;112:	else
;113:		isBot = qfalse;
ADDRLP4 556
CNSTI4 0
ASGNI4
LABELV $82
line 115
;114:
;115:	checkMask = 3;
ADDRLP4 560
CNSTI4 3
ASGNI4
LABELV $86
line 119
;116:
;117:__search:
;118:
;119:	checkTelefrag = checkMask & 1;
ADDRLP4 548
ADDRLP4 560
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 120
;120:	checkType = checkMask & 2;
ADDRLP4 552
ADDRLP4 560
INDIRI4
CNSTI4 2
BANDI4
ASGNI4
line 122
;121:
;122:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 123
;123:	for ( n = 0 ; n < level.numSpawnSpots ; n++ ) {
ADDRLP4 544
CNSTI4 0
ASGNI4
ADDRGP4 $90
JUMPV
LABELV $87
line 124
;124:		spot = level.spawnSpots[n];
ADDRLP4 528
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
INDIRP4
ASGNP4
line 126
;125:
;126:		if ( spot->fteam != TEAM_FREE && level.numSpawnSpotsFFA > 0 )
ADDRLP4 528
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
CNSTI4 0
EQI4 $93
ADDRGP4 level+11792
INDIRI4
CNSTI4 0
LEI4 $93
line 127
;127:			continue;
ADDRGP4 $88
JUMPV
LABELV $93
line 129
;128:
;129:		if ( checkTelefrag && SpotWouldTelefrag( spot ) )
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $96
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 572
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 572
INDIRI4
CNSTI4 0
EQI4 $96
line 130
;130:			continue;
ADDRGP4 $88
JUMPV
LABELV $96
line 132
;131:
;132:		if ( checkType ) 
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $98
line 133
;133:		{
line 134
;134:			if ( (spot->flags & FL_NO_BOTS) && isBot )
ADDRLP4 528
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $100
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $100
line 135
;135:				continue;
ADDRGP4 $88
JUMPV
LABELV $100
line 136
;136:			if ( (spot->flags & FL_NO_HUMANS) && !isBot )
ADDRLP4 528
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $102
ADDRLP4 556
INDIRI4
CNSTI4 0
NEI4 $102
line 137
;137:				continue;
ADDRGP4 $88
JUMPV
LABELV $102
line 138
;138:		}
LABELV $98
line 140
;139:
;140:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 580
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 141
;141:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 584
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 584
INDIRF4
ASGNF4
line 143
;142:
;143:		for ( i = 0; i < numSpots; i++ )
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $106
line 144
;144:		{
line 145
;145:			if( dist > list_dist[i] )
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $110
line 146
;146:			{
line 147
;147:				if (numSpots >= MAX_SPAWN_POINTS)
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $112
line 148
;148:					numSpots = MAX_SPAWN_POINTS - 1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $112
line 150
;149:
;150:				for( j = numSpots; j > i; j-- )
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 151
;151:				{
line 152
;152:					list_dist[j] = list_dist[j-1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 153
;153:					list_spot[j] = list_spot[j-1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 154
;154:				}
LABELV $115
line 150
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $117
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $114
line 156
;155:
;156:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 157
;157:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 159
;158:
;159:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 160
;160:				break;
ADDRGP4 $108
JUMPV
LABELV $110
line 162
;161:			}
;162:		}
LABELV $107
line 143
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $109
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $106
LABELV $108
line 164
;163:
;164:		if(i >= numSpots && numSpots < MAX_SPAWN_POINTS)
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $120
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $120
line 165
;165:		{
line 166
;166:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 167
;167:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 168
;168:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 169
;169:		}
LABELV $120
line 170
;170:	}
LABELV $88
line 123
ADDRLP4 544
ADDRLP4 544
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $90
ADDRLP4 544
INDIRI4
ADDRGP4 level+11784
INDIRI4
LTI4 $87
line 172
;171:
;172:	if ( !numSpots ) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $122
line 173
;173:		if ( checkMask <= 0 ) {
ADDRLP4 560
INDIRI4
CNSTI4 0
GTI4 $124
line 174
;174:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $126
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 175
;175:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $80
JUMPV
LABELV $124
line 177
;176:		}
;177:		checkMask--;
ADDRLP4 560
ADDRLP4 560
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 178
;178:		goto __search; // next attempt with different flags
ADDRGP4 $86
JUMPV
LABELV $122
line 182
;179:	}
;180:
;181:	// select a random spot from the spawn points furthest away
;182:	selection = random() * (numSpots / 2);
ADDRLP4 572
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 564
ADDRLP4 572
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 183
;183:	spot = list_spot[ selection ];
ADDRLP4 528
ADDRLP4 564
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
ASGNP4
line 185
;184:
;185:	VectorCopy( spot->s.angles, angles );
ADDRFP4 12
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 186
;186:	VectorCopy( spot->s.origin, origin );
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 187
;187:	origin[2] += 9.0f;
ADDRLP4 576
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 576
INDIRP4
ADDRLP4 576
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 189
;188:
;189:	return spot;
ADDRLP4 528
INDIRP4
RETP4
LABELV $80
endproc SelectRandomFurthestSpawnPoint 596 4
export SelectSpawnPoint
proc SelectSpawnPoint 4 16
line 200
;190:}
;191:
;192:
;193:/*
;194:===========
;195:SelectSpawnPoint
;196:
;197:Chooses a player start, deathmatch start, etc
;198:============
;199:*/
;200:gentity_t *SelectSpawnPoint( gentity_t *ent, vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 201
;201:	return SelectRandomFurthestSpawnPoint( ent, avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $127
endproc SelectSpawnPoint 4 16
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 16
line 213
;202:}
;203:
;204:
;205:/*
;206:===========
;207:SelectInitialSpawnPoint
;208:
;209:Try to find a spawn point marked 'initial', otherwise
;210:use normal spawn selection.
;211:============
;212:*/
;213:gentity_t *SelectInitialSpawnPoint( gentity_t *ent, vec3_t origin, vec3_t angles ) {
line 217
;214:	gentity_t	*spot;
;215:	int n;
;216:
;217:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 219
;218:
;219:	for ( n = 0; n < level.numSpawnSpotsFFA; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 220
;220:		spot = level.spawnSpots[ n ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
INDIRP4
ASGNP4
line 221
;221:		if ( spot->fteam != TEAM_FREE )
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
CNSTI4 0
EQI4 $135
line 222
;222:			continue;
ADDRGP4 $130
JUMPV
LABELV $135
line 223
;223:		if ( spot->spawnflags & 1 )
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $137
line 224
;224:			break;
ADDRGP4 $131
JUMPV
LABELV $137
line 226
;225:		else
;226:			spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 227
;227:	}
LABELV $130
line 219
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 4
INDIRI4
ADDRGP4 level+11792
INDIRI4
LTI4 $129
LABELV $131
line 229
;228:
;229:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $139
LABELV $141
line 230
;230:		return SelectSpawnPoint( ent, vec3_origin, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $128
JUMPV
LABELV $139
line 233
;231:	}
;232:
;233:	VectorCopy( spot->s.angles, angles );
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 234
;234:	VectorCopy( spot->s.origin, origin );
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 235
;235:	origin[2] += 9.0f;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 237
;236:
;237:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $128
endproc SelectInitialSpawnPoint 20 16
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 247
;238:}
;239:
;240:
;241:/*
;242:===========
;243:SelectSpectatorSpawnPoint
;244:
;245:============
;246:*/
;247:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 248
;248:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 250
;249:
;250:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 251
;251:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+7628
INDIRB
ASGNB 12
line 253
;252:
;253:	return level.spawnSpots[ SPAWN_SPOT_INTERMISSION ]; // was NULL
ADDRGP4 level+7688+4092
INDIRP4
RETP4
LABELV $142
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 270
;254:}
;255:
;256:
;257:/*
;258:=======================================================================
;259:
;260:BODYQUE
;261:
;262:=======================================================================
;263:*/
;264:
;265:/*
;266:===============
;267:InitBodyQue
;268:===============
;269:*/
;270:void InitBodyQue (void) {
line 274
;271:	int		i;
;272:	gentity_t	*ent;
;273:
;274:	level.bodyQueIndex = 0;
ADDRGP4 level+7652
CNSTI4 0
ASGNI4
line 275
;275:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $149
line 276
;276:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 277
;277:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $153
ASGNP4
line 278
;278:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 279
;279:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 280
;280:	}
LABELV $150
line 275
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $149
line 281
;281:}
LABELV $147
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 290
;282:
;283:/*
;284:=============
;285:BodySink
;286:
;287:After sitting around for five seconds, fall into the ground and dissapear
;288:=============
;289:*/
;290:void BodySink( gentity_t *ent ) {
line 291
;291:	if ( level.time - ent->timestamp > 6500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
SUBI4
CNSTI4 6500
LEI4 $156
line 293
;292:		// the body ques are never actually freed, they are just unlinked
;293:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 294
;294:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
line 295
;295:		return;	
ADDRGP4 $155
JUMPV
LABELV $156
line 297
;296:	}
;297:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 298
;298:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 299
;299:}
LABELV $155
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 48 8
line 310
;300:
;301:
;302:/*
;303:=============
;304:CopyToBodyQue
;305:
;306:A player is respawning, so make an entity that looks
;307:just like the existing corpse to leave behind.
;308:=============
;309:*/
;310:void CopyToBodyQue( gentity_t *ent ) {
line 318
;311:#ifdef MISSIONPACK
;312:	gentity_t	*e;
;313:	int i;
;314:#endif
;315:	gentity_t		*body;
;316:	int			contents;
;317:
;318:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 321
;319:
;320:	// if client is in a nodrop area, don't leave the body
;321:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 322
;322:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $161
line 323
;323:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 327
;324:	}
;325:
;326:	// grab a body que and cycle to the next one
;327:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+7652
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
INDIRP4
ASGNP4
line 328
;328:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+7652
ADDRGP4 level+7652
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 330
;329:
;330:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 332
;331:
;332:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 208
line 333
;333:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 352
;334:#ifdef MISSIONPACK
;335:	if ( ent->s.eFlags & EF_KAMIKAZE ) {
;336:		body->s.eFlags |= EF_KAMIKAZE;
;337:
;338:		// check if there is a kamikaze timer around for this owner
;339:		for (i = 0; i < level.num_entities; i++) {
;340:			e = &g_entities[i];
;341:			if (!e->inuse)
;342:				continue;
;343:			if (e->activator != ent)
;344:				continue;
;345:			if (strcmp(e->classname, "kamikaze timer"))
;346:				continue;
;347:			e->activator = body;
;348:			break;
;349:		}
;350:	}
;351:#endif
;352:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 353
;353:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 354
;354:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ASGNI4
line 355
;355:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 356
;356:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 357
;357:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 0
ASGNF4
line 358
;358:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $168
line 359
;359:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 360
;360:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 361
;361:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 362
;362:	} else {
ADDRGP4 $169
JUMPV
LABELV $168
line 363
;363:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 364
;364:	}
LABELV $169
line 365
;365:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 369
;366:
;367:	// change the animation to the last-frame only, so the sequence
;368:	// doesn't repeat anew for the body
;369:	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $171
ADDRLP4 16
INDIRI4
CNSTI4 5
GTI4 $171
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $177
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $177
address $174
address $174
address $175
address $175
address $176
address $176
code
LABELV $174
line 372
;370:	case BOTH_DEATH1:
;371:	case BOTH_DEAD1:
;372:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 373
;373:		break;
ADDRGP4 $172
JUMPV
LABELV $175
line 376
;374:	case BOTH_DEATH2:
;375:	case BOTH_DEAD2:
;376:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
ADDRLP4 36
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 377
;377:		break;
ADDRGP4 $172
JUMPV
LABELV $176
LABELV $171
line 381
;378:	case BOTH_DEATH3:
;379:	case BOTH_DEAD3:
;380:	default:
;381:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
ADDRLP4 44
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 382
;382:		break;
LABELV $172
line 385
;383:	}
;384:
;385:	body->r.svFlags = ent->r.svFlags;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 386
;386:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 387
;387:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 388
;388:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 389
;389:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 391
;390:
;391:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
line 392
;392:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 393
;393:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 395
;394:
;395:	body->nextthink = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 396
;396:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 BodySink
ASGNP4
line 398
;397:
;398:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 body_die
ASGNP4
line 401
;399:
;400:	// don't take more damage if already gibbed
;401:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $179
line 402
;402:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 403
;403:	} else {
ADDRGP4 $180
JUMPV
LABELV $179
line 404
;404:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 405
;405:	}
LABELV $180
line 407
;406:
;407:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 408
;408:	trap_LinkEntity( body );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 409
;409:}
LABELV $160
endproc CopyToBodyQue 48 8
export SetClientViewAngle
proc SetClientViewAngle 20 0
line 419
;410:
;411:
;412://======================================================================
;413:
;414:/*
;415:==================
;416:SetClientViewAngle
;417:==================
;418:*/
;419:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 423
;420:	int	i, cmdAngle;
;421:	gclient_t	*client;
;422:
;423:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 426
;424:
;425:	// set the delta angle
;426:	for (i = 0 ; i < 3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $182
line 427
;427:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 428
;428:		client->ps.delta_angles[i] = cmdAngle - client->pers.cmd.angles[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 429
;429:	}
LABELV $183
line 426
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $182
line 430
;430:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 431
;431:	VectorCopy( ent->s.angles, client->ps.viewangles );
ADDRLP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 432
;432:}
LABELV $181
endproc SetClientViewAngle 20 0
export respawn
proc respawn 12 8
line 440
;433:
;434:
;435:/*
;436:================
;437:respawn
;438:================
;439:*/
;440:void respawn( gentity_t *ent ) {
line 444
;441:	gentity_t	*tent;
;442:
;443://qlone - freezetag
;444:	if ( g_freezeTag.integer && Set_spectator( ent ) ) return;
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $187
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Set_spectator
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $187
ADDRGP4 $186
JUMPV
LABELV $187
line 447
;445://qlone - freezetag
;446:
;447:	if ( ent->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $190
line 448
;448:		CopyToBodyQue( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
LABELV $190
line 450
;449:
;450:	ClientSpawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 453
;451:
;452:	// bots doesn't need to see any effects
;453:	if ( level.intermissiontime && ent->r.svFlags & SVF_BOT )
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $192
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $192
line 454
;454:		return;
ADDRGP4 $186
JUMPV
LABELV $192
line 457
;455:
;456:	// add a teleportation effect
;457:	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 458
;458:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 461
;459:
;460:	// optimize bandwidth
;461:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $195
line 462
;462:		tent->r.svFlags = SVF_SINGLECLIENT;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 256
ASGNI4
line 463
;463:		tent->r.singleClient = ent->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 464
;464:	}
LABELV $195
line 465
;465:}
LABELV $186
endproc respawn 12 8
export TeamCount
proc TeamCount 8 0
line 475
;466:
;467:
;468:/*
;469:================
;470:TeamCount
;471:
;472:Returns number of players on a team
;473:================
;474:*/
;475:int TeamCount( int ignoreClientNum, team_t team ) {
line 477
;476:	int		i;
;477:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 479
;478:
;479:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $202
JUMPV
LABELV $199
line 480
;480:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $204
line 481
;481:			continue;
ADDRGP4 $200
JUMPV
LABELV $204
line 483
;482:		}
;483:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $206
line 484
;484:			continue;
ADDRGP4 $200
JUMPV
LABELV $206
line 486
;485:		}
;486:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $208
line 487
;487:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 488
;488:		}
LABELV $208
line 489
;489:	}
LABELV $200
line 479
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $202
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $199
line 491
;490:
;491:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $198
endproc TeamCount 8 0
export TeamConnectedCount
proc TeamConnectedCount 8 0
line 502
;492:}
;493:
;494:
;495:/*
;496:================
;497:TeamConnectedCount
;498:
;499:Returns number of active players on a team
;500:================
;501:*/
;502:int TeamConnectedCount( int ignoreClientNum, team_t team ) {
line 504
;503:	int		i;
;504:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 506
;505:
;506:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $211
line 507
;507:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $216
line 508
;508:			continue;
ADDRGP4 $212
JUMPV
LABELV $216
line 510
;509:		}
;510:		if ( level.clients[i].pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $218
line 511
;511:			continue;
ADDRGP4 $212
JUMPV
LABELV $218
line 513
;512:		}
;513:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $220
line 514
;514:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 515
;515:		}
LABELV $220
line 516
;516:	}
LABELV $212
line 506
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $214
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $211
line 518
;517:
;518:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $210
endproc TeamConnectedCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 529
;519:}
;520:
;521:
;522:/*
;523:================
;524:TeamLeader
;525:
;526:Returns the client number of the team leader
;527:================
;528:*/
;529:int TeamLeader( team_t team ) {
line 532
;530:	int		i;
;531:
;532:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $223
line 533
;533:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $228
line 534
;534:			continue;
ADDRGP4 $224
JUMPV
LABELV $228
line 536
;535:		}
;536:		if ( level.clients[i].sess.sessionTeam == team ) {
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $230
line 537
;537:			if ( level.clients[i].sess.teamLeader )
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 0
EQI4 $232
line 538
;538:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $222
JUMPV
LABELV $232
line 539
;539:		}
LABELV $230
line 540
;540:	}
LABELV $224
line 532
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $226
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $223
line 542
;541:
;542:	return -1;
CNSTI4 -1
RETI4
LABELV $222
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 551
;543:}
;544:
;545:
;546:/*
;547:================
;548:PickTeam
;549:================
;550:*/
;551:team_t PickTeam( int ignoreClientNum ) {
line 554
;552:	int		counts[TEAM_NUM_TEAMS];
;553:
;554:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 555
;555:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 557
;556:
;557:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $237
line 558
;558:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $234
JUMPV
LABELV $237
line 560
;559:	}
;560:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $241
line 561
;561:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $234
JUMPV
LABELV $241
line 564
;562:	}
;563:	// equal team count, so join the team with the lowest score
;564:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 level+48+4
INDIRI4
LEI4 $245
line 565
;565:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $234
JUMPV
LABELV $245
line 567
;566:	}
;567:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $234
endproc PickTeam 24 8
export ClientUserinfoChanged
proc ClientUserinfoChanged 1316 52
line 584
;568:}
;569:
;570:
;571:/*
;572:===========
;573:ClientUserInfoChanged
;574:
;575:Called from ClientConnect when the player first connects and
;576:directly by the server system when the player updates a userinfo variable.
;577:
;578:The game can override any of the settings and call trap_SetUserinfo
;579:if desired.
;580:
;581:returns qfalse in case of invalid userinfo
;582:============
;583:*/
;584:qboolean ClientUserinfoChanged( int clientNum ) {
line 596
;585:	gentity_t *ent;
;586:	int		teamTask, teamLeader, health;
;587:	char	*s;
;588:	char	model[MAX_QPATH];
;589:	char	headModel[MAX_QPATH];
;590:	char	oldname[MAX_NETNAME];
;591:	gclient_t	*client;
;592:	char	c1[8];
;593:	char	c2[8];
;594:	char	userinfo[MAX_INFO_STRING];
;595:
;596:	ent = g_entities + clientNum;
ADDRLP4 1032
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 597
;597:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 599
;598:
;599:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 602
;600:
;601:	// check for malformed or illegal info strings
;602:	if ( !Info_Validate( userinfo ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 1228
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $252
line 603
;603:		Q_strcpy( ban_reason, "bad userinfo" );
ADDRGP4 ban_reason
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 Q_strcpy
CALLV
pop
line 604
;604:		if ( client && client->pers.connected != CON_DISCONNECTED )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $255
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $255
line 605
;605:			trap_DropClient( clientNum, ban_reason );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ban_reason
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
LABELV $255
line 606
;606:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $251
JUMPV
LABELV $252
line 609
;607:	}
;608:
;609:	if ( client->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $257
line 612
;610:		// we just checked if connecting player can join server
;611:		// so quit now as some important data like player team is still not set
;612:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $251
JUMPV
LABELV $257
line 616
;613:	}
;614:
;615:	// check for local client
;616:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 1232
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1232
INDIRP4
ASGNP4
line 617
;617:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 1236
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $260
line 618
;618:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 619
;619:	} else {
ADDRGP4 $261
JUMPV
LABELV $260
line 620
;620:		client->pers.localClient = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 621
;621:	}
LABELV $261
line 624
;622:
;623:	// check the item prediction
;624:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 1240
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1240
INDIRP4
ASGNP4
line 625
;625:	if ( !atoi( s ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1244
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
NEI4 $264
line 626
;626:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 627
;627:	} else {
ADDRGP4 $265
JUMPV
LABELV $264
line 628
;628:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 629
;629:	}
LABELV $265
line 632
;630:
;631:	// set name
;632:	Q_strncpyz( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 633
;633:	s = Info_ValueForKey( userinfo, "name" );
ADDRLP4 4
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 1248
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1248
INDIRP4
ASGNP4
line 634
;634:	BG_CleanName( s, client->pers.netname, sizeof( client->pers.netname ), "UnnamedPlayer" );
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 $267
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 636
;635:
;636:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $268
line 637
;637:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
NEI4 $270
line 638
;638:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 $272
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 639
;639:		}
LABELV $270
line 640
;640:	}
LABELV $268
line 642
;641:
;642:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $273
line 643
;643:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1252
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
EQI4 $275
line 644
;644:			G_BroadcastServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, client->pers.netname) );
ADDRGP4 $277
ARGP4
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1256
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 645
;645:		}
LABELV $275
line 646
;646:	}
LABELV $273
line 660
;647:
;648:	// set max health
;649:#ifdef MISSIONPACK
;650:	if (client->ps.powerups[PW_GUARD]) {
;651:		client->pers.maxHealth = HEALTH_SOFT_LIMIT*2;
;652:	} else {
;653:		health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
;654:		client->pers.maxHealth = health;
;655:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT ) {
;656:			client->pers.maxHealth = HEALTH_SOFT_LIMIT;
;657:		}
;658:	}
;659:#else
;660:	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 1252
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1256
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1224
ADDRLP4 1256
INDIRI4
ASGNI4
line 661
;661:	client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 1224
INDIRI4
ASGNI4
line 662
;662:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT ) {
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1
LTI4 $281
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 100
LEI4 $279
LABELV $281
line 663
;663:		client->pers.maxHealth = HEALTH_SOFT_LIMIT;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 100
ASGNI4
line 664
;664:	}
LABELV $279
line 666
;665:#endif
;666:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 681
;667:
;668:#ifdef MISSIONPACK
;669:	if (g_gametype.integer >= GT_TEAM) {
;670:		client->pers.teamInfo = qtrue;
;671:	} else {
;672:		s = Info_ValueForKey( userinfo, "teamoverlay" );
;673:		if ( ! *s || atoi( s ) != 0 ) {
;674:			client->pers.teamInfo = qtrue;
;675:		} else {
;676:			client->pers.teamInfo = qfalse;
;677:		}
;678:	}
;679:#else
;680:	// teamInfo
;681:	s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 4
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 1268
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1268
INDIRP4
ASGNP4
line 682
;682:	if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $285
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1276
INDIRI4
CNSTI4 0
EQI4 $283
LABELV $285
line 683
;683:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 1
ASGNI4
line 684
;684:	} else {
ADDRGP4 $284
JUMPV
LABELV $283
line 685
;685:		client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 686
;686:	}
LABELV $284
line 690
;687:#endif
;688:
;689:	// set model
;690:	Q_strncpyz( model, Info_ValueForKey( userinfo, "model" ), sizeof( model ) );
ADDRLP4 4
ARGP4
ADDRGP4 $286
ARGP4
ADDRLP4 1280
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 1280
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 691
;691:	Q_strncpyz( headModel, Info_ValueForKey( userinfo, "headmodel" ), sizeof( headModel ) );
ADDRLP4 4
ARGP4
ADDRGP4 $287
ARGP4
ADDRLP4 1284
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 694
;692:
;693:	// team task (0 = none, 1 = offence, 2 = defence)
;694:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 4
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 1288
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1288
INDIRP4
ARGP4
ADDRLP4 1292
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1216
ADDRLP4 1292
INDIRI4
ASGNI4
line 696
;695:	// team Leader (1 = leader, 0 is normal player)
;696:	teamLeader = client->sess.teamLeader;
ADDRLP4 1220
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ASGNI4
line 699
;697:
;698:	// colors
;699:	Q_strncpyz( c1, Info_ValueForKey( userinfo, "color1" ), sizeof( c1 ) );
ADDRLP4 4
ARGP4
ADDRGP4 $289
ARGP4
ADDRLP4 1296
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1164
ARGP4
ADDRLP4 1296
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 700
;700:	Q_strncpyz( c2, Info_ValueForKey( userinfo, "color2" ), sizeof( c2 ) );
ADDRLP4 4
ARGP4
ADDRGP4 $290
ARGP4
ADDRLP4 1300
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1172
ARGP4
ADDRLP4 1300
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 704
;701:
;702:	// send over a subset of the userinfo keys so other clients can
;703:	// print scoreboards, display models, and play custom sounds
;704:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $291
line 705
;705:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 4
ARGP4
ADDRGP4 $294
ARGP4
ADDRLP4 1304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $293
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1172
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ARGI4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1216
INDIRI4
ARGI4
ADDRLP4 1220
INDIRI4
ARGI4
ADDRLP4 1312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1312
INDIRP4
ASGNP4
line 709
;706:			client->pers.netname, client->sess.sessionTeam, model, headModel, c1, c2,
;707:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;708:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;709:	} else {
ADDRGP4 $292
JUMPV
LABELV $291
line 710
;710:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $295
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1172
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ARGI4
ADDRLP4 1216
INDIRI4
ARGI4
ADDRLP4 1220
INDIRI4
ARGI4
ADDRLP4 1308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1308
INDIRP4
ASGNP4
line 713
;711:			client->pers.netname, client->sess.sessionTeam, model, headModel, c1, c2, 
;712:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader );
;713:	}
LABELV $292
line 715
;714:
;715:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 718
;716:
;717:	// this is not the userinfo, more like the configstring actually
;718:	G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $296
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 720
;719:
;720:	return qtrue;
CNSTI4 1
RETI4
LABELV $251
endproc ClientUserinfoChanged 1316 52
export ClientConnect
proc ClientConnect 1072 12
line 744
;721:}
;722:
;723:
;724:/*
;725:===========
;726:ClientConnect
;727:
;728:Called when a player begins connecting to the server.
;729:Called again for every map change or tournement restart.
;730:
;731:The session information will be valid after exit.
;732:
;733:Return NULL if the client should be allowed, otherwise return
;734:a string with the reason for denial.
;735:
;736:Otherwise, the client will be sent the current gamestate
;737:and will eventually get to ClientBegin.
;738:
;739:firstTime will be qtrue the very first time a client connects
;740:to the server machine, but qfalse on map changes and tournement
;741:restarts.
;742:============
;743:*/
;744:const char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 752
;745:	char		*value;
;746://	char		*areabits;
;747:	gclient_t	*client;
;748:	char		userinfo[MAX_INFO_STRING];
;749:	gentity_t	*ent;
;750:	qboolean	isAdmin;
;751:
;752:	if ( clientNum >= level.maxclients ) {
ADDRFP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $298
line 753
;753:		return "Bad connection slot.";
ADDRGP4 $301
RETP4
ADDRGP4 $297
JUMPV
LABELV $298
line 756
;754:	}
;755:
;756:	ent = &g_entities[ clientNum ];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 757
;757:	ent->client = level.clients + clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 759
;758:
;759:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $302
line 762
;760:		// cleanup previous data manually
;761:		// because client may silently (re)connect without ClientDisconnect in case of crash for example
;762:		if ( level.clients[ clientNum ].pers.connected != CON_DISCONNECTED )
ADDRFP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $304
line 763
;763:			ClientDisconnect( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
LABELV $304
line 766
;764:
;765:		// remove old entity from the world
;766:		trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 767
;767:		ent->r.contents = 0;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 768
;768:		ent->s.eType = ET_INVISIBLE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 769
;769:		ent->s.eFlags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 770
;770:		ent->s.modelindex = 0;
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 771
;771:		ent->s.clientNum = clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 772
;772:		ent->s.number = clientNum;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRI4
ASGNI4
line 773
;773:		ent->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 774
;774:	}
LABELV $302
line 776
;775:
;776:	ent->r.svFlags &= ~SVF_BOT;
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 777
;777:	ent->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 779
;778:
;779:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 785
;780:
;781: 	// IP filtering
;782: 	// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=500
;783: 	// recommanding PB based IP / GUID banning, the builtin system is pretty limited
;784: 	// check to see if they are on the banned IP list
;785:	value = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 12
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1044
INDIRP4
ASGNP4
line 787
;786:
;787:	if ( !strcmp( value, "localhost" ) && !isBot )
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 1048
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $306
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $306
line 788
;788:		isAdmin = qtrue;
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $306
line 790
;789:	else
;790:		isAdmin = qfalse;
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $307
line 792
;791:
;792:	if ( !isAdmin && G_FilterPacket( value ) ) {
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $308
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $308
line 793
;793:		return "You are banned from this server.";
ADDRGP4 $310
RETP4
ADDRGP4 $297
JUMPV
LABELV $308
line 799
;794:	}
;795:
;796:	// we don't check password for bots and local client
;797:	// NOTE: local client <-> "ip" "localhost"
;798:	// this means this client is not running in our current process
;799:	if ( !isBot && !isAdmin ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $311
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $311
line 801
;800:		// check for a password
;801:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) ) {
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $313
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $313
line 802
;802:			value = Info_ValueForKey( userinfo, "password" );
ADDRLP4 12
ARGP4
ADDRGP4 $318
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1060
INDIRP4
ASGNP4
line 803
;803:			if ( strcmp( g_password.string, value ) )
ADDRGP4 g_password+16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $319
line 804
;804:				return "Invalid password";
ADDRGP4 $322
RETP4
ADDRGP4 $297
JUMPV
LABELV $319
line 805
;805:		}
LABELV $313
line 806
;806:	}
LABELV $311
line 809
;807:
;808:	// they can connect
;809:	ent->client = level.clients + clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 810
;810:	client = ent->client;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 813
;811:
;812://	areabits = client->areabits;
;813:	memset( client, 0, sizeof( *client ) );
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1568
ARGI4
ADDRGP4 memset
CALLP4
pop
line 815
;814:
;815:	client->ps.clientNum = clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 817
;816:
;817:	if ( !ClientUserinfoChanged( clientNum ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 ClientUserinfoChanged
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $323
line 818
;818:		return ban_reason;
ADDRGP4 ban_reason
RETP4
ADDRGP4 $297
JUMPV
LABELV $323
line 822
;819:	}
;820:
;821:	// read or initialize the session data
;822:	if ( firstTime || level.newSession ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $328
ADDRGP4 level+68
INDIRI4
CNSTI4 0
EQI4 $325
LABELV $328
line 823
;823:		value = Info_ValueForKey( userinfo, "team" );
ADDRLP4 12
ARGP4
ADDRGP4 $329
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1060
INDIRP4
ASGNP4
line 824
;824:		G_InitSessionData( client, value, isBot );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitSessionData
CALLV
pop
line 825
;825:		G_WriteClientSessionData( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 826
;826:	}
LABELV $325
line 828
;827:
;828:	G_ReadClientSessionData( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ReadClientSessionData
CALLV
pop
line 831
;829:
;830://qlone -  freezetag
;831:	if (g_freezeTag.integer) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $330
line 832
;832:		if ( g_gametype.integer != GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $333
line 833
;833:			client->sess.wins = 0;
ADDRLP4 4
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
LABELV $333
line 834
;834:		ent->freezeState = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 0
ASGNI4
line 835
;835:		ent->readyBegin = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 836
;836:	}
LABELV $330
line 839
;837://qlone -  freezetag
;838:
;839:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $336
line 840
;840:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $341
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $342
JUMPV
LABELV $341
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $342
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $338
line 841
;841:			return "BotConnectfailed";
ADDRGP4 $343
RETP4
ADDRGP4 $297
JUMPV
LABELV $338
line 843
;842:		}
;843:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1068
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1068
INDIRP4
ADDRLP4 1068
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 844
;844:		client->sess.spectatorClient = clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 636
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 845
;845:	}
LABELV $336
line 846
;846:	ent->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 849
;847:
;848:	// get and distribute relevant paramters
;849:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $344
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 851
;850:
;851:	client->pers.connected = CON_CONNECTING;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 853
;852:
;853:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 856
;854:
;855:	// don't do the "xxx connected" messages if they were caried over from previous level
;856:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $345
line 857
;857:		G_BroadcastServerCommand( -1, va( "print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname ) );
ADDRGP4 $347
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 860
;858:
;859:		// mute all prints until completely in game
;860:		client->pers.inGame = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 0
ASGNI4
line 861
;861:	} else {
ADDRGP4 $346
JUMPV
LABELV $345
line 862
;862:		client->pers.inGame = qtrue; // FIXME: read from session data?
ADDRLP4 4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 1
ASGNI4
line 863
;863:	}
LABELV $346
line 866
;864:
;865:	// count current clients and rank for scoreboard
;866:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 873
;867:
;868:	// for statistics
;869://	client->areabits = areabits;
;870://	if ( !client->areabits )
;871://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;872:
;873:	return NULL;
CNSTP4 0
RETP4
LABELV $297
endproc ClientConnect 1072 12
export ClientBegin
proc ClientBegin 28 12
line 886
;874:}
;875:
;876:
;877:/*
;878:===========
;879:ClientBegin
;880:
;881:called when a client has finished connecting, and is ready
;882:to be placed into the level.  This will happen every level load,
;883:and on transition between teams, but doesn't happen on respawns
;884:============
;885:*/
;886:void ClientBegin( int clientNum ) {
line 893
;887:	gentity_t	*ent;
;888:	gclient_t	*client;
;889:	gentity_t	*tent;
;890:	int			flags;
;891:	int			spawns;
;892:
;893:	ent = g_entities + clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 895
;894:
;895:	client = level.clients + clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 897
;896:
;897:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $349
line 898
;898:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 899
;899:	}
LABELV $349
line 901
;900:
;901:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 902
;902:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTP4 0
ASGNP4
line 903
;903:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
CNSTP4 0
ASGNP4
line 904
;904:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 906
;905:
;906:	if ( client->pers.connected == CON_DISCONNECTED )
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $351
line 907
;907:		return;
ADDRGP4 $348
JUMPV
LABELV $351
line 909
;908:
;909:	client->pers.connected = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 2
ASGNI4
line 910
;910:	client->pers.enterTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 911
;911:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 912
;912:	spawns = client->ps.persistant[PERS_SPAWN_COUNT];
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 919
;913:
;914:	// save eflags around this, because changing teams will
;915:	// cause this to happen with a valid entity, and we
;916:	// want to make sure the teleport bit is set right
;917:	// so the viewpoint doesn't interpolate through the
;918:	// world to the new position
;919:	flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 920
;920:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 468
ARGI4
ADDRGP4 memset
CALLP4
pop
line 921
;921:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 922
;922:	client->ps.persistant[PERS_SPAWN_COUNT] = spawns;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 925
;923:
;924:	// locate ent at a spawn point
;925:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 927
;926:
;927:	if ( !client->pers.inGame ) {
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $354
line 928
;928:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 929
;929:		if ( client->sess.sessionTeam == TEAM_RED || client->sess.sessionTeam == TEAM_BLUE )
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
EQI4 $358
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $356
LABELV $358
line 930
;930:			CheckTeamLeader( client->sess.sessionTeam );
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
LABELV $356
line 931
;931:	}
LABELV $354
line 933
;932:
;933:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $359
line 935
;934:		// send event
;935:		tent = G_TempEntity( client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 936
;936:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 16
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 938
;937:
;938:		client->sess.spectatorTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 0
ASGNI4
line 940
;939:
;940:		if ( g_gametype.integer != GT_TOURNAMENT && !client->pers.inGame ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $361
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $361
line 941
;941:			G_BroadcastServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
ADDRGP4 $364
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 942
;942:		}
LABELV $361
line 943
;943:	}
LABELV $359
line 945
;944:	
;945:	client->pers.inGame = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 1
ASGNI4
line 947
;946:
;947:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $365
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 950
;948:
;949:	// count current clients and rank for scoreboard
;950:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 951
;951:}
LABELV $348
endproc ClientBegin 28 12
export ClientSpawn
proc ClientSpawn 1404 20
line 963
;952:
;953:
;954:/*
;955:===========
;956:ClientSpawn
;957:
;958:Called every time a client is placed fresh in the world:
;959:after the first ClientBegin, and after each respawn
;960:Initializes all non-persistant parts of playerState
;961:============
;962:*/
;963:void ClientSpawn(gentity_t *ent) {
line 980
;964:	int		index;
;965:	vec3_t	spawn_origin, spawn_angles;
;966:	gclient_t	*client;
;967:	int		i;
;968:	clientPersistant_t	saved;
;969:	clientSession_t		savedSess;
;970:	int		persistant[MAX_PERSISTANT];
;971:	gentity_t	*spawnPoint;
;972:	int		flags;
;973:	int		savedPing;
;974://	char	*savedAreaBits;
;975:	int		accuracy_hits, accuracy_shots;
;976:	int		eventSequence;
;977:	char	userinfo[MAX_INFO_STRING];
;978:	qboolean isSpectator;
;979:
;980:	index = ent - g_entities;
ADDRLP4 100
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
line 981
;981:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 983
;982:
;983:	trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 985
;984:
;985:	isSpectator = client->sess.sessionTeam == TEAM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $368
ADDRLP4 1336
CNSTI4 1
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $368
ADDRLP4 1336
CNSTI4 0
ASGNI4
LABELV $369
ADDRLP4 1132
ADDRLP4 1336
INDIRI4
ASGNI4
line 989
;986:	// find a spawn point
;987:	// do it before setting health back up, so farthest
;988:	// ranging doesn't count this client
;989:	if ( isSpectator ) {
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $370
line 990
;990:		spawnPoint = SelectSpectatorSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1340
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1340
INDIRP4
ASGNP4
line 991
;991:	} else if (g_gametype.integer >= GT_CTF ) {
ADDRGP4 $371
JUMPV
LABELV $370
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $372
line 993
;992:		// all base oriented team games use the CTF spawn points
;993:		spawnPoint = SelectCTFSpawnPoint( ent, client->sess.sessionTeam, client->pers.teamState.state, spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1344
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1344
INDIRP4
ASGNP4
line 994
;994:	} else {
ADDRGP4 $373
JUMPV
LABELV $372
LABELV $375
line 995
;995:		do {
line 997
;996:			// the first spawn should be at a good looking spot
;997:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
NEI4 $378
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
EQI4 $378
line 998
;998:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 999
;999:				spawnPoint = SelectInitialSpawnPoint( ent, spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1344
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1344
INDIRP4
ASGNP4
line 1000
;1000:			} else {
ADDRGP4 $379
JUMPV
LABELV $378
line 1002
;1001:				// don't spawn near existing origin if possible
;1002:				spawnPoint = SelectSpawnPoint( ent, client->ps.origin, spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1344
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1344
INDIRP4
ASGNP4
line 1003
;1003:			}
LABELV $379
line 1007
;1004:
;1005:			// Tim needs to prevent bots from spawning at the initial point
;1006:			// on q3dm0...
;1007:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $380
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $380
line 1008
;1008:				continue;	// try again
ADDRGP4 $376
JUMPV
LABELV $380
line 1011
;1009:			}
;1010:			// just to be symetric, we have a nohumans option...
;1011:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $377
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $377
line 1012
;1012:				continue;	// try again
line 1015
;1013:			}
;1014:
;1015:			break;
LABELV $376
line 1017
;1016:
;1017:		} while ( 1 );
ADDRGP4 $375
JUMPV
LABELV $377
line 1018
;1018:	}
LABELV $373
LABELV $371
line 1019
;1019:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 1
ASGNI4
line 1028
;1020:
;1021:#ifdef MISSIONPACK
;1022:	// always clear the kamikaze flag
;1023:	ent->s.eFlags &= ~EF_KAMIKAZE;
;1024:#endif
;1025:
;1026:	// toggle the teleport bit so the client knows to not lerp
;1027:	// and never clear the voted flag
;1028:	flags = client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 104
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1029
;1029:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 104
ADDRLP4 104
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1032
;1030:
;1031:	// unlagged
;1032:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 1033
;1033:	client->saved.leveltime = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 0
ASGNI4
line 1037
;1034:
;1035:	// clear everything but the persistant data
;1036:
;1037:	saved = client->pers;
ADDRLP4 1136
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRB
ASGNB 156
line 1038
;1038:	savedSess = client->sess;
ADDRLP4 1292
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 28
line 1039
;1039:	savedPing = client->ps.ping;
ADDRLP4 1320
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1041
;1040://	savedAreaBits = client->areabits;
;1041:	accuracy_hits = client->accuracy_hits;
ADDRLP4 1324
ADDRLP4 4
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 1042
;1042:	accuracy_shots = client->accuracy_shots;
ADDRLP4 1328
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ASGNI4
line 1043
;1043:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $384
line 1044
;1044:		persistant[i] = client->ps.persistant[i];
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
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1045
;1045:	}
LABELV $385
line 1043
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $384
line 1046
;1046:	eventSequence = client->ps.eventSequence;
ADDRLP4 1332
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1048
;1047:
;1048:	Com_Memset (client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1568
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1050
;1049:
;1050:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 1136
INDIRB
ASGNB 156
line 1051
;1051:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 1292
INDIRB
ASGNB 28
line 1052
;1052:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 1320
INDIRI4
ASGNI4
line 1054
;1053://	client->areabits = savedAreaBits;
;1054:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 724
ADDP4
ADDRLP4 1324
INDIRI4
ASGNI4
line 1055
;1055:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 1328
INDIRI4
ASGNI4
line 1056
;1056:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 -1
ASGNI4
line 1058
;1057:
;1058:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $388
line 1059
;1059:		client->ps.persistant[i] = persistant[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1060
;1060:	}
LABELV $389
line 1058
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $388
line 1061
;1061:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1332
INDIRI4
ASGNI4
line 1063
;1062:	// increment the spawncount so the client will detect the respawn
;1063:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 1340
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 1340
INDIRP4
ADDRLP4 1340
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1064
;1064:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 1066
;1065:
;1066:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1068
;1067:
;1068:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1070
;1069:	// set max health
;1070:	client->pers.maxHealth = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 108
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 1348
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1348
INDIRP4
ARGP4
ADDRLP4 1352
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 1352
INDIRI4
ASGNI4
line 1071
;1071:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT ) {
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1
LTI4 $395
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 100
LEI4 $393
LABELV $395
line 1072
;1072:		client->pers.maxHealth = HEALTH_SOFT_LIMIT;
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 100
ASGNI4
line 1073
;1073:	}
LABELV $393
line 1075
;1074:	// clear entity values
;1075:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 1076
;1076:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1078
;1077:
;1078:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1079
;1079:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 100
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1080
;1080:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1081
;1081:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $396
ASGNP4
line 1082
;1082:	if ( isSpectator ) {
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $397
line 1083
;1083:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 1084
;1084:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 1085
;1085:		ent->clipmask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
line 1086
;1086:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1087
;1087:	} else {
ADDRGP4 $398
JUMPV
LABELV $397
line 1088
;1088:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1089
;1089:		ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
line 1090
;1090:		ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 33619969
ASGNI4
line 1091
;1091:	}
LABELV $398
line 1092
;1092:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 player_die
ASGNP4
line 1093
;1093:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 0
ASGNI4
line 1094
;1094:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 1095
;1095:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 1097
;1096:	
;1097:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1098
;1098:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1100
;1099:
;1100:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 1102
;1101:
;1102:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1103
;1103:	if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $399
line 1104
;1104:		client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1105
;1105:	} else {
ADDRGP4 $400
JUMPV
LABELV $399
line 1106
;1106:		client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1107
;1107:	}
LABELV $400
line 1109
;1108:
;1109:	client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 1364
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 1364
INDIRP4
ADDRLP4 1364
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1110
;1110:	client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1111
;1111:	client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1114
;1112:
;1113:	// health will count down towards max_health
;1114:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 1372
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 1372
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 1372
INDIRI4
ASGNI4
line 1116
;1115:	//qlone - custom health
;1116:	if ( g_startHealth.integer > 0 ) {
ADDRGP4 g_startHealth+12
INDIRI4
CNSTI4 0
LEI4 $402
line 1117
;1117:		client->ps.stats[STAT_HEALTH] += g_startHealth.integer;
ADDRLP4 1376
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ASGNP4
ADDRLP4 1376
INDIRP4
ADDRLP4 1376
INDIRP4
INDIRI4
ADDRGP4 g_startHealth+12
INDIRI4
ADDI4
ASGNI4
line 1118
;1118:		if ( client->ps.stats[STAT_HEALTH] > client->ps.stats[STAT_MAX_HEALTH] * 2 )
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $406
line 1119
;1119:			client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
LABELV $406
line 1120
;1120:		ent->health = client->ps.stats[STAT_HEALTH];
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1121
;1121:	}
LABELV $402
line 1124
;1122:	//qlone - custom health
;1123:
;1124:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1125
;1125:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 76
INDIRB
ASGNB 12
line 1128
;1126:
;1127:	// the respawned flag will be cleared after the attack and jump keys come up
;1128:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 1376
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1376
INDIRP4
ADDRLP4 1376
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1130
;1129:
;1130:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
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
ADDRFP4 0
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
line 1131
;1131:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1136
;1132:
;1133:	// entity should be unlinked before calling G_KillBox()	
;1134://qlone - freezetag
;1135:	//if ( !isSpectator )
;1136:	if ( !is_spectator( client ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1380
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 1380
INDIRI4
CNSTI4 0
NEI4 $408
line 1138
;1137://qlone - freezetag
;1138:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 1140
;1139://qlone - custom weapons
;1140:		G_SpawnWeapon( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnWeapon
CALLV
pop
line 1141
;1141:		if ( g_freezeTag.integer && ( g_dmflags.integer & 1024 ) )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $410
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $410
line 1142
;1142:			G_SetInfiniteAmmo( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetInfiniteAmmo
CALLV
pop
LABELV $410
line 1144
;1143://qlone - custom weapons
;1144:	}
LABELV $408
line 1147
;1145:
;1146:	// force the base weapon up
;1147:	client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 1148
;1148:	client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1151
;1149:
;1150:	// don't allow full run speed for a bit
;1151:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 1384
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1384
INDIRP4
ADDRLP4 1384
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1152
;1152:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1154
;1153:
;1154:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1155
;1155:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
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
line 1156
;1156:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 672
ADDP4
CNSTI4 0
ASGNI4
line 1159
;1157:
;1158:	// set default animations
;1159:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 1160
;1160:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 1162
;1161:
;1162:	if ( level.intermissiontime ) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $417
line 1163
;1163:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1164
;1164:	} else {
ADDRGP4 $418
JUMPV
LABELV $417
line 1167
;1165://qlone - freezetag
;1166:		//if ( !isSpectator )
;1167:		if ( !is_spectator( client ) )
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1388
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 1388
INDIRI4
CNSTI4 0
NEI4 $420
line 1169
;1168://qlone - freezetag
;1169:			trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $420
line 1171
;1170://qlone - freezetag
;1171:		if ( g_freezeTag.integer && !( g_dmflags.integer & 1024 ) )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $422
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $422
line 1174
;1172://qlone - freezetag
;1173:		// fire the targets of the spawn point
;1174:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $422
line 1178
;1175:
;1176:		// select the highest weapon number available, after any
;1177:		// spawn given items have fired
;1178:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1179
;1179:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 0
CNSTI4 10
ASGNI4
LABELV $426
line 1180
;1180:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $430
line 1181
;1181:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1182
;1182:				break;
ADDRGP4 $428
JUMPV
LABELV $430
line 1184
;1183:			}
;1184:		}
LABELV $427
line 1179
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $426
LABELV $428
line 1186
;1185://qlone - freezetag
;1186:                if ( g_freezeTag.integer && ( client->ps.stats[ STAT_WEAPONS ] & ( 1 << WP_ROCKET_LAUNCHER ) ) ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $432
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $432
line 1187
;1187:                        client->ps.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 5
ASGNI4
line 1188
;1188:                }
LABELV $432
line 1190
;1189:
;1190:		if ( g_startArmor.integer > 0 ) {
ADDRGP4 g_startArmor+12
INDIRI4
CNSTI4 0
LEI4 $435
line 1191
;1191:			client->ps.stats[ STAT_ARMOR ] += g_startArmor.integer;
ADDRLP4 1392
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 1392
INDIRP4
ADDRLP4 1392
INDIRP4
INDIRI4
ADDRGP4 g_startArmor+12
INDIRI4
ADDI4
ASGNI4
line 1192
;1192:			if ( client->ps.stats[ STAT_ARMOR ] > client->ps.stats[ STAT_MAX_HEALTH ] * 2 ) {
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $439
line 1193
;1193:				client->ps.stats[ STAT_ARMOR ] = client->ps.stats[ STAT_MAX_HEALTH ] * 2;
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1194
;1194:			}
LABELV $439
line 1195
;1195:		}
LABELV $435
line 1198
;1196://qlone - freezetag
;1197:
;1198:	}
LABELV $418
line 1202
;1199:
;1200:	// run a client frame to drop exactly to the floor,
;1201:	// initialize animations and other things
;1202:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1203
;1203:	client->pers.cmd.serverTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1204
;1204:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 1206
;1205:
;1206:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
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
;1207:	VectorCopy( client->ps.origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1210
;1208:
;1209:	// run the presend to set anything else
;1210:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1213
;1211:
;1212:	// clear entity state values
;1213:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
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
line 1214
;1214:}
LABELV $366
endproc ClientSpawn 1404 20
export ClientDisconnect
proc ClientDisconnect 28 8
line 1229
;1215:
;1216:
;1217:/*
;1218:===========
;1219:ClientDisconnect
;1220:
;1221:Called when a player drops from the server.
;1222:Will not be called between levels.
;1223:
;1224:This should NOT be called directly by any game logic,
;1225:call trap_DropClient(), which will call this and do
;1226:server system housekeeping.
;1227:============
;1228:*/
;1229:void ClientDisconnect( int clientNum ) {
line 1236
;1230:	gentity_t	*ent;
;1231:	gentity_t	*tent;
;1232:	int			i;
;1233:
;1234:	// cleanup if we are kicking a bot that
;1235:	// hasn't spawned yet
;1236:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 1238
;1237:
;1238:	ent = g_entities + clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1239
;1239:	if (!ent->client || ent->client->pers.connected == CON_DISCONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $446
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $444
LABELV $446
line 1240
;1240:		return;
ADDRGP4 $443
JUMPV
LABELV $444
line 1244
;1241:	}
;1242:
;1243:	// stop any following clients
;1244:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $450
JUMPV
LABELV $447
line 1246
;1245://qlone - freezetag
;1246:		if ( /*level.clients[i].sess.sessionTeam == TEAM_SPECTATOR*/ is_spectator( &level.clients[ i ] )
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $452
ADDRLP4 24
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $452
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 636
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $452
line 1249
;1247://qlone - freezetag
;1248:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;1249:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 1250
;1250:			StopFollowing( &g_entities[i], qtrue );
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 1251
;1251:		}
LABELV $452
line 1252
;1252:	}
LABELV $448
line 1244
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $450
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $447
line 1255
;1253:
;1254:	// send effect if they were completely connected
;1255:	if ( ent->client->pers.connected == CON_CONNECTED 
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $454
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $454
line 1257
;1256://qlone - freezetag
;1257:		&& /*ent->client->sess.sessionTeam != TEAM_SPECTATOR*/ !is_spectator( ent->client ) ) {
line 1259
;1258://qlone - freezetag
;1259:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 24
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 1260
;1260:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1264
;1261:
;1262:		// They don't get to take powerups with them!
;1263:		// Especially important for stuff like CTF flags
;1264:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1272
;1265:#ifdef MISSIONPACK
;1266:		TossClientPersistantPowerups( ent );
;1267:		if( g_gametype.integer == GT_HARVESTER ) {
;1268:			TossClientCubes( ent );
;1269:		}
;1270:#endif
;1271:
;1272:	}
LABELV $454
line 1274
;1273:
;1274:	G_RevertVote( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RevertVote
CALLV
pop
line 1276
;1275:
;1276:	G_LogPrintf( "ClientDisconnect: %i\n", clientNum );
ADDRGP4 $456
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1279
;1277:
;1278:	// if we are playing in tourney mode and losing, give a win to the other player
;1279:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $457
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
NEI4 $457
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $457
ADDRGP4 level+88+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $457
line 1281
;1280:		&& !level.intermissiontime
;1281:		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
line 1282
;1282:		level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 24
ADDRGP4 level+88
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 640
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1283
;1283:		ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+88
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1284
;1284:	}
LABELV $457
line 1286
;1285:
;1286:	trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1287
;1287:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1288
;1288:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1289
;1289:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $466
ASGNP4
line 1290
;1290:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 1291
;1291:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1292
;1292:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 0
ASGNI4
line 1294
;1293:
;1294:	trap_SetConfigstring( CS_PLAYERS + clientNum, "" );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $467
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1296
;1295:
;1296:	G_ClearClientSessionData( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ClearClientSessionData
CALLV
pop
line 1298
;1297:
;1298:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1300
;1299:
;1300:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $468
line 1301
;1301:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1302
;1302:	}
LABELV $468
line 1303
;1303:}
LABELV $443
endproc ClientDisconnect 28 8
bss
align 1
LABELV ban_reason
skip 256
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
import CalculateRanks
import AddScore
import player_die
import BeginIntermission
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
LABELV $467
byte 1 0
align 1
LABELV $466
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $456
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $396
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $365
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $364
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $347
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $344
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $343
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $329
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $322
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $318
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $317
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $310
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $301
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $296
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $295
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $294
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $293
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $290
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $289
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $288
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $287
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $286
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $282
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $278
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $277
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $272
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $267
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $266
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $263
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $262
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $259
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $254
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $153
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $126
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
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $63
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $59
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $56
byte 1 48
byte 1 0
align 1
LABELV $55
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
