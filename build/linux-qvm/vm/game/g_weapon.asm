export CalcMuzzlePointOrigin
code
proc CalcMuzzlePointOrigin 4 0
file "../../../../code/game/g_weapon.c"
line 21
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c 
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:
;8:static	float	s_quadFactor;
;9:static	vec3_t	forward, right, up;
;10:static	vec3_t	muzzle;
;11:static	vec3_t	muzzle_origin; // for hitscan weapon trace
;12:
;13:#define NUM_NAILSHOTS 15
;14:
;15:
;16:/*
;17:===============
;18:CalcMuzzlePointOrigin
;19:===============
;20:*/
;21:void CalcMuzzlePointOrigin( const gentity_t *ent, vec3_t origin, const vec3_t forward, const vec3_t right, const vec3_t up, vec3_t muzzlePoint ) {
line 22
;22:	VectorCopy( ent->client->ps.origin, origin );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 23
;23:	origin[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 24
;24:	VectorMA( origin, 14.0, forward, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
line 27
;25:	// snap to integer coordinates for more efficient network bandwidth usage
;26:	//SnapVector( muzzlePoint );
;27:}
LABELV $54
endproc CalcMuzzlePointOrigin 4 0
export G_BounceProjectile
proc G_BounceProjectile 48 4
line 35
;28:
;29:
;30:/*
;31:================
;32:G_BounceProjectile
;33:================
;34:*/
;35:void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
line 39
;36:	vec3_t v, newv;
;37:	float dot;
;38:
;39:	VectorSubtract( impact, start, v );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
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
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 40
;40:	dot = DotProduct( v, dir );
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 41
;41:	VectorMA( v, -2*dot, dir, newv );
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
line 43
;42:
;43:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 44
;44:	VectorMA(impact, 8192, newv, endout);
ADDRFP4 12
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
line 45
;45:}
LABELV $55
endproc G_BounceProjectile 48 4
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 56
;46:
;47:
;48:/*
;49:======================================================================
;50:
;51:GAUNTLET
;52:
;53:======================================================================
;54:*/
;55:
;56:void Weapon_Gauntlet( gentity_t *ent ) {
line 58
;57:
;58:}
LABELV $66
endproc Weapon_Gauntlet 0 0
export CheckGauntletAttack
proc CheckGauntletAttack 96 32
line 65
;59:
;60:/*
;61:===============
;62:CheckGauntletAttack
;63:===============
;64:*/
;65:qboolean CheckGauntletAttack( gentity_t *ent ) {
line 73
;66:	trace_t		tr;
;67:	vec3_t		end;
;68:	gentity_t	*tent;
;69:	gentity_t	*traceEnt;
;70:	int			damage;
;71:	
;72:	// set aiming directions
;73:	AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 75
;74:
;75:	CalcMuzzlePointOrigin( ent, muzzle_origin, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 77
;76:
;77:	VectorMA( muzzle_origin, ( 32.0 + 14.0 ), forward, end );
ADDRLP4 60
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
line 79
;78:
;79:	trap_Trace( &tr, muzzle_origin, NULL, NULL, end, ent->s.number, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 80
;80:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $74
line 81
;81:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $74
line 84
;82:	}
;83:
;84:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $77
line 85
;85:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $77
line 88
;86:	}
;87:
;88:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 91
;89:
;90:	// send blood impact
;91:	if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $80
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $80
line 92
;92:		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 84
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 84
INDIRP4
ASGNP4
line 93
;93:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 94
;94:		tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 88
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 95
;95:		tent->s.weapon = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 96
;96:	}
LABELV $80
line 99
;97:
;98://qlone - freezetag
;99:	if ( g_freezeTag.integer && is_body( traceEnt ) ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $84
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 is_body
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $84
line 100
;100:		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 88
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 88
INDIRP4
ASGNP4
line 101
;101:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 102
;102:		tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 92
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 103
;103:		tent->s.weapon = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 104
;104:	}
LABELV $84
line 107
;105://qlone - freezetag
;106:
;107:	if ( !traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $89
line 108
;108:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $89
line 111
;109:	}
;110:
;111:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $91
line 112
;112:		G_AddEvent( ent, EV_POWERUP_QUAD, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 61
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 113
;113:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 114
;114:	} else {
ADDRGP4 $92
JUMPV
LABELV $91
line 115
;115:		s_quadFactor = 1.0;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 116
;116:	}
LABELV $92
line 124
;117:#ifdef MISSIONPACK
;118:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;119:		s_quadFactor *= 2;
;120:	}
;121:#endif
;122:
;123://qlone - freezetag
;124:	if ( g_freezeTag.integer && g_dmflags.integer & 1024 && !( g_removeweapon.integer & 2048 ) ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $94
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $94
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
NEI4 $94
line 125
;125:		s_quadFactor = 8;
ADDRGP4 s_quadFactor
CNSTF4 1090519040
ASGNF4
line 126
;126:	}
LABELV $94
line 129
;127:
;128://qlone - freezetag
;129:	damage = 50 * s_quadFactor;
ADDRLP4 76
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1112014848
MULF4
CVFI4 4
ASGNI4
line 130
;130:	G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_GAUNTLET );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 132
;131:
;132:	return qtrue;
CNSTI4 1
RETI4
LABELV $67
endproc CheckGauntletAttack 96 32
export SnapVectorTowards
proc SnapVectorTowards 24 0
line 154
;133:}
;134:
;135:
;136:/*
;137:======================================================================
;138:
;139:MACHINEGUN
;140:
;141:======================================================================
;142:*/
;143:
;144:/*
;145:======================
;146:SnapVectorTowards
;147:
;148:Round a vector to integers for more efficient network
;149:transmission, but make sure that it rounds towards a given point
;150:rather than blindly truncating.  This prevents it from truncating 
;151:into a wall.
;152:======================
;153:*/
;154:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 157
;155:	int		i;
;156:
;157:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $101
line 158
;158:		if ( v[i] < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $105
line 159
;159:			if ( to[i] >= v[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
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
LTF4 $107
line 160
;160:			v[i] = (int)v[i];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRGP4 $106
JUMPV
LABELV $107
line 162
;161:			else
;162:				v[i] = (int)v[i] - 1;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CNSTI4 1
SUBI4
CVIF4 4
ASGNF4
line 163
;163:		} else {
ADDRGP4 $106
JUMPV
LABELV $105
line 164
;164:			if ( to[i] <= v[i] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
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
GTF4 $109
line 165
;165:				v[i] = (int)v[i];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRGP4 $110
JUMPV
LABELV $109
line 167
;166:			else
;167:			v[i] = (int)v[i] + 1;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
LABELV $110
line 168
;168:		}
LABELV $106
line 169
;169:	}
LABELV $102
line 157
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $101
line 170
;170:}
LABELV $100
endproc SnapVectorTowards 24 0
proc Bullet_Fire 136 32
line 179
;171:
;172:#ifdef MISSIONPACK
;173:#define CHAINGUN_SPREAD		600
;174:#endif
;175:#define MACHINEGUN_SPREAD	200
;176:#define	MACHINEGUN_DAMAGE	7
;177:#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay
;178:
;179:static void Bullet_Fire( gentity_t *ent, float spread, int damage ) {
line 191
;180:	trace_t		tr;
;181:	vec3_t		end;
;182:#ifdef MISSIONPACK
;183:	vec3_t		impactpoint, bouncedir;
;184:#endif
;185:	float		r;
;186:	float		u;
;187:	gentity_t	*tent;
;188:	gentity_t	*traceEnt;
;189:	int			i, passent;
;190:
;191:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 193
;192:
;193:	r = random() * M_PI * 2.0f;
ADDRLP4 92
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 92
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 961089901
MULF4
ASGNF4
line 194
;194:	u = sin(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 96
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 100
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 96
INDIRF4
ADDRLP4 100
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
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1098907648
MULF4
ASGNF4
line 195
;195:	r = cos(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 104
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 108
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 104
INDIRF4
ADDRLP4 108
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
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1098907648
MULF4
ASGNF4
line 197
;196:
;197:	VectorMA( muzzle_origin, ( 8192.0 * 16.0 ), forward, end );
ADDRLP4 64
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 198
;198:	VectorMA( end, r, right, end );
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 right
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 right+4
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 right+8
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
line 199
;199:	VectorMA( end, u, up, end );
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 up
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 up+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 up+8
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
line 201
;200:
;201:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 202
;202:	for ( i = 0; i < 10; i++ ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $130
line 205
;203:
;204:		// unlagged
;205:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 207
;206:
;207:		trap_Trace( &tr, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 210
;208:
;209:		// unlagged
;210:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 212
;211:
;212:		if ( tr.surfaceFlags & SURF_NOIMPACT )
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $134
line 213
;213:			return;
ADDRGP4 $111
JUMPV
LABELV $134
line 215
;214:
;215:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 218
;216:
;217:		// snap the endpos to integers, but nudged towards the line
;218:		SnapVectorTowards( tr.endpos, muzzle_origin );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 221
;219:
;220:		// send bullet impact
;221:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $139
line 222
;222:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
ADDRLP4 4+12
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 124
INDIRP4
ASGNP4
line 223
;223:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 226
;224:
;225:			// unlagged
;226:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 60
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 228
;227:
;228:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $140
line 229
;229:				ent->client->accuracy_hits++;
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 230
;230:			}
line 232
;231://qlone - freezetag
;232:		} else if ( g_freezeTag.integer && is_body( traceEnt ) ) {
ADDRGP4 $140
JUMPV
LABELV $139
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $144
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 is_body
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $144
line 233
;233:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
ADDRLP4 4+12
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 128
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 128
INDIRP4
ASGNP4
line 234
;234:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 236
;235://qlone - freezetag
;236:		} else {
ADDRGP4 $145
JUMPV
LABELV $144
line 237
;237:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
ADDRLP4 4+12
ARGP4
CNSTI4 49
ARGI4
ADDRLP4 128
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 128
INDIRP4
ASGNP4
line 238
;238:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 132
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 239
;239:		}
LABELV $145
LABELV $140
line 240
;240:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 242
;241:
;242:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $132
line 259
;243:#ifdef MISSIONPACK
;244:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;245:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;246:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;247:					VectorCopy( impactpoint, muzzle );
;248:					// the player can hit him/herself with the bounced rail
;249:					passent = ENTITYNUM_NONE;
;250:				}
;251:				else {
;252:					VectorCopy( tr.endpos, muzzle );
;253:					passent = traceEnt->s.number;
;254:				}
;255:				continue;
;256:			}
;257:			else {
;258:#endif
;259:				G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_MACHINEGUN );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 263
;260:#ifdef MISSIONPACK
;261:			}
;262:#endif
;263:		}
line 264
;264:		break;
ADDRGP4 $132
JUMPV
LABELV $131
line 202
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $130
LABELV $132
line 266
;265:	}
;266:}
LABELV $111
endproc Bullet_Fire 136 32
export BFG_Fire
proc BFG_Fire 16 12
line 277
;267:
;268:
;269:/*
;270:======================================================================
;271:
;272:BFG
;273:
;274:======================================================================
;275:*/
;276:
;277:void BFG_Fire( gentity_t *ent ) {
line 280
;278:	gentity_t *m;
;279:
;280:	m = fire_bfg( ent, muzzle, forward );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_bfg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 281
;281:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 282
;282:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 285
;283:
;284://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;285:}
LABELV $153
endproc BFG_Fire 16 12
proc ShotgunPellet 108 32
line 300
;286:
;287:
;288:/*
;289:======================================================================
;290:
;291:SHOTGUN
;292:
;293:======================================================================
;294:*/
;295:
;296:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;297:// client predicts same spreads
;298:#define	DEFAULT_SHOTGUN_DAMAGE	10
;299:
;300:static qboolean ShotgunPellet( const vec3_t start, const vec3_t end, gentity_t *ent ) {
line 308
;301:	trace_t		tr;
;302:	int			damage, i, passent;
;303:	gentity_t	*traceEnt;
;304:#ifdef MISSIONPACK
;305:	vec3_t		impactpoint, bouncedir;
;306:#endif
;307:	vec3_t		tr_start, tr_end;
;308:	qboolean	hitClient = qfalse;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 310
;309:
;310:	passent = ent->s.number;
ADDRLP4 64
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 311
;311:	VectorCopy( start, tr_start );
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 312
;312:	VectorCopy( end, tr_end );
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 314
;313:
;314:	for ( i = 0; i < 10; i++ ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $155
line 315
;315:		trap_Trace( &tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 316
;316:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
ADDRLP4 0+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 319
;317:
;318:		// send bullet impact
;319:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $160
line 320
;320:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $154
JUMPV
LABELV $160
line 323
;321:		}
;322:
;323:		if ( traceEnt->takedamage ) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $163
line 324
;324:			damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1092616192
MULF4
CVFI4 4
ASGNI4
line 340
;325:#ifdef MISSIONPACK
;326:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;327:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;328:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
;329:					VectorCopy( impactpoint, tr_start );
;330:					// the player can hit him/herself with the bounced rail
;331:					passent = ENTITYNUM_NONE;
;332:				}
;333:				else {
;334:					VectorCopy( tr.endpos, tr_start );
;335:					passent = traceEnt->s.number;
;336:				}
;337:				continue;
;338:			}
;339:#else
;340:			if ( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $165
line 341
;341:				hitClient = qtrue;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 342
;342:			}
LABELV $165
line 343
;343:			G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_SHOTGUN );
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 104
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 92
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 344
;344:			return hitClient;
ADDRLP4 96
INDIRI4
RETI4
ADDRGP4 $154
JUMPV
LABELV $163
line 347
;345:#endif
;346:		}
;347:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $154
JUMPV
LABELV $156
line 314
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 10
LTI4 $155
line 349
;348:	}
;349:	return qfalse;
CNSTI4 0
RETI4
LABELV $154
endproc ShotgunPellet 108 32
proc ShotgunPattern 92 12
line 354
;350:}
;351:
;352:
;353:// this should match CG_ShotgunPattern
;354:static void ShotgunPattern( const vec3_t origin, const vec3_t origin2, int seed, gentity_t *ent ) {
line 359
;355:	int			i;
;356:	float		r, u;
;357:	vec3_t		end;
;358:	vec3_t		forward, right, up;
;359:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 363
;360:
;361:	// derive the right and up vectors from the forward vector, because
;362:	// the client won't have any other information
;363:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 364
;364:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 365
;365:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 368
;366:
;367:	// unlagged
;368:	G_DoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 371
;369:
;370:	// generate the "random" spread pattern
;371:	for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $169
line 372
;372:		r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 64
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 64
INDIRF4
CNSTF4 1177485312
MULF4
ASGNF4
line 373
;373:		u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 68
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 68
INDIRF4
CNSTF4 1177485312
MULF4
ASGNF4
line 374
;374:		VectorMA( origin, ( 8192.0 * 16.0 ), forward, end );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 375
;375:		VectorMA( end, r, right, end );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 376
;376:		VectorMA( end, u, up, end );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 377
;377:		if ( ShotgunPellet( origin, end, ent ) && !hitClient ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 ShotgunPellet
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $189
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $189
line 378
;378:			hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 379
;379:			ent->client->accuracy_hits++;
ADDRLP4 88
ADDRFP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 380
;380:		}
LABELV $189
line 381
;381:	}
LABELV $170
line 371
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 11
LTI4 $169
line 384
;382:
;383:	// unlagged
;384:	G_UndoTimeShiftFor( ent );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 385
;385:}
LABELV $168
endproc ShotgunPattern 92 12
proc weapon_supershotgun_fire 20 16
line 388
;386:
;387:
;388:static void weapon_supershotgun_fire( gentity_t *ent ) {
line 392
;389:	gentity_t		*tent;
;390:
;391:	// send shotgun blast
;392:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
ADDRGP4 muzzle
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 393
;393:	VectorScale( forward, 4096.0, tent->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 forward
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
line 395
;394:
;395:	SnapVector( tent->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 396
;396:	tent->s.eventParm = rand() & 255;		// seed for spread pattern
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 397
;397:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 399
;398:
;399:	ShotgunPattern( muzzle_origin, tent->s.origin2, tent->s.eventParm, ent );
ADDRGP4 muzzle_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShotgunPattern
CALLV
pop
line 400
;400:}
LABELV $191
endproc weapon_supershotgun_fire 20 16
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 411
;401:
;402:
;403:/*
;404:======================================================================
;405:
;406:GRENADE LAUNCHER
;407:
;408:======================================================================
;409:*/
;410:
;411:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 415
;412:	gentity_t	*m;
;413:
;414:	// extra vertical velocity
;415:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 416
;416:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 418
;417:
;418:	m = fire_grenade (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_grenade
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 419
;419:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 420
;420:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 423
;421:
;422://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;423:}
LABELV $194
endproc weapon_grenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 433
;424:
;425:/*
;426:======================================================================
;427:
;428:ROCKET
;429:
;430:======================================================================
;431:*/
;432:
;433:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 436
;434:	gentity_t	*m;
;435:
;436:	m = fire_rocket (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_rocket
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 437
;437:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 438
;438:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 441
;439:
;440://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;441:}
LABELV $196
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 16 12
line 452
;442:
;443:
;444:/*
;445:======================================================================
;446:
;447:PLASMA GUN
;448:
;449:======================================================================
;450:*/
;451:
;452:void Weapon_Plasmagun_Fire (gentity_t *ent) {
line 455
;453:	gentity_t	*m;
;454:
;455:	m = fire_plasma (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_plasma
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 456
;456:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 457
;457:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 460
;458:
;459://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;460:}
LABELV $197
endproc Weapon_Plasmagun_Fire 16 12
export weapon_railgun_fire
proc weapon_railgun_fire 160 32
line 477
;461:
;462:/*
;463:======================================================================
;464:
;465:RAILGUN
;466:
;467:======================================================================
;468:*/
;469:
;470:
;471:/*
;472:=================
;473:weapon_railgun_fire
;474:=================
;475:*/
;476:#define	MAX_RAIL_HITS	4
;477:void weapon_railgun_fire( gentity_t *ent ) {
line 492
;478:	vec3_t		end;
;479:#ifdef MISSIONPACK
;480:	vec3_t impactpoint, bouncedir;
;481:#endif
;482:	trace_t		trace;
;483:	gentity_t	*tent;
;484:	gentity_t	*traceEnt;
;485:	int			damage;
;486:	int			i;
;487:	int			hits;
;488:	int			unlinked;
;489:	int			passent;
;490:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;491:
;492:	damage = 100 * s_quadFactor;
ADDRLP4 104
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1120403456
MULF4
CVFI4 4
ASGNI4
line 494
;493:
;494:	VectorMA( muzzle_origin, 8192.0, forward, end );
ADDRLP4 88
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 88+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
line 497
;495:
;496:	// unlagged
;497:	G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 500
;498:
;499:	// trace only against the solids, so the railgun will go through people
;500:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 501
;501:	hits = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 502
;502:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $205
line 503
;503:	do {
line 504
;504:		trap_Trace( &trace, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 505
;505:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
LTI4 $208
line 506
;506:			break;
ADDRGP4 $207
JUMPV
LABELV $208
line 508
;507:		}
;508:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 509
;509:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $212
line 532
;510:#ifdef MISSIONPACK
;511:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;512:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
;513:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;514:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;515:					SnapVectorTowards( trace.endpos, muzzle );
;516:					// send railgun beam effect
;517:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
;518:					// set player number for custom colors on the railtrail
;519:					tent->s.clientNum = ent->s.clientNum;
;520:					VectorCopy( muzzle, tent->s.origin2 );
;521:					// move origin a bit to come closer to the drawn gun muzzle
;522:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
;523:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
;524:					tent->s.eventParm = 255;	// don't make the explosion at the end
;525:					//
;526:					VectorCopy( impactpoint, muzzle );
;527:					// the player can hit him/herself with the bounced rail
;528:					passent = ENTITYNUM_NONE;
;529:				}
;530:			} else
;531:#else
;532:			{
line 533
;533:				if ( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $214
line 534
;534:					hits++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 535
;535:				}
LABELV $214
line 536
;536:				G_Damage( traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 537
;537:			}
line 539
;538:#endif
;539:		}
LABELV $212
line 540
;540:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $217
line 541
;541:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $207
JUMPV
LABELV $217
line 544
;542:		}
;543:		// unlink this entity, so the next trace will go past it
;544:		trap_UnlinkEntity( traceEnt );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 545
;545:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 546
;546:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 547
;547:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $206
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $205
LABELV $207
line 550
;548:
;549:	// unlagged
;550:	G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 554
;551:
;552:
;553:	// link back in any entities we unlinked
;554:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $223
JUMPV
LABELV $220
line 555
;555:		trap_LinkEntity( unlinkedEntities[i] );
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 556
;556:	}
LABELV $221
line 554
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $223
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $220
line 561
;557:
;558:	// the final trace endpos will be the terminal point of the rail trail
;559:
;560:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;561:	SnapVectorTowards( trace.endpos, muzzle_origin );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 564
;562:
;563:	// send railgun beam effect
;564:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 4+12
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 112
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 112
INDIRP4
ASGNP4
line 567
;565:
;566:	// set player number for custom colors on the railtrail
;567:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 68
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 569
;568:
;569:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 571
;570:	// move origin a bit to come closer to the drawn gun muzzle
;571:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRGP4 right
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRGP4 right+4
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRGP4 right+8
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
line 572
;572:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRGP4 up
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRGP4 up+4
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRGP4 up+8
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
line 574
;573:
;574:	SnapVector( tent->s.origin2 );
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 577
;575:
;576:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;577:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $230
line 578
;578:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 68
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 579
;579:	} else {
ADDRGP4 $231
JUMPV
LABELV $230
line 580
;580:		tent->s.eventParm = DirToByte( trace.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 140
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 581
;581:	}
LABELV $231
line 582
;582:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 68
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 585
;583:
;584:	// give the shooter a reward sound if they have made two railgun hits in a row
;585:	if ( hits == 0 ) {
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $234
line 587
;586:		// complete miss
;587:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 588
;588:	} else {
ADDRGP4 $235
JUMPV
LABELV $234
line 590
;589:		// check for "impressive" reward sound
;590:		ent->client->accurateCount += hits;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 108
INDIRI4
ADDI4
ASGNI4
line 591
;591:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CNSTI4 2
LTI4 $236
line 592
;592:			ent->client->accurateCount -= 2;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 593
;593:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 595
;594:			// add the sprite over the player's head
;595:			ent->client->ps.eFlags &= ~EF_AWARDS;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 596
;596:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 597
;597:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
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
line 598
;598:		}
LABELV $236
line 599
;599:		ent->client->accuracy_hits++;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 600
;600:	}
LABELV $235
line 602
;601:
;602:}
LABELV $198
endproc weapon_railgun_fire 160 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 24
line 614
;603:
;604:
;605:/*
;606:======================================================================
;607:
;608:GRAPPLING HOOK
;609:
;610:======================================================================
;611:*/
;612:
;613:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;614:{
line 616
;615://qlone - grapple hook
;616:	AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 618
;617:	//uzu//CalcMuzzlePoint( ent, forward, right, up, muzzle );
;618:	CalcMuzzlePointOrigin( ent, muzzle_origin, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 621
;619://qlone - grapple hook
;620:
;621:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
NEI4 $240
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
NEU4 $240
line 622
;622:		fire_grapple (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 fire_grapple
CALLP4
pop
LABELV $240
line 624
;623:
;624:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 1
ASGNI4
line 625
;625:}
LABELV $239
endproc Weapon_GrapplingHook_Fire 4 24
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 629
;626:
;627:
;628:void Weapon_HookFree (gentity_t *ent)
;629:{
line 631
;630://qlone - grapple hook
;631:	ent->parent->timestamp = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 633
;632://qlone - grapple hook
;633:	ent->parent->client->hook = NULL;
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
line 634
;634:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
ADDRLP4 0
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
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 635
;635:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 636
;636:}
LABELV $242
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 640
;637:
;638:
;639:void Weapon_HookThink (gentity_t *ent)
;640:{
line 641
;641:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $245
line 644
;642:		vec3_t v, oldorigin;
;643:
;644:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 645
;645:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 646
;646:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 647
;647:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 648
;648:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 650
;649:
;650:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 651
;651:	}
LABELV $245
line 653
;652:
;653:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 654
;654:}
LABELV $244
endproc Weapon_HookThink 36 8
export Weapon_LightningFire
proc Weapon_LightningFire 104 32
line 665
;655:
;656:
;657:/*
;658:======================================================================
;659:
;660:LIGHTNING GUN
;661:
;662:======================================================================
;663:*/
;664:
;665:void Weapon_LightningFire( gentity_t *ent ) {
line 674
;666:	trace_t		tr;
;667:	vec3_t		end;
;668:#ifdef MISSIONPACK
;669:	vec3_t impactpoint, bouncedir;
;670:#endif
;671:	gentity_t	*traceEnt, *tent;
;672:	int			damage, i, passent;
;673:
;674:	damage = 8 * s_quadFactor;
ADDRLP4 84
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1090519040
MULF4
CVFI4 4
ASGNI4
line 676
;675:
;676:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 678
;677:
;678:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $250
line 679
;679:		VectorMA( muzzle_origin, LIGHTNING_RANGE, forward, end );
ADDRLP4 60
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
line 682
;680:
;681:		// unlagged
;682:		G_DoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 684
;683:
;684:		trap_Trace( &tr, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 687
;685:
;686:		// unlagged
;687:		G_UndoTimeShiftFor( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 701
;688:
;689:#ifdef MISSIONPACK
;690:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;691:		if (i) {
;692:			// add bounced off lightning bolt temp entity
;693:			// the first lightning bolt is a cgame only visual
;694:			//
;695:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
;696:			VectorCopy( tr.endpos, end );
;697:			SnapVector( end );
;698:			VectorCopy( end, tent->s.origin2 );
;699:		}
;700:#endif
;701:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1023
NEI4 $260
line 702
;702:			return;
ADDRGP4 $249
JUMPV
LABELV $260
line 705
;703:		}
;704:
;705:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 707
;706:
;707:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $264
line 725
;708:#ifdef MISSIONPACK
;709:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;710:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;711:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;712:					VectorCopy( impactpoint, muzzle );
;713:					VectorSubtract( end, impactpoint, forward );
;714:					VectorNormalize(forward);
;715:					// the player can hit him/herself with the bounced lightning
;716:					passent = ENTITYNUM_NONE;
;717:				}
;718:				else {
;719:					VectorCopy( tr.endpos, muzzle );
;720:					passent = traceEnt->s.number;
;721:				}
;722:				continue;
;723:			}
;724:#else
;725:			if ( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $266
line 726
;726:				ent->client->accuracy_hits++;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 727
;727:			}
LABELV $266
line 728
;728:			G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_LIGHTNING );
ADDRLP4 0
INDIRP4
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
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 730
;729:#endif
;730:		}
LABELV $264
line 732
;731:
;732:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $269
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $269
line 733
;733:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 92
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 92
INDIRP4
ASGNP4
line 734
;734:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 735
;735:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 96
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 736
;736:			tent->s.weapon = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 738
;737://qlone - freezetag
;738:		} else if ( g_freezeTag.integer && is_body( traceEnt ) ) {
ADDRGP4 $252
JUMPV
LABELV $269
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $273
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 is_body
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $273
line 739
;739:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 96
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 96
INDIRP4
ASGNP4
line 740
;740:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 741
;741:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 100
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 742
;742:			tent->s.weapon = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 744
;743://qlone - freezetag
;744:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $252
JUMPV
LABELV $273
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $252
line 745
;745:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 4+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 96
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 96
INDIRP4
ASGNP4
line 746
;746:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 100
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 747
;747:		}
line 749
;748:
;749:		break;
ADDRGP4 $252
JUMPV
LABELV $251
line 678
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $250
LABELV $252
line 751
;750:	}
;751:}
LABELV $249
endproc Weapon_LightningFire 104 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 808
;752:
;753:#ifdef MISSIONPACK
;754:/*
;755:======================================================================
;756:
;757:NAILGUN
;758:
;759:======================================================================
;760:*/
;761:
;762:void Weapon_Nailgun_Fire (gentity_t *ent) {
;763:	gentity_t	*m;
;764:	int			count;
;765:
;766:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
;767:		m = fire_nail (ent, muzzle, forward, right, up );
;768:		m->damage *= s_quadFactor;
;769:		m->splashDamage *= s_quadFactor;
;770:	}
;771:
;772://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;773:}
;774:
;775:
;776:/*
;777:======================================================================
;778:
;779:PROXIMITY MINE LAUNCHER
;780:
;781:======================================================================
;782:*/
;783:
;784:void weapon_proxlauncher_fire (gentity_t *ent) {
;785:	gentity_t	*m;
;786:
;787:	// extra vertical velocity
;788:	forward[2] += 0.2f;
;789:	VectorNormalize( forward );
;790:
;791:	m = fire_prox (ent, muzzle, forward);
;792:	m->damage *= s_quadFactor;
;793:	m->splashDamage *= s_quadFactor;
;794:
;795://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;796:}
;797:
;798:#endif
;799:
;800://======================================================================
;801:
;802:
;803:/*
;804:===============
;805:LogAccuracyHit
;806:===============
;807:*/
;808:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 809
;809:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $284
line 810
;810:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $283
JUMPV
LABELV $284
line 813
;811:	}
;812:
;813:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $286
line 814
;814:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $283
JUMPV
LABELV $286
line 817
;815:	}
;816:
;817:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $288
line 818
;818:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $283
JUMPV
LABELV $288
line 821
;819:	}
;820:
;821:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $290
line 822
;822:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $283
JUMPV
LABELV $290
line 825
;823:	}
;824:
;825:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $292
line 826
;826:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $283
JUMPV
LABELV $292
line 829
;827:	}
;828:
;829:	if ( OnSameTeam( target, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $294
line 830
;830:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $283
JUMPV
LABELV $294
line 833
;831:	}
;832:
;833:	return qtrue;
CNSTI4 1
RETI4
LABELV $283
endproc LogAccuracyHit 4 8
export FireWeapon
proc FireWeapon 12 24
line 842
;834:}
;835:
;836:
;837:/*
;838:===============
;839:FireWeapon
;840:===============
;841:*/
;842:void FireWeapon( gentity_t *ent ) {
line 843
;843:	if ( ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $297
line 844
;844:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 845
;845:	} else {
ADDRGP4 $298
JUMPV
LABELV $297
line 846
;846:		s_quadFactor = 1.0;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 847
;847:	}
LABELV $298
line 855
;848:#ifdef MISSIONPACK
;849:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;850:		s_quadFactor *= 2;
;851:	}
;852:#endif
;853:
;854://qlone - freezetag
;855:	if ( g_freezeTag.integer && g_dmflags.integer & 1024 ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $300
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $300
line 856
;856:		s_quadFactor = 8;
ADDRGP4 s_quadFactor
CNSTF4 1090519040
ASGNF4
line 857
;857:	}
LABELV $300
line 861
;858://qlone - freezetag
;859:
;860:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;861:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $304
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
EQI4 $304
line 869
;862:#ifdef MISSIONPACK
;863:		if( ent->s.weapon == WP_NAILGUN ) {
;864:			ent->client->accuracy_shots += NUM_NAILSHOTS;
;865:		} else {
;866:			ent->client->accuracy_shots++;
;867:		}
;868:#else
;869:		ent->client->accuracy_shots++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 720
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 871
;870:#endif
;871:	}
LABELV $304
line 874
;872:
;873:	// set aiming directions
;874:	AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 876
;875:
;876:	CalcMuzzlePointOrigin( ent, muzzle_origin, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 879
;877:
;878:	// fire the specific weapon
;879:	switch( ent->s.weapon ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $307
ADDRLP4 4
INDIRI4
CNSTI4 10
GTI4 $307
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $322-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $322
address $309
address $312
address $311
address $316
address $317
address $310
address $319
address $318
address $320
address $321
code
LABELV $309
line 881
;880:	case WP_GAUNTLET:
;881:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 882
;882:		break;
ADDRGP4 $307
JUMPV
LABELV $310
line 884
;883:	case WP_LIGHTNING:
;884:		Weapon_LightningFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_LightningFire
CALLV
pop
line 885
;885:		break;
ADDRGP4 $307
JUMPV
LABELV $311
line 887
;886:	case WP_SHOTGUN:
;887:		weapon_supershotgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 888
;888:		break;
ADDRGP4 $307
JUMPV
LABELV $312
line 890
;889:	case WP_MACHINEGUN:
;890:		if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $313
line 891
;891:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 7
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 892
;892:		} else {
ADDRGP4 $307
JUMPV
LABELV $313
line 893
;893:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 5
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 894
;894:		}
line 895
;895:		break;
ADDRGP4 $307
JUMPV
LABELV $316
line 897
;896:	case WP_GRENADE_LAUNCHER:
;897:		weapon_grenadelauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 898
;898:		break;
ADDRGP4 $307
JUMPV
LABELV $317
line 900
;899:	case WP_ROCKET_LAUNCHER:
;900:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 901
;901:		break;
ADDRGP4 $307
JUMPV
LABELV $318
line 903
;902:	case WP_PLASMAGUN:
;903:		Weapon_Plasmagun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 904
;904:		break;
ADDRGP4 $307
JUMPV
LABELV $319
line 906
;905:	case WP_RAILGUN:
;906:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 907
;907:		break;
ADDRGP4 $307
JUMPV
LABELV $320
line 909
;908:	case WP_BFG:
;909:		BFG_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BFG_Fire
CALLV
pop
line 910
;910:		break;
ADDRGP4 $307
JUMPV
LABELV $321
line 912
;911:	case WP_GRAPPLING_HOOK:
;912:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 913
;913:		break;
line 927
;914:#ifdef MISSIONPACK
;915:	case WP_NAILGUN:
;916:		Weapon_Nailgun_Fire( ent );
;917:		break;
;918:	case WP_PROX_LAUNCHER:
;919:		weapon_proxlauncher_fire( ent );
;920:		break;
;921:	case WP_CHAINGUN:
;922:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
;923:		break;
;924:#endif
;925:	default:
;926:// FIXME		G_Error( "Bad ent->s.weapon" );
;927:		break;
LABELV $307
line 929
;928:	}
;929:}
LABELV $296
endproc FireWeapon 12 24
bss
align 4
LABELV muzzle_origin
skip 12
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
skip 4
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
import CalcMuzzlePoint
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
