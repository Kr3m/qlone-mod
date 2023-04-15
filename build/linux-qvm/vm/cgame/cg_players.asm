data
align 4
LABELV cg_customSoundNames
address $72
address $73
address $74
address $75
address $76
address $77
address $78
address $79
address $80
address $81
address $82
address $83
address $84
skip 76
export CG_CustomSound
code
proc CG_CustomSound 16 8
file "../../../../code/cgame/cg_players.c"
line 31
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_players.c -- handle the media and animation for player entities
;4:#include "cg_local.h"
;5:
;6:#define	PM_SKIN "pm"
;7:
;8:static const char *cg_customSoundNames[ MAX_CUSTOM_SOUNDS ] = {
;9:	"*death1.wav",
;10:	"*death2.wav",
;11:	"*death3.wav",
;12:	"*jump1.wav",
;13:	"*pain25_1.wav",
;14:	"*pain50_1.wav",
;15:	"*pain75_1.wav",
;16:	"*pain100_1.wav",
;17:	"*falling1.wav",
;18:	"*gasp.wav",
;19:	"*drown.wav",
;20:	"*fall1.wav",
;21:	"*taunt.wav"
;22:};
;23:
;24:
;25:/*
;26:================
;27:CG_CustomSound
;28:
;29:================
;30:*/
;31:sfxHandle_t	CG_CustomSound( int clientNum, const char *soundName ) {
line 35
;32:	clientInfo_t *ci;
;33:	int			i;
;34:
;35:	if ( soundName[0] != '*' ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $86
line 36
;36:		return trap_S_RegisterSound( soundName, qfalse );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $85
JUMPV
LABELV $86
line 39
;37:	}
;38:
;39:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $90
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $88
LABELV $90
line 40
;40:		clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 41
;41:	}
LABELV $88
line 42
;42:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 44
;43:
;44:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i] ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $92
line 45
;45:		if ( !strcmp( soundName, cg_customSoundNames[i] ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $96
line 46
;46:			return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $85
JUMPV
LABELV $96
line 48
;47:		}
;48:	}
LABELV $93
line 44
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $95
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $98
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $92
LABELV $98
line 50
;49:
;50:	CG_Error( "Unknown custom sound: %s", soundName );
ADDRGP4 $99
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 51
;51:	return 0;
CNSTI4 0
RETI4
LABELV $85
endproc CG_CustomSound 16 8
proc CG_ParseAnimationFile 20076 12
line 72
;52:}
;53:
;54:
;55:
;56:/*
;57:=============================================================================
;58:
;59:CLIENT INFO
;60:
;61:=============================================================================
;62:*/
;63:
;64:/*
;65:======================
;66:CG_ParseAnimationFile
;67:
;68:Read a configuration file containing animation counts and rates
;69:models/players/visor/animation.cfg, etc
;70:======================
;71:*/
;72:static qboolean	CG_ParseAnimationFile( const char *filename, clientInfo_t *ci ) {
line 83
;73:	char		*text_p, *prev;
;74:	int			len;
;75:	int			i;
;76:	char		*token;
;77:	float		fps;
;78:	int			skip;
;79:	char		text[20000];
;80:	fileHandle_t	f;
;81:	animation_t *animations;
;82:
;83:	animations = ci->animations;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 448
ADDP4
ASGNP4
line 86
;84:
;85:	// load the file
;86:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20036
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 20036
INDIRI4
ASGNI4
line 87
;87:	if ( f == FS_INVALID_HANDLE ) {
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $101
line 88
;88:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $101
line 90
;89:	}
;90:	if ( len <= 0 ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
GTI4 $103
line 91
;91:		trap_FS_FCloseFile( f );
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 92
;92:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $103
line 94
;93:	}
;94:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 28
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $105
line 95
;95:		CG_Printf( "File %s too long\n", filename );
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 96
;96:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $105
line 98
;97:	}
;98:	trap_FS_Read( text, len, f );
ADDRLP4 36
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 99
;99:	text[len] = '\0';
ADDRLP4 28
INDIRI4
ADDRLP4 36
ADDP4
CNSTI1 0
ASGNI1
line 100
;100:	trap_FS_FCloseFile( f );
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 103
;101:
;102:	// parse the text
;103:	text_p = text;
ADDRLP4 12
ADDRLP4 36
ASGNP4
line 104
;104:	skip = 0;	// quite the compiler warning
ADDRLP4 24
CNSTI4 0
ASGNI4
line 106
;105:
;106:	ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 107
;107:	VectorClear( ci->headOffset );
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 404
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
CNSTF4 0
ASGNF4
line 108
;108:	ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 109
;109:	ci->fixedlegs = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 0
ASGNI4
line 110
;110:	ci->fixedtorso = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $108
line 113
;111:
;112:	// read optional parameters
;113:	while ( 1 ) {
line 114
;114:		prev = text_p;	// so we can unget
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
line 115
;115:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20040
INDIRP4
ASGNP4
line 116
;116:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $111
line 117
;117:			break;
ADDRGP4 $110
JUMPV
LABELV $111
line 119
;118:		}
;119:		if ( !Q_stricmp( token, "footsteps" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $115
ARGP4
ADDRLP4 20044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20044
INDIRI4
CNSTI4 0
NEI4 $113
line 120
;120:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 121
;121:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $116
line 122
;122:				break;
ADDRGP4 $110
JUMPV
LABELV $116
line 124
;123:			}
;124:			if ( !Q_stricmp( token, "default" ) || !Q_stricmp( token, "normal" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
EQI4 $122
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $118
LABELV $122
line 125
;125:				ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 126
;126:			} else if ( !Q_stricmp( token, "boot" ) ) {
ADDRGP4 $109
JUMPV
LABELV $118
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $125
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $123
line 127
;127:				ci->footsteps = FOOTSTEP_BOOT;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 128
;128:			} else if ( !Q_stricmp( token, "flesh" ) ) {
ADDRGP4 $109
JUMPV
LABELV $123
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $126
line 129
;129:				ci->footsteps = FOOTSTEP_FLESH;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 2
ASGNI4
line 130
;130:			} else if ( !Q_stricmp( token, "mech" ) ) {
ADDRGP4 $109
JUMPV
LABELV $126
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $129
line 131
;131:				ci->footsteps = FOOTSTEP_MECH;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 3
ASGNI4
line 132
;132:			} else if ( !Q_stricmp( token, "energy" ) ) {
ADDRGP4 $109
JUMPV
LABELV $129
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $132
line 133
;133:				ci->footsteps = FOOTSTEP_ENERGY;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 4
ASGNI4
line 134
;134:			} else {
ADDRGP4 $109
JUMPV
LABELV $132
line 135
;135:				CG_Printf( "Bad footsteps parm in %s: %s\n", filename, token );
ADDRGP4 $135
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 136
;136:			}
line 137
;137:			continue;
ADDRGP4 $109
JUMPV
LABELV $113
line 138
;138:		} else if ( !Q_stricmp( token, "headoffset" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRLP4 20048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20048
INDIRI4
CNSTI4 0
NEI4 $136
line 139
;139:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $139
line 140
;140:				token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 141
;141:				if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $143
line 142
;142:					break;
ADDRGP4 $109
JUMPV
LABELV $143
line 144
;143:				}
;144:				ci->headOffset[i] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ADDRLP4 20056
INDIRF4
ASGNF4
line 145
;145:			}
LABELV $140
line 139
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $139
line 146
;146:			continue;
ADDRGP4 $109
JUMPV
LABELV $136
line 147
;147:		} else if ( !Q_stricmp( token, "sex" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $147
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
NEI4 $145
line 148
;148:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20056
INDIRP4
ASGNP4
line 149
;149:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $148
line 150
;150:				break;
ADDRGP4 $110
JUMPV
LABELV $148
line 152
;151:			}
;152:			if ( token[0] == 'f' || token[0] == 'F' ) {
ADDRLP4 20060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 102
EQI4 $152
ADDRLP4 20060
INDIRI4
CNSTI4 70
NEI4 $150
LABELV $152
line 153
;153:				ci->gender = GENDER_FEMALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 154
;154:			} else if ( token[0] == 'n' || token[0] == 'N' ) {
ADDRGP4 $109
JUMPV
LABELV $150
ADDRLP4 20064
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 110
EQI4 $155
ADDRLP4 20064
INDIRI4
CNSTI4 78
NEI4 $153
LABELV $155
line 155
;155:				ci->gender = GENDER_NEUTER;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 2
ASGNI4
line 156
;156:			} else {
ADDRGP4 $109
JUMPV
LABELV $153
line 157
;157:				ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 158
;158:			}
line 159
;159:			continue;
ADDRGP4 $109
JUMPV
LABELV $145
line 160
;160:		} else if ( !Q_stricmp( token, "fixedlegs" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $156
line 161
;161:			ci->fixedlegs = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 1
ASGNI4
line 162
;162:			continue;
ADDRGP4 $109
JUMPV
LABELV $156
line 163
;163:		} else if ( !Q_stricmp( token, "fixedtorso" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $159
line 164
;164:			ci->fixedtorso = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 1
ASGNI4
line 165
;165:			continue;
ADDRGP4 $109
JUMPV
LABELV $159
line 169
;166:		}
;167:
;168:		// if it is a number, start parsing animations
;169:		if ( token[0] >= '0' && token[0] <= '9' ) {
ADDRLP4 20064
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 48
LTI4 $162
ADDRLP4 20064
INDIRI4
CNSTI4 57
GTI4 $162
line 170
;170:			text_p = prev;	// unget the token
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 171
;171:			break;
ADDRGP4 $110
JUMPV
LABELV $162
line 173
;172:		}
;173:		Com_Printf( "unknown token '%s' in %s\n", token, filename );
ADDRGP4 $164
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 174
;174:	}
LABELV $109
line 113
ADDRGP4 $108
JUMPV
LABELV $110
line 177
;175:
;176:	// read information for each frame
;177:	for ( i = 0 ; i < MAX_ANIMATIONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $165
line 179
;178:
;179:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20040
INDIRP4
ASGNP4
line 180
;180:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $169
line 181
;181:			if( i >= TORSO_GETFLAG && i <= TORSO_NEGATIVE ) {
ADDRLP4 4
INDIRI4
CNSTI4 25
LTI4 $167
ADDRLP4 4
INDIRI4
CNSTI4 30
GTI4 $167
line 182
;182:				animations[i].firstFrame = animations[TORSO_GESTURE].firstFrame;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 183
;183:				animations[i].frameLerp = animations[TORSO_GESTURE].frameLerp;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 184
;184:				animations[i].initialLerp = animations[TORSO_GESTURE].initialLerp;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 185
;185:				animations[i].loopFrames = animations[TORSO_GESTURE].loopFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
line 186
;186:				animations[i].numFrames = animations[TORSO_GESTURE].numFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 187
;187:				animations[i].reversed = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 188
;188:				animations[i].flipflop = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 189
;189:				continue;
ADDRGP4 $166
JUMPV
line 191
;190:			}
;191:			break;
LABELV $169
line 193
;192:		}
;193:		animations[i].firstFrame = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 20044
INDIRI4
ASGNI4
line 195
;194:		// leg only frames are adjusted to not count the upper body only frames
;195:		if ( i == LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $173
line 196
;196:			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
line 197
;197:		}
LABELV $173
line 198
;198:		if ( i >= LEGS_WALKCR && i<TORSO_GETFLAG) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $175
ADDRLP4 4
INDIRI4
CNSTI4 25
GEI4 $175
line 199
;199:			animations[i].firstFrame -= skip;
ADDRLP4 20052
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20052
INDIRP4
ADDRLP4 20052
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 200
;200:		}
LABELV $175
line 202
;201:
;202:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 203
;203:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $177
line 204
;204:			break;
ADDRGP4 $167
JUMPV
LABELV $177
line 206
;205:		}
;206:		animations[i].numFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20056
INDIRI4
ASGNI4
line 208
;207:
;208:		animations[i].reversed = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 209
;209:		animations[i].flipflop = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 211
;210:		// if numFrames is negative the animation is reversed
;211:		if (animations[i].numFrames < 0) {
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $179
line 212
;212:			animations[i].numFrames = -animations[i].numFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
NEGI4
ASGNI4
line 213
;213:			animations[i].reversed = qtrue;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 214
;214:		}
LABELV $179
line 216
;215:
;216:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 217
;217:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $181
line 218
;218:			break;
ADDRGP4 $167
JUMPV
LABELV $181
line 220
;219:		}
;220:		animations[i].loopFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20064
INDIRI4
ASGNI4
line 222
;221:
;222:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20068
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20068
INDIRP4
ASGNP4
line 223
;223:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $183
line 224
;224:			break;
ADDRGP4 $167
JUMPV
LABELV $183
line 226
;225:		}
;226:		fps = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20072
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20072
INDIRF4
ASGNF4
line 227
;227:		if ( fps == 0 ) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $185
line 228
;228:			fps = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 229
;229:		}
LABELV $185
line 230
;230:		animations[i].frameLerp = 1000 / fps;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 231
;231:		animations[i].initialLerp = 1000 / fps;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 232
;232:	}
LABELV $166
line 177
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $165
LABELV $167
line 234
;233:
;234:	if ( i != MAX_ANIMATIONS ) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $187
line 235
;235:		CG_Printf( "Error parsing animation file: %s\n", filename );
ADDRGP4 $189
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 236
;236:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $187
line 240
;237:	}
;238:
;239:	// crouch backward animation
;240:	memcpy(&animations[LEGS_BACKCR], &animations[LEGS_WALKCR], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 896
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 241
;241:	animations[LEGS_BACKCR].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 243
;242:	// walk backward animation
;243:	memcpy(&animations[LEGS_BACKWALK], &animations[LEGS_WALK], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 924
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 392
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 244
;244:	animations[LEGS_BACKWALK].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 246
;245:	// flag moving fast
;246:	animations[FLAG_RUN].firstFrame = 0;
ADDRLP4 8
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 0
ASGNI4
line 247
;247:	animations[FLAG_RUN].numFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 16
ASGNI4
line 248
;248:	animations[FLAG_RUN].loopFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 960
ADDP4
CNSTI4 16
ASGNI4
line 249
;249:	animations[FLAG_RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 964
ADDP4
CNSTI4 66
ASGNI4
line 250
;250:	animations[FLAG_RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 66
ASGNI4
line 251
;251:	animations[FLAG_RUN].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 0
ASGNI4
line 253
;252:	// flag not moving or moving slowly
;253:	animations[FLAG_STAND].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 16
ASGNI4
line 254
;254:	animations[FLAG_STAND].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 5
ASGNI4
line 255
;255:	animations[FLAG_STAND].loopFrames = 0;
ADDRLP4 8
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 256
;256:	animations[FLAG_STAND].frameLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 50
ASGNI4
line 257
;257:	animations[FLAG_STAND].initialLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 50
ASGNI4
line 258
;258:	animations[FLAG_STAND].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 0
ASGNI4
line 260
;259:	// flag speeding up
;260:	animations[FLAG_STAND2RUN].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 16
ASGNI4
line 261
;261:	animations[FLAG_STAND2RUN].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 5
ASGNI4
line 262
;262:	animations[FLAG_STAND2RUN].loopFrames = 1;
ADDRLP4 8
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 263
;263:	animations[FLAG_STAND2RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1020
ADDP4
CNSTI4 66
ASGNI4
line 264
;264:	animations[FLAG_STAND2RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1024
ADDP4
CNSTI4 66
ASGNI4
line 265
;265:	animations[FLAG_STAND2RUN].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 275
;266:	//
;267:	// new anims changes
;268:	//
;269://	animations[TORSO_GETFLAG].flipflop = qtrue;
;270://	animations[TORSO_GUARDBASE].flipflop = qtrue;
;271://	animations[TORSO_PATROL].flipflop = qtrue;
;272://	animations[TORSO_AFFIRMATIVE].flipflop = qtrue;
;273://	animations[TORSO_NEGATIVE].flipflop = qtrue;
;274:	//
;275:	return qtrue;
CNSTI4 1
RETI4
LABELV $100
endproc CG_ParseAnimationFile 20076 12
proc CG_FileExists 12 12
line 284
;276:}
;277:
;278:
;279:/*
;280:==========================
;281:CG_FileExists
;282:==========================
;283:*/
;284:static qboolean	CG_FileExists( const char *filename ) {
line 288
;285:	int len;
;286:	fileHandle_t	f;
;287:
;288:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 290
;289:
;290:	if ( f != FS_INVALID_HANDLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $191
line 291
;291:		trap_FS_FCloseFile( f );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 292
;292:	}
LABELV $191
line 294
;293:
;294:	if ( len > 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $193
line 295
;295:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $190
JUMPV
LABELV $193
line 298
;296:	}
;297:
;298:	return qfalse;
CNSTI4 0
RETI4
LABELV $190
endproc CG_FileExists 12 12
proc CG_FindClientModelFile 36 40
line 307
;299:}
;300:
;301:
;302:/*
;303:==========================
;304:CG_FindClientModelFile
;305:==========================
;306:*/
;307:static qboolean	CG_FindClientModelFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *base, const char *ext ) {
line 311
;308:	char *team, *charactersFolder;
;309:	int i;
;310:
;311:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $196
line 312
;312:		switch ( ci->team ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $202
ADDRGP4 $199
JUMPV
LABELV $202
line 313
;313:			case TEAM_BLUE: {
line 314
;314:				team = "blue";
ADDRLP4 8
ADDRGP4 $203
ASGNP4
line 315
;315:				break;
ADDRGP4 $197
JUMPV
LABELV $199
line 317
;316:			}
;317:			default: {
line 318
;318:				team = "red";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 319
;319:				break;
line 322
;320:			}
;321:		}
;322:	}
ADDRGP4 $197
JUMPV
LABELV $196
line 323
;323:	else {
line 324
;324:		team = "default";
ADDRLP4 8
ADDRGP4 $120
ASGNP4
line 325
;325:	}
LABELV $197
line 328
;326:
;327:	// colored skins
;328:	if ( ci->coloredSkin && !Q_stricmp( ci->skinName, PM_SKIN ) ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $205
ADDRLP4 12
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $205
line 329
;329:		team = PM_SKIN;
ADDRLP4 8
ADDRGP4 $207
ASGNP4
line 330
;330:	}
LABELV $205
line 332
;331:
;332:	charactersFolder = "";
ADDRLP4 4
ADDRGP4 $208
ASGNP4
ADDRGP4 $210
JUMPV
LABELV $209
line 333
;333:	while(1) {
line 334
;334:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $212
line 335
;335:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $216
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $216
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $216
line 337
;336:				//								"models/players/characters/james/stroggs/lower_lily_red.skin"
;337:				Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $218
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 338
;338:			}
ADDRGP4 $217
JUMPV
LABELV $216
line 339
;339:			else {
line 341
;340:				//								"models/players/characters/james/lower_lily_red.skin"
;341:				Com_sprintf( filename, length, "models/players/%s%s/%s_%s_%s.%s", charactersFolder, modelName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $219
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 342
;342:			}
LABELV $217
line 343
;343:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $220
line 344
;344:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $220
line 346
;345:			}
;346:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $222
line 347
;347:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $225
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $225
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $225
line 349
;348:					//								"models/players/characters/james/stroggs/lower_red.skin"
;349:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 350
;350:				}
ADDRGP4 $223
JUMPV
LABELV $225
line 351
;351:				else {
line 353
;352:					//								"models/players/characters/james/lower_red.skin"
;353:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 354
;354:				}
line 355
;355:			}
ADDRGP4 $223
JUMPV
LABELV $222
line 356
;356:			else {
line 357
;357:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $229
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $229
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $229
line 359
;358:					//								"models/players/characters/james/stroggs/lower_lily.skin"
;359:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 360
;360:				}
ADDRGP4 $230
JUMPV
LABELV $229
line 361
;361:				else {
line 363
;362:					//								"models/players/characters/james/lower_lily.skin"
;363:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 364
;364:				}
LABELV $230
line 365
;365:			}
LABELV $223
line 366
;366:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $231
line 367
;367:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $231
line 369
;368:			}
;369:			if ( !teamName || !*teamName ) {
ADDRLP4 32
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $235
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $233
LABELV $235
line 370
;370:				break;
ADDRGP4 $214
JUMPV
LABELV $233
line 372
;371:			}
;372:		}
LABELV $213
line 334
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $212
LABELV $214
line 374
;373:		// if tried the heads folder first
;374:		if ( charactersFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $236
line 375
;375:			break;
ADDRGP4 $211
JUMPV
LABELV $236
line 377
;376:		}
;377:		charactersFolder = "characters/";
ADDRLP4 4
ADDRGP4 $238
ASGNP4
line 378
;378:	}
LABELV $210
line 333
ADDRGP4 $209
JUMPV
LABELV $211
line 380
;379:
;380:	return qfalse;
CNSTI4 0
RETI4
LABELV $195
endproc CG_FindClientModelFile 36 40
proc CG_FindClientHeadFile 36 40
line 389
;381:}
;382:
;383:
;384:/*
;385:==========================
;386:CG_FindClientHeadFile
;387:==========================
;388:*/
;389:static qboolean	CG_FindClientHeadFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *headModelName, const char *headSkinName, const char *base, const char *ext ) {
line 393
;390:	char *team, *headsFolder;
;391:	int i;
;392:
;393:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $240
line 394
;394:		switch ( ci->team ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $246
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $247
ADDRGP4 $243
JUMPV
LABELV $246
line 395
;395:			case TEAM_RED: {
line 396
;396:				team = "red";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 397
;397:				break;
ADDRGP4 $241
JUMPV
LABELV $247
line 399
;398:			}
;399:			case TEAM_BLUE: {
line 400
;400:				team = "blue";
ADDRLP4 8
ADDRGP4 $203
ASGNP4
line 401
;401:				break;
ADDRGP4 $241
JUMPV
LABELV $243
line 403
;402:			}
;403:			default: {
line 404
;404:				team = "default";
ADDRLP4 8
ADDRGP4 $120
ASGNP4
line 405
;405:				break;
line 408
;406:			}
;407:		}
;408:	}
ADDRGP4 $241
JUMPV
LABELV $240
line 409
;409:	else {
line 410
;410:		team = "default";
ADDRLP4 8
ADDRGP4 $120
ASGNP4
line 411
;411:	}
LABELV $241
line 414
;412:
;413:	// colored skins
;414:	if ( ci->coloredSkin && !Q_stricmp( ci->headSkinName, PM_SKIN ) ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $248
ADDRLP4 12
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $248
line 415
;415:		team = PM_SKIN;
ADDRLP4 8
ADDRGP4 $207
ASGNP4
line 416
;416:	}
LABELV $248
line 418
;417:
;418:	if ( headModelName[0] == '*' ) {
ADDRFP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $250
line 419
;419:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $252
ASGNP4
line 420
;420:		headModelName++;
ADDRFP4 16
ADDRFP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 421
;421:	}
ADDRGP4 $254
JUMPV
LABELV $250
line 422
;422:	else {
line 423
;423:		headsFolder = "";
ADDRLP4 4
ADDRGP4 $208
ASGNP4
line 424
;424:	}
ADDRGP4 $254
JUMPV
LABELV $253
line 425
;425:	while(1) {
line 426
;426:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $256
line 427
;427:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $260
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $260
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $260
line 428
;428:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s%s_%s.%s", headsFolder, headModelName, headSkinName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $262
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 429
;429:			}
ADDRGP4 $261
JUMPV
LABELV $260
line 430
;430:			else {
line 431
;431:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s_%s.%s", headsFolder, headModelName, headSkinName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $263
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 432
;432:			}
LABELV $261
line 433
;433:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $264
line 434
;434:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $239
JUMPV
LABELV $264
line 436
;435:			}
;436:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $266
line 437
;437:				if ( i == 0 &&  teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $269
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $269
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $269
line 438
;438:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 439
;439:				}
ADDRGP4 $267
JUMPV
LABELV $269
line 440
;440:				else {
line 441
;441:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 442
;442:				}
line 443
;443:			}
ADDRGP4 $267
JUMPV
LABELV $266
line 444
;444:			else {
line 445
;445:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $271
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $271
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $271
line 446
;446:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 447
;447:				}
ADDRGP4 $272
JUMPV
LABELV $271
line 448
;448:				else {
line 449
;449:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 450
;450:				}
LABELV $272
line 451
;451:			}
LABELV $267
line 452
;452:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $273
line 453
;453:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $239
JUMPV
LABELV $273
line 455
;454:			}
;455:			if ( !teamName || !*teamName ) {
ADDRLP4 32
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $277
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $275
LABELV $277
line 456
;456:				break;
ADDRGP4 $258
JUMPV
LABELV $275
line 458
;457:			}
;458:		}
LABELV $257
line 426
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $256
LABELV $258
line 460
;459:		// if tried the heads folder first
;460:		if ( headsFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $278
line 461
;461:			break;
ADDRGP4 $255
JUMPV
LABELV $278
line 463
;462:		}
;463:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $252
ASGNP4
line 464
;464:	}
LABELV $254
line 425
ADDRGP4 $253
JUMPV
LABELV $255
line 466
;465:
;466:	return qfalse;
CNSTI4 0
RETI4
LABELV $239
endproc CG_FindClientHeadFile 36 40
proc CG_RegisterClientSkin 80 32
line 475
;467:}
;468:
;469:
;470:/*
;471:==========================
;472:CG_RegisterClientSkin
;473:==========================
;474:*/
;475:static qboolean	CG_RegisterClientSkin( clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName ) {
line 500
;476:	char filename[MAX_QPATH];
;477:
;478:	/*
;479:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%slower_%s.skin", modelName, teamName, skinName );
;480:	ci->legsSkin = trap_R_RegisterSkin( filename );
;481:	if (!ci->legsSkin) {
;482:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%slower_%s.skin", modelName, teamName, skinName );
;483:		ci->legsSkin = trap_R_RegisterSkin( filename );
;484:		if (!ci->legsSkin) {
;485:			Com_Printf( "Leg skin load failure: %s\n", filename );
;486:		}
;487:	}
;488:
;489:
;490:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%supper_%s.skin", modelName, teamName, skinName );
;491:	ci->torsoSkin = trap_R_RegisterSkin( filename );
;492:	if (!ci->torsoSkin) {
;493:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%supper_%s.skin", modelName, teamName, skinName );
;494:		ci->torsoSkin = trap_R_RegisterSkin( filename );
;495:		if (!ci->torsoSkin) {
;496:			Com_Printf( "Torso skin load failure: %s\n", filename );
;497:		}
;498:	}
;499:	*/
;500:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "lower", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
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
ADDRGP4 $283
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 64
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $281
line 501
;501:		ci->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 502
;502:	}
LABELV $281
line 503
;503:	if (!ci->legsSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
NEI4 $285
line 504
;504:		Com_Printf( "Leg skin load failure: %s\n", filename );
ADDRGP4 $287
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 505
;505:	}
LABELV $285
line 507
;506:
;507:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "upper", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
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
ADDRGP4 $290
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 68
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $288
line 508
;508:		ci->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 509
;509:	}
LABELV $288
line 510
;510:	if (!ci->torsoSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
NEI4 $291
line 511
;511:		Com_Printf( "Torso skin load failure: %s\n", filename );
ADDRGP4 $293
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 512
;512:	}
LABELV $291
line 514
;513:
;514:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headModelName, headSkinName, "head", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 $296
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 72
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $294
line 515
;515:		ci->headSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 516
;516:	}
LABELV $294
line 517
;517:	if (!ci->headSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $297
line 518
;518:		Com_Printf( "Head skin load failure: %s\n", filename );
ADDRGP4 $299
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 519
;519:	}
LABELV $297
line 522
;520:
;521:	// if any skins failed to load
;522:	if ( !ci->legsSkin || !ci->torsoSkin || !ci->headSkin ) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $303
ADDRLP4 76
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
EQI4 $303
ADDRLP4 76
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $300
LABELV $303
line 523
;523:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $280
JUMPV
LABELV $300
line 525
;524:	}
;525:	return qtrue;
CNSTI4 1
RETI4
LABELV $280
endproc CG_RegisterClientSkin 80 32
proc CG_RegisterClientModelname 164 32
line 534
;526:}
;527:
;528:
;529:/*
;530:==========================
;531:CG_RegisterClientModelname
;532:==========================
;533:*/
;534:static qboolean CG_RegisterClientModelname( clientInfo_t *ci, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName, const char *teamName ) {
line 539
;535:	char	filename[MAX_QPATH];
;536:	const char		*headName;
;537:	char newTeamName[MAX_QPATH];
;538:
;539:	if ( headModelName[0] == '\0' ) {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $305
line 540
;540:		headName = modelName;
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
line 541
;541:	}
ADDRGP4 $306
JUMPV
LABELV $305
line 542
;542:	else {
line 543
;543:		headName = headModelName;
ADDRLP4 64
ADDRFP4 12
INDIRP4
ASGNP4
line 544
;544:	}
LABELV $306
line 545
;545:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $307
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 546
;546:	ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 547
;547:	if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
NEI4 $308
line 548
;548:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $310
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 549
;549:		ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 550
;550:		if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
NEI4 $311
line 551
;551:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $313
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 552
;552:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $311
line 554
;553:		}
;554:	}
LABELV $308
line 556
;555:
;556:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $314
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 557
;557:	ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 558
;558:	if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $315
line 559
;559:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $317
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 560
;560:		ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 561
;561:		if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $318
line 562
;562:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $313
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 563
;563:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $318
line 565
;564:		}
;565:	}
LABELV $315
line 567
;566:
;567:	if( headName[0] == '*' ) {
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $320
line 568
;568:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", &headModelName[1], &headModelName[1] );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $322
ARGP4
ADDRLP4 140
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 569
;569:	}
ADDRGP4 $321
JUMPV
LABELV $320
line 570
;570:	else {
line 571
;571:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $323
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 572
;572:	}
LABELV $321
line 573
;573:	ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 575
;574:	// if the head model could not be found and we didn't load from the heads folder try to load from there
;575:	if ( !ci->headModel && headName[0] != '*' ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
NEI4 $324
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $324
line 576
;576:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", headModelName, headModelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $322
ARGP4
ADDRLP4 144
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 577
;577:		ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 578
;578:	}
LABELV $324
line 579
;579:	if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
NEI4 $326
line 580
;580:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $313
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 581
;581:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $326
line 585
;582:	}
;583:
;584:	// if any skins failed to load, return failure
;585:	if ( !CG_RegisterClientSkin( ci, teamName, modelName, skinName, headName, headSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $328
line 586
;586:		if ( teamName && *teamName) {
ADDRLP4 148
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $330
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $330
line 587
;587:			Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", teamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $332
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 588
;588:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $333
line 589
;589:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_BLUETEAM_NAME);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $335
ARGP4
ADDRGP4 $336
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 590
;590:			}
ADDRGP4 $334
JUMPV
LABELV $333
line 591
;591:			else {
line 592
;592:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_REDTEAM_NAME);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $335
ARGP4
ADDRGP4 $337
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 593
;593:			}
LABELV $334
line 594
;594:			if ( !CG_RegisterClientSkin( ci, newTeamName, modelName, skinName, headName, headSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $331
line 595
;595:				Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", newTeamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $332
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 596
;596:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
line 598
;597:			}
;598:		} else {
LABELV $330
line 599
;599:			Com_Printf( "Failed to load skin file: %s : %s, %s : %s\n", modelName, skinName, headName, headSkinName );
ADDRGP4 $340
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 600
;600:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $331
line 602
;601:		}
;602:	}
LABELV $328
line 605
;603:
;604:	// load the animations
;605:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $341
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 606
;606:	if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $342
line 607
;607:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $344
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 608
;608:		if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $345
line 609
;609:			Com_Printf( "Failed to load animation file %s\n", filename );
ADDRGP4 $347
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 610
;610:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $345
line 612
;611:		}
;612:	}
LABELV $342
line 614
;613:
;614:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 152
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $348
line 615
;615:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 616
;616:	}
ADDRGP4 $349
JUMPV
LABELV $348
line 617
;617:	else if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "tga" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRGP4 $353
ARGP4
ADDRLP4 156
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $351
line 618
;618:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 160
INDIRI4
ASGNI4
line 619
;619:	}
LABELV $351
LABELV $349
line 621
;620:
;621:	if ( !ci->modelIcon ) {
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
CNSTI4 0
NEI4 $354
line 622
;622:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $354
line 625
;623:	}
;624:
;625:	return qtrue;
CNSTI4 1
RETI4
LABELV $304
endproc CG_RegisterClientModelname 164 32
proc CG_IsKnownModel 92 8
line 630
;626:}
;627:
;628:
;629:/* advance this function on any new pm skin added */
;630:static qboolean CG_IsKnownModel( const char *modelName ) {
line 632
;631:
;632:	if ( Q_stricmp(modelName, "anarki") &&
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $359
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $360
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $363
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $364
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $365
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $366
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $367
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $368
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $369
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $370
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $371
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $372
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $373
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $378
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $379
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $380
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $357
line 655
;633:		 Q_stricmp(modelName, "biker") &&
;634:		 Q_stricmp(modelName, "bitterman") &&
;635:		 Q_stricmp(modelName, "bones") &&
;636:		 Q_stricmp(modelName, "crash") &&
;637:		 Q_stricmp(modelName, "doom") &&
;638:		 Q_stricmp(modelName, "grunt") &&
;639:		 Q_stricmp(modelName, "hunter") &&
;640:		 Q_stricmp(modelName, "keel") &&
;641:		 Q_stricmp(modelName, "klesk") &&
;642:		 Q_stricmp(modelName, "lucy") &&
;643:		 Q_stricmp(modelName, "major") &&
;644:		 Q_stricmp(modelName, "mynx") &&
;645:		 Q_stricmp(modelName, "orbb") &&
;646:		 Q_stricmp(modelName, "ranger") &&
;647:		 Q_stricmp(modelName, "razor") &&
;648:		 Q_stricmp(modelName, "sarge") &&
;649:		 Q_stricmp(modelName, "slash") &&
;650:		 Q_stricmp(modelName, "sorlag") &&
;651:		 Q_stricmp(modelName, "tankjr") &&
;652:		 Q_stricmp(modelName, "uriel") &&
;653:		 Q_stricmp(modelName, "visor") &&
;654:		 Q_stricmp(modelName, "xaero") )
;655:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $356
JUMPV
LABELV $357
line 657
;656:	else
;657:		return qtrue;
CNSTI4 1
RETI4
LABELV $356
endproc CG_IsKnownModel 92 8
proc CG_ColorFromChar 8 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 666
;658:}
;659:
;660:
;661:/*
;662:====================
;663:CG_ColorFromString
;664:====================
;665:*/
;666:static void CG_ColorFromChar( char v, vec3_t color ) {
line 669
;667:	int val;
;668:
;669:	val = v - '0';
ADDRLP4 0
ADDRFP4 0
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
line 671
;670:
;671:	if ( val < 1 || val > 7 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $385
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $383
LABELV $385
line 672
;672:		VectorSet( color, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 673
;673:	} else {
ADDRGP4 $384
JUMPV
LABELV $383
line 674
;674:		VectorClear( color );
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 675
;675:		if ( val & 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $386
line 676
;676:			color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 677
;677:		}
LABELV $386
line 678
;678:		if ( val & 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $388
line 679
;679:			color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 680
;680:		}
LABELV $388
line 681
;681:		if ( val & 4 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $390
line 682
;682:			color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 683
;683:		}
LABELV $390
line 684
;684:	}
LABELV $384
line 685
;685:}
LABELV $382
endproc CG_ColorFromChar 8 0
proc CG_SetColorInfo 0 8
line 689
;686:
;687:
;688:static void CG_SetColorInfo( const char *color, clientInfo_t *info ) 
;689:{
line 690
;690:	VectorSet ( info->headColor, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTI4 1616
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1620
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1624
ADDP4
CNSTF4 1065353216
ASGNF4
line 691
;691:	VectorSet ( info->bodyColor, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTI4 1628
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1632
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1636
ADDP4
CNSTF4 1065353216
ASGNF4
line 692
;692:	VectorSet ( info->legsColor, 1.0f, 1.0f, 1.0f );
ADDRFP4 4
INDIRP4
CNSTI4 1640
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1644
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1648
ADDP4
CNSTF4 1065353216
ASGNF4
line 694
;693:	
;694:	if ( !color[0] )
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $393
line 695
;695:		return;
ADDRGP4 $392
JUMPV
LABELV $393
line 696
;696:	CG_ColorFromChar( color[0], info->headColor );
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 698
;697:	
;698:	if ( !color[1] )
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $395
line 699
;699:		return;
ADDRGP4 $392
JUMPV
LABELV $395
line 700
;700:	CG_ColorFromChar( color[1], info->bodyColor );
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1628
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 702
;701:
;702:	if ( !color[2] )
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $397
line 703
;703:		return;
ADDRGP4 $392
JUMPV
LABELV $397
line 704
;704:	CG_ColorFromChar( color[2], info->legsColor );
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1640
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 707
;705:
;706:	// override color1/color2 if specified
;707:	if ( !color[3] )
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $399
line 708
;708:		return;
ADDRGP4 $392
JUMPV
LABELV $399
line 709
;709:	CG_ColorFromChar( color[3], info->color1 );
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 711
;710:
;711:	if ( !color[4] )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $401
line 712
;712:		return;
ADDRGP4 $392
JUMPV
LABELV $401
line 713
;713:	CG_ColorFromChar( color[4], info->color2 );
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 714
;714:}
LABELV $392
endproc CG_SetColorInfo 0 8
bss
align 1
LABELV $404
skip 6
code
proc CG_GetTeamColors 8 12
line 717
;715:
;716:
;717:static const char *CG_GetTeamColors( const char *color, team_t team ) {
line 720
;718:	static char str[6];
;719:
;720:	Q_strncpyz( str, color, sizeof( str ) );
ADDRGP4 $404
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 722
;721:
;722:	switch ( team ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $410
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $408
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $409
ADDRGP4 $406
JUMPV
LABELV $408
line 723
;723:		case TEAM_RED:  replace1( '?', '1', str ); break;
CNSTI4 63
ARGI4
CNSTI4 49
ARGI4
ADDRGP4 $404
ARGP4
ADDRGP4 replace1
CALLI4
pop
ADDRGP4 $406
JUMPV
LABELV $409
line 724
;724:		case TEAM_BLUE: replace1( '?', '4', str ); break;
CNSTI4 63
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 $404
ARGP4
ADDRGP4 replace1
CALLI4
pop
ADDRGP4 $406
JUMPV
LABELV $410
line 725
;725:		case TEAM_FREE: replace1( '?', '7', str ); break;
CNSTI4 63
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 $404
ARGP4
ADDRGP4 replace1
CALLI4
pop
line 726
;726:		default: break;
LABELV $406
line 729
;727:    }
;728:
;729:	return str;
ADDRGP4 $404
RETP4
LABELV $403
endproc CG_GetTeamColors 8 12
proc CG_LoadClientInfo 404 24
line 741
;730:}
;731:
;732:
;733:/*
;734:===================
;735:CG_LoadClientInfo
;736:
;737:Load it now, taking the disk hits.
;738:This will usually be deferred to a safe time
;739:===================
;740:*/
;741:static void CG_LoadClientInfo( clientInfo_t *ci ) {
line 749
;742:	const char	*dir;
;743:	int			i, modelloaded;
;744:	const char	*s;
;745:	int			clientNum;
;746:	char		teamname[MAX_QPATH];
;747:	char		vertexlit[MAX_CVAR_VALUE_STRING];
;748:
;749:	teamname[0] = '\0';
ADDRLP4 276
CNSTI1 0
ASGNI1
line 752
;750:
;751:	// disable vertexlight for colored skins
;752:	trap_Cvar_VariableStringBuffer( "r_vertexlight", vertexlit, sizeof( vertexlit ) );
ADDRGP4 $412
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 753
;753:	if ( vertexlit[0] && vertexlit[0] != '0' ) {
ADDRLP4 340
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $413
ADDRLP4 340
INDIRI4
CNSTI4 48
EQI4 $413
line 754
;754:		trap_Cvar_Set( "r_vertexlight", "0" );
ADDRGP4 $412
ARGP4
ADDRGP4 $415
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 755
;755:	}
LABELV $413
line 769
;756:
;757:#ifdef MISSIONPACK
;758:	if( cgs.gametype >= GT_TEAM) {
;759:		if( ci->team == TEAM_BLUE ) {
;760:			Q_strncpyz(teamname, cg_blueTeamName.string, sizeof(teamname) );
;761:		} else {
;762:			Q_strncpyz(teamname, cg_redTeamName.string, sizeof(teamname) );
;763:		}
;764:	}
;765:	if( teamname[0] ) {
;766:		strcat( teamname, "/" );
;767:	}
;768:#endif
;769:	modelloaded = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 770
;770:	if ( !CG_RegisterClientModelname( ci, ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname ) ) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 348
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
NEI4 $416
line 771
;771:		if ( cg_buildScript.integer ) {
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $418
line 772
;772:			CG_Error( "CG_RegisterClientModelname( %s, %s, %s, %s %s ) failed", ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname );
ADDRGP4 $421
ARGP4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 773
;773:		}
LABELV $418
line 776
;774:
;775:		// fall back to default team name
;776:		if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $422
line 778
;777:			// keep skin name
;778:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $425
line 779
;779:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 276
ARGP4
ADDRGP4 $336
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 780
;780:			} else {
ADDRGP4 $426
JUMPV
LABELV $425
line 781
;781:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 276
ARGP4
ADDRGP4 $337
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 782
;782:			}
LABELV $426
line 783
;783:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, ci->skinName, DEFAULT_MODEL, ci->skinName, teamname ) ) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 $375
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 360
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $423
line 784
;784:				CG_Error( "DEFAULT_TEAM_MODEL / skin (%s/%s) failed to register", DEFAULT_MODEL, ci->skinName );
ADDRGP4 $429
ARGP4
ADDRGP4 $375
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 785
;785:			}
line 786
;786:		} else {
ADDRGP4 $423
JUMPV
LABELV $422
line 787
;787:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, "default", DEFAULT_MODEL, "default", teamname ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 352
ADDRGP4 $375
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 $120
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 360
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $430
line 788
;788:				CG_Error( "DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL );
ADDRGP4 $432
ARGP4
ADDRGP4 $375
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 789
;789:			}
LABELV $430
line 790
;790:		}
LABELV $423
line 791
;791:		modelloaded = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 792
;792:	}
LABELV $416
line 794
;793:
;794:	ci->newAnims = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 0
ASGNI4
line 795
;795:	if ( ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $433
line 798
;796:		orientation_t tag;
;797:		// if the torso model has the "tag_flag"
;798:		if ( trap_R_LerpTag( &tag, ci->torsoModel, 0, 0, 1, "tag_flag" ) ) {
ADDRLP4 352
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 $437
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
EQI4 $435
line 799
;799:			ci->newAnims = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 1
ASGNI4
line 800
;800:		}
LABELV $435
line 801
;801:	}
LABELV $433
line 804
;802:
;803:	// sounds
;804:	dir = ci->modelName;
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
line 806
;805:
;806:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $438
line 807
;807:		s = cg_customSoundNames[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 808
;808:		if ( !s ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $442
line 809
;809:			break;
ADDRGP4 $440
JUMPV
LABELV $442
line 811
;810:		}
;811:		ci->sounds[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 813
;812:		// if the model didn't load use the sounds of the default model
;813:		if (modelloaded) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $444
line 814
;814:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", dir, s + 1), qfalse );
ADDRGP4 $446
ARGP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 815
;815:		}
LABELV $444
line 816
;816:		if ( !ci->sounds[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $447
line 817
;817:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", DEFAULT_MODEL, s + 1), qfalse );
ADDRGP4 $446
ARGP4
ADDRGP4 $375
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 818
;818:		}
LABELV $447
line 819
;819:	}
LABELV $439
line 806
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $438
LABELV $440
line 821
;820:
;821:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 825
;822:
;823:	// reset any existing players and bodies, because they might be in bad
;824:	// frames for this new model
;825:	clientNum = ci - cgs.clientinfo;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+40996
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1652
DIVI4
ASGNI4
line 826
;826:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $450
line 827
;827:		if ( cg_entities[i].currentState.clientNum == clientNum
ADDRLP4 0
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+168
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $454
ADDRLP4 0
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $454
line 828
;828:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
line 829
;829:			CG_ResetPlayerEntity( &cg_entities[i] );
ADDRLP4 0
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 830
;830:		}
LABELV $454
line 831
;831:	}
LABELV $451
line 826
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $450
line 834
;832:
;833:	// restore vertexlight mode
;834:	if ( vertexlit[0] && vertexlit[0] != '0' ) {
ADDRLP4 352
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $458
ADDRLP4 352
INDIRI4
CNSTI4 48
EQI4 $458
line 835
;835:		trap_Cvar_Set( "r_vertexlight", vertexlit );
ADDRGP4 $412
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 836
;836:	}
LABELV $458
line 837
;837:}
LABELV $411
endproc CG_LoadClientInfo 404 24
proc CG_CopyClientInfoModel 0 12
line 845
;838:
;839:
;840:/*
;841:======================
;842:CG_CopyClientInfoModel
;843:======================
;844:*/
;845:static void CG_CopyClientInfoModel( const clientInfo_t *from, clientInfo_t *to ) {
line 846
;846:	VectorCopy( from->headOffset, to->headOffset );
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
INDIRB
ASGNB 12
line 847
;847:	to->footsteps = from->footsteps;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 848
;848:	to->gender = from->gender;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 850
;849:
;850:	to->legsModel = from->legsModel;
ADDRFP4 4
INDIRP4
CNSTI4 420
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 851
;851:	to->legsSkin = from->legsSkin;
ADDRFP4 4
INDIRP4
CNSTI4 424
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 852
;852:	to->torsoModel = from->torsoModel;
ADDRFP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 853
;853:	to->torsoSkin = from->torsoSkin;
ADDRFP4 4
INDIRP4
CNSTI4 432
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 854
;854:	to->headModel = from->headModel;
ADDRFP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 855
;855:	to->headSkin = from->headSkin;
ADDRFP4 4
INDIRP4
CNSTI4 440
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 856
;856:	to->modelIcon = from->modelIcon;
ADDRFP4 4
INDIRP4
CNSTI4 444
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 858
;857:
;858:	to->newAnims = from->newAnims;
ADDRFP4 4
INDIRP4
CNSTI4 388
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ASGNI4
line 859
;859:	to->coloredSkin = from->coloredSkin;
ADDRFP4 4
INDIRP4
CNSTI4 1612
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
ASGNI4
line 861
;860:
;861:	memcpy( to->animations, from->animations, sizeof( to->animations ) );
ADDRFP4 4
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ARGP4
CNSTI4 1036
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 862
;862:	memcpy( to->sounds, from->sounds, sizeof( to->sounds ) );
ADDRFP4 4
INDIRP4
CNSTI4 1484
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 863
;863:}
LABELV $460
endproc CG_CopyClientInfoModel 0 12
proc CG_ScanForExistingClientInfo 24 8
line 871
;864:
;865:
;866:/*
;867:======================
;868:CG_ScanForExistingClientInfo
;869:======================
;870:*/
;871:static qboolean CG_ScanForExistingClientInfo( clientInfo_t *ci ) {
line 875
;872:	int		i;
;873:	clientInfo_t	*match;
;874:
;875:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $465
JUMPV
LABELV $462
line 876
;876:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 877
;877:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $468
line 878
;878:			continue;
ADDRGP4 $463
JUMPV
LABELV $468
line 880
;879:		}
;880:		if ( match->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $470
line 881
;881:			continue;
ADDRGP4 $463
JUMPV
LABELV $470
line 883
;882:		}
;883:		if ( !Q_stricmp( ci->modelName, match->modelName )
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $472
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $472
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $472
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $472
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $475
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $472
LABELV $475
line 889
;884:			&& !Q_stricmp( ci->skinName, match->skinName )
;885:			&& !Q_stricmp( ci->headModelName, match->headModelName )
;886:			&& !Q_stricmp( ci->headSkinName, match->headSkinName ) 
;887:			//&& !Q_stricmp( ci->blueTeam, match->blueTeam ) 
;888:			//&& !Q_stricmp( ci->redTeam, match->redTeam )
;889:			&& (cgs.gametype < GT_TEAM || ci->team == match->team) ) {
line 892
;890:			// this clientinfo is identical, so use it's handles
;891:
;892:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 894
;893:
;894:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 896
;895:
;896:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $461
JUMPV
LABELV $472
line 898
;897:		}
;898:	}
LABELV $463
line 875
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $465
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $462
line 901
;899:
;900:	// nothing matches, so defer the load
;901:	return qfalse;
CNSTI4 0
RETI4
LABELV $461
endproc CG_ScanForExistingClientInfo 24 8
proc CG_SetDeferredClientInfo 20 8
line 913
;902:}
;903:
;904:
;905:/*
;906:======================
;907:CG_SetDeferredClientInfo
;908:
;909:We aren't going to load it now, so grab some other
;910:client's info to use until we have some spare time.
;911:======================
;912:*/
;913:static void CG_SetDeferredClientInfo( clientInfo_t *ci ) {
line 919
;914:	int		i;
;915:	clientInfo_t	*match;
;916:
;917:	// if someone else is already the same models and skins we
;918:	// can just load the client info
;919:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $480
JUMPV
LABELV $477
line 920
;920:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 921
;921:		if ( !match->infoValid || match->deferred ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $485
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $483
LABELV $485
line 922
;922:			continue;
ADDRGP4 $478
JUMPV
LABELV $483
line 924
;923:		}
;924:		if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $490
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $490
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $486
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
EQI4 $486
LABELV $490
line 928
;925:			 Q_stricmp( ci->modelName, match->modelName ) ||
;926://			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;927://			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;928:			 (cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 929
;929:			continue;
ADDRGP4 $478
JUMPV
LABELV $486
line 932
;930:		}
;931:		// just load the real info cause it uses the same models and skins
;932:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 933
;933:		return;
ADDRGP4 $476
JUMPV
LABELV $478
line 919
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $480
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $477
line 937
;934:	}
;935:
;936:	// if we are in teamplay, only grab a model if the skin is correct
;937:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $491
line 938
;938:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $497
JUMPV
LABELV $494
line 939
;939:			match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 940
;940:			if ( !match->infoValid || match->deferred ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $502
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $500
LABELV $502
line 941
;941:				continue;
ADDRGP4 $495
JUMPV
LABELV $500
line 943
;942:			}
;943:			if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $506
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $503
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
EQI4 $503
LABELV $506
line 944
;944:				(cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 945
;945:				continue;
ADDRGP4 $495
JUMPV
LABELV $503
line 948
;946:			}
;947://freeze
;948:			if ( ci->team != TEAM_SPECTATOR && ci->team != match->team ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 3
EQI4 $507
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
EQI4 $507
line 949
;949:				continue;
ADDRGP4 $495
JUMPV
LABELV $507
line 952
;950:			}
;951://freeze
;952:			ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 1
ASGNI4
line 953
;953:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 954
;954:			return;
ADDRGP4 $476
JUMPV
LABELV $495
line 938
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $497
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $494
line 960
;955:		}
;956:		// load the full model, because we don't ever want to show
;957:		// an improper team skin.  This will cause a hitch for the first
;958:		// player, when the second enters.  Combat shouldn't be going on
;959:		// yet, so it shouldn't matter
;960:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 961
;961:		return;
ADDRGP4 $476
JUMPV
LABELV $491
line 965
;962:	}
;963:
;964:	// find the first valid clientinfo and grab its stuff
;965:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $512
JUMPV
LABELV $509
line 966
;966:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 967
;967:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $515
line 968
;968:			continue;
ADDRGP4 $510
JUMPV
LABELV $515
line 971
;969:		}
;970:
;971:		ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 1
ASGNI4
line 972
;972:		CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 973
;973:		return;
ADDRGP4 $476
JUMPV
LABELV $510
line 965
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $512
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $509
line 977
;974:	}
;975:
;976:	// we should never get here...
;977:	CG_Printf( "CG_SetDeferredClientInfo: no valid clients!\n" );
ADDRGP4 $517
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 979
;978:
;979:	CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 980
;980:}
LABELV $476
endproc CG_SetDeferredClientInfo 20 8
proc CG_SetSkinAndModel 188 12
line 991
;981:
;982:
;983:static void CG_SetSkinAndModel( clientInfo_t *newInfo,
;984:		clientInfo_t *curInfo,
;985:		const char *infomodel,
;986:		qboolean allowNativeModel,
;987:		int clientNum, int myClientNum,
;988:		team_t myTeam, qboolean setColor,
;989:		char *modelName, int modelNameSize,
;990:		char *skinName, int skinNameSize ) 
;991:{
line 999
;992:	char modelStr[ MAX_QPATH ];
;993:	char newSkin[ MAX_QPATH ];
;994:	char *skin, *slash;
;995:	qboolean	pm_model;
;996:	team_t		team;
;997:	const char	*colors;
;998:	
;999:	team = newInfo->team;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
line 1000
;1000:	pm_model = ( Q_stricmp( cg_enemyModel.string, PM_SKIN ) == 0 ) ? qtrue : qfalse;
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $521
ADDRLP4 148
CNSTI4 1
ASGNI4
ADDRGP4 $522
JUMPV
LABELV $521
ADDRLP4 148
CNSTI4 0
ASGNI4
LABELV $522
ADDRLP4 8
ADDRLP4 148
INDIRI4
ASGNI4
line 1002
;1001:
;1002:	if ( cg_forceModel.integer || cg_enemyModel.string[0] || cg_teamModel.string[0] )
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
NEI4 $529
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $529
ADDRGP4 cg_teamModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $523
LABELV $529
line 1003
;1003:	{
line 1004
;1004:		if ( cgs.gametype >= GT_TEAM )
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $530
line 1005
;1005:		{
line 1007
;1006:			// enemy model
;1007:			if ( cg_enemyModel.string[0] && team != myTeam && team != TEAM_SPECTATOR ) {
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $533
ADDRLP4 156
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRFP4 24
INDIRI4
EQI4 $533
ADDRLP4 156
INDIRI4
CNSTI4 3
EQI4 $533
line 1008
;1008:				if ( pm_model )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $536
line 1009
;1009:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $537
JUMPV
LABELV $536
line 1011
;1010:				else
;1011:					Q_strncpyz( modelName, cg_enemyModel.string, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $537
line 1013
;1012:
;1013:				skin = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
ASGNP4
line 1015
;1014:				// force skin
;1015:				strcpy( newSkin, PM_SKIN );
ADDRLP4 16
ARGP4
ADDRGP4 $207
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1016
;1016:				if ( skin )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $539
line 1017
;1017:					*skin = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $539
line 1019
;1018:
;1019:				if ( pm_model && !CG_IsKnownModel( modelName ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $541
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $541
line 1021
;1020:					// revert to default model if specified skin is not known
;1021:					Q_strncpyz( modelName, "sarge", modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1022
;1022:				}
LABELV $541
line 1023
;1023:				Q_strncpyz( skinName, newSkin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1025
;1024:
;1025:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $524
line 1026
;1026:					if ( cg_enemyColors.string[0] && myTeam != TEAM_SPECTATOR ) // free-fly?
ADDRGP4 cg_enemyColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $545
ADDRFP4 24
INDIRI4
CNSTI4 3
EQI4 $545
line 1027
;1027:						colors = CG_GetTeamColors( cg_enemyColors.string, newInfo->team );
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 168
INDIRP4
ASGNP4
ADDRGP4 $546
JUMPV
LABELV $545
line 1029
;1028:					else
;1029:						colors = CG_GetTeamColors( "???", newInfo->team );
ADDRGP4 $549
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 172
INDIRP4
ASGNP4
LABELV $546
line 1031
;1030:
;1031:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1032
;1032:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1033
;1033:				}
line 1035
;1034:
;1035:			} else if ( cg_teamModel.string[0] && team == myTeam && team != TEAM_SPECTATOR && clientNum != myClientNum ) {
ADDRGP4 $524
JUMPV
LABELV $533
ADDRGP4 cg_teamModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $550
ADDRLP4 160
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 160
INDIRI4
ADDRFP4 24
INDIRI4
NEI4 $550
ADDRLP4 160
INDIRI4
CNSTI4 3
EQI4 $550
ADDRFP4 16
INDIRI4
ADDRFP4 20
INDIRI4
EQI4 $550
line 1037
;1036:				// teammodel
;1037:				pm_model = ( Q_stricmp( cg_teamModel.string, PM_SKIN ) == 0 ) ? qtrue : qfalse;
ADDRGP4 cg_teamModel+16
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $555
ADDRLP4 164
CNSTI4 1
ASGNI4
ADDRGP4 $556
JUMPV
LABELV $555
ADDRLP4 164
CNSTI4 0
ASGNI4
LABELV $556
ADDRLP4 8
ADDRLP4 164
INDIRI4
ASGNI4
line 1039
;1038:
;1039:				if ( pm_model )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $557
line 1040
;1040:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $558
JUMPV
LABELV $557
line 1042
;1041:				else
;1042:					Q_strncpyz( modelName, cg_teamModel.string, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_teamModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $558
line 1044
;1043:
;1044:				skin = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 172
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 172
INDIRP4
ASGNP4
line 1046
;1045:				// force skin
;1046:				strcpy( newSkin, PM_SKIN );
ADDRLP4 16
ARGP4
ADDRGP4 $207
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1047
;1047:				if ( skin )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $560
line 1048
;1048:					*skin = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $560
line 1050
;1049:
;1050:				if ( pm_model && !CG_IsKnownModel( modelName ) ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $562
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $562
line 1052
;1051:					// revert to default model if specified skin is not known
;1052:					Q_strncpyz( modelName, "sarge", modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1053
;1053:				}
LABELV $562
line 1054
;1054:				Q_strncpyz( skinName, newSkin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1056
;1055:
;1056:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $524
line 1057
;1057:					if ( cg_teamColors.string[0] && myTeam != TEAM_SPECTATOR ) // free-fly?
ADDRGP4 cg_teamColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $566
ADDRFP4 24
INDIRI4
CNSTI4 3
EQI4 $566
line 1058
;1058:						colors = CG_GetTeamColors( cg_teamColors.string, newInfo->team );
ADDRGP4 cg_teamColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 180
INDIRP4
ASGNP4
ADDRGP4 $567
JUMPV
LABELV $566
line 1060
;1059:					else
;1060:						colors = CG_GetTeamColors( "???", newInfo->team );
ADDRGP4 $549
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 184
INDIRP4
ASGNP4
LABELV $567
line 1062
;1061:
;1062:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1063
;1063:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1064
;1064:				}
line 1066
;1065:
;1066:			} else {
ADDRGP4 $524
JUMPV
LABELV $550
line 1068
;1067:				// forcemodel etc.
;1068:				if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $570
line 1070
;1069:
;1070:					trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $573
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1071
;1071:					if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
ADDRLP4 84
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 164
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $574
line 1072
;1072:						skin = "default";
ADDRLP4 12
ADDRGP4 $120
ASGNP4
line 1073
;1073:					} else {
ADDRGP4 $575
JUMPV
LABELV $574
line 1074
;1074:						*skin++ = '\0';
ADDRLP4 168
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 168
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI1 0
ASGNI1
line 1075
;1075:					}
LABELV $575
line 1077
;1076:
;1077:					Q_strncpyz( skinName, skin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1078
;1078:					Q_strncpyz( modelName, modelStr, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1080
;1079:
;1080:				} else {
ADDRGP4 $524
JUMPV
LABELV $570
line 1081
;1081:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1082
;1082:					slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
ASGNP4
line 1083
;1083:					if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $576
line 1084
;1084:						Q_strncpyz( skinName, "default", skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1085
;1085:					} else {
ADDRGP4 $524
JUMPV
LABELV $576
line 1086
;1086:						Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1087
;1087:						*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1088
;1088:					}
line 1089
;1089:				}
line 1090
;1090:			}
line 1091
;1091:		} else { // not team game
ADDRGP4 $524
JUMPV
LABELV $530
line 1093
;1092:
;1093:			if ( pm_model && myClientNum != clientNum && cgs.gametype != GT_SINGLE_PLAYER ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $578
ADDRFP4 20
INDIRI4
ADDRFP4 16
INDIRI4
EQI4 $578
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 2
EQI4 $578
line 1094
;1094:				Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1097
;1095:
;1096:				// strip skin name from model name
;1097:				slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1098
;1098:				if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $581
line 1099
;1099:					Q_strncpyz( skinName, PM_SKIN, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1100
;1100:				} else {
ADDRGP4 $582
JUMPV
LABELV $581
line 1101
;1101:					Q_strncpyz( skinName, PM_SKIN, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1102
;1102:					*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1103
;1103:				}
LABELV $582
line 1105
;1104:
;1105:				if ( !CG_IsKnownModel( modelName ) )
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $583
line 1106
;1106:					Q_strncpyz( modelName, "sarge", modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $583
line 1108
;1107:
;1108:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $524
line 1109
;1109:					colors = CG_GetTeamColors( cg_enemyColors.string, newInfo->team );
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 164
INDIRP4
ASGNP4
line 1110
;1110:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1111
;1111:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1112
;1112:				}
line 1114
;1113:
;1114:			} else if ( cg_enemyModel.string[0] && myClientNum != clientNum && !allowNativeModel && cgs.gametype != GT_SINGLE_PLAYER ) {
ADDRGP4 $524
JUMPV
LABELV $578
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $588
ADDRFP4 20
INDIRI4
ADDRFP4 16
INDIRI4
EQI4 $588
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $588
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 2
EQI4 $588
line 1116
;1115:
;1116:				Q_strncpyz( modelName, cg_enemyModel.string, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1118
;1117:
;1118:				slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1119
;1119:				if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $593
line 1120
;1120:					Q_strncpyz( skinName, PM_SKIN, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1121
;1121:				} else {
ADDRGP4 $594
JUMPV
LABELV $593
line 1122
;1122:					Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1123
;1123:					*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1124
;1124:				}
LABELV $594
line 1126
;1125:
;1126:				if ( setColor ) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $524
line 1127
;1127:					colors = CG_GetTeamColors( cg_enemyColors.string, newInfo->team );
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 160
INDIRP4
ASGNP4
line 1128
;1128:					CG_SetColorInfo( colors, newInfo );
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1129
;1129:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1130
;1130:				}
line 1131
;1131:			} else { // forcemodel, etc.
ADDRGP4 $524
JUMPV
LABELV $588
line 1132
;1132:				if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $598
line 1134
;1133:
;1134:					trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $573
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1135
;1135:					if ( ( skin = strchr( modelStr, '/' ) ) == NULL ) {
ADDRLP4 84
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 156
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $601
line 1136
;1136:						skin = "default";
ADDRLP4 12
ADDRGP4 $120
ASGNP4
line 1137
;1137:					} else {
ADDRGP4 $602
JUMPV
LABELV $601
line 1138
;1138:						*skin++ = '\0';
ADDRLP4 160
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI1 0
ASGNI1
line 1139
;1139:					}
LABELV $602
line 1141
;1140:
;1141:					Q_strncpyz( skinName, skin, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1142
;1142:					Q_strncpyz( modelName, modelStr, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1143
;1143:				} else {
ADDRGP4 $524
JUMPV
LABELV $598
line 1144
;1144:					Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1145
;1145:						slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1146
;1146:					if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $603
line 1148
;1147:						// modelName didn not include a skin name
;1148:						Q_strncpyz( skinName, "default", skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1149
;1149:					} else {
ADDRGP4 $524
JUMPV
LABELV $603
line 1150
;1150:						Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1152
;1151:						// truncate modelName
;1152:						*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1153
;1153:					}
line 1154
;1154:				}
line 1155
;1155:			}
line 1156
;1156:		}
line 1157
;1157:	}
ADDRGP4 $524
JUMPV
LABELV $523
line 1159
;1158:	else // !cg_forcemodel && !cg_enemyModel && !cg_teamModel
;1159:	{
line 1160
;1160:		Q_strncpyz( modelName, infomodel, modelNameSize );
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1161
;1161:		slash = strchr( modelName, '/' );
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1162
;1162:		if ( !slash ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $605
line 1164
;1163:			// modelName didn not include a skin name
;1164:			Q_strncpyz( skinName, "default", skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1165
;1165:		} else {
ADDRGP4 $606
JUMPV
LABELV $605
line 1166
;1166:			Q_strncpyz( skinName, slash + 1, skinNameSize );
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1168
;1167:			// truncate modelName
;1168:			*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1169
;1169:		}
LABELV $606
line 1170
;1170:	}
LABELV $524
line 1171
;1171:}
LABELV $518
endproc CG_SetSkinAndModel 188 12
export CG_NewClientInfo
proc CG_NewClientInfo 1788 48
line 1179
;1172:
;1173:
;1174:/*
;1175:======================
;1176:CG_NewClientInfo
;1177:======================
;1178:*/
;1179:void CG_NewClientInfo( int clientNum ) {
line 1193
;1180:	clientInfo_t *ci;
;1181:	clientInfo_t newInfo;
;1182:	const char	*configstring;
;1183:	const char	*v;
;1184:
;1185:	// for colored skins
;1186:	qboolean	allowNativeModel;
;1187:	int			can_defer;
;1188:	int			myClientNum;
;1189:	team_t		myTeam;
;1190:	team_t		team;
;1191:	int			len;
;1192:
;1193:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 1668
ADDRFP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1195
;1194:
;1195:	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1688
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1656
ADDRLP4 1688
INDIRP4
ASGNP4
line 1196
;1196:	if ( !configstring[0] ) {
ADDRLP4 1656
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $609
line 1197
;1197:		memset( ci, 0, sizeof( *ci ) );
ADDRLP4 1668
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1652
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1198
;1198:		return;	// player just left
ADDRGP4 $607
JUMPV
LABELV $609
line 1201
;1199:	}
;1200:
;1201:	if ( cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $611
line 1202
;1202:		myClientNum = cg.snap->ps.clientNum;
ADDRLP4 1672
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1203
;1203:		myTeam = cgs.clientinfo[ myClientNum ].team;
ADDRLP4 1664
ADDRLP4 1672
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
line 1204
;1204:	} else {
ADDRGP4 $612
JUMPV
LABELV $611
line 1205
;1205:		myClientNum = cg.clientNum;
ADDRLP4 1672
ADDRGP4 cg+4
INDIRI4
ASGNI4
line 1206
;1206:		myTeam = TEAM_SPECTATOR;
ADDRLP4 1664
CNSTI4 3
ASGNI4
line 1207
;1207:	}
LABELV $612
line 1210
;1208:
;1209:	// "join" team if spectating
;1210:	if ( myTeam == TEAM_SPECTATOR && cg.snap ) {
ADDRLP4 1664
INDIRI4
CNSTI4 3
NEI4 $618
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $618
line 1211
;1211:		myTeam = cg.snap->ps.persistant[ PERS_TEAM ];
ADDRLP4 1664
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 1212
;1212:	}
LABELV $618
line 1214
;1213:
;1214:	allowNativeModel = qfalse;
ADDRLP4 1676
CNSTI4 0
ASGNI4
line 1215
;1215:	if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $622
line 1216
;1216:		if ( !cg.snap || ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_FREE && cg.snap->ps.clientNum == clientNum ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $630
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 0
NEI4 $625
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $625
LABELV $630
line 1217
;1217:			if ( cg.demoPlayback || ( cg.snap && cg.snap->ps.pm_flags & PMF_FOLLOW ) ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $636
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $631
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $631
LABELV $636
line 1218
;1218:				allowNativeModel = qtrue;
ADDRLP4 1676
CNSTI4 1
ASGNI4
line 1219
;1219:			}
LABELV $631
line 1220
;1220:		}
LABELV $625
line 1221
;1221:	}
LABELV $622
line 1225
;1222:
;1223:	// build into a temp buffer so the defer checks can use
;1224:	// the old value
;1225:	memset( &newInfo, 0, sizeof( newInfo ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1652
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1228
;1226:
;1227:	// isolate the player's name
;1228:	v = Info_ValueForKey( configstring, "n" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $637
ARGP4
ADDRLP4 1692
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1692
INDIRP4
ASGNP4
line 1229
;1229:	Q_strncpyz( newInfo.name, v, sizeof( newInfo.name ) );
ADDRLP4 0+4
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1232
;1230:
;1231:	// team
;1232:	v = Info_ValueForKey( configstring, "t" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $640
ARGP4
ADDRLP4 1696
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1696
INDIRP4
ASGNP4
line 1233
;1233:	team = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1700
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1660
ADDRLP4 1700
INDIRI4
ASGNI4
line 1234
;1234:	if ( (unsigned) team > TEAM_NUM_TEAMS ) {
ADDRLP4 1660
INDIRI4
CVIU4 4
CNSTU4 4
LEU4 $641
line 1235
;1235:		team = TEAM_SPECTATOR;
ADDRLP4 1660
CNSTI4 3
ASGNI4
line 1236
;1236:	}
LABELV $641
line 1237
;1237:	newInfo.team = team;
ADDRLP4 0+36
ADDRLP4 1660
INDIRI4
ASGNI4
line 1240
;1238:
;1239:	// colors
;1240:	v = Info_ValueForKey( configstring, "c1" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $644
ARGP4
ADDRLP4 1704
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1704
INDIRP4
ASGNP4
line 1241
;1241:	CG_ColorFromChar( v[0], newInfo.color1 );
ADDRLP4 1652
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+44
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 1243
;1242:
;1243:	v = Info_ValueForKey( configstring, "c2" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $646
ARGP4
ADDRLP4 1708
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1708
INDIRP4
ASGNP4
line 1244
;1244:	CG_ColorFromChar( v[0], newInfo.color2 );
ADDRLP4 1652
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+56
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 1246
;1245:
;1246:	VectorSet( newInfo.headColor, 1.0, 1.0, 1.0 );
ADDRLP4 0+1616
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1616+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1616+8
CNSTF4 1065353216
ASGNF4
line 1247
;1247:	VectorSet( newInfo.bodyColor, 1.0, 1.0, 1.0 );
ADDRLP4 0+1628
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1628+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1628+8
CNSTF4 1065353216
ASGNF4
line 1248
;1248:	VectorSet( newInfo.legsColor, 1.0, 1.0, 1.0 );
ADDRLP4 0+1640
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1640+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1640+8
CNSTF4 1065353216
ASGNF4
line 1251
;1249:
;1250:	// bot skill
;1251:	v = Info_ValueForKey( configstring, "skill" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $663
ARGP4
ADDRLP4 1712
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1712
INDIRP4
ASGNP4
line 1252
;1252:	newInfo.botSkill = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1716
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+40
ADDRLP4 1716
INDIRI4
ASGNI4
line 1255
;1253:
;1254:	// handicap
;1255:	v = Info_ValueForKey( configstring, "hc" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $665
ARGP4
ADDRLP4 1720
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1720
INDIRP4
ASGNP4
line 1256
;1256:	newInfo.handicap = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1724
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+88
ADDRLP4 1724
INDIRI4
ASGNI4
line 1259
;1257:
;1258:	// wins
;1259:	v = Info_ValueForKey( configstring, "w" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $667
ARGP4
ADDRLP4 1728
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1728
INDIRP4
ASGNP4
line 1260
;1260:	newInfo.wins = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1732
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+92
ADDRLP4 1732
INDIRI4
ASGNI4
line 1263
;1261:
;1262:	// losses
;1263:	v = Info_ValueForKey( configstring, "l" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $669
ARGP4
ADDRLP4 1736
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1736
INDIRP4
ASGNP4
line 1264
;1264:	newInfo.losses = atoi( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1740
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+96
ADDRLP4 1740
INDIRI4
ASGNI4
line 1267
;1265:
;1266:	// always apply team colors [4] and [5] if specified, this will work in non-team games too
;1267:	if ( cg_teamColors.string[0] && team != TEAM_SPECTATOR ) {
ADDRGP4 cg_teamColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $671
ADDRLP4 1660
INDIRI4
CNSTI4 3
EQI4 $671
line 1268
;1268:		if ( allowNativeModel || ( ( team == TEAM_RED || team == TEAM_BLUE ) && team == myTeam && ( clientNum != myClientNum || cg.demoPlayback ) ) ) {
ADDRLP4 1676
INDIRI4
CNSTI4 0
NEI4 $679
ADDRLP4 1660
INDIRI4
CNSTI4 1
EQI4 $678
ADDRLP4 1660
INDIRI4
CNSTI4 2
NEI4 $674
LABELV $678
ADDRLP4 1660
INDIRI4
ADDRLP4 1664
INDIRI4
NEI4 $674
ADDRFP4 0
INDIRI4
ADDRLP4 1672
INDIRI4
NEI4 $679
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $674
LABELV $679
line 1269
;1269:			v = CG_GetTeamColors( cg_teamColors.string, team );
ADDRGP4 cg_teamColors+16
ARGP4
ADDRLP4 1660
INDIRI4
ARGI4
ADDRLP4 1748
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1748
INDIRP4
ASGNP4
line 1270
;1270:			len = strlen( v );
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1752
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1684
ADDRLP4 1752
INDIRI4
ASGNI4
line 1271
;1271:			if ( len >= 4 )
ADDRLP4 1684
INDIRI4
CNSTI4 4
LTI4 $681
line 1272
;1272:				CG_ColorFromChar( v[3], newInfo.color1 );
ADDRLP4 1652
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+44
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
LABELV $681
line 1273
;1273:			if ( len >= 5 )
ADDRLP4 1684
INDIRI4
CNSTI4 5
LTI4 $684
line 1274
;1274:				CG_ColorFromChar( v[4], newInfo.color2 );
ADDRLP4 1652
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+56
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
LABELV $684
line 1275
;1275:		}
LABELV $674
line 1276
;1276:	}
LABELV $671
line 1279
;1277:
;1278:	// team task
;1279:	v = Info_ValueForKey( configstring, "tt" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $687
ARGP4
ADDRLP4 1744
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1744
INDIRP4
ASGNP4
line 1280
;1280:	newInfo.teamTask = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1748
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+100
ADDRLP4 1748
INDIRI4
ASGNI4
line 1283
;1281:
;1282:	// team leader
;1283:	v = Info_ValueForKey( configstring, "tl" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $689
ARGP4
ADDRLP4 1752
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1752
INDIRP4
ASGNP4
line 1284
;1284:	newInfo.teamLeader = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1756
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+104
ADDRLP4 1756
INDIRI4
ASGNI4
line 1287
;1285:
;1286:	// model
;1287:	v = Info_ValueForKey( configstring, "model" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $573
ARGP4
ADDRLP4 1760
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1760
INDIRP4
ASGNP4
line 1288
;1288:	CG_SetSkinAndModel( &newInfo, ci, v, allowNativeModel, clientNum, myClientNum, myTeam, qtrue, 
ADDRLP4 0
ARGP4
ADDRLP4 1668
INDIRP4
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1676
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1672
INDIRI4
ARGI4
ADDRLP4 1664
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0+128
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0+192
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 CG_SetSkinAndModel
CALLV
pop
line 1292
;1289:		newInfo.modelName, sizeof( newInfo.modelName ),	newInfo.skinName, sizeof( newInfo.skinName ) );
;1290:
;1291:	// head model
;1292:	v = Info_ValueForKey( configstring, "hmodel" );
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $695
ARGP4
ADDRLP4 1764
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1764
INDIRP4
ASGNP4
line 1293
;1293:	CG_SetSkinAndModel( &newInfo, ci, v, allowNativeModel, clientNum, myClientNum, myTeam, qfalse, 
ADDRLP4 0
ARGP4
ADDRLP4 1668
INDIRP4
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1676
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1672
INDIRI4
ARGI4
ADDRLP4 1664
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0+256
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0+320
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 CG_SetSkinAndModel
CALLV
pop
line 1297
;1294:		newInfo.headModelName, sizeof( newInfo.headModelName ),	newInfo.headSkinName, sizeof( newInfo.headSkinName ) );
;1295:
;1296:	// allow deferred load at some conditions
;1297:	can_defer = cg_deferPlayers.integer == 2 || ( cg_deferPlayers.integer == 1 && myTeam != TEAM_SPECTATOR && team == TEAM_SPECTATOR );
ADDRGP4 cg_deferPlayers+12
INDIRI4
CNSTI4 2
EQI4 $705
ADDRGP4 cg_deferPlayers+12
INDIRI4
CNSTI4 1
NEI4 $703
ADDRLP4 1664
INDIRI4
CNSTI4 3
EQI4 $703
ADDRLP4 1660
INDIRI4
CNSTI4 3
NEI4 $703
LABELV $705
ADDRLP4 1768
CNSTI4 1
ASGNI4
ADDRGP4 $704
JUMPV
LABELV $703
ADDRLP4 1768
CNSTI4 0
ASGNI4
LABELV $704
ADDRLP4 1680
ADDRLP4 1768
INDIRI4
ASGNI4
line 1301
;1298:
;1299:	// scan for an existing clientinfo that matches this modelname
;1300:	// so we can avoid loading checks if possible
;1301:	if ( !CG_ScanForExistingClientInfo( &newInfo ) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1772
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 1772
INDIRI4
CNSTI4 0
NEI4 $706
line 1304
;1302:		qboolean	forceDefer;
;1303:
;1304:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 1784
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 1784
INDIRI4
CNSTI4 4000000
GEI4 $709
ADDRLP4 1780
CNSTI4 1
ASGNI4
ADDRGP4 $710
JUMPV
LABELV $709
ADDRLP4 1780
CNSTI4 0
ASGNI4
LABELV $710
ADDRLP4 1776
ADDRLP4 1780
INDIRI4
ASGNI4
line 1307
;1305:
;1306:		// if we are defering loads, just have it pick the first valid
;1307:		if ( forceDefer || (can_defer && !cg_buildScript.integer && !cg.loading) )  {
ADDRLP4 1776
INDIRI4
CNSTI4 0
NEI4 $715
ADDRLP4 1680
INDIRI4
CNSTI4 0
EQI4 $711
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
NEI4 $711
ADDRGP4 cg+20
INDIRI4
CNSTI4 0
NEI4 $711
LABELV $715
line 1309
;1308:			// keep whatever they had if it won't violate team skins
;1309:			CG_SetDeferredClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 1311
;1310:			// if we are low on memory, leave them with this model
;1311:			if ( forceDefer ) {
ADDRLP4 1776
INDIRI4
CNSTI4 0
EQI4 $712
line 1312
;1312:				CG_Printf( "Memory is low. Using deferred model.\n" );
ADDRGP4 $718
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1313
;1313:				newInfo.deferred = qfalse;
ADDRLP4 0+384
CNSTI4 0
ASGNI4
line 1314
;1314:			}
line 1315
;1315:		} else {
ADDRGP4 $712
JUMPV
LABELV $711
line 1316
;1316:			CG_LoadClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1317
;1317:		}
LABELV $712
line 1318
;1318:	}
LABELV $706
line 1321
;1319:
;1320:	// replace whatever was there with the new one
;1321:	newInfo.infoValid = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1322
;1322:	*ci = newInfo;
ADDRLP4 1668
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 1652
line 1323
;1323:}
LABELV $607
endproc CG_NewClientInfo 1788 48
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 16 4
line 1335
;1324:
;1325:
;1326:/*
;1327:======================
;1328:CG_LoadDeferredPlayers
;1329:
;1330:Called each frame when a player is dead
;1331:and the scoreboard is up
;1332:so deferred players can be loaded
;1333:======================
;1334:*/
;1335:void CG_LoadDeferredPlayers( void ) {
line 1340
;1336:	int		i;
;1337:	clientInfo_t	*ci;
;1338:
;1339:	// scan for a deferred player to load
;1340:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+40996
ASGNP4
ADDRGP4 $724
JUMPV
LABELV $721
line 1341
;1341:		if ( ci->infoValid && ci->deferred ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $727
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $727
line 1343
;1342:			// if we are low on memory, leave it deferred
;1343:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 12
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4000000
GEI4 $729
line 1344
;1344:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $731
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1345
;1345:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 1346
;1346:				continue;
ADDRGP4 $722
JUMPV
LABELV $729
line 1348
;1347:			}
;1348:			CG_LoadClientInfo( ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1350
;1349://			break;
;1350:		}
LABELV $727
line 1351
;1351:	}
LABELV $722
line 1340
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1652
ADDP4
ASGNP4
LABELV $724
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $721
line 1352
;1352:}
LABELV $720
endproc CG_LoadDeferredPlayers 16 4
proc CG_SetLerpFrameAnimation 12 8
line 1370
;1353:
;1354:/*
;1355:=============================================================================
;1356:
;1357:PLAYER ANIMATION
;1358:
;1359:=============================================================================
;1360:*/
;1361:
;1362:
;1363:/*
;1364:===============
;1365:CG_SetLerpFrameAnimation
;1366:
;1367:may include ANIM_TOGGLEBIT
;1368:===============
;1369:*/
;1370:static void CG_SetLerpFrameAnimation( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 1373
;1371:	animation_t	*anim;
;1372:
;1373:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1374
;1374:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1376
;1375:
;1376:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $735
ADDRLP4 4
INDIRI4
CNSTI4 37
LTI4 $733
LABELV $735
line 1377
;1377:		CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $736
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1378
;1378:	}
LABELV $733
line 1380
;1379:
;1380:	anim = &ci->animations[ newAnimation ];
ADDRLP4 0
ADDRFP4 8
INDIRI4
CNSTI4 28
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDP4
ASGNP4
line 1382
;1381:
;1382:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1383
;1383:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1385
;1384:
;1385:	if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $737
line 1386
;1386:		CG_Printf( "Anim: %i\n", newAnimation );
ADDRGP4 $740
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1387
;1387:	}
LABELV $737
line 1388
;1388:}
LABELV $732
endproc CG_SetLerpFrameAnimation 12 8
proc CG_RunLerpFrame 36 12
line 1399
;1389:
;1390:
;1391:/*
;1392:===============
;1393:CG_RunLerpFrame
;1394:
;1395:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1396:cg.time should be between oldFrameTime and frameTime after exit
;1397:===============
;1398:*/
;1399:static void CG_RunLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale ) {
line 1404
;1400:	int			f, numFrames;
;1401:	animation_t	*anim;
;1402:
;1403:	// debugging tool to get no animations
;1404:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $742
line 1405
;1405:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1406
;1406:		return;
ADDRGP4 $741
JUMPV
LABELV $742
line 1410
;1407:	}
;1408:
;1409:	// see if the animation sequence is switching
;1410:	if ( newAnimation != lf->animationNumber || !lf->animation ) {
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $747
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $745
LABELV $747
line 1411
;1411:		CG_SetLerpFrameAnimation( ci, lf, newAnimation );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1412
;1412:	}
LABELV $745
line 1416
;1413:
;1414:	// if we have passed the current frame, move it to
;1415:	// oldFrame and calculate a new frame
;1416:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $748
line 1417
;1417:		lf->oldFrame = lf->frame;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1418
;1418:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1421
;1419:
;1420:		// get the next frame based on the animation
;1421:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 1422
;1422:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $751
line 1423
;1423:			return;		// shouldn't happen
ADDRGP4 $741
JUMPV
LABELV $751
line 1425
;1424:		}
;1425:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $753
line 1426
;1426:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1427
;1427:		} else {
ADDRGP4 $754
JUMPV
LABELV $753
line 1428
;1428:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1429
;1429:		}
LABELV $754
line 1430
;1430:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1431
;1431:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1433
;1432:
;1433:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1434
;1434:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $756
line 1435
;1435:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1436
;1436:		}
LABELV $756
line 1437
;1437:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $758
line 1438
;1438:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1439
;1439:			if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $760
line 1440
;1440:				f %= anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 1441
;1441:				f += anim->numFrames - anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1442
;1442:			} else {
ADDRGP4 $761
JUMPV
LABELV $760
line 1443
;1443:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1446
;1444:				// the animation is stuck at the end, so it
;1445:				// can immediately transition to another sequence
;1446:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1447
;1447:			}
LABELV $761
line 1448
;1448:		}
LABELV $758
line 1449
;1449:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $763
line 1450
;1450:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1451
;1451:		}
ADDRGP4 $764
JUMPV
LABELV $763
line 1452
;1452:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $765
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $765
line 1453
;1453:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
MODI4
SUBI4
ASGNI4
line 1454
;1454:		}
ADDRGP4 $766
JUMPV
LABELV $765
line 1455
;1455:		else {
line 1456
;1456:			lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1457
;1457:		}
LABELV $766
LABELV $764
line 1458
;1458:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $767
line 1459
;1459:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1460
;1460:			if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $771
line 1461
;1461:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $774
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1462
;1462:			}
LABELV $771
line 1463
;1463:		}
LABELV $767
line 1464
;1464:	}
LABELV $748
line 1466
;1465:
;1466:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
LEI4 $775
line 1467
;1467:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1468
;1468:	}
LABELV $775
line 1470
;1469:
;1470:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $779
line 1471
;1471:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1472
;1472:	}
LABELV $779
line 1474
;1473:	// calculate current lerp value
;1474:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $783
line 1475
;1475:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 1476
;1476:	} else {
ADDRGP4 $784
JUMPV
LABELV $783
line 1477
;1477:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 1478
;1478:	}
LABELV $784
line 1479
;1479:}
LABELV $741
endproc CG_RunLerpFrame 36 12
proc CG_ClearLerpFrame 16 12
line 1487
;1480:
;1481:
;1482:/*
;1483:===============
;1484:CG_ClearLerpFrame
;1485:===============
;1486:*/
;1487:static void CG_ClearLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int animationNumber ) {
line 1488
;1488:	lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1489
;1489:	CG_SetLerpFrameAnimation( ci, lf, animationNumber );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1490
;1490:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1491
;1491:}
LABELV $786
endproc CG_ClearLerpFrame 16 12
proc CG_PlayerAnimation 20 16
line 1500
;1492:
;1493:
;1494:/*
;1495:===============
;1496:CG_PlayerAnimation
;1497:===============
;1498:*/
;1499:static void CG_PlayerAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;1500:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 1505
;1501:	clientInfo_t	*ci;
;1502:	int				clientNum;
;1503:	float			speedScale;
;1504:
;1505:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1507
;1506:
;1507:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $789
line 1508
;1508:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1509
;1509:		return;
ADDRGP4 $788
JUMPV
LABELV $789
line 1512
;1510:	}
;1511:
;1512:	if ( cent->currentState.powerups & ( 1 << PW_HASTE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $792
line 1513
;1513:		speedScale = 1.5;
ADDRLP4 4
CNSTF4 1069547520
ASGNF4
line 1514
;1514:	} else {
ADDRGP4 $793
JUMPV
LABELV $792
line 1515
;1515:		speedScale = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1516
;1516:	}
LABELV $793
line 1518
;1517:
;1518:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1521
;1519:
;1520:	// do the shuffle turn frames locally
;1521:	if ( cent->pe.legs.yawing && ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $795
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $795
line 1522
;1522:		CG_RunLerpFrame( ci, &cent->pe.legs, LEGS_TURN, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1523
;1523:	} else {
ADDRGP4 $796
JUMPV
LABELV $795
line 1524
;1524:		CG_RunLerpFrame( ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1525
;1525:	}
LABELV $796
line 1527
;1526:
;1527:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 1528
;1528:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 1529
;1529:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ASGNF4
line 1531
;1530:
;1531:	CG_RunLerpFrame( ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1533
;1532:
;1533:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 1534
;1534:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 1535
;1535:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRF4
ASGNF4
line 1536
;1536:}
LABELV $788
endproc CG_PlayerAnimation 20 16
proc CG_SwingAngles 28 8
line 1552
;1537:
;1538:/*
;1539:=============================================================================
;1540:
;1541:PLAYER ANGLES
;1542:
;1543:=============================================================================
;1544:*/
;1545:
;1546:/*
;1547:==================
;1548:CG_SwingAngles
;1549:==================
;1550:*/
;1551:static void CG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;1552:					float speed, float *angle, qboolean *swinging ) {
line 1557
;1553:	float	swing;
;1554:	float	move;
;1555:	float	scale;
;1556:
;1557:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $798
line 1559
;1558:		// see if a swing should be started
;1559:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1560
;1560:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $802
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $800
LABELV $802
line 1561
;1561:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 1562
;1562:		}
LABELV $800
line 1563
;1563:	}
LABELV $798
line 1565
;1564:
;1565:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $803
line 1566
;1566:		return;
ADDRGP4 $797
JUMPV
LABELV $803
line 1571
;1567:	}
;1568:	
;1569:	// modify the speed depending on the delta
;1570:	// so it doesn't seem so linear
;1571:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1572
;1572:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 1573
;1573:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
CNSTF4 1056964608
MULF4
GEF4 $805
line 1574
;1574:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1575
;1575:	} else if ( scale < swingTolerance ) {
ADDRGP4 $806
JUMPV
LABELV $805
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $807
line 1576
;1576:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1577
;1577:	} else {
ADDRGP4 $808
JUMPV
LABELV $807
line 1578
;1578:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 1579
;1579:	}
LABELV $808
LABELV $806
line 1582
;1580:
;1581:	// swing towards the destination angle
;1582:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $809
line 1583
;1583:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1584
;1584:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $812
line 1585
;1585:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1586
;1586:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1587
;1587:		}
LABELV $812
line 1588
;1588:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1589
;1589:	} else {
ADDRGP4 $810
JUMPV
LABELV $809
line 1590
;1590:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 1591
;1591:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $815
line 1592
;1592:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1593
;1593:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1594
;1594:		}
LABELV $815
line 1595
;1595:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1596
;1596:	}
LABELV $810
line 1599
;1597:
;1598:	// clamp to no more than tolerance
;1599:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1600
;1600:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $817
line 1601
;1601:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1602
;1602:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $818
JUMPV
LABELV $817
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $819
line 1603
;1603:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1604
;1604:	}
LABELV $819
LABELV $818
line 1605
;1605:}
LABELV $797
endproc CG_SwingAngles 28 8
proc CG_AddPainTwitch 12 0
line 1613
;1606:
;1607:
;1608:/*
;1609:=================
;1610:CG_AddPainTwitch
;1611:=================
;1612:*/
;1613:static void CG_AddPainTwitch( centity_t *cent, vec3_t torsoAngles ) {
line 1617
;1614:	int		t;
;1615:	float	f;
;1616:
;1617:	t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1618
;1618:	if ( t >= PAIN_TWITCH_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $823
line 1619
;1619:		return;
ADDRGP4 $821
JUMPV
LABELV $823
line 1622
;1620:	}
;1621:
;1622:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1000593162
MULF4
SUBF4
ASGNF4
line 1624
;1623:
;1624:	if ( cent->pe.painDirection ) {
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 0
EQI4 $825
line 1625
;1625:		torsoAngles[ROLL] += 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1101004800
MULF4
ADDF4
ASGNF4
line 1626
;1626:	} else {
ADDRGP4 $826
JUMPV
LABELV $825
line 1627
;1627:		torsoAngles[ROLL] -= 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1101004800
MULF4
SUBF4
ASGNF4
line 1628
;1628:	}
LABELV $826
line 1629
;1629:}
LABELV $821
endproc CG_AddPainTwitch 12 0
data
align 4
LABELV $828
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
code
proc CG_PlayerAngles 136 24
line 1646
;1630:
;1631:
;1632:/*
;1633:===============
;1634:CG_PlayerAngles
;1635:
;1636:Handles seperate torso motion
;1637:
;1638:  legs pivot based on direction of movement
;1639:
;1640:  head always looks exactly at cent->lerpAngles
;1641:
;1642:  if motion < 20 degrees, show in head only
;1643:  if < 45 degrees, also show in torso
;1644:===============
;1645:*/
;1646:static void CG_PlayerAngles( centity_t *cent, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 1655
;1647:	vec3_t		legsAngles, torsoAngles, headAngles;
;1648:	float		dest;
;1649:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;1650:	vec3_t		velocity;
;1651:	float		speed;
;1652:	int			dir, clientNum;
;1653:	clientInfo_t	*ci;
;1654:
;1655:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 1656
;1656:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 24+4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 68
INDIRF4
ASGNF4
line 1657
;1657:	VectorClear( legsAngles );
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12+4
CNSTF4 0
ASGNF4
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1658
;1658:	VectorClear( torsoAngles );
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1663
;1659:
;1660:	// --------- yaw -------------
;1661:
;1662:	// allow yaw to drift a bit
;1663:	if ( ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != LEGS_IDLE 
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $837
ADDRLP4 72
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 11
EQI4 $835
ADDRLP4 72
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 12
EQI4 $835
LABELV $837
line 1665
;1664:		|| ((cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_STAND 
;1665:		&& (cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_STAND2)) {
line 1667
;1666:		// if not standing still, always point all in the same direction
;1667:		cent->pe.torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 1668
;1668:		cent->pe.torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 1669
;1669:		cent->pe.legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 1670
;1670:	}
LABELV $835
line 1673
;1671:
;1672:	// adjust legs for movement dir
;1673:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $838
line 1675
;1674:		// don't let dead bodies twitch
;1675:		dir = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1676
;1676:	} else {
ADDRGP4 $839
JUMPV
LABELV $838
line 1677
;1677:		dir = cent->currentState.angles2[YAW];
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1678
;1678:		if ( dir < 0 || dir > 7 ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $842
ADDRLP4 52
INDIRI4
CNSTI4 7
LEI4 $840
LABELV $842
line 1679
;1679:			CG_Error( "Bad player movement angle" );
ADDRGP4 $843
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1680
;1680:		}
LABELV $840
line 1681
;1681:	}
LABELV $839
line 1682
;1682:	legsAngles[YAW] = headAngles[YAW] + movementOffsets[ dir ];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $828
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1683
;1683:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $828
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1048576000
MULF4
ADDF4
ASGNF4
line 1686
;1684:
;1685:	// torso
;1686:	CG_SwingAngles( torsoAngles[YAW], 25, 90, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing );
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 532
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1687
;1687:	CG_SwingAngles( legsAngles[YAW], 40, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
ADDRLP4 12+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 480
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 484
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1689
;1688:
;1689:	torsoAngles[YAW] = cent->pe.torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ASGNF4
line 1690
;1690:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ASGNF4
line 1696
;1691:
;1692:
;1693:	// --------- pitch -------------
;1694:
;1695:	// only show a fraction of the pitch angle in the torso
;1696:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 24
INDIRF4
CNSTF4 1127481344
LEF4 $854
line 1697
;1697:		dest = (-360 + headAngles[PITCH]) * 0.75f;
ADDRLP4 60
ADDRLP4 24
INDIRF4
CNSTF4 3283353600
ADDF4
CNSTF4 1061158912
MULF4
ASGNF4
line 1698
;1698:	} else {
ADDRGP4 $855
JUMPV
LABELV $854
line 1699
;1699:		dest = headAngles[PITCH] * 0.75f;
ADDRLP4 60
ADDRLP4 24
INDIRF4
CNSTF4 1061158912
MULF4
ASGNF4
line 1700
;1700:	}
LABELV $855
line 1701
;1701:	CG_SwingAngles( dest, 15, 30, 0.1f, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 536
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 540
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1702
;1702:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ASGNF4
line 1705
;1703:
;1704:	//
;1705:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1706
;1706:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $856
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $856
line 1707
;1707:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
ADDRLP4 36
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1708
;1708:		if ( ci->fixedtorso ) {
ADDRLP4 64
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $859
line 1709
;1709:			torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1710
;1710:		}
LABELV $859
line 1711
;1711:	}
LABELV $856
line 1717
;1712:
;1713:	// --------- roll -------------
;1714:
;1715:
;1716:	// lean towards the direction of travel
;1717:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1718
;1718:	speed = VectorNormalize( velocity );
ADDRLP4 40
ARGP4
ADDRLP4 92
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 92
INDIRF4
ASGNF4
line 1719
;1719:	if ( speed ) {
ADDRLP4 56
INDIRF4
CNSTF4 0
EQF4 $861
line 1723
;1720:		vec3_t	axis[3];
;1721:		float	side;
;1722:
;1723:		speed *= 0.05f;
ADDRLP4 56
ADDRLP4 56
INDIRF4
CNSTF4 1028443341
MULF4
ASGNF4
line 1725
;1724:
;1725:		AnglesToAxis( legsAngles, axis );
ADDRLP4 12
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1726
;1726:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 132
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 96+12
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 96+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 96+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1727
;1727:		legsAngles[ROLL] -= side;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 132
INDIRF4
SUBF4
ASGNF4
line 1729
;1728:
;1729:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 132
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 96+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 96+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1730
;1730:		legsAngles[PITCH] += side;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 132
INDIRF4
ADDF4
ASGNF4
line 1731
;1731:	}
LABELV $861
line 1734
;1732:
;1733:	//
;1734:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1735
;1735:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $875
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $875
line 1736
;1736:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
ADDRLP4 36
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1737
;1737:		if ( ci->fixedlegs ) {
ADDRLP4 64
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 0
EQI4 $878
line 1738
;1738:			legsAngles[YAW] = torsoAngles[YAW];
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1739
;1739:			legsAngles[PITCH] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1740
;1740:			legsAngles[ROLL] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1741
;1741:		}
LABELV $878
line 1742
;1742:	}
LABELV $875
line 1745
;1743:
;1744:	// pain twitch
;1745:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 1748
;1746:
;1747:	// pull the angles back out of the hierarchial chain
;1748:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1749
;1749:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1750
;1750:	AnglesToAxis( legsAngles, legs );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1751
;1751:	AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1752
;1752:	AnglesToAxis( headAngles, head );
ADDRLP4 24
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1753
;1753:}
LABELV $827
endproc CG_PlayerAngles 136 24
proc CG_HasteTrail 32 48
line 1763
;1754:
;1755:
;1756://==========================================================================
;1757:
;1758:/*
;1759:===============
;1760:CG_HasteTrail
;1761:===============
;1762:*/
;1763:static void CG_HasteTrail( centity_t *cent ) {
line 1768
;1764:	localEntity_t	*smoke;
;1765:	vec3_t			origin;
;1766:	int				anim;
;1767:
;1768:	if ( cent->trailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $884
line 1769
;1769:		return;
ADDRGP4 $883
JUMPV
LABELV $884
line 1771
;1770:	}
;1771:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1772
;1772:	if ( anim != LEGS_RUN && anim != LEGS_BACK ) {
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $887
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $887
line 1773
;1773:		return;
ADDRGP4 $883
JUMPV
LABELV $887
line 1776
;1774:	}
;1775:
;1776:	cent->trailTime += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1777
;1777:	if ( cent->trailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $889
line 1778
;1778:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1779
;1779:	}
LABELV $889
line 1781
;1780:
;1781:	VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 1782
;1782:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1784
;1783:
;1784:	smoke = CG_SmokePuff( origin, vec3_origin, 
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+428
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 1794
;1785:				  8, 
;1786:				  1, 1, 1, 1,
;1787:				  500, 
;1788:				  cg.time,
;1789:				  0,
;1790:				  0,
;1791:				  cgs.media.hastePuffShader );
;1792:
;1793:	// use the optimized local entity add
;1794:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 1795
;1795:}
LABELV $883
endproc CG_HasteTrail 32 48
proc CG_TrailItem 188 12
line 1890
;1796:
;1797:
;1798:#ifdef MISSIONPACK
;1799:/*
;1800:===============
;1801:CG_BreathPuffs
;1802:===============
;1803:*/
;1804:static void CG_BreathPuffs( centity_t *cent, refEntity_t *head) {
;1805:	clientInfo_t *ci;
;1806:	vec3_t up, origin;
;1807:	int contents;
;1808:
;1809:	ci = &cgs.clientinfo[ cent->currentState.number ];
;1810:
;1811:	if (!cg_enableBreath.integer) {
;1812:		return;
;1813:	}
;1814:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson) {
;1815:		return;
;1816:	}
;1817:	if ( cent->currentState.eFlags & EF_DEAD ) {
;1818:		return;
;1819:	}
;1820:	contents = CG_PointContents( head->origin, 0 );
;1821:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
;1822:		return;
;1823:	}
;1824:	if ( ci->breathPuffTime > cg.time ) {
;1825:		return;
;1826:	}
;1827:
;1828:	VectorSet( up, 0, 0, 8 );
;1829:	VectorMA(head->origin, 8, head->axis[0], origin);
;1830:	VectorMA(origin, -4, head->axis[2], origin);
;1831:	CG_SmokePuff( origin, up, 16, 1, 1, 1, 0.66f, 1500, cg.time, cg.time + 400, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
;1832:	ci->breathPuffTime = cg.time + 2000;
;1833:}
;1834:
;1835:/*
;1836:===============
;1837:CG_DustTrail
;1838:===============
;1839:*/
;1840:static void CG_DustTrail( centity_t *cent ) {
;1841:	int				anim;
;1842:	vec3_t end, vel;
;1843:	trace_t tr;
;1844:
;1845:	if (!cg_enableDust.integer)
;1846:		return;
;1847:
;1848:	if ( cent->dustTrailTime > cg.time ) {
;1849:		return;
;1850:	}
;1851:
;1852:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
;1853:	if ( anim != LEGS_LANDB && anim != LEGS_LAND ) {
;1854:		return;
;1855:	}
;1856:
;1857:	cent->dustTrailTime += 40;
;1858:	if ( cent->dustTrailTime < cg.time ) {
;1859:		cent->dustTrailTime = cg.time;
;1860:	}
;1861:
;1862:	VectorCopy(cent->currentState.pos.trBase, end);
;1863:	end[2] -= 64;
;1864:	CG_Trace( &tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID );
;1865:
;1866:	if ( !(tr.surfaceFlags & SURF_DUST) )
;1867:		return;
;1868:
;1869:	VectorCopy( cent->currentState.pos.trBase, end );
;1870:	end[2] -= 16;
;1871:
;1872:	VectorSet(vel, 0, 0, -30);
;1873:	CG_SmokePuff( end, vel,
;1874:				  24,
;1875:				  .8f, .8f, 0.7f, 0.33f,
;1876:				  500,
;1877:				  cg.time,
;1878:				  0,
;1879:				  0,
;1880:				  cgs.media.dustPuffShader );
;1881:}
;1882:#endif
;1883:
;1884:
;1885:/*
;1886:===============
;1887:CG_TrailItem
;1888:===============
;1889:*/
;1890:static void CG_TrailItem( const centity_t *cent, qhandle_t hModel ) {
line 1895
;1891:	refEntity_t		ent;
;1892:	vec3_t			angles;
;1893:	vec3_t			axis[3];
;1894:
;1895:	VectorCopy( cent->lerpAngles, angles );
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 1896
;1896:	angles[PITCH] = 0;
ADDRLP4 140
CNSTF4 0
ASGNF4
line 1897
;1897:	angles[ROLL] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 1898
;1898:	AnglesToAxis( angles, axis );
ADDRLP4 140
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1900
;1899:
;1900:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1901
;1901:	VectorMA( cent->lerpOrigin, -16, axis[0], ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ADDRLP4 152
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ADDRLP4 152+4
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
line 1902
;1902:	ent.origin[2] += 16;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1903
;1903:	angles[YAW] += 90;
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1904
;1904:	AnglesToAxis( angles, ent.axis );
ADDRLP4 140
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1906
;1905:
;1906:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 1907
;1907:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1908
;1908:}
LABELV $897
endproc CG_TrailItem 188 12
proc CG_PlayerFlag 352 24
line 1916
;1909:
;1910:
;1911:/*
;1912:===============
;1913:CG_PlayerFlag
;1914:===============
;1915:*/
;1916:static void CG_PlayerFlag( centity_t *cent, qhandle_t hSkin, refEntity_t *torso ) {
line 1925
;1917:	clientInfo_t	*ci;
;1918:	refEntity_t	pole;
;1919:	refEntity_t	flag;
;1920:	vec3_t		angles, dir;
;1921:	int			legsAnim, flagAnim, updateangles;
;1922:	float		angle, d;
;1923:
;1924:	// show the flag pole model
;1925:	memset( &pole, 0, sizeof(pole) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1926
;1926:	pole.hModel = cgs.media.flagPoleModel;
ADDRLP4 0+8
ADDRGP4 cgs+148692+88
INDIRI4
ASGNI4
line 1927
;1927:	VectorCopy( torso->lightingOrigin, pole.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1928
;1928:	pole.shadowPlane = torso->shadowPlane;
ADDRLP4 0+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1929
;1929:	pole.renderfx = torso->renderfx;
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1930
;1930:	CG_PositionEntityOnTag( &pole, torso, torso->hModel, "tag_flag" );
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $437
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 1931
;1931:	trap_R_AddRefEntityToScene( &pole );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1934
;1932:
;1933:	// show the flag model
;1934:	memset( &flag, 0, sizeof(flag) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1935
;1935:	flag.hModel = cgs.media.flagFlapModel;
ADDRLP4 140+8
ADDRGP4 cgs+148692+92
INDIRI4
ASGNI4
line 1936
;1936:	flag.customSkin = hSkin;
ADDRLP4 140+108
ADDRFP4 4
INDIRI4
ASGNI4
line 1937
;1937:	VectorCopy( torso->lightingOrigin, flag.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1938
;1938:	flag.shadowPlane = torso->shadowPlane;
ADDRLP4 140+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1939
;1939:	flag.renderfx = torso->renderfx;
ADDRLP4 140+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1941
;1940:
;1941:	VectorClear(angles);
ADDRLP4 280
CNSTF4 0
ASGNF4
ADDRLP4 280+4
CNSTF4 0
ASGNF4
ADDRLP4 280+8
CNSTF4 0
ASGNF4
line 1943
;1942:
;1943:	updateangles = qfalse;
ADDRLP4 312
CNSTI4 0
ASGNI4
line 1944
;1944:	legsAnim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1945
;1945:	if( legsAnim == LEGS_IDLE || legsAnim == LEGS_IDLECR ) {
ADDRLP4 304
INDIRI4
CNSTI4 22
EQI4 $929
ADDRLP4 304
INDIRI4
CNSTI4 23
NEI4 $927
LABELV $929
line 1946
;1946:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1947
;1947:	} else if ( legsAnim == LEGS_WALK || legsAnim == LEGS_WALKCR ) {
ADDRGP4 $928
JUMPV
LABELV $927
ADDRLP4 304
INDIRI4
CNSTI4 14
EQI4 $932
ADDRLP4 304
INDIRI4
CNSTI4 13
NEI4 $930
LABELV $932
line 1948
;1948:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1949
;1949:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1950
;1950:	} else {
ADDRGP4 $931
JUMPV
LABELV $930
line 1951
;1951:		flagAnim = FLAG_RUN;
ADDRLP4 320
CNSTI4 34
ASGNI4
line 1952
;1952:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1953
;1953:	}
LABELV $931
LABELV $928
line 1955
;1954:
;1955:	if ( updateangles ) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $933
line 1957
;1956:
;1957:		VectorCopy( cent->currentState.pos.trDelta, dir );
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1959
;1958:		// add gravity
;1959:		dir[2] += 100;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 1960
;1960:		VectorNormalize( dir );
ADDRLP4 292
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1961
;1961:		d = DotProduct(pole.axis[2], dir);
ADDRLP4 308
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1963
;1962:		// if there is enough movement orthogonal to the flag pole
;1963:		if (fabs(d) < 0.9) {
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 340
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 340
INDIRF4
CNSTF4 1063675494
GEF4 $946
line 1965
;1964:			//
;1965:			d = DotProduct(pole.axis[0], dir);
ADDRLP4 308
ADDRLP4 0+28
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1966
;1966:			if (d > 1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 1065353216
LEF4 $955
line 1967
;1967:				d = 1.0f;
ADDRLP4 308
CNSTF4 1065353216
ASGNF4
line 1968
;1968:			}
ADDRGP4 $956
JUMPV
LABELV $955
line 1969
;1969:			else if (d < -1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 3212836864
GEF4 $957
line 1970
;1970:				d = -1.0f;
ADDRLP4 308
CNSTF4 3212836864
ASGNF4
line 1971
;1971:			}
LABELV $957
LABELV $956
line 1972
;1972:			angle = acos(d);
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 344
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 324
ADDRLP4 344
INDIRF4
ASGNF4
line 1974
;1973:
;1974:			d = DotProduct(pole.axis[1], dir);
ADDRLP4 308
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1975
;1975:			if (d < 0) {
ADDRLP4 308
INDIRF4
CNSTF4 0
GEF4 $969
line 1976
;1976:				angles[YAW] = 360 - angle * 180 / M_PI;
ADDRLP4 280+4
CNSTF4 1135869952
ADDRLP4 324
INDIRF4
CNSTF4 1113927393
MULF4
SUBF4
ASGNF4
line 1977
;1977:			}
ADDRGP4 $970
JUMPV
LABELV $969
line 1978
;1978:			else {
line 1979
;1979:				angles[YAW] = angle * 180 / M_PI;
ADDRLP4 280+4
ADDRLP4 324
INDIRF4
CNSTF4 1113927393
MULF4
ASGNF4
line 1980
;1980:			}
LABELV $970
line 1981
;1981:			if (angles[YAW] < 0)
ADDRLP4 280+4
INDIRF4
CNSTF4 0
GEF4 $973
line 1982
;1982:				angles[YAW] += 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $973
line 1983
;1983:			if (angles[YAW] > 360)
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
LEF4 $977
line 1984
;1984:				angles[YAW] -= 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $977
line 1989
;1985:
;1986:			//vectoangles( cent->currentState.pos.trDelta, tmpangles );
;1987:			//angles[YAW] = tmpangles[YAW] + 45 - cent->pe.torso.yawAngle;
;1988:			// change the yaw angle
;1989:			CG_SwingAngles( angles[YAW], 25, 90, 0.15f, &cent->pe.flag.yawAngle, &cent->pe.flag.yawing );
ADDRLP4 280+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1041865114
ARGF4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 576
ADDP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 580
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1990
;1990:		}
LABELV $946
line 2010
;1991:
;1992:		/*
;1993:		d = DotProduct(pole.axis[2], dir);
;1994:		angle = Q_acos(d);
;1995:
;1996:		d = DotProduct(pole.axis[1], dir);
;1997:		if (d < 0) {
;1998:			angle = 360 - angle * 180 / M_PI;
;1999:		}
;2000:		else {
;2001:			angle = angle * 180 / M_PI;
;2002:		}
;2003:		if (angle > 340 && angle < 20) {
;2004:			flagAnim = FLAG_RUNUP;
;2005:		}
;2006:		if (angle > 160 && angle < 200) {
;2007:			flagAnim = FLAG_RUNDOWN;
;2008:		}
;2009:		*/
;2010:	}
LABELV $933
line 2013
;2011:
;2012:	// set the yaw angle
;2013:	angles[YAW] = cent->pe.flag.yawAngle;
ADDRLP4 280+4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRF4
ASGNF4
line 2015
;2014:	// lerp the flag animation frames
;2015:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2016
;2016:	CG_RunLerpFrame( ci, &cent->pe.flag, flagAnim, 1 );
ADDRLP4 316
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ARGP4
ADDRLP4 320
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 2017
;2017:	flag.oldframe = cent->pe.flag.oldFrame;
ADDRLP4 140+96
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
line 2018
;2018:	flag.frame = cent->pe.flag.frame;
ADDRLP4 140+80
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
ASGNI4
line 2019
;2019:	flag.backlerp = cent->pe.flag.backlerp;
ADDRLP4 140+100
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRF4
ASGNF4
line 2021
;2020:
;2021:	AnglesToAxis( angles, flag.axis );
ADDRLP4 280
ARGP4
ADDRLP4 140+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2022
;2022:	CG_PositionRotatedEntityOnTag( &flag, &pole, pole.hModel, "tag_flag" );
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $437
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2024
;2023:
;2024:	trap_R_AddRefEntityToScene( &flag );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2025
;2025:}
LABELV $911
endproc CG_PlayerFlag 352 24
proc CG_PlayerPowerups 12 20
line 2101
;2026:
;2027:
;2028:#ifdef MISSIONPACK // bk001204
;2029:/*
;2030:===============
;2031:CG_PlayerTokens
;2032:===============
;2033:*/
;2034:static void CG_PlayerTokens( centity_t *cent, int renderfx ) {
;2035:	int			tokens, i, j;
;2036:	float		angle;
;2037:	refEntity_t	ent;
;2038:	vec3_t		dir, origin;
;2039:	skulltrail_t *trail;
;2040:	trail = &cg.skulltrails[cent->currentState.number];
;2041:	tokens = cent->currentState.generic1;
;2042:	if ( !tokens ) {
;2043:		trail->numpositions = 0;
;2044:		return;
;2045:	}
;2046:
;2047:	if ( tokens > MAX_SKULLTRAIL ) {
;2048:		tokens = MAX_SKULLTRAIL;
;2049:	}
;2050:
;2051:	// add skulls if there are more than last time
;2052:	for (i = 0; i < tokens - trail->numpositions; i++) {
;2053:		for (j = trail->numpositions; j > 0; j--) {
;2054:			VectorCopy(trail->positions[j-1], trail->positions[j]);
;2055:		}
;2056:		VectorCopy(cent->lerpOrigin, trail->positions[0]);
;2057:	}
;2058:	trail->numpositions = tokens;
;2059:
;2060:	// move all the skulls along the trail
;2061:	VectorCopy(cent->lerpOrigin, origin);
;2062:	for (i = 0; i < trail->numpositions; i++) {
;2063:		VectorSubtract(trail->positions[i], origin, dir);
;2064:		if (VectorNormalize(dir) > 30) {
;2065:			VectorMA(origin, 30, dir, trail->positions[i]);
;2066:		}
;2067:		VectorCopy(trail->positions[i], origin);
;2068:	}
;2069:
;2070:	memset( &ent, 0, sizeof( ent ) );
;2071:	if( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_BLUE ) {
;2072:		ent.hModel = cgs.media.redCubeModel;
;2073:	} else {
;2074:		ent.hModel = cgs.media.blueCubeModel;
;2075:	}
;2076:	ent.renderfx = renderfx;
;2077:
;2078:	VectorCopy(cent->lerpOrigin, origin);
;2079:	for (i = 0; i < trail->numpositions; i++) {
;2080:		VectorSubtract(origin, trail->positions[i], ent.axis[0]);
;2081:		ent.axis[0][2] = 0;
;2082:		VectorNormalize(ent.axis[0]);
;2083:		VectorSet(ent.axis[2], 0, 0, 1);
;2084:		CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
;2085:
;2086:		VectorCopy(trail->positions[i], ent.origin);
;2087:		angle = (((cg.time + 500 * MAX_SKULLTRAIL - 500 * i) / 16) & 255) * (M_PI * 2) / 255;
;2088:		ent.origin[2] += sin(angle) * 10;
;2089:		trap_R_AddRefEntityToScene( &ent );
;2090:		VectorCopy(trail->positions[i], origin);
;2091:	}
;2092:}
;2093:#endif
;2094:
;2095:
;2096:/*
;2097:===============
;2098:CG_PlayerPowerups
;2099:===============
;2100:*/
;2101:static void CG_PlayerPowerups( centity_t *cent, refEntity_t *torso ) {
line 2105
;2102:	int		powerups;
;2103:	clientInfo_t	*ci;
;2104:
;2105:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 2106
;2106:	if ( !powerups ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $990
line 2107
;2107:		return;
ADDRGP4 $989
JUMPV
LABELV $990
line 2111
;2108:	}
;2109:
;2110:	// quad gives a dlight
;2111:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $992
line 2112
;2112:		if ( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $994
line 2113
;2113:			trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 1.0f, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2114
;2114:		} else {
ADDRGP4 $995
JUMPV
LABELV $994
line 2115
;2115:			trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 0.2f, 0.2f, 1.0f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2116
;2116:		}
LABELV $995
line 2117
;2117:	}
LABELV $992
line 2120
;2118:
;2119:	// flight plays a looped sound
;2120:	if ( powerups & ( 1 << PW_FLIGHT ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $998
line 2121
;2121:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.flightSound );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 cgs+148692+832
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 2122
;2122:	}
LABELV $998
line 2124
;2123:
;2124:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2126
;2125:	// redflag
;2126:	if ( powerups & ( 1 << PW_REDFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1003
line 2127
;2127:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1005
line 2128
;2128:			CG_PlayerFlag( cent, cgs.media.redFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+96
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2129
;2129:		}
ADDRGP4 $1006
JUMPV
LABELV $1005
line 2130
;2130:		else {
line 2131
;2131:			CG_TrailItem( cent, cgs.media.redFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+36
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2132
;2132:		}
LABELV $1006
line 2133
;2133:		trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 1.0f, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2134
;2134:	}
LABELV $1003
line 2137
;2135:
;2136:	// blueflag
;2137:	if ( powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1011
line 2138
;2138:		if (ci->newAnims){
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1013
line 2139
;2139:			CG_PlayerFlag( cent, cgs.media.blueFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+100
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2140
;2140:		}
ADDRGP4 $1014
JUMPV
LABELV $1013
line 2141
;2141:		else {
line 2142
;2142:			CG_TrailItem( cent, cgs.media.blueFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+40
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2143
;2143:		}
LABELV $1014
line 2144
;2144:		trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 0.2f, 0.2f, 1.0f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2145
;2145:	}
LABELV $1011
line 2148
;2146:
;2147:	// neutralflag
;2148:	if ( powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1019
line 2149
;2149:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1021
line 2150
;2150:			CG_PlayerFlag( cent, cgs.media.neutralFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+104
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2151
;2151:		}
ADDRGP4 $1022
JUMPV
LABELV $1021
line 2152
;2152:		else {
line 2153
;2153:			CG_TrailItem( cent, cgs.media.neutralFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+44
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2154
;2154:		}
LABELV $1022
line 2155
;2155:		trap_R_AddLightToScene( cent->lerpOrigin, ( POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD) ), 1.0f, 1.0f, 1.0f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2156
;2156:	}
LABELV $1019
line 2159
;2157:
;2158:	// haste leaves smoke trails
;2159:	if ( powerups & ( 1 << PW_HASTE ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1027
line 2160
;2160:		CG_HasteTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 2161
;2161:	}
LABELV $1027
line 2162
;2162:}
LABELV $989
endproc CG_PlayerPowerups 12 20
proc CG_PlayerFloatSprite 144 12
line 2172
;2163:
;2164:
;2165:/*
;2166:===============
;2167:CG_PlayerFloatSprite
;2168:
;2169:Float a sprite over the player's head
;2170:===============
;2171:*/
;2172:static void CG_PlayerFloatSprite( const centity_t *cent, qhandle_t shader ) {
line 2176
;2173:	int				rf;
;2174:	refEntity_t		ent;
;2175:
;2176:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1030
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1030
line 2177
;2177:		rf = RF_THIRD_PERSON;		// only show in mirrors
ADDRLP4 140
CNSTI4 2
ASGNI4
line 2178
;2178:	} else {
ADDRGP4 $1031
JUMPV
LABELV $1030
line 2179
;2179:		rf = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 2180
;2180:	}
LABELV $1031
line 2182
;2181:
;2182:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2183
;2183:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2184
;2184:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 2185
;2185:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 2186
;2186:	ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 4
INDIRI4
ASGNI4
line 2187
;2187:	ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 2188
;2188:	ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 140
INDIRI4
ASGNI4
line 2189
;2189:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 2190
;2190:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 2191
;2191:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 2192
;2192:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2193
;2193:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2194
;2194:}
LABELV $1029
endproc CG_PlayerFloatSprite 144 12
proc CG_PlayerSprites 4 8
line 2204
;2195:
;2196:
;2197:/*
;2198:===============
;2199:CG_PlayerSprites
;2200:
;2201:Float sprites over the player's head
;2202:===============
;2203:*/
;2204:static void CG_PlayerSprites( centity_t *cent ) {
line 2207
;2205:	int		team;
;2206:
;2207:	if ( cent->currentState.eFlags & EF_CONNECTION ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1048
line 2208
;2208:		CG_PlayerFloatSprite( cent, cgs.media.connectionShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+208
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2209
;2209:		return;
ADDRGP4 $1047
JUMPV
LABELV $1048
line 2212
;2210:	}
;2211:
;2212:	if ( cent->currentState.eFlags & EF_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1052
line 2213
;2213:		CG_PlayerFloatSprite( cent, cgs.media.balloonShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+204
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2214
;2214:		return;
ADDRGP4 $1047
JUMPV
LABELV $1052
line 2217
;2215:	}
;2216:
;2217:	if ( cent->currentState.eFlags & EF_AWARD_IMPRESSIVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1056
line 2218
;2218:		CG_PlayerFloatSprite( cent, cgs.media.medalImpressive );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+500
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2219
;2219:		return;
ADDRGP4 $1047
JUMPV
LABELV $1056
line 2222
;2220:	}
;2221:
;2222:	if ( cent->currentState.eFlags & EF_AWARD_EXCELLENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1060
line 2223
;2223:		CG_PlayerFloatSprite( cent, cgs.media.medalExcellent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+504
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2224
;2224:		return;
ADDRGP4 $1047
JUMPV
LABELV $1060
line 2227
;2225:	}
;2226:
;2227:	if ( cent->currentState.eFlags & EF_AWARD_GAUNTLET ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1064
line 2228
;2228:		CG_PlayerFloatSprite( cent, cgs.media.medalGauntlet );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+508
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2229
;2229:		return;
ADDRGP4 $1047
JUMPV
LABELV $1064
line 2232
;2230:	}
;2231:
;2232:	if ( cent->currentState.eFlags & EF_AWARD_DEFEND ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $1068
line 2233
;2233:		CG_PlayerFloatSprite( cent, cgs.media.medalDefend );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+512
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2234
;2234:		return;
ADDRGP4 $1047
JUMPV
LABELV $1068
line 2237
;2235:	}
;2236:
;2237:	if ( cent->currentState.eFlags & EF_AWARD_ASSIST ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $1072
line 2238
;2238:		CG_PlayerFloatSprite( cent, cgs.media.medalAssist );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+516
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2239
;2239:		return;
ADDRGP4 $1047
JUMPV
LABELV $1072
line 2242
;2240:	}
;2241:
;2242:	if ( cent->currentState.eFlags & EF_AWARD_CAP ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1076
line 2243
;2243:		CG_PlayerFloatSprite( cent, cgs.media.medalCapture );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+520
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2244
;2244:		return;
ADDRGP4 $1047
JUMPV
LABELV $1076
line 2247
;2245:	}
;2246:
;2247:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
line 2248
;2248:	if ( !(cent->currentState.eFlags & EF_DEAD) && 
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1082
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1082
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1082
line 2250
;2249:		cg.snap->ps.persistant[PERS_TEAM] == team &&
;2250:		cgs.gametype >= GT_TEAM) {
line 2251
;2251:		if (cg_drawFriend.integer) {
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $1047
line 2252
;2252:			CG_PlayerFloatSprite( cent, cgs.media.friendShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+200
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2253
;2253:		}
line 2254
;2254:		return;
LABELV $1082
line 2256
;2255:	}
;2256:}
LABELV $1047
endproc CG_PlayerSprites 4 8
data
align 4
LABELV $1092
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $1093
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 100 44
line 2269
;2257:
;2258:
;2259:/*
;2260:===============
;2261:CG_PlayerShadow
;2262:
;2263:Returns the Z component of the surface being shadowed
;2264:
;2265:  should it return a full plane instead of a Z?
;2266:===============
;2267:*/
;2268:#define	SHADOW_DISTANCE		128
;2269:static qboolean CG_PlayerShadow( centity_t *cent, float *shadowPlane ) {
line 2270
;2270:	vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 72
ADDRGP4 $1092
INDIRB
ASGNB 12
ADDRLP4 84
ADDRGP4 $1093
INDIRB
ASGNB 12
line 2274
;2271:	trace_t		trace;
;2272:	float		alpha;
;2273:
;2274:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 2276
;2275:
;2276:	if ( cg_shadows.integer == 0 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1094
line 2277
;2277:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1091
JUMPV
LABELV $1094
line 2281
;2278:	}
;2279:
;2280:	// no shadows when invisible
;2281:	if ( cent->currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1097
line 2282
;2282:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1091
JUMPV
LABELV $1097
line 2286
;2283:	}
;2284:
;2285:	// send a trace down from the player to the ground
;2286:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2287
;2287:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 2289
;2288:
;2289:	trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 0
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2292
;2290:
;2291:	// no shadow if too high
;2292:	if ( trace.fraction == 1.0 || trace.startsolid || trace.allsolid ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1105
ADDRLP4 0+4
INDIRI4
CNSTI4 0
NEI4 $1105
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1100
LABELV $1105
line 2293
;2293:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1091
JUMPV
LABELV $1100
line 2296
;2294:	}
;2295:
;2296:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2298
;2297:
;2298:	if ( cg_shadows.integer != 1 ) {	// no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $1108
line 2299
;2299:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1091
JUMPV
LABELV $1108
line 2303
;2300:	}
;2301:
;2302:	// fade the shadow out with height
;2303:	alpha = 1.0 - trace.fraction;
ADDRLP4 56
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2310
;2304:
;2305:	// bk0101022 - hack / FPE - bogus planes?
;2306:	//assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f ) 
;2307:
;2308:	// add the mark as a temporary, so it goes directly to the renderer
;2309:	// without taking a spot in the cg_marks array
;2310:	CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal, 
ADDRGP4 cgs+148692+344
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1103101952
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 2313
;2311:		cent->pe.legs.yawAngle, alpha,alpha,alpha,1, qfalse, 24, qtrue );
;2312:
;2313:	return qtrue;
CNSTI4 1
RETI4
LABELV $1091
endproc CG_PlayerShadow 100 44
proc CG_PlayerSplash 188 28
line 2324
;2314:}
;2315:
;2316:
;2317:/*
;2318:===============
;2319:CG_PlayerSplash
;2320:
;2321:Draw a mark at the water surface
;2322:===============
;2323:*/
;2324:static void CG_PlayerSplash( const centity_t *cent ) {
line 2330
;2325:	vec3_t		start, end;
;2326:	trace_t		trace;
;2327:	int			contents;
;2328:	polyVert_t	verts[4];
;2329:
;2330:	if ( !cg_shadows.integer ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1117
line 2331
;2331:		return;
ADDRGP4 $1116
JUMPV
LABELV $1117
line 2334
;2332:	}
;2333:
;2334:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2335
;2335:	end[2] -= 24;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 2339
;2336:
;2337:	// if the feet aren't in liquid, don't make a mark
;2338:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;2339:	contents = CG_PointContents( end, 0 );
ADDRLP4 164
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 180
INDIRI4
ASGNI4
line 2340
;2340:	if ( !( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $1121
line 2341
;2341:		return;
ADDRGP4 $1116
JUMPV
LABELV $1121
line 2344
;2342:	}
;2343:
;2344:	VectorCopy( cent->lerpOrigin, start );
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2345
;2345:	start[2] += 32;
ADDRLP4 152+8
ADDRLP4 152+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2348
;2346:
;2347:	// if the head isn't out of liquid, don't make a mark
;2348:	contents = CG_PointContents( start, 0 );
ADDRLP4 152
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 184
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 184
INDIRI4
ASGNI4
line 2349
;2349:	if ( contents & ( CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 57
BANDI4
CNSTI4 0
EQI4 $1124
line 2350
;2350:		return;
ADDRGP4 $1116
JUMPV
LABELV $1124
line 2354
;2351:	}
;2352:
;2353:	// trace down to find the surface
;2354:	trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) );
ADDRLP4 96
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 164
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2356
;2355:
;2356:	if ( trace.fraction == 1.0 ) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $1126
line 2357
;2357:		return;
ADDRGP4 $1116
JUMPV
LABELV $1126
line 2361
;2358:	}
;2359:
;2360:	// create a mark polygon
;2361:	VectorCopy( trace.endpos, verts[0].xyz );
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2362
;2362:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2363
;2363:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2364
;2364:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2365
;2365:	verts[0].st[1] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 2366
;2366:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2367
;2367:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2368
;2368:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2369
;2369:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2371
;2370:
;2371:	VectorCopy( trace.endpos, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2372
;2372:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2373
;2373:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2374
;2374:	verts[1].st[0] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 2375
;2375:	verts[1].st[1] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 2376
;2376:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2377
;2377:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2378
;2378:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2379
;2379:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2381
;2380:
;2381:	VectorCopy( trace.endpos, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2382
;2382:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2383
;2383:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2384
;2384:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2385
;2385:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2386
;2386:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2387
;2387:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2388
;2388:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2389
;2389:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2391
;2390:
;2391:	VectorCopy( trace.endpos, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2392
;2392:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2393
;2393:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2394
;2394:	verts[3].st[0] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 2395
;2395:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2396
;2396:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2397
;2397:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2398
;2398:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2399
;2399:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2401
;2400:
;2401:	trap_R_AddPolyToScene( cgs.media.wakeMarkShader, 4, verts );
ADDRGP4 cgs+148692+368
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 2402
;2402:}
LABELV $1116
endproc CG_PlayerSplash 188 28
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 0 4
line 2413
;2403:
;2404:
;2405:/*
;2406:===============
;2407:CG_AddRefEntityWithPowerups
;2408:
;2409:Adds a piece with modifications or duplications for powerups
;2410:Also called by CG_Missile for quad rockets, but nobody can tell...
;2411:===============
;2412:*/
;2413:void CG_AddRefEntityWithPowerups( refEntity_t *ent, entityState_t *state, int team ) {
line 2415
;2414:
;2415:	if ( state->powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1207
line 2416
;2416:		ent->customShader = cgs.media.invisShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+412
INDIRI4
ASGNI4
line 2417
;2417:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2418
;2418:	} else {
ADDRGP4 $1208
JUMPV
LABELV $1207
line 2428
;2419:		/*
;2420:		if ( state->eFlags & EF_KAMIKAZE ) {
;2421:			if (team == TEAM_BLUE)
;2422:				ent->customShader = cgs.media.blueKamikazeShader;
;2423:			else
;2424:				ent->customShader = cgs.media.redKamikazeShader;
;2425:			trap_R_AddRefEntityToScene( ent );
;2426:		}
;2427:		else {*/
;2428:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2431
;2429:		//}
;2430:
;2431:		if ( state->powerups & ( 1 << PW_QUAD ) )
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1211
line 2432
;2432:		{
line 2433
;2433:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1213
line 2434
;2434:				ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+404
INDIRI4
ASGNI4
ADDRGP4 $1214
JUMPV
LABELV $1213
line 2436
;2435:			else
;2436:				ent->customShader = cgs.media.quadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+400
INDIRI4
ASGNI4
LABELV $1214
line 2437
;2437:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2438
;2438:		}
LABELV $1211
line 2439
;2439:		if ( state->powerups & ( 1 << PW_REGEN ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1219
line 2440
;2440:			if ( ( ( cg.time / 100 ) % 10 ) == 1 ) {
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $1221
line 2441
;2441:				ent->customShader = cgs.media.regenShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+416
INDIRI4
ASGNI4
line 2442
;2442:				trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2443
;2443:			}
LABELV $1221
line 2444
;2444:		}
LABELV $1219
line 2445
;2445:		if ( state->powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1226
line 2447
;2446://freeze
;2447:			if ( !state->weapon )
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1228
line 2448
;2448:				ent->customShader = cgs.media.freezeShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+392
INDIRI4
ASGNI4
ADDRGP4 $1229
JUMPV
LABELV $1228
line 2451
;2449:			else
;2450://freeze
;2451:			ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+420
INDIRI4
ASGNI4
LABELV $1229
line 2452
;2452:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2453
;2453:		}
LABELV $1226
line 2454
;2454:	}
LABELV $1208
line 2455
;2455:}
LABELV $1206
endproc CG_AddRefEntityWithPowerups 0 4
export CG_LightVerts
proc CG_LightVerts 88 16
line 2464
;2456:
;2457:
;2458:/*
;2459:=================
;2460:CG_LightVerts
;2461:=================
;2462:*/
;2463:int CG_LightVerts( vec3_t normal, int numVerts, polyVert_t *verts )
;2464:{
line 2471
;2465:	int				i, j;
;2466:	float			incoming;
;2467:	vec3_t			ambientLight;
;2468:	vec3_t			lightDir;
;2469:	vec3_t			directedLight;
;2470:
;2471:	trap_R_LightForPoint( verts[0].xyz, ambientLight, directedLight, lightDir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 2473
;2472:
;2473:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1238
JUMPV
LABELV $1235
line 2474
;2474:		incoming = DotProduct (normal, lightDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2475
;2475:		if ( incoming <= 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1241
line 2476
;2476:			verts[i].modulate[0] = ambientLight[0];
ADDRLP4 56
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $1244
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1245
JUMPV
LABELV $1244
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1245
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 2477
;2477:			verts[i].modulate[1] = ambientLight[1];
ADDRLP4 68
ADDRLP4 12+4
INDIRF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $1248
ADDRLP4 64
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1249
JUMPV
LABELV $1248
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1249
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 2478
;2478:			verts[i].modulate[2] = ambientLight[2];
ADDRLP4 80
ADDRLP4 12+8
INDIRF4
ASGNF4
ADDRLP4 84
CNSTF4 1325400064
ASGNF4
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
LTF4 $1252
ADDRLP4 76
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1253
JUMPV
LABELV $1252
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1253
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 76
INDIRU4
CVUU1 4
ASGNU1
line 2479
;2479:			verts[i].modulate[3] = 255;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2480
;2480:			continue;
ADDRGP4 $1236
JUMPV
LABELV $1241
line 2482
;2481:		} 
;2482:		j = ( ambientLight[0] + incoming * directedLight[0] );
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2483
;2483:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1254
line 2484
;2484:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2485
;2485:		}
LABELV $1254
line 2486
;2486:		verts[i].modulate[0] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2488
;2487:
;2488:		j = ( ambientLight[1] + incoming * directedLight[1] );
ADDRLP4 0
ADDRLP4 12+4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2489
;2489:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1258
line 2490
;2490:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2491
;2491:		}
LABELV $1258
line 2492
;2492:		verts[i].modulate[1] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2494
;2493:
;2494:		j = ( ambientLight[2] + incoming * directedLight[2] );
ADDRLP4 0
ADDRLP4 12+8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2495
;2495:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1262
line 2496
;2496:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2497
;2497:		}
LABELV $1262
line 2498
;2498:		verts[i].modulate[2] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2500
;2499:
;2500:		verts[i].modulate[3] = 255;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2501
;2501:	}
LABELV $1236
line 2473
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1238
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1235
line 2502
;2502:	return qtrue;
CNSTI4 1
RETI4
LABELV $1234
endproc CG_LightVerts 88 16
export CG_Player
proc CG_Player 484 28
line 2511
;2503:}
;2504:
;2505:
;2506:/*
;2507:===============
;2508:CG_Player
;2509:===============
;2510:*/
;2511:void CG_Player( centity_t *cent ) {
line 2533
;2512:	clientInfo_t	*ci;
;2513:	refEntity_t		legs;
;2514:	refEntity_t		torso;
;2515:	refEntity_t		head;
;2516:	int				clientNum;
;2517:	int				renderfx;
;2518:	qboolean		shadow;
;2519:	float			shadowPlane;
;2520:#ifdef MISSIONPACK
;2521:	refEntity_t		skull;
;2522:	refEntity_t		powerup;
;2523:	int				t;
;2524:	float			c;
;2525:	float			angle;
;2526:	vec3_t			dir, angles;
;2527:#endif
;2528:	qboolean		darken;
;2529:
;2530:	// the client number is stored in clientNum.  It can't be derived
;2531:	// from the entity number, because a single client may have
;2532:	// multiple corpses on the level using the same clientinfo
;2533:	clientNum = cent->currentState.clientNum;
ADDRLP4 436
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2534
;2534:	if ( (unsigned) clientNum >= MAX_CLIENTS ) {
ADDRLP4 436
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $1265
line 2535
;2535:		CG_Error( "Bad clientNum on player entity" );
ADDRGP4 $1267
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2536
;2536:	}
LABELV $1265
line 2537
;2537:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 280
ADDRLP4 436
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2541
;2538:
;2539:	// it is possible to see corpses from disconnected players that may
;2540:	// not have valid clientinfo
;2541:	if ( !ci->infoValid ) {
ADDRLP4 280
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1269
line 2542
;2542:		return;
ADDRGP4 $1264
JUMPV
LABELV $1269
line 2546
;2543:	}
;2544:
;2545:	// get the player model information
;2546:	renderfx = 0;
ADDRLP4 424
CNSTI4 0
ASGNI4
line 2547
;2547:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1271
line 2548
;2548:		if (!cg.renderingThirdPerson) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1274
line 2549
;2549:			renderfx = RF_THIRD_PERSON;			// only draw in mirrors
ADDRLP4 424
CNSTI4 2
ASGNI4
line 2550
;2550:		} else {
ADDRGP4 $1275
JUMPV
LABELV $1274
line 2551
;2551:			if (cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $1277
line 2552
;2552:				return;
ADDRGP4 $1264
JUMPV
LABELV $1277
line 2554
;2553:			}
;2554:		}
LABELV $1275
line 2555
;2555:	}
LABELV $1271
line 2557
;2556:
;2557:	if ( cg_deadBodyDarken.integer && cent->currentState.eFlags & EF_DEAD )
ADDRGP4 cg_deadBodyDarken+12
INDIRI4
CNSTI4 0
EQI4 $1280
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1280
line 2558
;2558:		darken = qtrue;
ADDRLP4 432
CNSTI4 1
ASGNI4
ADDRGP4 $1281
JUMPV
LABELV $1280
line 2560
;2559:	else
;2560:		darken = qfalse;
ADDRLP4 432
CNSTI4 0
ASGNI4
LABELV $1281
line 2562
;2561:
;2562:	memset( &legs, 0, sizeof(legs) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2563
;2563:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2564
;2564:	memset( &head, 0, sizeof(head) );
ADDRLP4 284
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2567
;2565:
;2566:	// get the rotation information
;2567:	CG_PlayerAngles( cent, legs.axis, torso.axis, head.axis );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 140+28
ARGP4
ADDRLP4 284+28
ARGP4
ADDRGP4 CG_PlayerAngles
CALLV
pop
line 2570
;2568:	
;2569:	// get the animation state (after rotation, to allow feet shuffle)
;2570:	CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRLP4 140+96
ARGP4
ADDRLP4 140+80
ARGP4
ADDRLP4 140+100
ARGP4
ADDRGP4 CG_PlayerAnimation
CALLV
pop
line 2574
;2571:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;2572:
;2573:	// add the talk baloon or disconnect icon
;2574:	CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 2577
;2575:
;2576:	// add the shadow
;2577:	shadow = CG_PlayerShadow( cent, &shadowPlane );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 428
ARGP4
ADDRLP4 444
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 440
ADDRLP4 444
INDIRI4
ASGNI4
line 2580
;2578:
;2579:	// add a water splash if partially in and out of water
;2580:	CG_PlayerSplash( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 2582
;2581:
;2582:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1292
ADDRLP4 440
INDIRI4
CNSTI4 0
EQI4 $1292
line 2583
;2583:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2584
;2584:	}
LABELV $1292
line 2585
;2585:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2594
;2586:#ifdef MISSIONPACK
;2587:	if( cgs.gametype == GT_HARVESTER ) {
;2588:		CG_PlayerTokens( cent, renderfx );
;2589:	}
;2590:#endif
;2591:	//
;2592:	// add the legs
;2593:	//
;2594:	legs.hModel = ci->legsModel;
ADDRLP4 0+8
ADDRLP4 280
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 2595
;2595:	legs.customSkin = ci->legsSkin;
ADDRLP4 0+108
ADDRLP4 280
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 2597
;2596:
;2597:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2599
;2598:
;2599:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2600
;2600:	legs.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 428
INDIRF4
ASGNF4
line 2601
;2601:	legs.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2602
;2602:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2605
;2603:
;2604:	// colored skin
;2605:	if ( darken ) {
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $1303
line 2606
;2606:		legs.shaderRGBA[0] = 85;
ADDRLP4 0+116
CNSTU1 85
ASGNU1
line 2607
;2607:		legs.shaderRGBA[1] = 85;
ADDRLP4 0+116+1
CNSTU1 85
ASGNU1
line 2608
;2608:		legs.shaderRGBA[2] = 85;
ADDRLP4 0+116+2
CNSTU1 85
ASGNU1
line 2609
;2609:	} else {
ADDRGP4 $1304
JUMPV
LABELV $1303
line 2610
;2610:		legs.shaderRGBA[0] = ci->legsColor[0] * 255;
ADDRLP4 452
ADDRLP4 280
INDIRP4
CNSTI4 1640
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 456
CNSTF4 1325400064
ASGNF4
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
LTF4 $1312
ADDRLP4 448
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1313
JUMPV
LABELV $1312
ADDRLP4 448
ADDRLP4 452
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1313
ADDRLP4 0+116
ADDRLP4 448
INDIRU4
CVUU1 4
ASGNU1
line 2611
;2611:		legs.shaderRGBA[1] = ci->legsColor[1] * 255;
ADDRLP4 464
ADDRLP4 280
INDIRP4
CNSTI4 1644
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 468
CNSTF4 1325400064
ASGNF4
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
LTF4 $1317
ADDRLP4 460
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1318
JUMPV
LABELV $1317
ADDRLP4 460
ADDRLP4 464
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1318
ADDRLP4 0+116+1
ADDRLP4 460
INDIRU4
CVUU1 4
ASGNU1
line 2612
;2612:		legs.shaderRGBA[2] = ci->legsColor[2] * 255;
ADDRLP4 476
ADDRLP4 280
INDIRP4
CNSTI4 1648
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 480
CNSTF4 1325400064
ASGNF4
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
LTF4 $1322
ADDRLP4 472
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1323
JUMPV
LABELV $1322
ADDRLP4 472
ADDRLP4 476
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1323
ADDRLP4 0+116+2
ADDRLP4 472
INDIRU4
CVUU1 4
ASGNU1
line 2613
;2613:	}
LABELV $1304
line 2614
;2614:	legs.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2616
;2615:
;2616:	CG_AddRefEntityWithPowerups( &legs, &cent->currentState, ci->team );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2619
;2617:
;2618:	// if the model failed, allow the default nullmodel to be displayed
;2619:	if (!legs.hModel) {
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1326
line 2620
;2620:		return;
ADDRGP4 $1264
JUMPV
LABELV $1326
line 2626
;2621:	}
;2622:
;2623:	//
;2624:	// add the torso
;2625:	//
;2626:	torso.hModel = ci->torsoModel;
ADDRLP4 140+8
ADDRLP4 280
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 2627
;2627:	if (!torso.hModel) {
ADDRLP4 140+8
INDIRI4
CNSTI4 0
NEI4 $1330
line 2628
;2628:		return;
ADDRGP4 $1264
JUMPV
LABELV $1330
line 2631
;2629:	}
;2630:
;2631:	torso.customSkin = ci->torsoSkin;
ADDRLP4 140+108
ADDRLP4 280
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 2633
;2632:
;2633:	VectorCopy( cent->lerpOrigin, torso.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2635
;2634:
;2635:	CG_PositionRotatedEntityOnTag( &torso, &legs, ci->legsModel, "tag_torso");
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1335
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2637
;2636:
;2637:	torso.shadowPlane = shadowPlane;
ADDRLP4 140+24
ADDRLP4 428
INDIRF4
ASGNF4
line 2638
;2638:	torso.renderfx = renderfx;
ADDRLP4 140+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2641
;2639:
;2640:	// colored skin
;2641:	if ( darken ) {
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $1338
line 2642
;2642:		torso.shaderRGBA[0] = 85;
ADDRLP4 140+116
CNSTU1 85
ASGNU1
line 2643
;2643:		torso.shaderRGBA[1] = 85;
ADDRLP4 140+116+1
CNSTU1 85
ASGNU1
line 2644
;2644:		torso.shaderRGBA[2] = 85;
ADDRLP4 140+116+2
CNSTU1 85
ASGNU1
line 2645
;2645:	} else {
ADDRGP4 $1339
JUMPV
LABELV $1338
line 2646
;2646:		torso.shaderRGBA[0] = ci->bodyColor[0] * 255;
ADDRLP4 452
ADDRLP4 280
INDIRP4
CNSTI4 1628
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 456
CNSTF4 1325400064
ASGNF4
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
LTF4 $1347
ADDRLP4 448
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1348
JUMPV
LABELV $1347
ADDRLP4 448
ADDRLP4 452
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1348
ADDRLP4 140+116
ADDRLP4 448
INDIRU4
CVUU1 4
ASGNU1
line 2647
;2647:		torso.shaderRGBA[1] = ci->bodyColor[1] * 255;
ADDRLP4 464
ADDRLP4 280
INDIRP4
CNSTI4 1632
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 468
CNSTF4 1325400064
ASGNF4
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
LTF4 $1352
ADDRLP4 460
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1353
JUMPV
LABELV $1352
ADDRLP4 460
ADDRLP4 464
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1353
ADDRLP4 140+116+1
ADDRLP4 460
INDIRU4
CVUU1 4
ASGNU1
line 2648
;2648:		torso.shaderRGBA[2] = ci->bodyColor[2] * 255;
ADDRLP4 476
ADDRLP4 280
INDIRP4
CNSTI4 1636
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 480
CNSTF4 1325400064
ASGNF4
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
LTF4 $1357
ADDRLP4 472
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1358
JUMPV
LABELV $1357
ADDRLP4 472
ADDRLP4 476
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1358
ADDRLP4 140+116+2
ADDRLP4 472
INDIRU4
CVUU1 4
ASGNU1
line 2649
;2649:	}
LABELV $1339
line 2650
;2650:	torso.shaderRGBA[3] = 255;
ADDRLP4 140+116+3
CNSTU1 255
ASGNU1
line 2652
;2651:
;2652:	CG_AddRefEntityWithPowerups( &torso, &cent->currentState, ci->team );
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2861
;2653:
;2654:#ifdef MISSIONPACK
;2655:	if ( cent->currentState.eFlags & EF_KAMIKAZE ) {
;2656:
;2657:		memset( &skull, 0, sizeof(skull) );
;2658:
;2659:		VectorCopy( cent->lerpOrigin, skull.lightingOrigin );
;2660:		skull.shadowPlane = shadowPlane;
;2661:		skull.renderfx = renderfx;
;2662:
;2663:		if ( cent->currentState.eFlags & EF_DEAD ) {
;2664:			// one skull bobbing above the dead body
;2665:			angle = ((cg.time / 7) & 255) * (M_PI * 2) / 255;
;2666:			if (angle > M_PI * 2)
;2667:				angle -= (float)M_PI * 2;
;2668:			dir[0] = sin(angle) * 20;
;2669:			dir[1] = cos(angle) * 20;
;2670:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2671:			dir[2] = 15 + sin(angle) * 8;
;2672:			VectorAdd(torso.origin, dir, skull.origin);
;2673:			
;2674:			dir[2] = 0;
;2675:			VectorCopy(dir, skull.axis[1]);
;2676:			VectorNormalize(skull.axis[1]);
;2677:			VectorSet(skull.axis[2], 0, 0, 1);
;2678:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2679:
;2680:			skull.hModel = cgs.media.kamikazeHeadModel;
;2681:			trap_R_AddRefEntityToScene( &skull );
;2682:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2683:			trap_R_AddRefEntityToScene( &skull );
;2684:		}
;2685:		else {
;2686:			// three skulls spinning around the player
;2687:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2688:			dir[0] = cos(angle) * 20;
;2689:			dir[1] = sin(angle) * 20;
;2690:			dir[2] = cos(angle) * 20;
;2691:			VectorAdd(torso.origin, dir, skull.origin);
;2692:
;2693:			angles[0] = sin(angle) * 30;
;2694:			angles[1] = (angle * 180 / M_PI) + 90;
;2695:			if (angles[1] > 360)
;2696:				angles[1] -= 360;
;2697:			angles[2] = 0;
;2698:			AnglesToAxis( angles, skull.axis );
;2699:
;2700:			/*
;2701:			dir[2] = 0;
;2702:			VectorInverse(dir);
;2703:			VectorCopy(dir, skull.axis[1]);
;2704:			VectorNormalize(skull.axis[1]);
;2705:			VectorSet(skull.axis[2], 0, 0, 1);
;2706:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2707:			*/
;2708:
;2709:			skull.hModel = cgs.media.kamikazeHeadModel;
;2710:			trap_R_AddRefEntityToScene( &skull );
;2711:			// flip the trail because this skull is spinning in the other direction
;2712:			VectorInverse(skull.axis[1]);
;2713:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2714:			trap_R_AddRefEntityToScene( &skull );
;2715:
;2716:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255 + M_PI;
;2717:			if (angle > M_PI * 2)
;2718:				angle -= (float)M_PI * 2;
;2719:			dir[0] = sin(angle) * 20;
;2720:			dir[1] = cos(angle) * 20;
;2721:			dir[2] = cos(angle) * 20;
;2722:			VectorAdd(torso.origin, dir, skull.origin);
;2723:
;2724:			angles[0] = cos(angle - 0.5 * M_PI) * 30;
;2725:			angles[1] = 360 - (angle * 180 / M_PI);
;2726:			if (angles[1] > 360)
;2727:				angles[1] -= 360;
;2728:			angles[2] = 0;
;2729:			AnglesToAxis( angles, skull.axis );
;2730:
;2731:			/*
;2732:			dir[2] = 0;
;2733:			VectorCopy(dir, skull.axis[1]);
;2734:			VectorNormalize(skull.axis[1]);
;2735:			VectorSet(skull.axis[2], 0, 0, 1);
;2736:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2737:			*/
;2738:
;2739:			skull.hModel = cgs.media.kamikazeHeadModel;
;2740:			trap_R_AddRefEntityToScene( &skull );
;2741:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2742:			trap_R_AddRefEntityToScene( &skull );
;2743:
;2744:			angle = ((cg.time / 3) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
;2745:			if (angle > M_PI * 2)
;2746:				angle -= (float)M_PI * 2;
;2747:			dir[0] = sin(angle) * 20;
;2748:			dir[1] = cos(angle) * 20;
;2749:			dir[2] = 0;
;2750:			VectorAdd(torso.origin, dir, skull.origin);
;2751:			
;2752:			VectorCopy(dir, skull.axis[1]);
;2753:			VectorNormalize(skull.axis[1]);
;2754:			VectorSet(skull.axis[2], 0, 0, 1);
;2755:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2756:
;2757:			skull.hModel = cgs.media.kamikazeHeadModel;
;2758:			trap_R_AddRefEntityToScene( &skull );
;2759:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2760:			trap_R_AddRefEntityToScene( &skull );
;2761:		}
;2762:	}
;2763:
;2764:	if ( cent->currentState.powerups & ( 1 << PW_GUARD ) ) {
;2765:		memcpy(&powerup, &torso, sizeof(torso));
;2766:		powerup.hModel = cgs.media.guardPowerupModel;
;2767:		powerup.frame = 0;
;2768:		powerup.oldframe = 0;
;2769:		powerup.customSkin = 0;
;2770:		trap_R_AddRefEntityToScene( &powerup );
;2771:	}
;2772:	if ( cent->currentState.powerups & ( 1 << PW_SCOUT ) ) {
;2773:		memcpy(&powerup, &torso, sizeof(torso));
;2774:		powerup.hModel = cgs.media.scoutPowerupModel;
;2775:		powerup.frame = 0;
;2776:		powerup.oldframe = 0;
;2777:		powerup.customSkin = 0;
;2778:		trap_R_AddRefEntityToScene( &powerup );
;2779:	}
;2780:	if ( cent->currentState.powerups & ( 1 << PW_DOUBLER ) ) {
;2781:		memcpy(&powerup, &torso, sizeof(torso));
;2782:		powerup.hModel = cgs.media.doublerPowerupModel;
;2783:		powerup.frame = 0;
;2784:		powerup.oldframe = 0;
;2785:		powerup.customSkin = 0;
;2786:		trap_R_AddRefEntityToScene( &powerup );
;2787:	}
;2788:	if ( cent->currentState.powerups & ( 1 << PW_AMMOREGEN ) ) {
;2789:		memcpy(&powerup, &torso, sizeof(torso));
;2790:		powerup.hModel = cgs.media.ammoRegenPowerupModel;
;2791:		powerup.frame = 0;
;2792:		powerup.oldframe = 0;
;2793:		powerup.customSkin = 0;
;2794:		trap_R_AddRefEntityToScene( &powerup );
;2795:	}
;2796:	if ( cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) {
;2797:		if ( !ci->invulnerabilityStartTime ) {
;2798:			ci->invulnerabilityStartTime = cg.time;
;2799:		}
;2800:		ci->invulnerabilityStopTime = cg.time;
;2801:	}
;2802:	else {
;2803:		ci->invulnerabilityStartTime = 0;
;2804:	}
;2805:	if ( (cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) ||
;2806:		cg.time - ci->invulnerabilityStopTime < 250 ) {
;2807:
;2808:		memcpy(&powerup, &torso, sizeof(torso));
;2809:		powerup.hModel = cgs.media.invulnerabilityPowerupModel;
;2810:		powerup.customSkin = 0;
;2811:		// always draw
;2812:		powerup.renderfx &= ~RF_THIRD_PERSON;
;2813:		VectorCopy(cent->lerpOrigin, powerup.origin);
;2814:
;2815:		if ( cg.time - ci->invulnerabilityStartTime < 250 ) {
;2816:			c = (float) (cg.time - ci->invulnerabilityStartTime) / 250;
;2817:		}
;2818:		else if (cg.time - ci->invulnerabilityStopTime < 250 ) {
;2819:			c = (float) (250 - (cg.time - ci->invulnerabilityStopTime)) / 250;
;2820:		}
;2821:		else {
;2822:			c = 1;
;2823:		}
;2824:		VectorSet( powerup.axis[0], c, 0, 0 );
;2825:		VectorSet( powerup.axis[1], 0, c, 0 );
;2826:		VectorSet( powerup.axis[2], 0, 0, c );
;2827:		trap_R_AddRefEntityToScene( &powerup );
;2828:	}
;2829:
;2830:	t = cg.time - ci->medkitUsageTime;
;2831:	if ( ci->medkitUsageTime && t < 500 ) {
;2832:		memcpy(&powerup, &torso, sizeof(torso));
;2833:		powerup.hModel = cgs.media.medkitUsageModel;
;2834:		powerup.customSkin = 0;
;2835:		// always draw
;2836:		powerup.renderfx &= ~RF_THIRD_PERSON;
;2837:		VectorClear(angles);
;2838:		AnglesToAxis(angles, powerup.axis);
;2839:		VectorCopy(cent->lerpOrigin, powerup.origin);
;2840:		powerup.origin[2] += -24 + (float) t * 80 / 500;
;2841:		if ( t > 400 ) {
;2842:			c = (float) (t - 1000) * 0xff / 100;
;2843:			powerup.shaderRGBA[0] = 0xff - c;
;2844:			powerup.shaderRGBA[1] = 0xff - c;
;2845:			powerup.shaderRGBA[2] = 0xff - c;
;2846:			powerup.shaderRGBA[3] = 0xff - c;
;2847:		}
;2848:		else {
;2849:			powerup.shaderRGBA[0] = 0xff;
;2850:			powerup.shaderRGBA[1] = 0xff;
;2851:			powerup.shaderRGBA[2] = 0xff;
;2852:			powerup.shaderRGBA[3] = 0xff;
;2853:		}
;2854:		trap_R_AddRefEntityToScene( &powerup );
;2855:	}
;2856:#endif // MISSIONPACK
;2857:
;2858:	//
;2859:	// add the head
;2860:	//
;2861:	head.hModel = ci->headModel;
ADDRLP4 284+8
ADDRLP4 280
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 2862
;2862:	if (!head.hModel) {
ADDRLP4 284+8
INDIRI4
CNSTI4 0
NEI4 $1362
line 2863
;2863:		return;
ADDRGP4 $1264
JUMPV
LABELV $1362
line 2865
;2864:	}
;2865:	head.customSkin = ci->headSkin;
ADDRLP4 284+108
ADDRLP4 280
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 2867
;2866:
;2867:	VectorCopy( cent->lerpOrigin, head.lightingOrigin );
ADDRLP4 284+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2869
;2868:
;2869:	CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head");
ADDRLP4 284
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1367
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2871
;2870:
;2871:	head.shadowPlane = shadowPlane;
ADDRLP4 284+24
ADDRLP4 428
INDIRF4
ASGNF4
line 2872
;2872:	head.renderfx = renderfx;
ADDRLP4 284+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2875
;2873:
;2874:	// colored skin
;2875:	if ( darken ) {
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $1370
line 2876
;2876:		head.shaderRGBA[0] = 85;
ADDRLP4 284+116
CNSTU1 85
ASGNU1
line 2877
;2877:		head.shaderRGBA[1] = 85;
ADDRLP4 284+116+1
CNSTU1 85
ASGNU1
line 2878
;2878:		head.shaderRGBA[2] = 85;
ADDRLP4 284+116+2
CNSTU1 85
ASGNU1
line 2879
;2879:	} else {
ADDRGP4 $1371
JUMPV
LABELV $1370
line 2880
;2880:		head.shaderRGBA[0] = ci->headColor[0] * 255;
ADDRLP4 452
ADDRLP4 280
INDIRP4
CNSTI4 1616
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 456
CNSTF4 1325400064
ASGNF4
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
LTF4 $1379
ADDRLP4 448
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1380
JUMPV
LABELV $1379
ADDRLP4 448
ADDRLP4 452
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1380
ADDRLP4 284+116
ADDRLP4 448
INDIRU4
CVUU1 4
ASGNU1
line 2881
;2881:		head.shaderRGBA[1] = ci->headColor[1] * 255;
ADDRLP4 464
ADDRLP4 280
INDIRP4
CNSTI4 1620
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 468
CNSTF4 1325400064
ASGNF4
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
LTF4 $1384
ADDRLP4 460
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1385
JUMPV
LABELV $1384
ADDRLP4 460
ADDRLP4 464
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1385
ADDRLP4 284+116+1
ADDRLP4 460
INDIRU4
CVUU1 4
ASGNU1
line 2882
;2882:		head.shaderRGBA[2] = ci->headColor[2] * 255;
ADDRLP4 476
ADDRLP4 280
INDIRP4
CNSTI4 1624
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 480
CNSTF4 1325400064
ASGNF4
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
LTF4 $1389
ADDRLP4 472
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1390
JUMPV
LABELV $1389
ADDRLP4 472
ADDRLP4 476
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1390
ADDRLP4 284+116+2
ADDRLP4 472
INDIRU4
CVUU1 4
ASGNU1
line 2883
;2883:	}
LABELV $1371
line 2884
;2884:	head.shaderRGBA[3] = 255;
ADDRLP4 284+116+3
CNSTU1 255
ASGNU1
line 2886
;2885:	
;2886:	CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team );
ADDRLP4 284
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2897
;2887:
;2888:#ifdef MISSIONPACK
;2889:	CG_BreathPuffs(cent, &head);
;2890:
;2891:	CG_DustTrail(cent);
;2892:#endif
;2893:
;2894:	//
;2895:	// add the gun / barrel / flash
;2896:	//
;2897:	CG_AddPlayerWeapon( &torso, NULL, cent, ci->team );
ADDRLP4 140
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 2900
;2898:
;2899:	// add powerups floating behind the player
;2900:	CG_PlayerPowerups( cent, &torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 2901
;2901:}
LABELV $1264
endproc CG_Player 484 28
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 40 12
line 2913
;2902:
;2903:
;2904://=====================================================================
;2905:
;2906:/*
;2907:===============
;2908:CG_ResetPlayerEntity
;2909:
;2910:A player just came into view or teleported, so reset all animation info
;2911:===============
;2912:*/
;2913:void CG_ResetPlayerEntity( centity_t *cent ) {
line 2914
;2914:	cent->errorTime = -99999;		// guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 -99999
ASGNI4
line 2915
;2915:	cent->extrapolated = qfalse;	
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 2917
;2916:
;2917:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.legs, cent->currentState.legsAnim );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2918
;2918:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.torso, cent->currentState.torsoAnim );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2920
;2919:
;2920:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2921
;2921:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2923
;2922:
;2923:	VectorCopy( cent->lerpOrigin, cent->rawOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2924
;2924:	VectorCopy( cent->lerpAngles, cent->rawAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 692
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 2926
;2925:
;2926:	memset( &cent->pe.legs, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2927
;2927:	cent->pe.legs.yawAngle = cent->rawAngles[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ASGNF4
line 2928
;2928:	cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 2929
;2929:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 0
ASGNF4
line 2930
;2930:	cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 2932
;2931:
;2932:	memset( &cent->pe.torso, 0, sizeof( cent->pe.torso ) );
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2933
;2933:	cent->pe.torso.yawAngle = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ASGNF4
line 2934
;2934:	cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2935
;2935:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ASGNF4
line 2936
;2936:	cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 2938
;2937:
;2938:	if ( cg_debugPosition.integer ) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $1398
line 2939
;2939:		CG_Printf("%i ResetPlayerEntity yaw=%f\n", cent->currentState.number, cent->pe.torso.yawAngle );
ADDRGP4 $1401
ARGP4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 2940
;2940:	}
LABELV $1398
line 2941
;2941:}
LABELV $1393
endproc CG_ResetPlayerEntity 40 12
import trap_R_AddLinearLightToScene
import trap_R_AddRefEntityToScene2
import linearLight
import intShaderTime
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_inPVS
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedCapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_CapsuleTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_RemoveCommand
import trap_AddCommand
import trap_RealTime
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_AddGib
import Q_Isfreeze
import CG_BodyObituary
import CG_Drop_f
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseSysteminfo
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ScoreboardClick
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_PlayDroppedEvents
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_TrackClientTeamChange
import CG_ForceModelChange
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_SelectFont
import CG_LoadFonts
import CG_DrawString
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColorTime
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawStringExt
import CG_DrawPic
import CG_FillScreen
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_SetScoreCatcher
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import eventnames
import cg_followKiller
import cg_fovAdjust
import cg_deadBodyDarken
import cg_teamColors
import cg_teamModel
import cg_enemyColors
import cg_enemyModel
import cg_hitSounds
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import cg_smoothClients
import cg_scorePlum
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailRadius
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_drawWeaponSelect
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $1401
byte 1 37
byte 1 105
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 61
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $1367
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1335
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $1267
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $843
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $774
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $740
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $736
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $731
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $718
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $695
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $689
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $687
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $669
byte 1 108
byte 1 0
align 1
LABELV $667
byte 1 119
byte 1 0
align 1
LABELV $665
byte 1 104
byte 1 99
byte 1 0
align 1
LABELV $663
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $646
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $644
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $640
byte 1 116
byte 1 0
align 1
LABELV $637
byte 1 110
byte 1 0
align 1
LABELV $573
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $549
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $517
byte 1 67
byte 1 71
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $446
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $437
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $432
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $429
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 47
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $421
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 40
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $415
byte 1 48
byte 1 0
align 1
LABELV $412
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $381
byte 1 120
byte 1 97
byte 1 101
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $380
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $379
byte 1 117
byte 1 114
byte 1 105
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $378
byte 1 116
byte 1 97
byte 1 110
byte 1 107
byte 1 106
byte 1 114
byte 1 0
align 1
LABELV $377
byte 1 115
byte 1 111
byte 1 114
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $376
byte 1 115
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $375
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $374
byte 1 114
byte 1 97
byte 1 122
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $373
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $372
byte 1 111
byte 1 114
byte 1 98
byte 1 98
byte 1 0
align 1
LABELV $371
byte 1 109
byte 1 121
byte 1 110
byte 1 120
byte 1 0
align 1
LABELV $370
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $369
byte 1 108
byte 1 117
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $368
byte 1 107
byte 1 108
byte 1 101
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $367
byte 1 107
byte 1 101
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $366
byte 1 104
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $365
byte 1 103
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $364
byte 1 100
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $363
byte 1 99
byte 1 114
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $362
byte 1 98
byte 1 111
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $361
byte 1 98
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $360
byte 1 98
byte 1 105
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $359
byte 1 97
byte 1 110
byte 1 97
byte 1 114
byte 1 107
byte 1 105
byte 1 0
align 1
LABELV $353
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $350
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $347
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $344
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $341
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $340
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $337
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $336
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $335
byte 1 37
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $332
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $323
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $322
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $317
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $314
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $313
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $310
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $307
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $299
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $296
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $293
byte 1 84
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $290
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $287
byte 1 76
byte 1 101
byte 1 103
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $284
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $283
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $263
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $262
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $252
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $238
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $228
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $227
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $219
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $218
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $208
byte 1 0
align 1
LABELV $207
byte 1 112
byte 1 109
byte 1 0
align 1
LABELV $204
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $203
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $189
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $164
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $161
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $158
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $147
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $138
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $135
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $134
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 0
align 1
LABELV $131
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $128
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $125
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $121
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $120
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $115
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $107
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $99
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $84
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $83
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $82
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $81
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $80
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $79
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $78
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $77
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $76
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $75
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $74
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $73
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $72
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
