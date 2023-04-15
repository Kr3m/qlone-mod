export SpawnTime
code
proc SpawnTime 32 0
file "../../../../code/game/g_items.c"
line 41
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:/*
;6:
;7:  Items are any object that a player can touch to gain some effect.
;8:
;9:  Pickup will return the number of seconds until they should respawn.
;10:
;11:  all items should pop when dropped in lava or slime
;12:
;13:  Respawnable items don't actually go away when picked up, they are
;14:  just made invisible and untouchable.  This allows them to ride
;15:  movers and respawn apropriately.
;16:*/
;17:
;18:// initial spawn times after warmup
;19:// in vq3 most of the items appears in one frame but we will delay that a bit
;20:// to reduce peak bandwidth and get some nice transition effects
;21:#define	SPAWN_WEAPONS		333
;22:#define	SPAWN_ARMOR			1200
;23:#define	SPAWN_HEALTH		900
;24:#define	SPAWN_AMMO			600
;25:#define	SPAWN_HOLDABLE		2500
;26:#define	SPAWN_MEGAHEALTH	10000
;27:#define	SPAWN_POWERUP		45000
;28:
;29:// periodic respawn times
;30:// g_weaponRespawn.integer || g_weaponTeamRespawn.integer
;31:#define	RESPAWN_ARMOR		25000
;32:#define	RESPAWN_HEALTH		35000
;33:#define	RESPAWN_AMMO		40000
;34:#define	RESPAWN_HOLDABLE	60000
;35:#define	RESPAWN_MEGAHEALTH	35000 //120000
;36:#define	RESPAWN_POWERUP		120000
;37:
;38://======================================================================
;39:
;40:int SpawnTime( gentity_t *ent, qboolean firstSpawn ) 
;41:{
line 42
;42:	if ( !ent->item )
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $55
line 43
;43:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $54
JUMPV
LABELV $55
line 45
;44:
;45:	switch( ent->item->giType ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $58
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $58
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $93-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $93
address $60
address $68
address $72
address $76
address $85
address $89
code
LABELV $60
line 48
;46:
;47:	case IT_WEAPON:
;48:		if ( firstSpawn )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $61
line 49
;49:			return SPAWN_WEAPONS;
CNSTI4 333
RETI4
ADDRGP4 $54
JUMPV
LABELV $61
line 50
;50:		if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $63
line 51
;51:			return g_weaponTeamRespawn.value * 1000;
ADDRGP4 g_weaponTeamRespawn+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
RETI4
ADDRGP4 $54
JUMPV
LABELV $63
line 53
;52:		else
;53:			return g_weaponRespawn.value * 1000 ;
ADDRGP4 g_weaponRespawn+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
RETI4
ADDRGP4 $54
JUMPV
LABELV $68
line 56
;54:
;55:	case IT_AMMO:
;56:		return firstSpawn ? SPAWN_AMMO : RESPAWN_AMMO;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $70
ADDRLP4 8
CNSTI4 600
ASGNI4
ADDRGP4 $71
JUMPV
LABELV $70
ADDRLP4 8
CNSTI4 40000
ASGNI4
LABELV $71
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $72
line 59
;57:
;58:	case IT_ARMOR:
;59:		return firstSpawn ? SPAWN_ARMOR : RESPAWN_ARMOR;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $74
ADDRLP4 12
CNSTI4 1200
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 12
CNSTI4 25000
ASGNI4
LABELV $75
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $76
line 62
;60:
;61:	case IT_HEALTH:
;62:		if ( ent->item->quantity == 100 ) // mega health respawns slow
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
NEI4 $77
line 63
;63:			return firstSpawn ? SPAWN_MEGAHEALTH : RESPAWN_MEGAHEALTH;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $80
ADDRLP4 16
CNSTI4 10000
ASGNI4
ADDRGP4 $81
JUMPV
LABELV $80
ADDRLP4 16
CNSTI4 35000
ASGNI4
LABELV $81
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $77
line 65
;64:		else
;65:			return firstSpawn ? SPAWN_HEALTH : RESPAWN_HEALTH;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $83
ADDRLP4 20
CNSTI4 900
ASGNI4
ADDRGP4 $84
JUMPV
LABELV $83
ADDRLP4 20
CNSTI4 35000
ASGNI4
LABELV $84
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $85
line 68
;66:
;67:	case IT_POWERUP:
;68:		return firstSpawn ? SPAWN_POWERUP : RESPAWN_POWERUP;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $87
ADDRLP4 24
CNSTI4 45000
ASGNI4
ADDRGP4 $88
JUMPV
LABELV $87
ADDRLP4 24
CNSTI4 120000
ASGNI4
LABELV $88
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $89
line 77
;69:
;70:#ifdef MISSIONPACK
;71:	case IT_PERSISTANT_POWERUP:
;72:		return -1;
;73:		break;
;74:#endif
;75:
;76:	case IT_HOLDABLE:
;77:		return firstSpawn ? SPAWN_HOLDABLE : RESPAWN_HOLDABLE;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $91
ADDRLP4 28
CNSTI4 2500
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 28
CNSTI4 60000
ASGNI4
LABELV $92
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
line 79
;78:
;79:	default: break; //qlone - avoid compiler warnings
LABELV $58
line 82
;80:	}
;81:
;82:	return 0;
CNSTI4 0
RETI4
LABELV $54
endproc SpawnTime 32 0
export Pickup_Powerup
proc Pickup_Powerup 120 28
line 86
;83:} 
;84:
;85:
;86:int Pickup_Powerup( gentity_t *ent, gentity_t *other ) {
line 91
;87:	int			quantity;
;88:	int			i;
;89:	gclient_t	*client;
;90:
;91:	if ( !other->client->ps.powerups[ent->item->giTag] ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $96
line 93
;92:		// round timing to seconds to make multiple powerup timers count in sync
;93:		other->client->ps.powerups[ent->item->giTag] = level.time - ( level.time % 1000 );
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 94
;94:	}
LABELV $96
line 96
;95:
;96:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $100
line 97
;97:		quantity = ent->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 98
;98:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 99
;99:		quantity = ent->item->quantity;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 100
;100:	}
LABELV $101
line 102
;101:
;102:	other->client->ps.powerups[ent->item->giTag] += quantity * 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 105
;103:
;104:	// give any nearby players a "denied" anti-reward
;105:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $102
line 111
;106:		vec3_t		delta;
;107:		float		len;
;108:		vec3_t		forward;
;109:		trace_t		tr;
;110:
;111:		client = &level.clients[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 112
;112:		if ( client == other->client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $107
line 113
;113:			continue;
ADDRGP4 $103
JUMPV
LABELV $107
line 115
;114:		}
;115:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $109
line 116
;116:			continue;
ADDRGP4 $103
JUMPV
LABELV $109
line 118
;117:		}
;118:		if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $111
line 119
;119:			continue;
ADDRGP4 $103
JUMPV
LABELV $111
line 124
;120:		}
;121:
;122:		// if same team in team game, no sound
;123:		// cannot use OnSameTeam as it expects to g_entities, not clients
;124:		if ( g_gametype.integer >= GT_TEAM && other->client->sess.sessionTeam == client->sess.sessionTeam  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $113
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
NEI4 $113
line 125
;125:			continue;
ADDRGP4 $103
JUMPV
LABELV $113
line 129
;126:		}
;127:
;128://qlone - freezetag
;129:		if ( g_freezeTag.integer && is_spectator( other->client ) ) continue;
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $116
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $116
ADDRGP4 $103
JUMPV
LABELV $116
line 133
;130://qlone - freezetag
;131:
;132:		// if too far away, no sound
;133:		VectorSubtract( ent->s.pos.trBase, client->ps.origin, delta );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 104
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 104
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 134
;134:		len = VectorNormalize( delta );
ADDRLP4 16
ARGP4
ADDRLP4 112
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 112
INDIRF4
ASGNF4
line 135
;135:		if ( len > 192 ) {
ADDRLP4 40
INDIRF4
CNSTF4 1128267776
LEF4 $121
line 136
;136:			continue;
ADDRGP4 $103
JUMPV
LABELV $121
line 140
;137:		}
;138:
;139:		// if not facing, no sound
;140:		AngleVectors( client->ps.viewangles, forward, NULL, NULL );
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 28
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 141
;141:		if ( DotProduct( delta, forward ) < 0.4 ) {
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
CNSTF4 1053609165
GEF4 $123
line 142
;142:			continue;
ADDRGP4 $103
JUMPV
LABELV $123
line 146
;143:		}
;144:
;145:		// if not line of sight, no sound
;146:		trap_Trace( &tr, client->ps.origin, NULL, NULL, ent->s.pos.trBase, ENTITYNUM_NONE, CONTENTS_SOLID );
ADDRLP4 44
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 147
;147:		if ( tr.fraction != 1.0 ) {
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $129
line 148
;148:			continue;
ADDRGP4 $103
JUMPV
LABELV $129
line 152
;149:		}
;150:
;151:		// anti-reward
;152:		client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_DENIEDREWARD;
ADDRLP4 116
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 153
;153:	}
LABELV $103
line 105
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $105
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $102
line 155
;154:
;155:	return SpawnTime( ent, qfalse ); // return RESPAWN_POWERUP;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
LABELV $95
endproc Pickup_Powerup 120 28
export Pickup_Holdable
proc Pickup_Holdable 4 8
line 236
;156:}
;157:
;158:
;159://======================================================================
;160:
;161:#ifdef MISSIONPACK
;162:int Pickup_PersistantPowerup( gentity_t *ent, gentity_t *other ) {
;163:	int		clientNum;
;164:	char	userinfo[MAX_INFO_STRING];
;165:	float	handicap;
;166:	int		max;
;167:
;168:	other->client->ps.stats[STAT_PERSISTANT_POWERUP] = ent->item - bg_itemlist;
;169:	other->client->persistantPowerup = ent;
;170:
;171:	switch( ent->item->giTag ) {
;172:	case PW_GUARD:
;173:		clientNum = other->client->ps.clientNum;
;174:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;175:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;176:		if( handicap<=0.0f || handicap>100.0f) {
;177:			handicap = 100.0f;
;178:		}
;179:		max = (int)(2 *  handicap);
;180:
;181:		other->health = max;
;182:		other->client->ps.stats[STAT_HEALTH] = max;
;183:		other->client->ps.stats[STAT_MAX_HEALTH] = max;
;184:		other->client->ps.stats[STAT_ARMOR] = max;
;185:		other->client->pers.maxHealth = max;
;186:
;187:		break;
;188:
;189:	case PW_SCOUT:
;190:		clientNum = other->client->ps.clientNum;
;191:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;192:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;193:		if( handicap<=0.0f || handicap>100.0f) {
;194:			handicap = 100.0f;
;195:		}
;196:		other->client->pers.maxHealth = handicap;
;197:		other->client->ps.stats[STAT_ARMOR] = 0;
;198:		break;
;199:
;200:	case PW_DOUBLER:
;201:		clientNum = other->client->ps.clientNum;
;202:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;203:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;204:		if( handicap<=0.0f || handicap>100.0f) {
;205:			handicap = 100.0f;
;206:		}
;207:		other->client->pers.maxHealth = handicap;
;208:		break;
;209:	case PW_AMMOREGEN:
;210:		clientNum = other->client->ps.clientNum;
;211:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;212:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;213:		if( handicap<=0.0f || handicap>100.0f) {
;214:			handicap = 100.0f;
;215:		}
;216:		other->client->pers.maxHealth = handicap;
;217:		memset(other->client->ammoTimes, 0, sizeof(other->client->ammoTimes));
;218:		break;
;219:	default:
;220:		clientNum = other->client->ps.clientNum;
;221:		trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
;222:		handicap = atof( Info_ValueForKey( userinfo, "handicap" ) );
;223:		if( handicap<=0.0f || handicap>100.0f) {
;224:			handicap = 100.0f;
;225:		}
;226:		other->client->pers.maxHealth = handicap;
;227:		break;
;228:	}
;229:
;230:	return SpawnTime( ent, qfalse ); // return -1;
;231:}
;232:
;233://======================================================================
;234:#endif
;235:
;236:int Pickup_Holdable( gentity_t *ent, gentity_t *other ) {
line 238
;237:
;238:	other->client->ps.stats[STAT_HOLDABLE_ITEM] = ent->item - bg_itemlist;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 246
;239:
;240:#ifdef MISSIONPACK	
;241:	if( ent->item->giTag == HI_KAMIKAZE ) {
;242:		other->client->ps.eFlags |= EF_KAMIKAZE;
;243:	}
;244:#endif
;245:
;246:	return SpawnTime( ent, qfalse ); // return RESPAWN_HOLDABLE;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $132
endproc Pickup_Holdable 4 8
proc Add_Ammo 4 0
line 254
;247:}
;248:
;249:
;250://======================================================================
;251:
;252:
;253:static void Add_Ammo( gentity_t *ent, int weapon, int count )
;254:{
line 255
;255:	ent->client->ps.ammo[weapon] += count;
ADDRLP4 0
ADDRFP4 4
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
line 256
;256:	if ( ent->client->ps.ammo[weapon] > AMMO_HARD_LIMIT ) {
ADDRFP4 4
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
CNSTI4 200
LEI4 $134
line 257
;257:		ent->client->ps.ammo[weapon] = AMMO_HARD_LIMIT;
ADDRFP4 4
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
CNSTI4 200
ASGNI4
line 258
;258:	}
LABELV $134
line 259
;259:}
LABELV $133
endproc Add_Ammo 4 0
proc Pickup_Ammo 8 12
line 263
;260:
;261:
;262:static int Pickup_Ammo( gentity_t *ent, gentity_t *other )
;263:{
line 266
;264:	int		quantity;
;265:
;266:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $137
line 267
;267:		quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 268
;268:	} else {
ADDRGP4 $138
JUMPV
LABELV $137
line 269
;269:		quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 270
;270:	}
LABELV $138
line 272
;271:
;272:	Add_Ammo( other, ent->item->giTag, quantity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 274
;273:
;274:	return SpawnTime( ent, qfalse ); // return RESPAWN_AMMO;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $136
endproc Pickup_Ammo 8 12
proc Pickup_Weapon 12 12
line 280
;275:}
;276:
;277://======================================================================
;278:
;279:
;280:static int Pickup_Weapon( gentity_t *ent, gentity_t *other ) {
line 283
;281:	int		quantity;
;282:
;283:	if ( ent->count < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
GEI4 $140
line 284
;284:		quantity = 0; // None for you, sir!
ADDRLP4 0
CNSTI4 0
ASGNI4
line 285
;285:	} else {
ADDRGP4 $141
JUMPV
LABELV $140
line 286
;286:		if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $142
line 287
;287:			quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 288
;288:		} else {
ADDRGP4 $143
JUMPV
LABELV $142
line 289
;289:			quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 290
;290:		}
LABELV $143
line 293
;291:
;292:		// dropped items and teamplay weapons always have full ammo
;293:		if ( ! (ent->flags & FL_DROPPED_ITEM) && g_gametype.integer != GT_TEAM ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $144
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $144
line 296
;294:			// respawning rules
;295:			// drop the quantity if the already have over the minimum
;296:			if ( other->client->ps.ammo[ ent->item->giTag ] < quantity ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $147
line 297
;297:				quantity = quantity - other->client->ps.ammo[ ent->item->giTag ];
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 298
;298:			} else {
ADDRGP4 $148
JUMPV
LABELV $147
line 299
;299:				quantity = 1;		// only add a single shot
ADDRLP4 0
CNSTI4 1
ASGNI4
line 300
;300:			}
LABELV $148
line 301
;301:		}
LABELV $144
line 302
;302:	}
LABELV $141
line 305
;303:
;304:	// add the weapon
;305:	other->client->ps.stats[STAT_WEAPONS] |= ( 1 << ent->item->giTag );
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 307
;306:
;307:	Add_Ammo( other, ent->item->giTag, quantity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 309
;308:
;309:	if (ent->item->giTag == WP_GRAPPLING_HOOK)
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 10
NEI4 $149
line 310
;310:		other->client->ps.ammo[ent->item->giTag] = -1; // unlimited ammo
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 -1
ASGNI4
LABELV $149
line 318
;311:
;312:	// team deathmatch has slow weapon respawns
;313:	//if ( g_gametype.integer == GT_TEAM ) {
;314:	//	return g_weaponTeamRespawn.integer;
;315:	//} else {
;316:	//	return g_weaponRespawn.integer;
;317:	//}
;318:	return SpawnTime( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $139
endproc Pickup_Weapon 12 12
proc Pickup_Health 24 8
line 324
;319:}
;320:
;321:
;322://======================================================================
;323:
;324:static int Pickup_Health( gentity_t *ent, gentity_t *other ) {
line 335
;325:	int			max;
;326:	int			quantity;
;327:
;328:	// small and mega healths will go over the max
;329:#ifdef MISSIONPACK
;330:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;331:		max = other->client->ps.stats[STAT_MAX_HEALTH];
;332:	}
;333:	else
;334:#endif
;335:	if ( ent->item->quantity != 5 && ent->item->quantity != 100 ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 5
EQI4 $152
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
EQI4 $152
line 336
;336:		max = other->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 337
;337:	} else {
ADDRGP4 $153
JUMPV
LABELV $152
line 338
;338:		max = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 339
;339:	}
LABELV $153
line 341
;340:
;341:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $154
line 342
;342:		quantity = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 343
;343:	} else {
ADDRGP4 $155
JUMPV
LABELV $154
line 344
;344:		quantity = ent->item->quantity;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 345
;345:	}
LABELV $155
line 347
;346:
;347:	other->health += quantity;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 349
;348:
;349:	if (other->health > max ) {
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $156
line 350
;350:		other->health = max;
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 351
;351:	}
LABELV $156
line 352
;352:	other->client->ps.stats[STAT_HEALTH] = other->health;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 359
;353:
;354:	//if ( ent->item->quantity == 100 ) { // mega health respawns slow
;355:	//	return RESPAWN_MEGAHEALTH;
;356:	//} else {
;357:	//	return RESPAWN_HEALTH;
;358:	//}
;359:	return SpawnTime( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
LABELV $151
endproc Pickup_Health 24 8
export Pickup_Armor
proc Pickup_Armor 12 8
line 365
;360:}
;361:
;362:
;363://======================================================================
;364:
;365:int Pickup_Armor( gentity_t *ent, gentity_t *other ) {
line 382
;366:#ifdef MISSIONPACK
;367:	int		upperBound;
;368:
;369:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
;370:
;371:	if( other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;372:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH];
;373:	}
;374:	else {
;375:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
;376:	}
;377:
;378:	if ( other->client->ps.stats[STAT_ARMOR] > upperBound ) {
;379:		other->client->ps.stats[STAT_ARMOR] = upperBound;
;380:	}
;381:#else
;382:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 383
;383:	if ( other->client->ps.stats[STAT_ARMOR] > other->client->ps.stats[STAT_MAX_HEALTH] * 2 ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $159
line 384
;384:		other->client->ps.stats[STAT_ARMOR] = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 385
;385:	}
LABELV $159
line 388
;386:#endif
;387:
;388:	return SpawnTime( ent, qfalse ); // return RESPAWN_ARMOR;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $158
endproc Pickup_Armor 12 8
export RespawnItem
proc RespawnItem 20 12
line 398
;389:}
;390:
;391://======================================================================
;392:
;393:/*
;394:===============
;395:RespawnItem
;396:===============
;397:*/
;398:void RespawnItem( gentity_t *ent ) {
line 400
;399:	
;400:	if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $162
line 401
;401:		return;
ADDRGP4 $161
JUMPV
LABELV $162
line 404
;402:	
;403:	// randomly select from teamed entities
;404:	if (ent->team) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $164
line 409
;405:		gentity_t	*master;
;406:		int	count;
;407:		int choice;
;408:
;409:		if ( !ent->teammaster ) {
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $166
line 410
;410:			G_Error( "RespawnItem: bad teammaster");
ADDRGP4 $168
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 411
;411:		}
LABELV $166
line 412
;412:		master = ent->teammaster;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ASGNP4
line 414
;413:
;414:		for (count = 0, ent = master; ent; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $172
JUMPV
LABELV $169
line 415
;415:			;
LABELV $170
line 414
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $172
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $169
line 417
;416:
;417:		choice = rand() % count;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 419
;418:
;419:		for (count = 0, ent = master; ent && count < choice; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $176
JUMPV
LABELV $173
line 420
;420:			;
LABELV $174
line 419
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $176
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $177
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $173
LABELV $177
line 421
;421:	}
LABELV $164
line 423
;422:
;423:	if ( !ent )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $178
line 424
;424:		return;
ADDRGP4 $161
JUMPV
LABELV $178
line 426
;425:
;426:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 427
;427:	ent->s.eFlags &= ~EF_NODRAW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 428
;428:	ent->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 429
;429:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 431
;430:
;431:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $180
line 436
;432:		// play powerup spawn sound to all clients
;433:		gentity_t	*te;
;434:
;435:		// if the powerup respawn sound should Not be global
;436:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
EQF4 $182
line 437
;437:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 438
;438:		}
ADDRGP4 $183
JUMPV
LABELV $182
line 439
;439:		else {
line 440
;440:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 441
;441:		}
LABELV $183
line 442
;442:		te->s.eventParm = G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $184
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 443
;443:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 444
;444:	}
LABELV $180
line 464
;445:
;446:#ifdef MISSIONPACK
;447:	if ( ent->item->giType == IT_HOLDABLE && ent->item->giTag == HI_KAMIKAZE ) {
;448:		// play powerup spawn sound to all clients
;449:		gentity_t	*te;
;450:
;451:		// if the powerup respawn sound should Not be global
;452:		if (ent->speed) {
;453:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
;454:		}
;455:		else {
;456:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
;457:		}
;458:		te->s.eventParm = G_SoundIndex( "sound/items/kamikazerespawn.wav" );
;459:		te->r.svFlags |= SVF_BROADCAST;
;460:	}
;461:#endif
;462:
;463:	// play the normal respawn sound only to nearby clients
;464:	G_AddEvent( ent, EV_ITEM_RESPAWN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 40
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 466
;465:
;466:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 467
;467:}
LABELV $161
endproc RespawnItem 20 12
export Touch_Item
proc Touch_Item 52 12
line 475
;468:
;469:
;470:/*
;471:===============
;472:Touch_Item
;473:===============
;474:*/
;475:void Touch_Item (gentity_t *ent, gentity_t *other, trace_t *trace) {
line 479
;476:	int			respawn;
;477:	qboolean	predict;
;478:
;479:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $186
line 480
;480:		return;
ADDRGP4 $185
JUMPV
LABELV $186
line 481
;481:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 1
GEI4 $188
line 482
;482:		return;		// dead people can't pickup
ADDRGP4 $185
JUMPV
LABELV $188
line 484
;483://qlone - freezetag
;484:	if ( g_freezeTag.integer && other->freezeState )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $190
ADDRFP4 4
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $190
line 485
;485:		return;
ADDRGP4 $185
JUMPV
LABELV $190
line 489
;486://qlone - freezetag
;487:
;488:	// the same pickup rules are used for client side and server side
;489:	if ( !BG_CanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps ) ) {
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $193
line 490
;490:		return;
ADDRGP4 $185
JUMPV
LABELV $193
line 493
;491:	}
;492:
;493:	G_LogPrintf( "Item: %i %s\n", other->s.number, ent->item->classname );
ADDRGP4 $196
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 495
;494:
;495:	predict = other->client->pers.predictItemPickup;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 498
;496:
;497:	// call the item-specific pickup function
;498:	switch( ent->item->giType ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $185
ADDRLP4 12
INDIRI4
CNSTI4 8
GTI4 $185
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $209-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $209
address $200
address $201
address $202
address $203
address $204
address $208
address $185
address $207
code
LABELV $200
line 500
;499:	case IT_WEAPON:
;500:		respawn = Pickup_Weapon(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Pickup_Weapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 501
;501:		break;
ADDRGP4 $198
JUMPV
LABELV $201
line 503
;502:	case IT_AMMO:
;503:		respawn = Pickup_Ammo(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Pickup_Ammo
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 504
;504:		break;
ADDRGP4 $198
JUMPV
LABELV $202
line 506
;505:	case IT_ARMOR:
;506:		respawn = Pickup_Armor(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Pickup_Armor
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 507
;507:		break;
ADDRGP4 $198
JUMPV
LABELV $203
line 509
;508:	case IT_HEALTH:
;509:		respawn = Pickup_Health(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Pickup_Health
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
ASGNI4
line 510
;510:		break;
ADDRGP4 $198
JUMPV
LABELV $204
line 512
;511:	case IT_POWERUP:
;512:		respawn = Pickup_Powerup(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Pickup_Powerup
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 514
;513:		// allow prediction for some powerups
;514:		if ( ent->item->giTag >= PW_QUAD && ent->item->giTag <= PW_FLIGHT )
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
LTI4 $205
ADDRLP4 40
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
GTI4 $205
line 515
;515:			predict = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $205
line 517
;516:		else
;517:			predict = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 518
;518:		break;
ADDRGP4 $198
JUMPV
LABELV $207
line 525
;519:#ifdef MISSIONPACK
;520:	case IT_PERSISTANT_POWERUP:
;521:		respawn = Pickup_PersistantPowerup(ent, other);
;522:		break;
;523:#endif
;524:	case IT_TEAM:
;525:		respawn = Pickup_Team(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Pickup_Team
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 526
;526:		break;
ADDRGP4 $198
JUMPV
LABELV $208
line 528
;527:	case IT_HOLDABLE:
;528:		respawn = Pickup_Holdable(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Pickup_Holdable
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 48
INDIRI4
ASGNI4
line 529
;529:		break;
line 531
;530:	default:
;531:		return;
LABELV $198
line 534
;532:	}
;533:
;534:	if ( !respawn ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $211
line 535
;535:		return;
ADDRGP4 $185
JUMPV
LABELV $211
line 539
;536:	}
;537:
;538:	// play the normal pickup sound
;539:	if ( predict ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $213
line 540
;540:		G_AddPredictableEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddPredictableEvent
CALLV
pop
line 541
;541:	} else {
ADDRGP4 $214
JUMPV
LABELV $213
line 542
;542:		G_AddEvent( other, EV_ITEM_PICKUP, ent->s.modelindex );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 543
;543:	}
LABELV $214
line 546
;544:
;545:	// powerup pickups are global broadcasts
;546:	if ( ent->item->giType == IT_POWERUP || ent->item->giType == IT_TEAM) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $217
ADDRLP4 20
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $215
LABELV $217
line 548
;547:		// if we want the global sound to play
;548:		if (!ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $218
line 551
;549:			gentity_t	*te;
;550:
;551:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 552
;552:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 553
;553:			te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 554
;554:		} else {
ADDRGP4 $219
JUMPV
LABELV $218
line 557
;555:			gentity_t	*te;
;556:
;557:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 558
;558:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 560
;559:			// only send this temp entity to a single client
;560:			te->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 561
;561:			te->r.singleClient = other->s.number;
ADDRLP4 24
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 562
;562:		}
LABELV $219
line 563
;563:	}
LABELV $215
line 566
;564:
;565:	// fire item targets
;566:	G_UseTargets (ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 569
;567:
;568:	// wait of -1 will not respawn
;569:	if ( ent->wait == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $220
line 570
;570:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 571
;571:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 572
;572:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 573
;573:		ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 574
;574:		return;
ADDRGP4 $185
JUMPV
LABELV $220
line 578
;575:	}
;576:
;577:	// non zero wait overrides respawn time
;578:	if ( ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $222
line 579
;579:		respawn = ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 580
;580:		respawn *= 1000;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1000
MULI4
ASGNI4
line 581
;581:	}
LABELV $222
line 584
;582:
;583:	// random can be used to vary the respawn time
;584:	if ( ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $224
line 585
;585:		respawn += (crandom() * ent->random) * 1000;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 24
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
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
CNSTF4 1148846080
MULF4
ADDF4
CVFI4 4
ASGNI4
line 586
;586:		if ( respawn < 1000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1000
GEI4 $226
line 587
;587:			respawn = 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
line 588
;588:		}
LABELV $226
line 589
;589:	}
LABELV $224
line 592
;590:
;591:	// dropped items will not respawn
;592:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $228
line 593
;593:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 594
;594:	}
LABELV $228
line 599
;595:
;596:	// picked up items still stay around, they just don't
;597:	// draw anything.  This allows respawnable items
;598:	// to be placed on movers.
;599:	ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 600
;600:	ent->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 601
;601:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 607
;602:
;603:	// ZOID
;604:	// A negative respawn times means to never respawn this item (but don't 
;605:	// delete it).  This is used by items that are respawned by third party 
;606:	// events such as ctf flags
;607:	if ( respawn <= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $230
line 608
;608:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 609
;609:		ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTP4 0
ASGNP4
line 610
;610:	} else {
ADDRGP4 $231
JUMPV
LABELV $230
line 611
;611:		ent->nextthink = level.time + respawn;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 613
;612://qlone - freezetag
;613:		if ( g_freezeTag.integer && ent->item->giType == IT_WEAPON && g_dmflags.integer & 256 && !ent->freeAfterEvent ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $233
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $233
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $233
ADDRLP4 32
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
NEI4 $233
line 614
;614:			ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 615
;615:		}
LABELV $233
line 617
;616://qlone - freezetag
;617:		ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 618
;618:	}
LABELV $231
line 620
;619:
;620:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 621
;621:}
LABELV $185
endproc Touch_Item 52 12
export LaunchItem
proc LaunchItem 12 8
line 633
;622:
;623:
;624://======================================================================
;625:
;626:/*
;627:================
;628:LaunchItem
;629:
;630:Spawns an item and tosses it forward
;631:================
;632:*/
;633:gentity_t *LaunchItem( gitem_t *item, vec3_t origin, vec3_t velocity ) {
line 636
;634:	gentity_t	*dropped;
;635:
;636:	dropped = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 638
;637:
;638:	dropped->s.eType = ET_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 639
;639:	dropped->s.modelindex = item - bg_itemlist;	// store item number in modelindex
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 640
;640:	dropped->s.modelindex2 = 1; // This is non-zero is it's a dropped item
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 1
ASGNI4
line 643
;641:
;642:	// item scale-down
;643:	dropped->s.time = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 645
;644:
;645:	dropped->classname = item->classname;
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 646
;646:	dropped->item = item;
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 647
;647:	VectorSet (dropped->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3245342720
ASGNF4
line 648
;648:	VectorSet (dropped->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1097859072
ASGNF4
line 649
;649:	dropped->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 651
;650:
;651:	dropped->touch = Touch_Item;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 653
;652:
;653:	G_SetOrigin( dropped, origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 654
;654:	dropped->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 655
;655:	dropped->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 656
;656:	VectorCopy( velocity, dropped->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 658
;657:
;658:	dropped->s.eFlags |= EF_BOUNCE_HALF;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 662
;659:#ifdef MISSIONPACK
;660:	if ((g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF)			&& item->giType == IT_TEAM) { // Special case for CTF flags
;661:#else
;662:	if (g_gametype.integer == GT_CTF && item->giType == IT_TEAM) { // Special case for CTF flags
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $241
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $241
line 664
;663:#endif
;664:		dropped->think = Team_DroppedFlagThink;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Team_DroppedFlagThink
ASGNP4
line 665
;665:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 666
;666:		Team_CheckDroppedItem( dropped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Team_CheckDroppedItem
CALLV
pop
line 667
;667:	} else { // auto-remove after 30 seconds
ADDRGP4 $242
JUMPV
LABELV $241
line 668
;668:		dropped->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 669
;669:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 670
;670:	}
LABELV $242
line 672
;671:
;672:	dropped->flags = FL_DROPPED_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 4096
ASGNI4
line 674
;673:
;674:	trap_LinkEntity (dropped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 676
;675:
;676:	return dropped;
ADDRLP4 0
INDIRP4
RETP4
LABELV $238
endproc LaunchItem 12 8
export Drop_Item
proc Drop_Item 32 16
line 686
;677:}
;678:
;679:/*
;680:================
;681:Drop_Item
;682:
;683:Spawns an item and tosses it forward
;684:================
;685:*/
;686:gentity_t *Drop_Item( gentity_t *ent, gitem_t *item, float angle ) {
line 690
;687:	vec3_t	velocity;
;688:	vec3_t	angles;
;689:
;690:	VectorCopy( ent->s.apos.trBase, angles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 691
;691:	angles[YAW] += angle;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 692
;692:	angles[PITCH] = 0;	// always forward
ADDRLP4 12
CNSTF4 0
ASGNF4
line 694
;693:
;694:	AngleVectors( angles, velocity, NULL, NULL );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 695
;695:	VectorScale( velocity, 150, velocity );
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1125515264
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1125515264
MULF4
ASGNF4
line 696
;696:	velocity[2] += 200 + crandom() * 50;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1120403456
MULF4
CNSTF4 1128792064
ADDF4
ADDF4
ASGNF4
line 698
;697:	
;698:	return LaunchItem( item, ent->s.pos.trBase, velocity );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ADDRGP4 LaunchItem
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
RETP4
LABELV $246
endproc Drop_Item 32 16
export Use_Item
proc Use_Item 0 4
line 709
;699:}
;700:
;701:
;702:/*
;703:================
;704:Use_Item
;705:
;706:Respawn the item
;707:================
;708:*/
;709:void Use_Item( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 710
;710:	RespawnItem( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 711
;711:}
LABELV $253
endproc Use_Item 0 4
export FinishSpawningItem
proc FinishSpawningItem 84 28
line 723
;712:
;713://======================================================================
;714:
;715:/*
;716:================
;717:FinishSpawningItem
;718:
;719:Traces down to find where an item should rest, instead of letting them
;720:free fall from their spawn points
;721:================
;722:*/
;723:void FinishSpawningItem( gentity_t *ent ) {
line 727
;724:	trace_t		tr;
;725:	vec3_t		dest;
;726:
;727:	VectorSet( ent->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3245342720
ASGNF4
line 728
;728:	VectorSet( ent->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS );
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1097859072
ASGNF4
line 730
;729:
;730:	ent->s.eType = ET_ITEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 731
;731:	ent->s.modelindex = ent->item - bg_itemlist;		// store item number in modelindex
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 732
;732:	ent->s.modelindex2 = 0; // zero indicates this isn't a dropped item
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 0
ASGNI4
line 735
;733:
;734://qlone - freezetag
;735:	if ( g_freezeTag.integer && g_dmflags.integer & 256 ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $255
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $255
line 736
;736:		ent->s.modelindex2 = 255;
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 255
ASGNI4
line 737
;737:	}
LABELV $255
line 740
;738://qlone - freezetag
;739:
;740:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 741
;741:	ent->touch = Touch_Item;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 743
;742:	// using an item causes it to respawn
;743:	ent->use = Use_Item;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Item
ASGNP4
line 746
;744:
;745:	// for pickup prediction
;746:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $259
line 747
;747:		ent->s.time2 = ent->count;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 748
;748:	} else if ( ent->item ) {
ADDRGP4 $260
JUMPV
LABELV $259
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $261
line 749
;749:		ent->s.time2 = ent->item->quantity;	
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 750
;750:	}
LABELV $261
LABELV $260
line 752
;751:
;752:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $263
line 754
;753:		// suspended
;754:		G_SetOrigin( ent, ent->s.origin );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 755
;755:	} else {
ADDRGP4 $264
JUMPV
LABELV $263
line 757
;756:		// drop to floor
;757:		VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 72
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 758
;758:		trap_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 759
;759:		if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $267
line 760
;760:			G_Printf ("FinishSpawningItem: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $270
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 761
;761:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 762
;762:			return;
ADDRGP4 $254
JUMPV
LABELV $267
line 766
;763:		}
;764:
;765:		// allow to ride movers
;766:		ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 768
;767:
;768:		G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 769
;769:	}
LABELV $264
line 772
;770:
;771:	// team slaves and targeted items aren't present at start
;772:	if ( ( ent->flags & FL_TEAMSLAVE ) || ent->targetname ) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $275
ADDRLP4 72
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $273
LABELV $275
line 773
;773:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 774
;774:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 775
;775:		return;
ADDRGP4 $254
JUMPV
LABELV $273
line 778
;776:	}
;777:
;778:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 779
;779:}
LABELV $254
endproc FinishSpawningItem 84 28
export Registered
proc Registered 8 0
line 784
;780:
;781:
;782:qboolean	itemRegistered[MAX_ITEMS];
;783://qlone - freezetag
;784:qboolean Registered( gitem_t *item ) {
line 785
;785:	return ( item && itemRegistered[ item - bg_itemlist ] );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 4
INDIRU4
CNSTU4 0
EQU4 $278
ADDRLP4 4
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
EQI4 $278
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $279
JUMPV
LABELV $278
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $279
ADDRLP4 0
INDIRI4
RETI4
LABELV $276
endproc Registered 8 0
export G_CheckTeamItems
proc G_CheckTeamItems 20 4
line 795
;786:}
;787://qlone - freezetag
;788:
;789:
;790:/*
;791:==================
;792:G_CheckTeamItems
;793:==================
;794:*/
;795:void G_CheckTeamItems( void ) {
line 798
;796:
;797:	// Set up team stuff
;798:	Team_InitGame();
ADDRGP4 Team_InitGame
CALLV
pop
line 800
;799:
;800:	if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $281
line 804
;801:		gitem_t	*item;
;802:
;803:		// check for the two flags
;804:		item = BG_FindItem( "Red Flag" );
ADDRGP4 $284
ARGP4
ADDRLP4 4
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 805
;805:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
CNSTU4 0
EQU4 $287
ADDRLP4 8
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $285
LABELV $287
line 806
;806:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map\n" );
ADDRGP4 $288
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 807
;807:		}
LABELV $285
line 808
;808:		item = BG_FindItem( "Blue Flag" );
ADDRGP4 $289
ARGP4
ADDRLP4 12
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 809
;809:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $292
ADDRLP4 16
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $290
LABELV $292
line 810
;810:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map\n" );
ADDRGP4 $293
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 811
;811:		}
LABELV $290
line 812
;812:	}
LABELV $281
line 872
;813:#ifdef MISSIONPACK
;814:	if( g_gametype.integer == GT_1FCTF ) {
;815:		gitem_t	*item;
;816:
;817:		// check for all three flags
;818:		item = BG_FindItem( "Red Flag" );
;819:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;820:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map\n" );
;821:		}
;822:		item = BG_FindItem( "Blue Flag" );
;823:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;824:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map\n" );
;825:		}
;826:		item = BG_FindItem( "Neutral Flag" );
;827:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
;828:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_neutralflag in map\n" );
;829:		}
;830:	}
;831:
;832:	if( g_gametype.integer == GT_OBELISK ) {
;833:		gentity_t	*ent;
;834:
;835:		// check for the two obelisks
;836:		ent = NULL;
;837:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;838:		if( !ent ) {
;839:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map\n" );
;840:		}
;841:
;842:		ent = NULL;
;843:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;844:		if( !ent ) {
;845:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map\n" );
;846:		}
;847:	}
;848:
;849:	if( g_gametype.integer == GT_HARVESTER ) {
;850:		gentity_t	*ent;
;851:
;852:		// check for all three obelisks
;853:		ent = NULL;
;854:		ent = G_Find( ent, FOFS(classname), "team_redobelisk" );
;855:		if( !ent ) {
;856:			G_Printf( S_COLOR_YELLOW "WARNING: No team_redobelisk in map\n" );
;857:		}
;858:
;859:		ent = NULL;
;860:		ent = G_Find( ent, FOFS(classname), "team_blueobelisk" );
;861:		if( !ent ) {
;862:			G_Printf( S_COLOR_YELLOW "WARNING: No team_blueobelisk in map\n" );
;863:		}
;864:
;865:		ent = NULL;
;866:		ent = G_Find( ent, FOFS(classname), "team_neutralobelisk" );
;867:		if( !ent ) {
;868:			G_Printf( S_COLOR_YELLOW "WARNING: No team_neutralobelisk in map\n" );
;869:		}
;870:	}
;871:#endif
;872:}
LABELV $280
endproc G_CheckTeamItems 20 4
export ClearRegisteredItems
proc ClearRegisteredItems 8 12
line 879
;873:
;874:/*
;875:==============
;876:ClearRegisteredItems
;877:==============
;878:*/
;879:void ClearRegisteredItems( void ) {
line 880
;880:	memset( itemRegistered, 0, sizeof( itemRegistered ) );
ADDRGP4 itemRegistered
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 883
;881:
;882:	// players always start with the base weapon
;883:	RegisterItem( BG_FindItemForWeapon( WP_MACHINEGUN ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 884
;884:	RegisterItem( BG_FindItemForWeapon( WP_GAUNTLET ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 892
;885:#ifdef MISSIONPACK
;886:	if( g_gametype.integer == GT_HARVESTER ) {
;887:		RegisterItem( BG_FindItem( "Red Cube" ) );
;888:		RegisterItem( BG_FindItem( "Blue Cube" ) );
;889:	}
;890:#endif
;891://qlone - custom weapons
;892:	G_RegisterWeapon();
ADDRGP4 G_RegisterWeapon
CALLV
pop
line 893
;893:	if ( g_freezeTag.integer ) FT_ResetFlags(); //qlone - freezetag
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $295
ADDRGP4 FT_ResetFlags
CALLV
pop
LABELV $295
line 895
;894://qlone - custom weapons
;895:}
LABELV $294
endproc ClearRegisteredItems 8 12
export RegisterItem
proc RegisterItem 0 4
line 904
;896:
;897:/*
;898:===============
;899:RegisterItem
;900:
;901:The item will be added to the precache list
;902:===============
;903:*/
;904:void RegisterItem( gitem_t *item ) {
line 905
;905:	if ( !item ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $299
line 906
;906:		G_Error( "RegisterItem: NULL" );
ADDRGP4 $301
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 907
;907:	}
LABELV $299
line 908
;908:	itemRegistered[ item - bg_itemlist ] = qtrue;
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
CNSTI4 1
ASGNI4
line 909
;909:}
LABELV $298
endproc RegisterItem 0 4
export SaveRegisteredItems
proc SaveRegisteredItems 268 8
line 920
;910:
;911:
;912:/*
;913:===============
;914:SaveRegisteredItems
;915:
;916:Write the needed items to a config string
;917:so the client will know which ones to precache
;918:===============
;919:*/
;920:void SaveRegisteredItems( void ) {
line 925
;921:	char	string[MAX_ITEMS+1];
;922:	int		i;
;923:	int		count;
;924:
;925:	count = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 926
;926:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $306
JUMPV
LABELV $303
line 927
;927:		if ( itemRegistered[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
EQI4 $307
line 928
;928:			count++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 929
;929:			string[i] = '1';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 49
ASGNI1
line 930
;930:		} else {
ADDRGP4 $308
JUMPV
LABELV $307
line 931
;931:			string[i] = '0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 48
ASGNI1
line 932
;932:		}
LABELV $308
line 933
;933:	}
LABELV $304
line 926
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $306
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $303
line 934
;934:	string[ bg_numItems ] = 0;
ADDRGP4 bg_numItems
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 936
;935:
;936:	G_Printf( "%i items registered\n", count );
ADDRGP4 $309
ARGP4
ADDRLP4 264
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 937
;937:	trap_SetConfigstring(CS_ITEMS, string);
CNSTI4 27
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 938
;938:}
LABELV $302
endproc SaveRegisteredItems 268 8
export G_ItemDisabled
proc G_ItemDisabled 132 16
line 945
;939:
;940:/*
;941:============
;942:G_ItemDisabled
;943:============
;944:*/
;945:int G_ItemDisabled( gitem_t *item ) {
line 949
;946:
;947:	char name[128];
;948:
;949:	Com_sprintf(name, sizeof(name), "disable_%s", item->classname);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $311
ARGP4
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 950
;950:	return trap_Cvar_VariableIntegerValue( name );
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
RETI4
LABELV $310
endproc G_ItemDisabled 132 16
export G_SpawnItem
proc G_SpawnItem 4 12
line 963
;951:}
;952:
;953:/*
;954:============
;955:G_SpawnItem
;956:
;957:Sets the clipping size and plants the object on the floor.
;958:
;959:Items can't be immediately dropped to floor, because they might
;960:be on an entity that hasn't spawned yet.
;961:============
;962:*/
;963:void G_SpawnItem( gentity_t *ent, gitem_t *item ) {
line 965
;964:
;965:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $313
ARGP4
ADDRGP4 $314
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 966
;966:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $315
ARGP4
ADDRGP4 $314
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 968
;967:
;968:	RegisterItem( item );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 970
;969:
;970:	if ( G_ItemDisabled( item ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_ItemDisabled
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $316
line 971
;971:		ent->tag = TAG_DONTSPAWN;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 1
ASGNI4
line 972
;972:		return;
ADDRGP4 $312
JUMPV
LABELV $316
line 975
;973:	}
;974:
;975:	ent->item = item;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 978
;976:	// some movers spawn on the second frame, so delay item
;977:	// spawns until the third frame so they can ride trains
;978:	ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 979
;979:	ent->think = FinishSpawningItem;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 FinishSpawningItem
ASGNP4
line 981
;980:
;981:	ent->physicsBounce = 0.50;		// items are bouncy
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 1056964608
ASGNF4
line 983
;982:
;983:	if ( item->giType == IT_POWERUP ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $319
line 984
;984:		G_SoundIndex( "sound/items/poweruprespawn.wav" );
ADDRGP4 $184
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 985
;985:		G_SpawnFloat( "noglobalsound", "0", &ent->speed);
ADDRGP4 $321
ARGP4
ADDRGP4 $314
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 986
;986:	}
LABELV $319
line 993
;987:
;988:#ifdef MISSIONPACK
;989:	if ( item->giType == IT_PERSISTANT_POWERUP ) {
;990:		ent->s.generic1 = ent->spawnflags;
;991:	}
;992:#endif
;993:}
LABELV $312
endproc G_SpawnItem 4 12
export G_BounceItem
proc G_BounceItem 52 12
line 1002
;994:
;995:
;996:/*
;997:================
;998:G_BounceItem
;999:
;1000:================
;1001:*/
;1002:void G_BounceItem( gentity_t *ent, trace_t *trace ) {
line 1008
;1003:	vec3_t	velocity;
;1004:	float	dot;
;1005:	int		hitTime;
;1006:
;1007:	// reflect the velocity on the trace plane
;1008:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1009
;1009:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 1010
;1010:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1011
;1011:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
line 1014
;1012:
;1013:	// cut the velocity to keep from bouncing forever
;1014:	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
line 1017
;1015:
;1016:	// check for stop
;1017:	if ( trace->plane.normal[2] > 0 && ent->s.pos.trDelta[2] < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $330
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $330
line 1018
;1018:		trace->endpos[2] += 1.0;	// make sure it is off ground
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1019
;1019:		SnapVector( trace->endpos );
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1020
;1020:		G_SetOrigin( ent, trace->endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1021
;1021:		ent->s.groundEntityNum = trace->entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 1023
;1022://qlone - freezetag
;1023:		if ( g_freezeTag.integer && ent->pain_debounce_time < level.time - 700 ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $322
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
SUBI4
GEI4 $322
line 1024
;1024:			ent->pain_debounce_time = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1025
;1025:			G_AddEvent( ent, EV_FALL_SHORT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1026
;1026:		}
line 1028
;1027://qlone - freezetag
;1028:		return;
ADDRGP4 $322
JUMPV
LABELV $330
line 1031
;1029:	}
;1030:
;1031:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1032
;1032:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1033
;1033:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1034
;1034:}
LABELV $322
endproc G_BounceItem 52 12
export G_RunItem
proc G_RunItem 100 28
line 1043
;1035:
;1036:
;1037:/*
;1038:================
;1039:G_RunItem
;1040:
;1041:================
;1042:*/
;1043:void G_RunItem( gentity_t *ent ) {
line 1050
;1044:	vec3_t		origin;
;1045:	trace_t		tr;
;1046:	int			contents;
;1047:	int			mask;
;1048:
;1049:	// if its groundentity has been set to ENTITYNUM_NONE, it may have been pushed off an edge
;1050:	if ( ent->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $339
line 1051
;1051:		if ( ent->s.pos.trType != TR_GRAVITY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $341
line 1052
;1052:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1053
;1053:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1054
;1054:		}
LABELV $341
line 1055
;1055:	}
LABELV $339
line 1057
;1056:
;1057:	if ( ent->s.pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $344
line 1059
;1058:		// check think function
;1059:		G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1060
;1060:		return;
ADDRGP4 $338
JUMPV
LABELV $344
line 1064
;1061:	}
;1062:
;1063:	// get current position
;1064:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1067
;1065:
;1066:	// trace a line from the previous position to the current position
;1067:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
CNSTI4 0
EQI4 $347
line 1068
;1068:		mask = ent->clipmask;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ASGNI4
line 1069
;1069:	} else {
ADDRGP4 $348
JUMPV
LABELV $347
line 1070
;1070:		mask = MASK_PLAYERSOLID & ~CONTENTS_BODY;//MASK_SOLID;
ADDRLP4 72
CNSTI4 65537
ASGNI4
line 1071
;1071:	}
LABELV $348
line 1073
;1072://qlone - freezetag
;1073:        if ( g_freezeTag.integer && is_body_freeze( ent ) )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $349
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 is_body_freeze
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $349
line 1074
;1074:                trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 80
INDIRP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
ADDRGP4 $350
JUMPV
LABELV $349
line 1077
;1075:        else
;1076://qlone - freezetag
;1077:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, 
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
LABELV $350
line 1080
;1078:		ent->r.ownerNum, mask );
;1079:
;1080:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1082
;1081:
;1082:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $353
line 1083
;1083:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1084
;1084:	}
LABELV $353
line 1086
;1085:
;1086:	trap_LinkEntity( ent );	// FIXME: avoid this for stationary?
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1089
;1087:
;1088:	// check think function
;1089:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1091
;1090:
;1091:	if ( tr.fraction == 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $357
line 1092
;1092:		return;
ADDRGP4 $338
JUMPV
LABELV $357
line 1096
;1093:	}
;1094:
;1095:	// if it is in a nodrop volume, remove it
;1096:	contents = trap_PointContents( ent->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 88
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 88
INDIRI4
ASGNI4
line 1097
;1097:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $360
line 1098
;1098:		if (ent->item && ent->item->giType == IT_TEAM) {
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $362
ADDRLP4 92
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $362
line 1099
;1099:			Team_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_FreeEntity
CALLV
pop
line 1100
;1100:		} else {
ADDRGP4 $338
JUMPV
LABELV $362
line 1102
;1101://qlone - freezetag
;1102:			if ( g_freezeTag.integer && is_body( ent ) ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $364
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 is_body
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $364
line 1103
;1103:				if ( level.time - ent->timestamp > 10000 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
SUBI4
CNSTI4 10000
LEI4 $338
line 1104
;1104:					Body_free( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Body_free
CALLV
pop
line 1105
;1105:				}
line 1106
;1106:				return;
ADDRGP4 $338
JUMPV
LABELV $364
line 1109
;1107:			}
;1108://qlone - freezetag
;1109:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1110
;1110:		}
line 1111
;1111:		return;
ADDRGP4 $338
JUMPV
LABELV $360
line 1114
;1112:	}
;1113:
;1114:	G_BounceItem( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceItem
CALLV
pop
line 1115
;1115:}
LABELV $338
endproc G_RunItem 100 28
bss
export itemRegistered
align 4
LABELV itemRegistered
skip 1024
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
import ArmorIndex
import Think_Weapon
import SetRespawn
import PrecacheItem
import UseHoldableItem
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
LABELV $321
byte 1 110
byte 1 111
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $315
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $314
byte 1 48
byte 1 0
align 1
LABELV $313
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $311
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $309
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $301
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $293
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
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
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $289
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $288
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
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
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $284
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $270
byte 1 70
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $196
byte 1 73
byte 1 116
byte 1 101
byte 1 109
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
LABELV $184
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $168
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
