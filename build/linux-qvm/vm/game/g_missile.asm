export G_BounceMissile
code
proc G_BounceMissile 40 12
file "../../../../code/game/g_missile.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#define	MISSILE_PRESTEP_TIME	50
;6:
;7:/*
;8:================
;9:G_BounceMissile
;10:
;11:================
;12:*/
;13:void G_BounceMissile( gentity_t *ent, trace_t *trace ) {
line 19
;14:	vec3_t	velocity;
;15:	float	dot;
;16:	int		hitTime;
;17:
;18:	// reflect the velocity on the trace plane
;19:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
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
line 20
;20:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
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
line 21
;21:	dot = DotProduct( velocity, trace->plane.normal );
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
line 22
;22:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
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
line 24
;23:
;24:	if ( ent->s.eFlags & EF_BOUNCE_HALF ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $62
line 25
;25:		VectorScale( ent->s.pos.trDelta, 0.65, ent->s.pos.trDelta );
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
CNSTF4 1059481190
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
CNSTF4 1059481190
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
CNSTF4 1059481190
MULF4
ASGNF4
line 27
;26:		// check for stop
;27:		if ( trace->plane.normal[2] > 0.2 && VectorLength( ent->s.pos.trDelta ) < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1045220557
LEF4 $64
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1109393408
GEF4 $64
line 28
;28:			G_SetOrigin( ent, trace->endpos );
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
line 29
;29:			ent->s.time = level.time / 4;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 30
;30:			return;
ADDRGP4 $54
JUMPV
LABELV $64
line 32
;31:		}
;32:	}
LABELV $62
line 34
;33:
;34:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 24
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
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 28
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
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 32
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
line 35
;35:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 36
;36:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 37
;37:}
LABELV $54
endproc G_BounceMissile 40 12
export G_ExplodeMissile
proc G_ExplodeMissile 44 24
line 47
;38:
;39:
;40:/*
;41:================
;42:G_ExplodeMissile
;43:
;44:Explode a missile without an impact
;45:================
;46:*/
;47:void G_ExplodeMissile( gentity_t *ent ) {
line 51
;48:	vec3_t		dir;
;49:	vec3_t		origin;
;50:
;51:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 52
;52:	SnapVector( origin );
ADDRLP4 0
ADDRLP4 0
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 53
;53:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 56
;54:
;55:	// we don't have a valid direction, so just point straight up
;56:	dir[0] = dir[1] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 57
;57:	dir[2] = 1;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 59
;58:
;59:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 60
;60:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 62
;61:
;62:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 65
;63:
;64:	// splash damage
;65:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $76
line 66
;66:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, ent
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $78
line 67
;67:			, ent->splashMethodOfDeath ) ) {
line 68
;68:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 724
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
line 69
;69:		}
LABELV $78
line 70
;70:	}
LABELV $76
line 72
;71:
;72:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 73
;73:}
LABELV $68
endproc G_ExplodeMissile 44 24
export G_MissileImpact
proc G_MissileImpact 52 32
line 253
;74:
;75:
;76:#ifdef MISSIONPACK
;77:/*
;78:================
;79:ProximityMine_Explode
;80:================
;81:*/
;82:static void ProximityMine_Explode( gentity_t *mine ) {
;83:	G_ExplodeMissile( mine );
;84:	// if the prox mine has a trigger free it
;85:	if (mine->activator) {
;86:		G_FreeEntity(mine->activator);
;87:		mine->activator = NULL;
;88:	}
;89:}
;90:
;91:/*
;92:================
;93:ProximityMine_Die
;94:================
;95:*/
;96:static void ProximityMine_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
;97:	ent->think = ProximityMine_Explode;
;98:	ent->nextthink = level.time + 1;
;99:}
;100:
;101:/*
;102:================
;103:ProximityMine_Trigger
;104:================
;105:*/
;106:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace ) {
;107:	vec3_t		v;
;108:	gentity_t	*mine;
;109:
;110:	if( !other->client ) {
;111:		return;
;112:	}
;113:
;114:	// trigger is a cube, do a distance test now to act as if it's a sphere
;115:	VectorSubtract( trigger->s.pos.trBase, other->s.pos.trBase, v );
;116:	if( VectorLength( v ) > trigger->parent->splashRadius ) {
;117:		return;
;118:	}
;119:
;120:
;121:	if ( g_gametype.integer >= GT_TEAM ) {
;122:		// don't trigger same team mines
;123:		if (trigger->parent->s.generic1 == other->client->sess.sessionTeam) {
;124:			return;
;125:		}
;126:	}
;127:
;128:	// ok, now check for ability to damage so we don't get triggered thru walls, closed doors, etc...
;129:	if( !CanDamage( other, trigger->s.pos.trBase ) ) {
;130:		return;
;131:	}
;132:
;133:	// trigger the mine!
;134:	mine = trigger->parent;
;135:	mine->s.loopSound = 0;
;136:	G_AddEvent( mine, EV_PROXIMITY_MINE_TRIGGER, 0 );
;137:	mine->nextthink = level.time + 500;
;138:
;139:	G_FreeEntity( trigger );
;140:}
;141:
;142:/*
;143:================
;144:ProximityMine_Activate
;145:================
;146:*/
;147:static void ProximityMine_Activate( gentity_t *ent ) {
;148:	gentity_t	*trigger;
;149:	float		r;
;150:
;151:	ent->think = ProximityMine_Explode;
;152:	ent->nextthink = level.time + g_proxMineTimeout.integer;
;153:
;154:	ent->takedamage = qtrue;
;155:	ent->health = 1;
;156:	ent->die = ProximityMine_Die;
;157:
;158:	ent->s.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav" );
;159:
;160:	// build the proximity trigger
;161:	trigger = G_Spawn ();
;162:
;163:	trigger->classname = "proxmine_trigger";
;164:
;165:	r = ent->splashRadius;
;166:	VectorSet( trigger->r.mins, -r, -r, -r );
;167:	VectorSet( trigger->r.maxs, r, r, r );
;168:
;169:	G_SetOrigin( trigger, ent->s.pos.trBase );
;170:
;171:	trigger->parent = ent;
;172:	trigger->r.contents = CONTENTS_TRIGGER;
;173:	trigger->touch = ProximityMine_Trigger;
;174:
;175:	trap_LinkEntity (trigger);
;176:
;177:	// set pointer to trigger so the entity can be freed when the mine explodes
;178:	ent->activator = trigger;
;179:}
;180:
;181:/*
;182:================
;183:ProximityMine_ExplodeOnPlayer
;184:================
;185:*/
;186:static void ProximityMine_ExplodeOnPlayer( gentity_t *mine ) {
;187:	gentity_t	*player;
;188:
;189:	player = mine->enemy;
;190:	player->client->ps.eFlags &= ~EF_TICKING;
;191:
;192:	if ( player->client->invulnerabilityTime > level.time ) {
;193:		G_Damage( player, mine->parent, mine->parent, vec3_origin, mine->s.origin, 1000, DAMAGE_NO_KNOCKBACK, MOD_JUICED );
;194:		player->client->invulnerabilityTime = 0;
;195:		G_TempEntity( player->client->ps.origin, EV_JUICED );
;196:	}
;197:	else {
;198:		G_SetOrigin( mine, player->s.pos.trBase );
;199:		// make sure the explosion gets to the client
;200:		mine->r.svFlags &= ~SVF_NOCLIENT;
;201:		mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
;202:		G_ExplodeMissile( mine );
;203:	}
;204:}
;205:
;206:/*
;207:================
;208:ProximityMine_Player
;209:================
;210:*/
;211:static void ProximityMine_Player( gentity_t *mine, gentity_t *player ) {
;212:	if( mine->s.eFlags & EF_NODRAW ) {
;213:		return;
;214:	}
;215:
;216:	G_AddEvent( mine, EV_PROXIMITY_MINE_STICK, 0 );
;217:
;218:	if( player->s.eFlags & EF_TICKING ) {
;219:		player->activator->splashDamage += mine->splashDamage;
;220:		player->activator->splashRadius *= 1.50;
;221:		mine->think = G_FreeEntity;
;222:		mine->nextthink = level.time;
;223:		return;
;224:	}
;225:
;226:	player->client->ps.eFlags |= EF_TICKING;
;227:	player->activator = mine;
;228:
;229:	mine->s.eFlags |= EF_NODRAW;
;230:	mine->r.svFlags |= SVF_NOCLIENT;
;231:	mine->s.pos.trType = TR_LINEAR;
;232:	VectorClear( mine->s.pos.trDelta );
;233:
;234:	mine->enemy = player;
;235:	mine->think = ProximityMine_ExplodeOnPlayer;
;236:	if ( player->client->invulnerabilityTime > level.time ) {
;237:		mine->nextthink = level.time + 2 * 1000;
;238:	}
;239:	else {
;240:		mine->nextthink = level.time + 10 * 1000;
;241:	}
;242:}
;243://qlone - freezetag
;244:void ProximityMine_Body( gentity_t *mine, gentity_t *body );
;245://qlone - freezetag
;246:#endif
;247:
;248:/*
;249:================
;250:G_MissileImpact
;251:================
;252:*/
;253:void G_MissileImpact( gentity_t *ent, trace_t *trace ) {
line 255
;254:	gentity_t		*other;
;255:	qboolean		hitClient = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 260
;256:#ifdef MISSIONPACK
;257:	vec3_t			forward, impactpoint, bouncedir;
;258:	int				eFlags;
;259:#endif
;260:	other = &g_entities[trace->entityNum];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 263
;261:
;262:	// check for bounce
;263:	if ( !other->takedamage &&
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $82
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 48
BANDI4
CNSTI4 0
EQI4 $82
line 264
;264:		( ent->s.eFlags & ( EF_BOUNCE | EF_BOUNCE_HALF ) ) ) {
line 265
;265:		G_BounceMissile( ent, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_BounceMissile
CALLV
pop
line 266
;266:		G_AddEvent( ent, EV_GRENADE_BOUNCE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 267
;267:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 291
;268:	}
;269:
;270:#ifdef MISSIONPACK
;271:	if ( other->takedamage ) {
;272:		if ( ent->s.weapon != WP_PROX_LAUNCHER ) {
;273:			if ( other->client && other->client->invulnerabilityTime > level.time ) {
;274:				//
;275:				VectorCopy( ent->s.pos.trDelta, forward );
;276:				VectorNormalize( forward );
;277:				if (G_InvulnerabilityEffect( other, forward, ent->s.pos.trBase, impactpoint, bouncedir )) {
;278:					VectorCopy( bouncedir, trace->plane.normal );
;279:					eFlags = ent->s.eFlags & EF_BOUNCE_HALF;
;280:					ent->s.eFlags &= ~EF_BOUNCE_HALF;
;281:					G_BounceMissile( ent, trace );
;282:					ent->s.eFlags |= eFlags;
;283:				}
;284:				ent->target_ent = other;
;285:				return;
;286:			}
;287:		}
;288:	}
;289:#endif
;290:	// impact damage
;291:	if (other->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $84
line 293
;292:		// FIXME: wrong damage direction?
;293:		if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
EQI4 $86
line 296
;294:			vec3_t	velocity;
;295:
;296:			if( LogAccuracyHit( other, &g_entities[ent->r.ownerNum] ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $88
line 297
;297:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 724
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
line 298
;298:				hitClient = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 299
;299:			}
LABELV $88
line 300
;300:			BG_EvaluateTrajectoryDelta( &ent->s.pos, level.time, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 301
;301:			if ( VectorLength( velocity ) == 0 ) {
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
NEF4 $92
line 302
;302:				velocity[2] = 1;	// stepped on a grenade
ADDRLP4 8+8
CNSTF4 1065353216
ASGNF4
line 303
;303:			}
LABELV $92
line 304
;304:			G_Damage (other, ent, &g_entities[ent->r.ownerNum], velocity,
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 307
;305:				ent->s.origin, ent->damage, 
;306:				0, ent->methodOfDeath);
;307:		}
LABELV $86
line 308
;308:	}
LABELV $84
line 353
;309:
;310:#ifdef MISSIONPACK
;311:	if( ent->s.weapon == WP_PROX_LAUNCHER ) {
;312:		if( ent->s.pos.trType != TR_GRAVITY ) {
;313:			return;
;314:		}
;315:
;316:		// if it's a player, stick it on to them (flag them and remove this entity)
;317:		if( other->s.eType == ET_PLAYER && other->health > 0 ) {
;318:			ProximityMine_Player( ent, other );
;319:			return;
;320:		}
;321://qlone - freezetag
;322:		if ( g_freezeTag.integer && is_body_freeze( other ) ) {
;323:			ProximityMine_Body( ent, other );
;324:			return;
;325:		}
;326://qlone - freezetag
;327:
;328:		SnapVectorTowards( trace->endpos, ent->s.pos.trBase );
;329:		G_SetOrigin( ent, trace->endpos );
;330:		ent->s.pos.trType = TR_STATIONARY;
;331:		VectorClear( ent->s.pos.trDelta );
;332:
;333:		G_AddEvent( ent, EV_PROXIMITY_MINE_STICK, trace->surfaceFlags );
;334:
;335:		ent->think = ProximityMine_Activate;
;336:		ent->nextthink = level.time + 2000;
;337:
;338:		vectoangles( trace->plane.normal, ent->s.angles );
;339:		ent->s.angles[0] += 90;
;340:
;341:		// link the prox mine to the other entity
;342:		ent->enemy = other;
;343:		ent->die = ProximityMine_Die;
;344:		VectorCopy(trace->plane.normal, ent->movedir);
;345:		VectorSet(ent->r.mins, -4, -4, -4);
;346:		VectorSet(ent->r.maxs, 4, 4, 4);
;347:		trap_LinkEntity(ent);
;348:
;349:		return;
;350:	}
;351:#endif
;352:
;353:	if (!strcmp(ent->classname, "hook")) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $97
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $95
line 357
;354:		gentity_t *nent;
;355:		vec3_t v;
;356:
;357:		nent = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 358
;358:		if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $98
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $98
line 360
;359:
;360:			G_AddEvent( nent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 361
;361:			nent->s.otherEntityNum = other->s.number;
ADDRLP4 12
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 363
;362:
;363:			ent->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 365
;364:
;365:			v[0] = other->r.currentOrigin[0] + (other->r.mins[0] + other->r.maxs[0]) * 0.5;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 366
;366:			v[1] = other->r.currentOrigin[1] + (other->r.mins[1] + other->r.maxs[1]) * 0.5;
ADDRLP4 16+4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 367
;367:			v[2] = other->r.currentOrigin[2] + (other->r.mins[2] + other->r.maxs[2]) * 0.5;
ADDRLP4 16+8
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 369
;368:
;369:			SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 370
;370:		} else {
ADDRGP4 $99
JUMPV
LABELV $98
line 371
;371:			VectorCopy(trace->endpos, v);
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 372
;372:			G_AddEvent( nent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 373
;373:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTP4 0
ASGNP4
line 374
;374:		}
LABELV $99
line 376
;375:
;376:		SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 378
;377:
;378:		nent->freeAfterEvent = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 380
;379:		// change over to a normal entity right at the point of impact
;380:		nent->s.eType = ET_GENERAL;
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 381
;381:		ent->s.eType = ET_GRAPPLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 11
ASGNI4
line 383
;382:
;383:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 384
;384:		G_SetOrigin( nent, v );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 386
;385:
;386:		ent->think = Weapon_HookThink;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Weapon_HookThink
ASGNP4
line 387
;387:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 389
;388:
;389:		ent->parent->client->ps.pm_flags |= PMF_GRAPPLE_PULL;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
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
line 390
;390:		VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 392
;391:
;392:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 393
;393:		trap_LinkEntity( nent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 395
;394:
;395:		return;
ADDRGP4 $81
JUMPV
LABELV $95
line 401
;396:	}
;397:
;398:	// is it cheaper in bandwidth to just remove this ent and create a new
;399:	// one, rather than changing the missile into the explosion?
;400:
;401:	if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $103
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $103
line 402
;402:		G_AddEvent( ent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 403
;403:		ent->s.otherEntityNum = other->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 404
;404:	} else if( trace->surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 $104
JUMPV
LABELV $103
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $105
line 405
;405:		G_AddEvent( ent, EV_MISSILE_MISS_METAL, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 406
;406:	} else {
ADDRGP4 $106
JUMPV
LABELV $105
line 407
;407:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 408
;408:	}
LABELV $106
LABELV $104
line 410
;409:
;410:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 413
;411:
;412:	// change over to a normal entity right at the point of impact
;413:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 415
;414:
;415:	SnapVectorTowards( trace->endpos, ent->s.pos.trBase );	// save net bandwidth
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 417
;416:
;417:	G_SetOrigin( ent, trace->endpos );
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
line 420
;418:
;419:	// splash damage (doesn't apply to person directly hit)
;420:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $107
line 421
;421:		if( G_RadiusDamage( trace->endpos, ent->parent, ent->splashDamage, ent->splashRadius, 
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $109
line 422
;422:			other, ent->splashMethodOfDeath ) ) {
line 423
;423:			if( !hitClient ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $111
line 424
;424:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 724
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
line 425
;425:			}
LABELV $111
line 426
;426:		}
LABELV $109
line 427
;427:	}
LABELV $107
line 429
;428:
;429:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 430
;430:}
LABELV $81
endproc G_MissileImpact 52 32
export G_RunMissile
proc G_RunMissile 80 28
line 438
;431:
;432:
;433:/*
;434:================
;435:G_RunMissile
;436:================
;437:*/
;438:void G_RunMissile( gentity_t *ent ) {
line 444
;439:	vec3_t		origin;
;440:	trace_t		tr;
;441:	int			passent;
;442:
;443:	// get current position
;444:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 60
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 447
;445:
;446:	// if this missile bounced off an invulnerability sphere
;447:	if ( ent->target_ent ) {
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $116
line 448
;448:		passent = ent->target_ent->s.number;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 449
;449:	}
ADDRGP4 $117
JUMPV
LABELV $116
line 456
;450:#ifdef MISSIONPACK
;451:	// prox mines that left the owner bbox will attach to anything, even the owner
;452:	else if (ent->s.weapon == WP_PROX_LAUNCHER && ent->count) {
;453:		passent = ENTITYNUM_NONE;
;454:	}
;455:#endif
;456:	else {
line 458
;457:		// ignore interactions with the missile owner
;458:		passent = ent->r.ownerNum;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 459
;459:	}
LABELV $117
line 461
;460:	// trace a line from the previous position to the current position
;461:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, passent, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 463
;462:
;463:	if ( tr.startsolid || tr.allsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
NEI4 $121
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $118
LABELV $121
line 465
;464:		// make sure the tr.entityNum is set to the entity we're stuck in
;465:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, passent, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 488
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
ADDRLP4 76
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 466
;466:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 467
;467:	}
ADDRGP4 $119
JUMPV
LABELV $118
line 468
;468:	else {
line 469
;469:		VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 470
;470:	}
LABELV $119
line 472
;471:
;472:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 474
;473:
;474:	if ( tr.fraction != 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $124
line 476
;475:		// never explode or bounce on sky
;476:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $127
line 478
;477:			// If grapple, reset owner
;478:			if (ent->parent && ent->parent->client && ent->parent->client->hook == ent) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
ADDRLP4 76
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
ADDRLP4 76
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRP4
CVPU4 4
NEU4 $130
line 479
;479:				ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
CNSTP4 0
ASGNP4
line 480
;480:			}
LABELV $130
line 481
;481:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 482
;482:			return;
ADDRGP4 $114
JUMPV
LABELV $127
line 484
;483:		}
;484:		G_MissileImpact( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_MissileImpact
CALLV
pop
line 485
;485:		if ( ent->s.eType != ET_MISSILE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $132
line 486
;486:			return;		// exploded
ADDRGP4 $114
JUMPV
LABELV $132
line 488
;487:		}
;488:	}
LABELV $124
line 500
;489:#ifdef MISSIONPACK
;490:	// if the prox mine wasn't yet outside the player body
;491:	if (ent->s.weapon == WP_PROX_LAUNCHER && !ent->count) {
;492:		// check if the prox mine is outside the owner bbox
;493:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ENTITYNUM_NONE, ent->clipmask );
;494:		if (!tr.startsolid || tr.entityNum != ent->r.ownerNum) {
;495:			ent->count = 1;
;496:		}
;497:	}
;498:#endif
;499:	// check think function after bouncing
;500:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 501
;501:}
LABELV $114
endproc G_RunMissile 80 28
export fire_plasma
proc fire_plasma 20 4
line 512
;502:
;503:
;504://=============================================================================
;505:
;506:/*
;507:=================
;508:fire_plasma
;509:
;510:=================
;511:*/
;512:gentity_t *fire_plasma (gentity_t *self, vec3_t start, vec3_t dir) {
line 515
;513:	gentity_t	*bolt;
;514:
;515:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 517
;516:
;517:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 518
;518:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $135
ASGNP4
line 519
;519:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 520
;520:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 521
;521:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 522
;522:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 523
;523:	bolt->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 524
;524:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 525
;525:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 526
;526:	bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 20
ASGNI4
line 527
;527:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 15
ASGNI4
line 528
;528:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 20
ASGNI4
line 529
;529:	bolt->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 8
ASGNI4
line 530
;530:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 9
ASGNI4
line 531
;531:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 532
;532:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 535
;533:
;534:	// missile owner
;535:	bolt->s.clientNum = self->s.clientNum;
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
line 537
;536:	// unlagged
;537:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 539
;538:
;539:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 540
;540:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 541
;541:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 542
;542:	SnapVector( bolt->s.pos.trBase );			// save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 543
;543:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
line 544
;544:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 546
;545:
;546:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 548
;547:
;548:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $134
endproc fire_plasma 20 4
export fire_grenade
proc fire_grenade 24 4
line 559
;549:}	
;550:
;551://=============================================================================
;552:
;553:
;554:/*
;555:=================
;556:fire_grenade
;557:=================
;558:*/
;559:gentity_t *fire_grenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 562
;560:	gentity_t	*bolt;
;561:
;562:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 564
;563:
;564:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 565
;565:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $139
ASGNP4
line 566
;566:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 567
;567:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 568
;568:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 569
;569:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 570
;570:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 571
;571:	bolt->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 572
;572:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 573
;573:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 574
;574:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 100
ASGNI4
line 575
;575:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 100
ASGNI4
line 576
;576:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 150
ASGNI4
line 577
;577:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 4
ASGNI4
line 578
;578:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 5
ASGNI4
line 579
;579:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 580
;580:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 582
;581:
;582:	if ( self->s.powerups & (1 << PW_QUAD) )
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $141
line 583
;583:		bolt->s.powerups |= (1 << PW_QUAD);
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $141
line 586
;584:
;585:	// missile owner
;586:	bolt->s.clientNum = self->s.clientNum;
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
line 588
;587:	// unlagged
;588:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 590
;589:
;590:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 591
;591:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 592
;592:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 593
;593:	VectorScale( dir, 700, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1143930880
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1143930880
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1143930880
MULF4
ASGNF4
line 594
;594:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 596
;595:
;596:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 598
;597:
;598:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $138
endproc fire_grenade 24 4
export fire_bfg
proc fire_bfg 24 4
line 609
;599:}
;600:
;601://=============================================================================
;602:
;603:
;604:/*
;605:=================
;606:fire_bfg
;607:=================
;608:*/
;609:gentity_t *fire_bfg (gentity_t *self, vec3_t start, vec3_t dir) {
line 612
;610:	gentity_t	*bolt;
;611:
;612:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 614
;613:
;614:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 615
;615:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $145
ASGNP4
line 616
;616:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 617
;617:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 618
;618:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 619
;619:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 620
;620:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 621
;621:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 622
;622:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 623
;623:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 100
ASGNI4
line 624
;624:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 100
ASGNI4
line 625
;625:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 120
ASGNI4
line 626
;626:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 12
ASGNI4
line 627
;627:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 13
ASGNI4
line 628
;628:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 629
;629:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 631
;630:
;631:	if ( self->s.powerups & (1 << PW_QUAD) )
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $147
line 632
;632:		bolt->s.powerups |= (1 << PW_QUAD);
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $147
line 635
;633:
;634:	// missile owner
;635:	bolt->s.clientNum = self->s.clientNum;
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
line 637
;636:	// unlagged
;637:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 639
;638:
;639:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 640
;640:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 641
;641:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 642
;642:	SnapVector( bolt->s.pos.trBase );			// save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 643
;643:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
line 644
;644:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 645
;645:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 647
;646:
;647:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $144
endproc fire_bfg 24 4
export fire_rocket
proc fire_rocket 24 4
line 658
;648:}
;649:
;650://=============================================================================
;651:
;652:
;653:/*
;654:=================
;655:fire_rocket
;656:=================
;657:*/
;658:gentity_t *fire_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 661
;659:	gentity_t	*bolt;
;660:
;661:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 663
;662:
;663:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 664
;664:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $151
ASGNP4
line 665
;665:	bolt->nextthink = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 666
;666:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 667
;667:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 668
;668:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 669
;669:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 670
;670:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 671
;671:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 672
;672:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 100
ASGNI4
line 673
;673:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 100
ASGNI4
line 674
;674:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 120
ASGNI4
line 675
;675:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 6
ASGNI4
line 676
;676:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 7
ASGNI4
line 677
;677:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 678
;678:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 680
;679:
;680:	if ( self->s.powerups & (1 << PW_QUAD) )
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $153
line 681
;681:		bolt->s.powerups |= (1 << PW_QUAD);
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $153
line 684
;682:
;683:	// missile owner
;684:	bolt->s.clientNum = self->s.clientNum;
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
line 686
;685:	// unlagged
;686:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 688
;687:
;688:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 689
;689:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 690
;690:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 691
;691:	SnapVector( bolt->s.pos.trBase );			// save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 692
;692:	VectorScale( dir, 900, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1147207680
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1147207680
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1147207680
MULF4
ASGNF4
line 693
;693:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 694
;694:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 696
;695:
;696:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $150
endproc fire_rocket 24 4
export fire_grapple
proc fire_grapple 24 4
line 705
;697:}
;698:
;699:
;700:/*
;701:=================
;702:fire_grapple
;703:=================
;704:*/
;705:gentity_t *fire_grapple (gentity_t *self, vec3_t start, vec3_t dir) {
line 710
;706:	gentity_t	*hook;
;707:	// unlagged
;708:	int			hooktime;
;709:
;710:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 712
;711:
;712:	hook = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 713
;713:	hook->classname = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $97
ASGNP4
line 714
;714:	hook->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 715
;715:	hook->think = Weapon_HookFree;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Weapon_HookFree
ASGNP4
line 716
;716:	hook->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 717
;717:	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 718
;718:	hook->s.weapon = WP_GRAPPLING_HOOK;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 10
ASGNI4
line 719
;719:	hook->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 720
;720:	hook->methodOfDeath = MOD_GRAPPLE;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 23
ASGNI4
line 721
;721:	hook->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 722
;722:	hook->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 723
;723:	hook->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 726
;724:
;725:	// missile owner
;726:	hook->s.clientNum = self->s.clientNum;
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
line 728
;727:	// unlagged
;728:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 730
;729:
;730:	if ( self->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $158
line 731
;731:		hooktime = self->client->pers.cmd.serverTime + MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 732
;732:	} else {
ADDRGP4 $159
JUMPV
LABELV $158
line 733
;733:		hooktime = level.time - MISSILE_PRESTEP_TIME; // // move a bit on the very first frame
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 734
;734:	}
LABELV $159
line 736
;735:
;736:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 737
;737:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 738
;738:	VectorCopy( start, hook->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 739
;739:	SnapVector( hook->s.pos.trBase );			// save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 740
;740:	VectorScale( dir, 800, hook->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
line 741
;741:	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 742
;742:	VectorCopy (start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 744
;743:
;744:	self->client->hook = hook;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 746
;745:
;746:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $156
endproc fire_grapple 24 4
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
import fire_blaster
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
LABELV $151
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $145
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $139
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $135
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $97
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
