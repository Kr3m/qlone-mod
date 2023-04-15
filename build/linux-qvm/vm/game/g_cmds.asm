export DeathmatchScoreboardMessage
code
proc DeathmatchScoreboardMessage 1344 64
file "../../../../code/game/g_cmds.c"
line 15
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#ifdef MISSIONPACK
;6:#include "../../ui/menudef.h"			// for the voice chats
;7:#endif
;8:
;9:/*
;10:==================
;11:DeathmatchScoreboardMessage
;12:
;13:==================
;14:*/
;15:void DeathmatchScoreboardMessage( gentity_t *ent ) {
line 24
;16:	char		entry[256]; // enough to hold 14 integers
;17:	char		string[MAX_STRING_CHARS-1];
;18:	int			stringlength;
;19:	int			i, j, ping, prefix;
;20:	gclient_t	*cl;
;21:	int			numSorted, scoreFlags, accuracy, perfect;
;22:
;23:	// send the latest information on all clients
;24:	string[0] = '\0';
ADDRLP4 16
CNSTI1 0
ASGNI1
line 25
;25:	stringlength = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 26
;26:	scoreFlags = 0;
ADDRLP4 1308
CNSTI4 0
ASGNI4
line 28
;27:
;28:	numSorted = level.numConnectedClients;
ADDRLP4 1312
ADDRGP4 level+76
INDIRI4
ASGNI4
line 31
;29:
;30:	// estimate prefix length to avoid oversize of final string
;31:	prefix = BG_sprintf( entry, "scores %i %i %i", level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE], numSorted );
ADDRLP4 1039
ARGP4
ADDRGP4 $56
ARGP4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 1312
INDIRI4
ARGI4
ADDRLP4 1320
ADDRGP4 BG_sprintf
CALLI4
ASGNI4
ADDRLP4 1316
ADDRLP4 1320
INDIRI4
ASGNI4
line 33
;32:	
;33:	for ( i = 0 ; i < numSorted ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $64
JUMPV
LABELV $61
line 35
;34:
;35:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 37
;36:
;37:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $66
line 38
;38:			ping = -1;
ADDRLP4 1296
CNSTI4 -1
ASGNI4
line 39
;39:		} else {
ADDRGP4 $67
JUMPV
LABELV $66
line 40
;40:			ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
GEI4 $69
ADDRLP4 1324
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $70
JUMPV
LABELV $69
ADDRLP4 1324
CNSTI4 999
ASGNI4
LABELV $70
ADDRLP4 1296
ADDRLP4 1324
INDIRI4
ASGNI4
line 41
;41:		}
LABELV $67
line 43
;42:
;43:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
CNSTI4 0
EQI4 $71
line 44
;44:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1300
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 100
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
DIVI4
ASGNI4
line 45
;45:		} else {
ADDRGP4 $72
JUMPV
LABELV $71
line 46
;46:			accuracy = 0;
ADDRLP4 1300
CNSTI4 0
ASGNI4
line 47
;47:		}
LABELV $72
line 49
;48:
;49:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $74
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $74
ADDRLP4 1324
CNSTI4 1
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 1324
CNSTI4 0
ASGNI4
LABELV $75
ADDRLP4 1304
ADDRLP4 1324
INDIRI4
ASGNI4
line 52
;50:
;51://qlone - freezetag
;52:		if ( g_freezeTag.integer ) scoreFlags = cl->sess.wins;
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $76
ADDRLP4 1308
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ASGNI4
LABELV $76
line 55
;53://qlone - freezetag
;54:
;55:		j = BG_sprintf( entry, " %i %i %i %i %i %i %i %i %i %i %i %i %i %i",
ADDRLP4 1039
ARGP4
ADDRGP4 $79
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 1296
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 1308
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+188
ADDP4
INDIRI4
ARGI4
ADDRLP4 1300
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 1304
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRLP4 1340
ADDRGP4 BG_sprintf
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 1340
INDIRI4
ASGNI4
line 71
;56:			level.sortedClients[i],
;57:			cl->ps.persistant[PERS_SCORE],
;58:			ping,
;59:			(level.time - cl->pers.enterTime)/60000,
;60:			scoreFlags,
;61:			g_entities[level.sortedClients[i]].s.powerups,
;62:			accuracy, 
;63:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;64:			cl->ps.persistant[PERS_EXCELLENT_COUNT],
;65:			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
;66:			cl->ps.persistant[PERS_DEFEND_COUNT], 
;67:			cl->ps.persistant[PERS_ASSIST_COUNT], 
;68:			perfect,
;69:			cl->ps.persistant[PERS_CAPTURES]);
;70:
;71:		if ( stringlength + j + prefix >= sizeof( string ) )
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 1316
INDIRI4
ADDI4
CVIU4 4
CNSTU4 1023
LTU4 $84
line 72
;72:			break;
ADDRGP4 $63
JUMPV
LABELV $84
line 74
;73:
;74:		strcpy( string + stringlength, entry );
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
ARGP4
ADDRLP4 1039
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 75
;75:		stringlength += j;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 76
;76:	}
LABELV $62
line 33
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $64
ADDRLP4 4
INDIRI4
ADDRLP4 1312
INDIRI4
LTI4 $61
LABELV $63
line 78
;77:
;78:	trap_SendServerCommand( ent-g_entities, va( "scores %i %i %i%s", i,
ADDRGP4 $86
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 1324
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 1324
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 81
;79:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
;80:		string ) );
;81:}
LABELV $54
endproc DeathmatchScoreboardMessage 1344 64
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 91
;82:
;83:
;84:/*
;85:==================
;86:Cmd_Score_f
;87:
;88:Request current scoreboard information
;89:==================
;90:*/
;91:void Cmd_Score_f( gentity_t *ent ) {
line 92
;92:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 93
;93:}
LABELV $91
endproc Cmd_Score_f 0 4
export CheatsOk
proc CheatsOk 0 8
line 101
;94:
;95:
;96:/*
;97:==================
;98:CheatsOk
;99:==================
;100:*/
;101:qboolean	CheatsOk( gentity_t *ent ) {
line 102
;102:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $93
line 103
;103:		trap_SendServerCommand( ent-g_entities, "print \"Cheats are not enabled on this server.\n\"");
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
ADDRGP4 $96
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 104
;104:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $92
JUMPV
LABELV $93
line 106
;105:	}
;106:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $97
line 107
;107:		trap_SendServerCommand( ent-g_entities, "print \"You must be alive to use this command.\n\"");
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
ADDRGP4 $99
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 108
;108:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $92
JUMPV
LABELV $97
line 110
;109:	}
;110:	return qtrue;
CNSTI4 1
RETI4
LABELV $92
endproc CheatsOk 0 8
bss
align 1
LABELV $101
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 119
;111:}
;112:
;113:
;114:/*
;115:==================
;116:ConcatArgs
;117:==================
;118:*/
;119:char *ConcatArgs( int start ) {
line 125
;120:	static char line[MAX_STRING_CHARS];
;121:	char	arg[MAX_STRING_CHARS];
;122:	int		i, c, tlen;
;123:	int		len;
;124:
;125:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 126
;126:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 127
;127:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $102
line 128
;128:		trap_Argv( i, arg, sizeof( arg ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 129
;129:		tlen = (int)strlen( arg );
ADDRLP4 8
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1044
INDIRI4
ASGNI4
line 130
;130:		if ( len + tlen >= sizeof( line )-1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
CVIU4 4
CNSTU4 1023
LTU4 $106
line 131
;131:			break;
ADDRGP4 $104
JUMPV
LABELV $106
line 133
;132:		}
;133:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $101
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 134
;134:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 135
;135:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $108
line 136
;136:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $101
ADDP4
CNSTI1 32
ASGNI1
line 137
;137:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 138
;138:		}
LABELV $108
line 139
;139:	}
LABELV $103
line 127
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $105
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $102
LABELV $104
line 141
;140:
;141:	line[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRGP4 $101
ADDP4
CNSTI1 0
ASGNI1
line 143
;142:
;143:	return line;
ADDRGP4 $101
RETP4
LABELV $100
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 4 4
line 154
;144:}
;145:
;146:
;147:/*
;148:==================
;149:SanitizeString
;150:
;151:Remove case and control characters
;152:==================
;153:*/
;154:void SanitizeString( const char *in, char *out ) {
ADDRGP4 $112
JUMPV
LABELV $111
line 155
;155:	while ( *in ) {
line 156
;156:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $114
line 157
;157:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 158
;158:			continue;
ADDRGP4 $112
JUMPV
LABELV $114
line 160
;159:		}
;160:		if ( *in < ' ' ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $116
line 161
;161:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 162
;162:			continue;
ADDRGP4 $112
JUMPV
LABELV $116
line 164
;163:		}
;164:		*out = tolower( *in );
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CVII1 4
ASGNI1
line 165
;165:		out++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 166
;166:		in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 167
;167:	}
LABELV $112
line 155
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $111
line 169
;168:
;169:	*out = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 170
;170:}
LABELV $110
endproc SanitizeString 4 4
export ClientNumberFromString
proc ClientNumberFromString 2068 8
line 181
;171:
;172:
;173:/*
;174:==================
;175:ClientNumberFromString
;176:
;177:Returns a player number for either a number or name string
;178:Returns -1 if invalid
;179:==================
;180:*/
;181:int ClientNumberFromString( gentity_t *to, char *s ) {
line 188
;182:	gclient_t	*cl;
;183:	int			idnum;
;184:	char		s2[MAX_STRING_CHARS];
;185:	char		n2[MAX_STRING_CHARS];
;186:
;187:	// numeric values are just slot numbers
;188:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $119
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $119
line 189
;189:		idnum = atoi( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRI4
ASGNI4
line 190
;190:		if ( (unsigned) idnum >= (unsigned)level.maxclients ) {
ADDRLP4 4
INDIRI4
CVIU4 4
ADDRGP4 level+24
INDIRI4
CVIU4 4
LTU4 $121
line 191
;191:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $124
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 192
;192:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $118
JUMPV
LABELV $121
line 195
;193:		}
;194:
;195:		cl = &level.clients[idnum];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 196
;196:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $125
line 197
;197:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $127
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 198
;198:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $118
JUMPV
LABELV $125
line 200
;199:		}
;200:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $118
JUMPV
LABELV $119
line 204
;201:	}
;202:
;203:	// check for a name match
;204:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 205
;205:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $131
JUMPV
LABELV $128
line 206
;206:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $133
line 207
;207:			continue;
ADDRGP4 $129
JUMPV
LABELV $133
line 209
;208:		}
;209:		SanitizeString( cl->pers.netname, n2 );
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 210
;210:		if ( !strcmp( n2, s2 ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $135
line 211
;211:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $118
JUMPV
LABELV $135
line 213
;212:		}
;213:	}
LABELV $129
line 205
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1568
ADDP4
ASGNP4
LABELV $131
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $128
line 215
;214:
;215:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $137
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 216
;216:	return -1;
CNSTI4 -1
RETI4
LABELV $118
endproc ClientNumberFromString 2068 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 228
;217:}
;218:
;219:
;220:/*
;221:==================
;222:Cmd_Give_f
;223:
;224:Give items to a client
;225:==================
;226:*/
;227:void Cmd_Give_f( gentity_t *ent )
;228:{
line 236
;229:	char		*name;
;230:	gitem_t		*it;
;231:	int			i;
;232:	qboolean	give_all;
;233:	gentity_t	*it_ent;
;234:	trace_t		trace;
;235:
;236:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $139
line 237
;237:		return;
ADDRGP4 $138
JUMPV
LABELV $139
line 240
;238:	}
;239:
;240:	name = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 80
INDIRP4
ASGNP4
line 242
;241:
;242:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $141
line 243
;243:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $142
JUMPV
LABELV $141
line 245
;244:	else
;245:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $142
line 247
;246:
;247:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $147
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $146
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $144
LABELV $147
line 248
;248:	{
line 249
;249:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 250
;250:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $148
line 251
;251:			return;
ADDRGP4 $138
JUMPV
LABELV $148
line 252
;252:	}
LABELV $144
line 254
;253:
;254:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $153
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $152
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $150
LABELV $153
line 255
;255:	{
line 256
;256:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - 
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1022
ASGNI4
line 258
;257:			( 1 << WP_GRAPPLING_HOOK ) - ( 1 << WP_NONE );
;258:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $154
line 259
;259:			return;
ADDRGP4 $138
JUMPV
LABELV $154
line 260
;260:	}
LABELV $150
line 262
;261:
;262:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $159
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $156
LABELV $159
line 263
;263:	{
line 264
;264:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $160
line 265
;265:			ent->client->ps.ammo[i] = 999;
ADDRLP4 0
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
CNSTI4 999
ASGNI4
line 266
;266:		}
LABELV $161
line 264
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $160
line 267
;267:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $164
line 268
;268:			return;
ADDRGP4 $138
JUMPV
LABELV $164
line 269
;269:	}
LABELV $156
line 271
;270:
;271:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $169
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $168
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $166
LABELV $169
line 272
;272:	{
line 273
;273:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 200
ASGNI4
line 275
;274:
;275:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $170
line 276
;276:			return;
ADDRGP4 $138
JUMPV
LABELV $170
line 277
;277:	}
LABELV $166
line 279
;278:
;279:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $174
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $172
line 280
;280:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 281
;281:		return;
ADDRGP4 $138
JUMPV
LABELV $172
line 283
;282:	}
;283:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $175
line 284
;284:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 285
;285:		return;
ADDRGP4 $138
JUMPV
LABELV $175
line 287
;286:	}
;287:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $180
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $178
line 288
;288:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 289
;289:		return;
ADDRGP4 $138
JUMPV
LABELV $178
line 291
;290:	}
;291:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $181
line 292
;292:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 293
;293:		return;
ADDRGP4 $138
JUMPV
LABELV $181
line 295
;294:	}
;295:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $186
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $184
line 296
;296:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 297
;297:		return;
ADDRGP4 $138
JUMPV
LABELV $184
line 301
;298:	}
;299:
;300:	// spawn a specific item right on the player
;301:	if ( !give_all ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $187
line 302
;302:		it = BG_FindItem (name);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 124
INDIRP4
ASGNP4
line 303
;303:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $189
line 304
;304:			return;
ADDRGP4 $138
JUMPV
LABELV $189
line 307
;305:		}
;306:
;307:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 308
;308:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 309
;309:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 310
;310:		G_SpawnItem (it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 311
;311:		FinishSpawningItem(it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 312
;312:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 313
;313:		Touch_Item (it_ent, ent, &trace);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 314
;314:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $191
line 315
;315:			G_FreeEntity( it_ent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 316
;316:		}
LABELV $191
line 317
;317:	}
LABELV $187
line 318
;318:}
LABELV $138
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 331
;319:
;320:
;321:/*
;322:==================
;323:Cmd_God_f
;324:
;325:Sets client to godmode
;326:
;327:argv(0) god
;328:==================
;329:*/
;330:void Cmd_God_f( gentity_t *ent )
;331:{
line 334
;332:	const char *msg;
;333:
;334:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $194
line 335
;335:		return;
ADDRGP4 $193
JUMPV
LABELV $194
line 338
;336:	}
;337:
;338:	ent->flags ^= FL_GODMODE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 339
;339:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $196
line 340
;340:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $198
ASGNP4
ADDRGP4 $197
JUMPV
LABELV $196
line 342
;341:	else
;342:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $199
ASGNP4
LABELV $197
line 344
;343:
;344:	trap_SendServerCommand( ent-g_entities, va( "print \"%s\"", msg ) );
ADDRGP4 $200
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 345
;345:}
LABELV $193
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 357
;346:
;347:
;348:/*
;349:==================
;350:Cmd_Notarget_f
;351:
;352:Sets client to notarget
;353:
;354:argv(0) notarget
;355:==================
;356:*/
;357:void Cmd_Notarget_f( gentity_t *ent ) {
line 360
;358:	const char *msg;
;359:
;360:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $202
line 361
;361:		return;
ADDRGP4 $201
JUMPV
LABELV $202
line 364
;362:	}
;363:
;364:	ent->flags ^= FL_NOTARGET;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 365
;365:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $204
line 366
;366:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $206
ASGNP4
ADDRGP4 $205
JUMPV
LABELV $204
line 368
;367:	else
;368:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $207
ASGNP4
LABELV $205
line 370
;369:
;370:	trap_SendServerCommand( ent-g_entities, va( "print \"%s\"", msg ) );
ADDRGP4 $200
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 371
;371:}
LABELV $201
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 381
;372:
;373:
;374:/*
;375:==================
;376:Cmd_Noclip_f
;377:
;378:argv(0) noclip
;379:==================
;380:*/
;381:void Cmd_Noclip_f( gentity_t *ent ) {
line 384
;382:	const char *msg;
;383:
;384:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $209
line 385
;385:		return;
ADDRGP4 $208
JUMPV
LABELV $209
line 388
;386:	}
;387:
;388:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $211
line 389
;389:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $213
ASGNP4
line 390
;390:	} else {
ADDRGP4 $212
JUMPV
LABELV $211
line 391
;391:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $214
ASGNP4
line 392
;392:	}
LABELV $212
line 393
;393:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
NEI4 $216
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $216
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $217
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 395
;394:
;395:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $200
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 396
;396:}
LABELV $208
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 409
;397:
;398:
;399:/*
;400:==================
;401:Cmd_LevelShot_f
;402:
;403:This is just to help generate the level pictures
;404:for the menus.  It goes to the intermission immediately
;405:and sends over a command to the client to resize the view,
;406:hide the scoreboard, and take a special screenshot
;407:==================
;408:*/
;409:void Cmd_LevelShot_f( gentity_t *ent ) {
line 410
;410:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $219
line 411
;411:		return;
ADDRGP4 $218
JUMPV
LABELV $219
line 415
;412:	}
;413:
;414:	// doesn't work in single player
;415:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $221
line 416
;416:		trap_SendServerCommand( ent-g_entities, 
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
ADDRGP4 $224
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 418
;417:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;418:		return;
ADDRGP4 $218
JUMPV
LABELV $221
line 421
;419:	}
;420:
;421:	if ( !ent->client->pers.localClient )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
NEI4 $225
line 422
;422:	{
line 423
;423:		trap_SendServerCommand( ent - g_entities,
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
ADDRGP4 $227
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 425
;424:			"print \"The levelshot command must be executed by a local client\n\"" );
;425:		return;
ADDRGP4 $218
JUMPV
LABELV $225
line 428
;426:	}
;427:
;428:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 429
;429:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
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
ADDRGP4 $228
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 430
;430:}
LABELV $218
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 438
;431:
;432:
;433:/*
;434:==================
;435:Cmd_TeamTask_f
;436:==================
;437:*/
;438:void Cmd_TeamTask_f( gentity_t *ent ) {
line 442
;439:	char userinfo[MAX_INFO_STRING];
;440:	char arg[MAX_TOKEN_CHARS];
;441:	int task;
;442:	int client = ent->client - level.clients;
ADDRLP4 1024
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
ASGNI4
line 444
;443:
;444:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $230
line 445
;445:		return;
ADDRGP4 $229
JUMPV
LABELV $230
line 447
;446:	}
;447:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 448
;448:	task = atoi( arg );
ADDRLP4 1028
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
ASGNI4
line 450
;449:
;450:	trap_GetUserinfo( client, userinfo, sizeof( userinfo ) );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 451
;451:	Info_SetValueForKey( userinfo, "teamtask", va( "%d", task ) );
ADDRGP4 $233
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $232
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 452
;452:	trap_SetUserinfo( client, userinfo );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 453
;453:	ClientUserinfoChanged( client );
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 454
;454:}
LABELV $229
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 24 20
line 462
;455:
;456:
;457:/*
;458:=================
;459:Cmd_Kill_f
;460:=================
;461:*/
;462:void Cmd_Kill_f( gentity_t *ent ) {
line 464
;463://qlone - freezetag
;464:	if ( /*ent->client->sess.sessionTeam == TEAM_SPECTATOR*/ is_spectator( ent->client ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $235
line 466
;465://qlone - freezetag
;466:		return;
ADDRGP4 $234
JUMPV
LABELV $235
line 468
;467:	}
;468:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $237
line 469
;469:		return;
ADDRGP4 $234
JUMPV
LABELV $237
line 471
;470:	}
;471:	ent->flags &= ~FL_GODMODE;
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
CNSTI4 -17
BANDI4
ASGNI4
line 472
;472:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 -999
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 474
;473://qlone - freezetag
;474:	if ( g_freezeTag.integer )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $239
line 475
;475:		player_die (ent, ent, ent, 100000, MOD_BFG_SPLASH);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 player_die
CALLV
pop
ADDRGP4 $240
JUMPV
LABELV $239
line 478
;476:	else
;477://qlone - freezetag
;478:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
LABELV $240
line 479
;479:}
LABELV $234
endproc Cmd_Kill_f 24 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 490
;480:
;481:
;482:/*
;483:=================
;484:BroadcastTeamChange
;485:
;486:Let everyone know about a team change
;487:=================
;488:*/
;489:void BroadcastTeamChange( gclient_t *client, team_t oldTeam )
;490:{
line 491
;491:	int clientNum = client - level.clients;
ADDRLP4 0
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
ASGNI4
line 493
;492:
;493:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
NEI4 $243
line 494
;494:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the " S_COLOR_RED "red" S_COLOR_WHITE " team.\n\"",
ADDRGP4 $245
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 496
;495:			client->pers.netname) );
;496:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $244
JUMPV
LABELV $243
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $246
line 497
;497:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the " S_COLOR_BLUE "blue" S_COLOR_WHITE " team.\n\"",
ADDRGP4 $248
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 499
;498:		client->pers.netname));
;499:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $247
JUMPV
LABELV $246
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $249
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $249
line 500
;500:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"",
ADDRGP4 $251
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 502
;501:		client->pers.netname));
;502:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $250
JUMPV
LABELV $249
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $252
line 503
;503:		G_BroadcastServerCommand( clientNum, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"",
ADDRGP4 $254
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 505
;504:		client->pers.netname));
;505:	}
LABELV $252
LABELV $250
LABELV $247
LABELV $244
line 506
;506:}
LABELV $242
endproc BroadcastTeamChange 8 8
proc AllowTeamSwitch 24 8
line 509
;507:
;508:
;509:static qboolean AllowTeamSwitch( int clientNum, team_t newTeam ) {
line 511
;510:
;511:	if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $256
line 514
;512:		int		counts[TEAM_NUM_TEAMS];
;513:
;514:		counts[TEAM_BLUE] = TeamCount( clientNum, TEAM_BLUE );
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
line 515
;515:		counts[TEAM_RED] = TeamCount( clientNum, TEAM_RED );
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
line 518
;516:
;517:		// We allow a spread of two
;518:		if ( newTeam == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $261
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
SUBI4
CNSTI4 1
LEI4 $261
line 519
;519:			trap_SendServerCommand( clientNum, "cp \"Red team has too many players.\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $265
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 520
;520:			return qfalse; // ignore the request
CNSTI4 0
RETI4
ADDRGP4 $255
JUMPV
LABELV $261
line 523
;521:		}
;522:
;523:		if ( newTeam == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $266
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $266
line 524
;524:			trap_SendServerCommand( clientNum, "cp \"Blue team has too many players.\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $270
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 525
;525:			return qfalse; // ignore the request
CNSTI4 0
RETI4
ADDRGP4 $255
JUMPV
LABELV $266
line 529
;526:		}
;527:
;528:		// It's ok, the team we are switching to has less or same number of players
;529:	}
LABELV $256
line 531
;530:
;531:	return qtrue;
CNSTI4 1
RETI4
LABELV $255
endproc AllowTeamSwitch 24 8
export SetTeam
proc SetTeam 76 20
line 540
;532:}
;533:
;534:
;535:/*
;536:=================
;537:SetTeam
;538:=================
;539:*/
;540:qboolean SetTeam( gentity_t *ent, const char *s ) {
line 553
;541:	team_t				team, oldTeam;
;542:	gclient_t			*client;
;543:	int					clientNum;
;544:	spectatorState_t	specState;
;545:	int					specClient;
;546:	int					teamLeader;
;547:	qboolean			checkTeamLeader;
;548:
;549:	//
;550:	// see what change is requested
;551:	//
;552:
;553:	clientNum = ent - g_entities;
ADDRLP4 12
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
line 554
;554:	client = level.clients + clientNum;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 557
;555:
;556:	// early team override
;557:	if ( client->pers.connected == CON_CONNECTING && g_gametype.integer >= GT_TEAM ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $272
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $272
line 558
;558:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $279
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $275
LABELV $279
line 559
;559:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 560
;560:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $276
JUMPV
LABELV $275
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $284
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $283
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $280
LABELV $284
line 561
;561:			team = TEAM_BLUE; 
ADDRLP4 4
CNSTI4 2
ASGNI4
line 562
;562:		} else {
ADDRGP4 $281
JUMPV
LABELV $280
line 563
;563:			team = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 564
;564:		}
LABELV $281
LABELV $276
line 565
;565:		if ( team != -1 && AllowTeamSwitch( clientNum, team ) ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $285
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 AllowTeamSwitch
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $285
line 566
;566:			client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 567
;567:			client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 568
;568:			G_WriteClientSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 570
;569:			// count current clients and rank for scoreboard
;570:			CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 571
;571:		}
LABELV $285
line 572
;572:		return qfalse; // bypass flood protection
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $272
line 575
;573:	}
;574:
;575:	specClient = clientNum;
ADDRLP4 20
ADDRLP4 12
INDIRI4
ASGNI4
line 576
;576:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 577
;577:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $289
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $291
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $290
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $287
LABELV $291
line 578
;578:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 579
;579:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 580
;580:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $288
JUMPV
LABELV $287
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $294
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $292
line 581
;581:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 582
;582:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 583
;583:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 584
;584:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $293
JUMPV
LABELV $292
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $297
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $295
line 585
;585:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 586
;586:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 587
;587:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 588
;588:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $296
JUMPV
LABELV $295
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $302
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $298
LABELV $302
line 589
;589:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 590
;590:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 591
;591:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $299
JUMPV
LABELV $298
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $303
line 593
;592:		// if running a team game, assign player to one of the teams
;593:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 594
;594:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $308
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $278
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $306
LABELV $308
line 595
;595:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 596
;596:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $307
JUMPV
LABELV $306
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $311
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $283
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $309
LABELV $311
line 597
;597:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 598
;598:		} else {
ADDRGP4 $310
JUMPV
LABELV $309
line 600
;599:			// pick the team with the least number of players
;600:			team = PickTeam( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 72
INDIRI4
ASGNI4
line 601
;601:		}
LABELV $310
LABELV $307
line 603
;602:
;603:		if ( !AllowTeamSwitch( clientNum, team ) ) {
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 AllowTeamSwitch
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $304
line 604
;604:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $271
JUMPV
line 607
;605:		}
;606:
;607:	} else {
LABELV $303
line 609
;608:		// force them to spectators if there aren't any spots free
;609:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 610
;610:	}
LABELV $304
LABELV $299
LABELV $296
LABELV $293
LABELV $288
line 613
;611:
;612:	// override decision if limiting the players
;613:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $314
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $314
line 614
;614:		&& level.numNonSpectatorClients >= 2 ) {
line 615
;615:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 616
;616:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $315
JUMPV
LABELV $314
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $318
ADDRGP4 level+80
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $318
line 617
;617:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 618
;618:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 619
;619:	}
LABELV $318
LABELV $315
line 624
;620:
;621:	//
;622:	// decide if we will allow the change
;623:	//
;624:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 625
;625:	if ( team == oldTeam ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $323
line 626
;626:		if ( team != TEAM_SPECTATOR )
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $325
line 627
;627:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $325
line 630
;628:
;629:		// do soft release if possible
;630:		if ( ( client->ps.pm_flags & PMF_FOLLOW ) && client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $327
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $327
line 631
;631:			StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 632
;632:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $327
line 636
;633:		}
;634:
;635:		// second spectator team request will move player to intermission point
;636:		if ( client->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR && !( client->ps.pm_flags & PMF_FOLLOW )
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $329
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $329
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 1
NEI4 $329
line 637
;637:			&& client->sess.spectatorState == SPECTATOR_FREE ) {
line 638
;638:			VectorCopy( level.intermission_origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 639
;639:			VectorCopy( level.intermission_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 640
;640:			SetClientViewAngle( ent, level.intermission_angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 641
;641:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $271
JUMPV
LABELV $329
line 643
;642:		}
;643:	}
LABELV $323
line 650
;644:
;645:	//
;646:	// execute the team change
;647:	//
;648:
;649:	// if the player was dead leave the body
;650:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $334
line 651
;651:		CopyToBodyQue( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 652
;652:	}
LABELV $334
line 655
;653:
;654:	// he starts at 'base'
;655:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 657
;656:
;657:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $336
line 660
;658:		
;659:		// revert any casted votes
;660:		if ( oldTeam != team )
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $338
line 661
;661:			G_RevertVote( ent->client );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RevertVote
CALLV
pop
LABELV $338
line 664
;662:
;663:		// Kill him (makes sure he loses flags, etc)
;664:		ent->flags &= ~FL_GODMODE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 665
;665:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 666
;666:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 667
;667:	}
LABELV $336
line 670
;668:
;669:	// they go to the end of the line for tournements
;670:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $340
line 671
;671:		client->sess.spectatorTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 0
ASGNI4
line 672
;672:	}
LABELV $340
line 674
;673:
;674:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 675
;675:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 676
;676:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 678
;677:
;678:	checkTeamLeader = client->sess.teamLeader;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ASGNI4
line 679
;679:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 0
ASGNI4
line 681
;680:
;681:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $344
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $342
LABELV $344
line 682
;682:		teamLeader = TeamLeader( team );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 TeamLeader
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
ASGNI4
line 684
;683:		// if there is no team leader or the team leader is a bot and this client is not a bot
;684:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $351
ADDRLP4 12
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $345
ADDRLP4 64
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $345
LABELV $351
line 685
;685:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 686
;686:		}
LABELV $345
line 687
;687:	}
LABELV $342
line 690
;688:
;689:	// make sure there is a team leader on the team the player came from
;690:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $354
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $352
LABELV $354
line 691
;691:		if ( checkTeamLeader ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $355
line 692
;692:			CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 693
;693:		}
LABELV $355
line 694
;694:	}
LABELV $352
line 696
;695:
;696:	G_WriteClientSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 698
;697:
;698:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 701
;699:
;700:	// get and distribute relevent paramters
;701:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 703
;702:
;703:	ClientBegin( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 705
;704:
;705:	return qtrue;
CNSTI4 1
RETI4
LABELV $271
endproc SetTeam 76 20
export StopFollowing
proc StopFollowing 12 12
line 717
;706:}
;707:
;708:
;709:/*
;710:=================
;711:StopFollowing
;712:
;713:If the client being followed leaves the game, or you just want to drop
;714:to free floating spectator mode
;715:=================
;716:*/
;717:void StopFollowing( gentity_t *ent, qboolean release ) {
line 720
;718:	gclient_t *client;
;719:
;720:	if ( ent->r.svFlags & SVF_BOT || !ent->inuse )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $360
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $358
LABELV $360
line 721
;721:		return;
ADDRGP4 $357
JUMPV
LABELV $358
line 723
;722:
;723:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 725
;724:
;725:	client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 727
;726://qlone - freezetag
;727:	if ( !g_freezeTag.integer )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
NEI4 $361
line 728
;728:	client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 3
ASGNI4
LABELV $361
line 730
;729://qlone - freezetag
;730:	if ( release ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $364
line 731
;731:		client->ps.stats[STAT_HEALTH] = ent->health = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 732
;732:		memset( client->ps.powerups, 0, sizeof ( client->ps.powerups ) );
ADDRLP4 0
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
line 733
;733:	}
LABELV $364
line 734
;734:	SetClientViewAngle( ent, client->ps.viewangles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 736
;735:
;736:	client->sess.spectatorState = SPECTATOR_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 1
ASGNI4
line 737
;737:	client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 740
;738:	//ent->r.svFlags &= ~SVF_BOT;
;739:
;740:	client->ps.clientNum = ent - g_entities;
ADDRLP4 0
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
line 741
;741:}
LABELV $357
endproc StopFollowing 12 12
export Cmd_Team_f
proc Cmd_Team_f 1036 12
line 749
;742:
;743:
;744:/*
;745:=================
;746:Cmd_Team_f
;747:=================
;748:*/
;749:void Cmd_Team_f( gentity_t *ent ) {
line 752
;750:	char		s[MAX_TOKEN_CHARS];
;751:
;752:	if ( trap_Argc() != 2 ) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
EQI4 $367
line 753
;753:		switch ( ent->client->sess.sessionTeam ) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $366
ADDRLP4 1028
INDIRI4
CNSTI4 3
GTI4 $366
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $380
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $380
address $376
address $374
address $372
address $378
code
LABELV $372
line 755
;754:		case TEAM_BLUE:
;755:			trap_SendServerCommand( ent-g_entities, "print \"Blue team\n\"" );
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
ADDRGP4 $373
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 756
;756:			break;
ADDRGP4 $366
JUMPV
LABELV $374
line 758
;757:		case TEAM_RED:
;758:			trap_SendServerCommand( ent-g_entities, "print \"Red team\n\"" );
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
ADDRGP4 $375
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 759
;759:			break;
ADDRGP4 $366
JUMPV
LABELV $376
line 761
;760:		case TEAM_FREE:
;761:			trap_SendServerCommand( ent-g_entities, "print \"Free team\n\"" );
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
ADDRGP4 $377
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 762
;762:			break;
ADDRGP4 $366
JUMPV
LABELV $378
line 764
;763:		case TEAM_SPECTATOR:
;764:			trap_SendServerCommand( ent-g_entities, "print \"Spectator team\n\"" );
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
ADDRGP4 $379
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 765
;765:			break;
line 766
;766:		default: break; //qlone - avoid compiler warnings
line 768
;767:		}
;768:		return;
ADDRGP4 $366
JUMPV
LABELV $367
line 771
;769:	}
;770:
;771:	if ( ent->client->switchTeamTime > level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $381
line 772
;772:		trap_SendServerCommand( ent-g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"" );
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
ADDRGP4 $384
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 773
;773:		return;
ADDRGP4 $366
JUMPV
LABELV $381
line 777
;774:	}
;775:
;776:	// if they are playing a tournement game, count as a loss
;777:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $385
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $385
line 778
;778:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 779
;779:		ent->client->sess.losses++;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 1028
INDIRP4
ADDRLP4 1028
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 780
;780:	}
LABELV $385
line 783
;781:
;782:	//qlone - freezetag
;783:	if ( g_freezeTag.integer && ent->freezeState ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $388
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $388
line 784
;784:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $366
line 785
;785:			StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 786
;786:		}
line 787
;787:		return;
ADDRGP4 $366
JUMPV
LABELV $388
line 791
;788:	}
;789:	//qlone - freezetag
;790:
;791:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 793
;792:
;793:	if ( SetTeam( ent, s ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 SetTeam
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $393
line 794
;794:		ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 795
;795:	}
LABELV $393
line 796
;796:}
LABELV $366
endproc Cmd_Team_f 1036 12
export Cmd_Follow_f
proc Cmd_Follow_f 1048 12
line 804
;797:
;798:
;799:/*
;800:=================
;801:Cmd_Follow_f
;802:=================
;803:*/
;804:void Cmd_Follow_f( gentity_t *ent ) {
line 808
;805:	int		i;
;806:	char	arg[MAX_TOKEN_CHARS];
;807:
;808:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $397
line 809
;809:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $396
line 810
;810:			StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 811
;811:		}
line 812
;812:		return;
ADDRGP4 $396
JUMPV
LABELV $397
line 815
;813:	}
;814:
;815:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 816
;816:	i = ClientNumberFromString( ent, arg );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 817
;817:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $401
line 818
;818:		return;
ADDRGP4 $396
JUMPV
LABELV $401
line 822
;819:	}
;820:
;821:	// can't follow self
;822:	if ( &level.clients[ i ] == ent->client ) {
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $403
line 823
;823:		return;
ADDRGP4 $396
JUMPV
LABELV $403
line 828
;824:	}
;825:
;826:	// can't follow another spectator
;827://qlone - freezetag
;828:	if ( !g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
NEI4 $405
line 830
;829://qlone - freezetag
;830:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
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
CNSTI4 3
NEI4 $406
line 831
;831:		return;
ADDRGP4 $396
JUMPV
line 834
;832:	}
;833://qlone - freezetag
;834:	} else {
LABELV $405
line 835
;835:		if ( ent->freezeState && !is_spectator( ent->client ) ) return;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $410
ADDRLP4 1036
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $410
ADDRGP4 $396
JUMPV
LABELV $410
line 836
;836:		if ( is_spectator( &level.clients[ i ] ) ) return;
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRLP4 1044
ADDRGP4 is_spectator
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $412
ADDRGP4 $396
JUMPV
LABELV $412
line 837
;837:	}
LABELV $406
line 841
;838://qlone - freezetag
;839:
;840:	// if they are playing a tournement game, count as a loss
;841:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $414
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $414
line 842
;842:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 843
;843:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 844
;844:	}
LABELV $414
line 847
;845:
;846:	// first set them to spectator
;847:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $417
line 848
;848:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $300
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 849
;849:	}
LABELV $417
line 851
;850:
;851:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 2
ASGNI4
line 852
;852:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 853
;853:}
LABELV $396
endproc Cmd_Follow_f 1048 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 24 8
line 861
;854:
;855:
;856:/*
;857:=================
;858:Cmd_FollowCycle_f
;859:=================
;860:*/
;861:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 867
;862:	int		clientnum;
;863:	int		original;
;864:	gclient_t	*client;
;865:
;866:	//qlone - freezetag
;867:	if (g_freezeTag.integer) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $420
line 868
;868:		if ( ent->freezeState && !is_spectator( ent->client ) ) return;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $423
ADDRLP4 12
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
NEI4 $423
ADDRGP4 $419
JUMPV
LABELV $423
line 869
;869:		if ( Set_Client( ent ) ) return;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Set_Client
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $425
ADDRGP4 $419
JUMPV
LABELV $425
line 870
;870:	}
LABELV $420
line 874
;871:	//qlone - freezetag
;872:
;873:	// if they are playing a tournement game, count as a loss
;874:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $427
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $427
line 875
;875:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 876
;876:		ent->client->sess.losses++;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 877
;877:	}
LABELV $427
line 879
;878:
;879:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 882
;880:
;881:	// first set them to spectator
;882:	if ( client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRLP4 8
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
NEI4 $430
line 883
;883:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $300
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 884
;884:	}
LABELV $430
line 886
;885:
;886:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $432
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $432
line 887
;887:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $434
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 888
;888:	}
LABELV $432
line 890
;889:
;890:	clientnum = client->sess.spectatorClient;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 891
;891:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $435
line 892
;892:	do {
line 893
;893:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 894
;894:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $438
line 895
;895:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 896
;896:		}
LABELV $438
line 897
;897:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $441
line 898
;898:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 899
;899:		}
LABELV $441
line 902
;900:
;901:		// can only follow connected clients
;902:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
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
EQI4 $444
line 903
;903:			continue;
ADDRGP4 $436
JUMPV
LABELV $444
line 908
;904:		}
;905:
;906:		// can't follow another spectator
;907://qlone - freezetag
;908:		if ( !g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
NEI4 $446
line 910
;909://qlone - freezetag
;910:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
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
CNSTI4 3
NEI4 $447
line 911
;911:			continue;
ADDRGP4 $436
JUMPV
line 914
;912:		}
;913://qlone - freezetag
;914:		} else {
LABELV $446
line 915
;915:			if ( &level.clients[ clientnum ] == ent->client ) {
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $451
line 916
;916:				if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $453
line 917
;917:					StopFollowing( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 918
;918:					ent->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 919
;919:					ent->client->ps.pm_time = 100;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 920
;920:					return;
ADDRGP4 $419
JUMPV
LABELV $453
line 922
;921:				}
;922:			}
LABELV $451
line 923
;923:			if ( g_entities[ clientnum ].freezeState ) continue;
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $455
ADDRGP4 $436
JUMPV
LABELV $455
line 924
;924:			if ( is_spectator( &level.clients[ clientnum ] ) ) continue;
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
EQI4 $458
ADDRGP4 $436
JUMPV
LABELV $458
line 925
;925:		}
LABELV $447
line 929
;926://qlone - freezetag
;927:
;928:		//qlone - limit spectator to teammates
;929:		if (g_specLock.integer
ADDRGP4 g_specLock+12
INDIRI4
CNSTI4 0
EQI4 $460
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
NEI4 $464
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
CNSTI4 2
EQI4 $463
LABELV $464
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $460
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
CNSTI4 1
NEI4 $460
LABELV $463
line 931
;930:			&& ( (ent->client->sess.sessionTeam == TEAM_RED && level.clients[ clientnum ].sess.sessionTeam == TEAM_BLUE)
;931:			|| (ent->client->sess.sessionTeam == TEAM_BLUE && level.clients[ clientnum ].sess.sessionTeam == TEAM_RED) ) ) {
line 932
;932:				continue;
ADDRGP4 $436
JUMPV
LABELV $460
line 937
;933:		}
;934:		//qlone - limit spectator to teammates
;935:
;936:		// this is good, we can use it
;937:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 938
;938:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 2
ASGNI4
line 939
;939:		return;
ADDRGP4 $419
JUMPV
LABELV $436
line 940
;940:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $435
line 943
;941:
;942:	// leave it where it was
;943:}
LABELV $419
endproc Cmd_FollowCycle_f 24 8
proc G_SayTo 12 28
line 951
;944:
;945:
;946:/*
;947:==================
;948:G_Say
;949:==================
;950:*/
;951:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 952
;952:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $466
line 953
;953:		return;
ADDRGP4 $465
JUMPV
LABELV $466
line 955
;954:	}
;955:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $468
line 956
;956:		return;
ADDRGP4 $465
JUMPV
LABELV $468
line 958
;957:	}
;958:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $470
line 959
;959:		return;
ADDRGP4 $465
JUMPV
LABELV $470
line 961
;960:	}
;961:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $472
line 962
;962:		return;
ADDRGP4 $465
JUMPV
LABELV $472
line 964
;963:	}
;964:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $474
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
NEI4 $474
line 965
;965:		return;
ADDRGP4 $465
JUMPV
LABELV $474
line 968
;966:	}
;967:	// no chatting to players in tournements
;968:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $476
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $476
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
EQI4 $476
line 970
;969:		&& other->client->sess.sessionTeam == TEAM_FREE
;970:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 971
;971:		return;
ADDRGP4 $465
JUMPV
LABELV $476
line 974
;972:	}
;973:
;974:	trap_SendServerCommand( other-g_entities, va( "%s \"%s%c%c%s\" %i", mode == SAY_TEAM ? "tchat" : "chat", 
ADDRGP4 $479
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $483
ADDRLP4 4
ADDRGP4 $480
ASGNP4
ADDRGP4 $484
JUMPV
LABELV $483
ADDRLP4 4
ADDRGP4 $481
ASGNP4
LABELV $484
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
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
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 824
DIVI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 976
;975:		name, Q_COLOR_ESCAPE, color, message, ent - g_entities ) );
;976:}
LABELV $465
endproc G_SayTo 12 28
export G_Say
proc G_Say 312 28
line 980
;977:
;978:#define EC		"\x19"
;979:
;980:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 989
;981:	int			j;
;982:	gentity_t	*other;
;983:	int			color;
;984:	char		name[64];
;985:	// don't let text be too long for malicious reasons
;986:	char		text[MAX_SAY_TEXT];
;987:	char		location[64];
;988:
;989:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $486
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $486
line 990
;990:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 991
;991:	}
LABELV $486
line 993
;992:
;993:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $491
ADDRLP4 292
INDIRI4
CNSTI4 1
EQI4 $494
ADDRLP4 292
INDIRI4
CNSTI4 2
EQI4 $500
ADDRGP4 $489
JUMPV
LABELV $489
LABELV $491
line 996
;994:	default:
;995:	case SAY_ALL:
;996:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $492
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 997
;997:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $493
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 998
;998:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 999
;999:		break;
ADDRGP4 $490
JUMPV
LABELV $494
line 1001
;1000:	case SAY_TEAM:
;1001:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $495
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1002
;1002:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 296
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $496
line 1003
;1003:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $498
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $497
JUMPV
LABELV $496
line 1006
;1004:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1005:		else
;1006:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $499
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $497
line 1008
;1007:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;1008:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 1009
;1009:		break;
ADDRGP4 $490
JUMPV
LABELV $500
line 1011
;1010:	case SAY_TELL:
;1011:		if (target && target->inuse && target->client && g_gametype.integer >= GT_TEAM &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $501
ADDRLP4 300
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $501
ADDRLP4 300
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $501
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $501
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 304
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
NEI4 $501
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 308
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $501
line 1014
;1012:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;1013:			Team_GetLocationMsg(ent, location, sizeof(location)))
;1014:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $504
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $502
JUMPV
LABELV $501
line 1016
;1015:		else
;1016:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $505
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $502
line 1017
;1017:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 1018
;1018:		break;
LABELV $490
line 1021
;1019:	}
;1020:
;1021:	Q_strncpyz( text, chatText, sizeof(text) );
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1023
;1022:
;1023:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $506
line 1024
;1024:		G_SayTo( ent, target, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1025
;1025:		return;
ADDRGP4 $485
JUMPV
LABELV $506
line 1029
;1026:	}
;1027:
;1028:	// echo the text to the console
;1029:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $508
line 1030
;1030:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $511
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1031
;1031:	}
LABELV $508
line 1034
;1032:
;1033:	// send it to all the apropriate clients
;1034:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $515
JUMPV
LABELV $512
line 1035
;1035:		other = &g_entities[j];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1036
;1036:		G_SayTo( ent, other, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1037
;1037:	}
LABELV $513
line 1034
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $515
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $512
line 1038
;1038:}
LABELV $485
endproc G_Say 312 28
proc Cmd_Say_f 12 16
line 1046
;1039:
;1040:
;1041:/*
;1042:==================
;1043:Cmd_Say_f
;1044:==================
;1045:*/
;1046:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 1049
;1047:	char		*p;
;1048:
;1049:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $518
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $518
line 1050
;1050:		return;
ADDRGP4 $517
JUMPV
LABELV $518
line 1053
;1051:	}
;1052:
;1053:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $520
line 1054
;1054:	{
line 1055
;1055:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1056
;1056:	}
ADDRGP4 $521
JUMPV
LABELV $520
line 1058
;1057:	else
;1058:	{
line 1059
;1059:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1060
;1060:	}
LABELV $521
line 1062
;1061:
;1062:	G_Say( ent, NULL, mode, p );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1063
;1063:}
LABELV $517
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1060 16
line 1071
;1064:
;1065:
;1066:/*
;1067:==================
;1068:Cmd_Tell_f
;1069:==================
;1070:*/
;1071:static void Cmd_Tell_f( gentity_t *ent ) {
line 1077
;1072:	int			targetNum;
;1073:	gentity_t	*target;
;1074:	char		*p;
;1075:	char		arg[MAX_TOKEN_CHARS];
;1076:
;1077:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $523
line 1078
;1078:		return;
ADDRGP4 $522
JUMPV
LABELV $523
line 1081
;1079:	}
;1080:
;1081:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1082
;1082:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1040
INDIRI4
ASGNI4
line 1083
;1083:	if ( (unsigned)targetNum >= (unsigned)level.maxclients ) {
ADDRLP4 8
INDIRI4
CVIU4 4
ADDRGP4 level+24
INDIRI4
CVIU4 4
LTU4 $525
line 1084
;1084:		return;
ADDRGP4 $522
JUMPV
LABELV $525
line 1087
;1085:	}
;1086:
;1087:	target = &g_entities[targetNum];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1088
;1088:	if ( !target->inuse || !target->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $530
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $528
LABELV $530
line 1089
;1089:		return;
ADDRGP4 $522
JUMPV
LABELV $528
line 1092
;1090:	}
;1091:
;1092:	p = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1048
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1048
INDIRP4
ASGNP4
line 1094
;1093:
;1094:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $531
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1095
;1095:	G_Say( ent, target, SAY_TELL, p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1098
;1096:	// don't tell to the player self if it was already directed to this player
;1097:	// also don't send the chat back to a bot
;1098:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $532
ADDRLP4 1052
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $532
line 1099
;1099:		G_Say( ent, ent, SAY_TELL, p );
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1100
;1100:	}
LABELV $532
line 1101
;1101:}
LABELV $522
endproc Cmd_Tell_f 1060 16
data
align 4
LABELV gc_orders
address $534
address $535
address $536
address $537
address $538
address $539
address $540
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1044 16
line 1313
;1102:
;1103:#ifdef MISSIONPACK
;1104:
;1105:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
;1106:	int color;
;1107:	char *cmd;
;1108:
;1109:	if (!other) {
;1110:		return;
;1111:	}
;1112:	if (!other->inuse) {
;1113:		return;
;1114:	}
;1115:	if (!other->client) {
;1116:		return;
;1117:	}
;1118:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
;1119:		return;
;1120:	}
;1121:	// no chatting to players in tournements
;1122:	if ( g_gametype.integer == GT_TOURNAMENT ) {
;1123:		return;
;1124:	}
;1125:
;1126:	if (mode == SAY_TEAM) {
;1127:		color = COLOR_CYAN;
;1128:		cmd = "vtchat";
;1129:	}
;1130:	else if (mode == SAY_TELL) {
;1131:		color = COLOR_MAGENTA;
;1132:		cmd = "vtell";
;1133:	}
;1134:	else {
;1135:		color = COLOR_GREEN;
;1136:		cmd = "vchat";
;1137:	}
;1138:
;1139:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
;1140:}
;1141:
;1142:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
;1143:	int			j;
;1144:	gentity_t	*other;
;1145:
;1146:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
;1147:		mode = SAY_ALL;
;1148:	}
;1149:
;1150:	if ( target ) {
;1151:		G_VoiceTo( ent, target, mode, id, voiceonly );
;1152:		return;
;1153:	}
;1154:
;1155:	// echo the text to the console
;1156:	if ( g_dedicated.integer ) {
;1157:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
;1158:	}
;1159:
;1160:	// send it to all the apropriate clients
;1161:	for (j = 0; j < level.maxclients; j++) {
;1162:		other = &g_entities[j];
;1163:		G_VoiceTo( ent, other, mode, id, voiceonly );
;1164:	}
;1165:}
;1166:
;1167:/*
;1168:==================
;1169:Cmd_Voice_f
;1170:==================
;1171:*/
;1172:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
;1173:	char		*p;
;1174:
;1175:	if ( trap_Argc () < 2 && !arg0 ) {
;1176:		return;
;1177:	}
;1178:
;1179:	if (arg0)
;1180:	{
;1181:		p = ConcatArgs( 0 );
;1182:	}
;1183:	else
;1184:	{
;1185:		p = ConcatArgs( 1 );
;1186:	}
;1187:
;1188:	G_Voice( ent, NULL, mode, p, voiceonly );
;1189:}
;1190:
;1191:/*
;1192:==================
;1193:Cmd_VoiceTell_f
;1194:==================
;1195:*/
;1196:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
;1197:	int			targetNum;
;1198:	gentity_t	*target;
;1199:	char		*id;
;1200:	char		arg[MAX_TOKEN_CHARS];
;1201:
;1202:	if ( trap_Argc () < 2 ) {
;1203:		return;
;1204:	}
;1205:
;1206:	trap_Argv( 1, arg, sizeof( arg ) );
;1207:	targetNum = atoi( arg );
;1208:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
;1209:		return;
;1210:	}
;1211:
;1212:	target = &g_entities[targetNum];
;1213:	if ( !target->inuse || !target->client ) {
;1214:		return;
;1215:	}
;1216:
;1217:	id = ConcatArgs( 2 );
;1218:
;1219:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
;1220:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
;1221:	// don't tell to the player self if it was already directed to this player
;1222:	// also don't send the chat back to a bot
;1223:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
;1224:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
;1225:	}
;1226:}
;1227:
;1228:
;1229:/*
;1230:==================
;1231:Cmd_VoiceTaunt_f
;1232:==================
;1233:*/
;1234:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
;1235:	gentity_t *who;
;1236:	int i;
;1237:
;1238:	if (!ent->client) {
;1239:		return;
;1240:	}
;1241:
;1242:	// insult someone who just killed you
;1243:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
;1244:		// i am a dead corpse
;1245:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
;1246:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
;1247:		}
;1248:		if (!(ent->r.svFlags & SVF_BOT)) {
;1249:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
;1250:		}
;1251:		ent->enemy = NULL;
;1252:		return;
;1253:	}
;1254:	// insult someone you just killed
;1255:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
;1256:		who = g_entities + ent->client->lastkilled_client;
;1257:		if (who->client) {
;1258:			// who is the person I just killed
;1259:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
;1260:				if (!(who->r.svFlags & SVF_BOT)) {
;1261:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
;1262:				}
;1263:				if (!(ent->r.svFlags & SVF_BOT)) {
;1264:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
;1265:				}
;1266:			} else {
;1267:				if (!(who->r.svFlags & SVF_BOT)) {
;1268:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
;1269:				}
;1270:				if (!(ent->r.svFlags & SVF_BOT)) {
;1271:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
;1272:				}
;1273:			}
;1274:			ent->client->lastkilled_client = -1;
;1275:			return;
;1276:		}
;1277:	}
;1278:
;1279:	if (g_gametype.integer >= GT_TEAM) {
;1280:		// praise a team mate who just got a reward
;1281:		for(i = 0; i < MAX_CLIENTS; i++) {
;1282:			who = g_entities + i;
;1283:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
;1284:				if (who->client->rewardTime > level.time) {
;1285:					if (!(who->r.svFlags & SVF_BOT)) {
;1286:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
;1287:					}
;1288:					if (!(ent->r.svFlags & SVF_BOT)) {
;1289:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
;1290:					}
;1291:					return;
;1292:				}
;1293:			}
;1294:		}
;1295:	}
;1296:
;1297:	// just say something
;1298:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
;1299:}
;1300:#endif
;1301:
;1302:
;1303:static char	*gc_orders[] = {
;1304:	"hold your position",
;1305:	"hold this position",
;1306:	"come here",
;1307:	"cover me",
;1308:	"guard location",
;1309:	"search and destroy",
;1310:	"report"
;1311:};
;1312:
;1313:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1318
;1314:	int		player;
;1315:	int		order;
;1316:	char	str[MAX_TOKEN_CHARS];
;1317:
;1318:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1319
;1319:	player = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 1320
;1320:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1321
;1321:	order = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1323
;1322:
;1323:	if ( (unsigned)player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $542
line 1324
;1324:		return;
ADDRGP4 $541
JUMPV
LABELV $542
line 1326
;1325:	}
;1326:	if ( (unsigned) order > ARRAY_LEN( gc_orders ) ) {
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $544
line 1327
;1327:		return;
ADDRGP4 $541
JUMPV
LABELV $544
line 1329
;1328:	}
;1329:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1330
;1330:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1331
;1331:}
LABELV $541
endproc Cmd_GameCommand_f 1044 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1339
;1332:
;1333:
;1334:/*
;1335:==================
;1336:Cmd_Where_f
;1337:==================
;1338:*/
;1339:void Cmd_Where_f( gentity_t *ent ) {
line 1340
;1340:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $547
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1341
;1341:}
LABELV $546
endproc Cmd_Where_f 8 8
data
align 4
LABELV voteCommands
address $548
address $549
address $550
address $551
address $552
address $553
address $554
address $555
address $556
address $557
address $558
address $559
code
proc ValidVoteCommand 320 12
line 1383
;1342:
;1343:
;1344://qlone - avoid compiler warnings
;1345:/*
;1346:static const char *gameNames[] = {
;1347:	"Free For All",
;1348:	"Tournament",
;1349:	"Single Player",
;1350:	"Team Deathmatch",
;1351:	"Capture the Flag",
;1352:	"One Flag CTF",
;1353:	"Overload",
;1354:	"Harvester"
;1355:};
;1356:*/
;1357://qlone - avoid compiler warnings
;1358:
;1359:static const char *voteCommands[] = {
;1360:	"map_restart",
;1361:	"map",
;1362:	"rotate",
;1363:	"nextmap",
;1364:	"kick",
;1365:	"clientkick",
;1366:	"g_gametype",
;1367:	"g_unlagged",
;1368:	"g_warmup",
;1369:	"timelimit",
;1370:	"fraglimit",
;1371:	"capturelimit"
;1372:};
;1373:
;1374:
;1375:/*
;1376:==================
;1377:ValidVoteCommand
;1378:
;1379:Input string can be modified by overwriting gametype number instead of text value, for example
;1380:==================
;1381:*/
;1382:static qboolean ValidVoteCommand( int clientNum, char *command ) 
;1383:{
line 1389
;1384:	char buf[ MAX_CVAR_VALUE_STRING ];
;1385:	char *base;
;1386:	char *s;
;1387:	int	i;
;1388:
;1389:	if ( strchr( command, ';' ) || strchr( command, '\n' ) || strchr( command, '\r' ) )
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 268
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 268
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $564
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 272
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $564
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 276
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $561
LABELV $564
line 1390
;1390:	{
line 1391
;1391:		trap_SendServerCommand( clientNum, "print \"Invalid vote command.\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $565
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1392
;1392:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $560
JUMPV
LABELV $561
line 1395
;1393:	}
;1394:
;1395:	base = command;
ADDRLP4 264
ADDRFP4 4
INDIRP4
ASGNP4
line 1397
;1396:	
;1397:	s = buf; // extract command name
ADDRLP4 4
ADDRLP4 8
ASGNP4
ADDRGP4 $567
JUMPV
LABELV $566
line 1398
;1398:	while ( *command != '\0' && *command != ' ' ) {
line 1399
;1399:		*s = *command; s++; command++;
ADDRLP4 4
INDIRP4
ADDRFP4 4
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1400
;1400:	}
LABELV $567
line 1398
ADDRLP4 280
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $569
ADDRLP4 280
INDIRI4
CNSTI4 32
NEI4 $566
LABELV $569
line 1401
;1401:	*s = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
ADDRGP4 $571
JUMPV
LABELV $570
line 1404
;1402:	// point cmd on first argument
;1403:	while ( *command == ' ' || *command == '\t' )
;1404:		command++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $571
line 1403
ADDRLP4 284
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 32
EQI4 $570
ADDRLP4 284
INDIRI4
CNSTI4 9
EQI4 $570
line 1406
;1405:
;1406:	for ( i = 0; i < ARRAY_LEN( voteCommands ); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $576
JUMPV
LABELV $573
line 1407
;1407:		if ( !Q_stricmp( buf, voteCommands[i] ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 voteCommands
ADDP4
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $577
line 1408
;1408:			break;
ADDRGP4 $575
JUMPV
LABELV $577
line 1410
;1409:		}
;1410:	}
LABELV $574
line 1406
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $576
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 12
LTU4 $573
LABELV $575
line 1412
;1411:
;1412:	if ( i == ARRAY_LEN( voteCommands ) ) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 12
NEU4 $579
line 1413
;1413:		trap_SendServerCommand( clientNum, "print \"Invalid vote command.\nVote commands are: \n"
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $581
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1419
;1414:			" g_gametype <n|ffa|duel|tdm|ctf>\n"
;1415:			" map_restart, map <mapname>, rotate [round], nextmap\n"
;1416:			" kick <player>, clientkick <clientnum>\n"
;1417:			" g_unlagged <0|1>, g_warmup <-1|0|seconds>\n"
;1418:			" timelimit <time>, fraglimit <frags>, capturelimit <captures>.\n\"" );
;1419:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $560
JUMPV
LABELV $579
line 1422
;1420:	}
;1421:
;1422:	if ( Q_stricmp( buf, "g_gametype" ) == 0 )
ADDRLP4 8
ARGP4
ADDRGP4 $554
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $582
line 1423
;1423:	{
line 1424
;1424:		if ( !Q_stricmp( command, "ffa" ) ) i = GT_FFA;
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $586
ARGP4
ADDRLP4 292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $584
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $585
JUMPV
LABELV $584
line 1425
;1425:		else if ( !Q_stricmp( command, "duel" ) ) i = GT_TOURNAMENT;
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $589
ARGP4
ADDRLP4 296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $587
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $588
JUMPV
LABELV $587
line 1426
;1426:		else if ( !Q_stricmp( command, "tdm" ) ) i = GT_TEAM;
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $592
ARGP4
ADDRLP4 300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $590
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRGP4 $591
JUMPV
LABELV $590
line 1427
;1427:		else if ( !Q_stricmp( command, "ctf" ) ) i = GT_CTF;
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $595
ARGP4
ADDRLP4 304
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
NEI4 $593
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRGP4 $594
JUMPV
LABELV $593
line 1429
;1428:		else 
;1429:		{
line 1430
;1430:			i = atoi( command );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 308
INDIRI4
ASGNI4
line 1431
;1431:			if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $599
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $599
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $596
LABELV $599
line 1432
;1432:				trap_SendServerCommand( clientNum, va( "print \"Invalid gametype %i.\n\"", i ) );
ADDRGP4 $600
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 316
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 316
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1433
;1433:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $560
JUMPV
LABELV $596
line 1435
;1434:			}
;1435:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $560
JUMPV
LABELV $594
LABELV $591
LABELV $588
LABELV $585
line 1439
;1436:		}
;1437:
;1438:		// handle string values
;1439:		BG_sprintf( base, "g_gametype %i", i );
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 $601
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BG_sprintf
CALLI4
pop
line 1441
;1440:
;1441:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $560
JUMPV
LABELV $582
line 1444
;1442:	}
;1443:
;1444:	if ( Q_stricmp( buf, "map" ) == 0 ) {
ADDRLP4 8
ARGP4
ADDRGP4 $549
ARGP4
ADDRLP4 292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $602
line 1445
;1445:		if ( !G_MapExist( command ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 G_MapExist
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $604
line 1446
;1446:			trap_SendServerCommand( clientNum, va( "print \"No such map on server: %s.\n\"", command ) );
ADDRGP4 $606
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1447
;1447:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $560
JUMPV
LABELV $604
line 1449
;1448:		} 
;1449:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $560
JUMPV
LABELV $602
line 1452
;1450:	}
;1451:
;1452:	if ( Q_stricmp( buf, "nextmap" ) == 0 ) {
ADDRLP4 8
ARGP4
ADDRGP4 $551
ARGP4
ADDRLP4 296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $607
line 1453
;1453:		strcpy( base, "rotate" );
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 $550
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1454
;1454:	}
LABELV $607
line 1456
;1455:
;1456:	return qtrue;
CNSTI4 1
RETI4
LABELV $560
endproc ValidVoteCommand 320 12
export Cmd_CallVote_f
proc Cmd_CallVote_f 2108 16
line 1465
;1457:}
;1458:
;1459:
;1460:/*
;1461:==================
;1462:Cmd_CallVote_f
;1463:==================
;1464:*/
;1465:void Cmd_CallVote_f( gentity_t *ent ) {
line 1470
;1466:	int		i, n;
;1467:	char	arg[MAX_STRING_TOKENS], *argn[4];
;1468:	char	cmd[MAX_STRING_TOKENS], *s;
;1469:
;1470:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $610
line 1471
;1471:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $613
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1472
;1472:		return;
ADDRGP4 $609
JUMPV
LABELV $610
line 1475
;1473:	}
;1474:
;1475:	if ( level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
EQI4 $614
line 1476
;1476:		trap_SendServerCommand( ent-g_entities, "print \"A vote is already in progress.\n\"" );
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
ADDRGP4 $617
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1477
;1477:		return;
ADDRGP4 $609
JUMPV
LABELV $614
line 1481
;1478:	}
;1479:
;1480:	// if there is still a vote to be executed
;1481:	if ( level.voteExecuteTime || level.restarted ) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
NEI4 $622
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $618
LABELV $622
line 1482
;1482:		trap_SendServerCommand( ent-g_entities, "print \"Previous vote command is waiting execution^1.^7\n\"" );
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
ADDRGP4 $623
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1483
;1483:		return;
ADDRGP4 $609
JUMPV
LABELV $618
line 1486
;1484:	}
;1485:
;1486:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
CNSTI4 3
LTI4 $624
line 1487
;1487:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of votes.\n\"" );
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
ADDRGP4 $626
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1488
;1488:		return;
ADDRGP4 $609
JUMPV
LABELV $624
line 1490
;1489:	}
;1490:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $627
line 1491
;1491:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
ADDRGP4 $629
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1492
;1492:		return;
ADDRGP4 $609
JUMPV
LABELV $627
line 1496
;1493:	}
;1494:
;1495:	// build command buffer
;1496:	arg[ 0 ] = '\0'; s = arg;
ADDRLP4 1052
CNSTI1 0
ASGNI1
ADDRLP4 4
ADDRLP4 1052
ASGNP4
line 1497
;1497:	for ( i = 1; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $633
JUMPV
LABELV $630
line 1498
;1498:		if ( arg[ 0 ] )
ADDRLP4 1052
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $634
line 1499
;1499:			s = Q_stradd( s, " " );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $636
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2076
INDIRP4
ASGNP4
LABELV $634
line 1500
;1500:		trap_Argv( i, cmd, sizeof( cmd ) );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1501
;1501:		s = Q_stradd( s, cmd );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2080
INDIRP4
ASGNP4
line 1502
;1502:	}
LABELV $631
line 1497
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $633
ADDRLP4 2076
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2076
INDIRI4
LTI4 $630
line 1505
;1503:
;1504:	// split by ';' seperators
;1505:	n = Com_Split( arg, argn, ARRAY_LEN( argn ), ';' );
ADDRLP4 1052
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 4
ARGI4
CNSTI4 59
ARGI4
ADDRLP4 2080
ADDRGP4 Com_Split
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 2080
INDIRI4
ASGNI4
line 1506
;1506:	if ( n == 0 || *argn[0] == '\0' ) 
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $639
ADDRLP4 1032
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $637
LABELV $639
line 1507
;1507:		return; // empty callvote command?
ADDRGP4 $609
JUMPV
LABELV $637
line 1510
;1508:
;1509:	// validate all split commands
;1510:	for ( i = 0; i < n; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $643
JUMPV
LABELV $640
line 1512
;1511:		// make sure it is a valid command to vote on
;1512:		if ( !ValidVoteCommand( ent - g_entities, argn[i] ) )
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
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 ValidVoteCommand
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $644
line 1513
;1513:			return;
ADDRGP4 $609
JUMPV
LABELV $644
line 1514
;1514:	}
LABELV $641
line 1510
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $643
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $640
line 1517
;1515:
;1516:	// rebuild command buffer
;1517:	cmd[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 1518
;1518:	for ( s = cmd, i = 0; i < n; i++ ) {
ADDRLP4 4
ADDRLP4 8
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $649
JUMPV
LABELV $646
line 1519
;1519:		if ( cmd[0] )
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $650
line 1520
;1520:			s = Q_stradd( s, ";" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $652
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2084
INDIRP4
ASGNP4
LABELV $650
line 1521
;1521:		s = Q_stradd( s, argn[ i ] );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
INDIRP4
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2088
INDIRP4
ASGNP4
line 1522
;1522:	}
LABELV $647
line 1518
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $649
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $646
line 1524
;1523:
;1524:	Com_sprintf( level.voteString, sizeof( level.voteString ), cmd );
ADDRGP4 level+360
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1525
;1525:	Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $657
ARGP4
ADDRGP4 level+360
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1527
;1526:
;1527:	trap_SendServerCommand( -1, va( "print \"%s called a vote(%s).\n\"", ent->client->pers.netname, cmd ) );
ADDRGP4 $659
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2084
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1530
;1528:
;1529:	// start the voting, the caller automatically votes yes
;1530:	level.voteTime = level.time;
ADDRGP4 level+872
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1531
;1531:	level.voteYes = 1;
ADDRGP4 level+880
CNSTI4 1
ASGNI4
line 1532
;1532:	level.voteNo = 0;
ADDRGP4 level+884
CNSTI4 0
ASGNI4
line 1534
;1533:
;1534:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $667
JUMPV
LABELV $664
line 1535
;1535:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2088
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1536
;1536:		level.clients[i].pers.voted = 0;
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1537
;1537:	}
LABELV $665
line 1534
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $667
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $664
line 1539
;1538:
;1539:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 2088
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1540
;1540:	ent->client->pers.voted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1542
;1541:
;1542:	ent->client->pers.voteCount++;
ADDRLP4 2092
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ASGNP4
ADDRLP4 2092
INDIRP4
ADDRLP4 2092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1544
;1543:
;1544:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $669
ARGP4
ADDRGP4 level+872
INDIRI4
ARGI4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1545
;1545:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+616
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1546
;1546:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $669
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1547
;1547:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $669
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1548
;1548:}
LABELV $609
endproc Cmd_CallVote_f 2108 16
export Cmd_Vote_f
proc Cmd_Vote_f 80 12
line 1556
;1549:
;1550:
;1551:/*
;1552:==================
;1553:Cmd_Vote_f
;1554:==================
;1555:*/
;1556:void Cmd_Vote_f( gentity_t *ent ) {
line 1559
;1557:	char		msg[64];
;1558:
;1559:	if ( !level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
NEI4 $675
line 1560
;1560:		trap_SendServerCommand( ent-g_entities, "print \"No vote in progress.\n\"" );
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
ADDRGP4 $678
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1561
;1561:		return;
ADDRGP4 $674
JUMPV
LABELV $675
line 1564
;1562:	}
;1563:
;1564:	if ( ent->client->pers.voted != 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $679
line 1565
;1565:		trap_SendServerCommand( ent-g_entities, "print \"Vote already cast.\n\"" );
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
ADDRGP4 $681
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1566
;1566:		return;
ADDRGP4 $674
JUMPV
LABELV $679
line 1569
;1567:	}
;1568:
;1569:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $682
line 1570
;1570:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $684
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1571
;1571:		return;
ADDRGP4 $674
JUMPV
LABELV $682
line 1574
;1572:	}
;1573:
;1574:	trap_SendServerCommand( ent-g_entities, "print \"Vote cast.\n\"" );
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
ADDRGP4 $685
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1576
;1575:
;1576:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1578
;1577:
;1578:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1580
;1579:
;1580:	if ( msg[0] == 'y' || msg[0] == 'Y' || msg[0] == '1' ) {
ADDRLP4 68
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 121
EQI4 $689
ADDRLP4 68
INDIRI4
CNSTI4 89
EQI4 $689
ADDRLP4 68
INDIRI4
CNSTI4 49
NEI4 $686
LABELV $689
line 1581
;1581:		level.voteYes++;
ADDRLP4 72
ADDRGP4 level+880
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1582
;1582:		ent->client->pers.voted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1583
;1583:		trap_SetConfigstring( CS_VOTE_YES, va( "%i", level.voteYes ) );
ADDRGP4 $669
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1584
;1584:	} else {
ADDRGP4 $687
JUMPV
LABELV $686
line 1585
;1585:		level.voteNo++;
ADDRLP4 72
ADDRGP4 level+884
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1586
;1586:		ent->client->pers.voted = -1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 -1
ASGNI4
line 1587
;1587:		trap_SetConfigstring( CS_VOTE_NO, va( "%i", level.voteNo ) );	
ADDRGP4 $669
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1588
;1588:	}
LABELV $687
line 1592
;1589:
;1590:	// a majority will be determined in CheckVote, which will also account
;1591:	// for players entering or leaving
;1592:}
LABELV $674
endproc Cmd_Vote_f 80 12
export G_RevertVote
proc G_RevertVote 20 8
line 1595
;1593:
;1594:
;1595:void G_RevertVote( gclient_t *client ) {
line 1596
;1596:	if ( level.voteTime ) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
EQI4 $695
line 1597
;1597:		if ( client->pers.voted == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 1
NEI4 $698
line 1598
;1598:			level.voteYes--;
ADDRLP4 0
ADDRGP4 level+880
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1599
;1599:			client->pers.voted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1600
;1600:			client->ps.eFlags &= ~EF_VOTED;
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
CNSTI4 -16385
BANDI4
ASGNI4
line 1601
;1601:			trap_SetConfigstring( CS_VOTE_YES, va( "%i", level.voteYes ) );
ADDRGP4 $669
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1602
;1602:		} else if ( client->pers.voted == -1 ) {
ADDRGP4 $699
JUMPV
LABELV $698
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $702
line 1603
;1603:			level.voteNo--;
ADDRLP4 0
ADDRGP4 level+884
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1604
;1604:			client->pers.voted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1605
;1605:			client->ps.eFlags &= ~EF_VOTED;
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
CNSTI4 -16385
BANDI4
ASGNI4
line 1606
;1606:			trap_SetConfigstring( CS_VOTE_NO, va( "%i", level.voteNo ) );
ADDRGP4 $669
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1607
;1607:		}
LABELV $702
LABELV $699
line 1608
;1608:	}
LABELV $695
line 1609
;1609:	if ( client->sess.sessionTeam == TEAM_RED || client->sess.sessionTeam == TEAM_BLUE ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
EQI4 $708
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $706
LABELV $708
line 1611
;1610:		int cs_offset;
;1611:		if ( client->sess.sessionTeam == TEAM_RED )
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
NEI4 $709
line 1612
;1612:			cs_offset = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $710
JUMPV
LABELV $709
line 1614
;1613:		else
;1614:			cs_offset = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $710
line 1615
;1615:		if ( client->pers.teamVoted == 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 1
NEI4 $711
line 1616
;1616:			level.teamVoteYes[cs_offset]--;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1617
;1617:			client->pers.teamVoted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1618
;1618:			client->ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1619
;1619:			trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $669
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1620
;1620:		} else if ( client->pers.teamVoted == -1 ) {
ADDRGP4 $712
JUMPV
LABELV $711
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $715
line 1621
;1621:			level.teamVoteNo[cs_offset]--;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1622
;1622:			client->pers.teamVoted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1623
;1623:			client->ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1624
;1624:			trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $669
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1625
;1625:		}
LABELV $715
LABELV $712
line 1626
;1626:	} 
LABELV $706
line 1627
;1627:}
LABELV $694
endproc G_RevertVote 20 8
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2172 20
line 1635
;1628:
;1629:
;1630:/*
;1631:==================
;1632:Cmd_CallTeamVote_f
;1633:==================
;1634:*/
;1635:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1640
;1636:	int		i, team, cs_offset;
;1637:	char	arg1[MAX_STRING_TOKENS];
;1638:	char	arg2[MAX_STRING_TOKENS];
;1639:
;1640:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 1641
;1641:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $720
line 1642
;1642:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $721
JUMPV
LABELV $720
line 1643
;1643:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $719
line 1644
;1644:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1646
;1645:	else
;1646:		return;
LABELV $723
LABELV $721
line 1648
;1647:
;1648:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $724
line 1649
;1649:		trap_SendServerCommand( ent-g_entities, "print \"Voting not allowed here.\n\"" );
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
ADDRGP4 $613
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1650
;1650:		return;
ADDRGP4 $719
JUMPV
LABELV $724
line 1653
;1651:	}
;1652:
;1653:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
EQI4 $727
line 1654
;1654:		trap_SendServerCommand( ent-g_entities, "print \"A team vote is already in progress.\n\"" );
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
ADDRGP4 $730
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1655
;1655:		return;
ADDRGP4 $719
JUMPV
LABELV $727
line 1657
;1656:	}
;1657:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 3
LTI4 $731
line 1658
;1658:		trap_SendServerCommand( ent-g_entities, "print \"You have called the maximum number of team votes.\n\"" );
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
ADDRGP4 $733
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1659
;1659:		return;
ADDRGP4 $719
JUMPV
LABELV $731
line 1662
;1660:	}
;1661:
;1662:	if ( level.voteExecuteTime || level.restarted ) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
NEI4 $738
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $734
LABELV $738
line 1663
;1663:		return;
ADDRGP4 $719
JUMPV
LABELV $734
line 1666
;1664:	}
;1665:
;1666:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $739
line 1667
;1667:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to call a vote as spectator.\n\"" );
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
ADDRGP4 $629
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1668
;1668:		return;
ADDRGP4 $719
JUMPV
LABELV $739
line 1672
;1669:	}
;1670:
;1671:	// make sure it is a valid command to vote on
;1672:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1673
;1673:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1674
;1674:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $744
JUMPV
LABELV $741
line 1675
;1675:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $745
line 1676
;1676:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $636
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $745
line 1677
;1677:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - (int)strlen(arg2) );
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 2064
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1678
;1678:	}
LABELV $742
line 1674
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $744
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $741
line 1680
;1679:
;1680:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) || strchr( arg2, '\n' ) || strchr( arg2, '\r' ) ) {
ADDRLP4 1036
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2064
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $751
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2068
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2068
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $751
ADDRLP4 4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 2072
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $751
ADDRLP4 4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 2076
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2076
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $747
LABELV $751
line 1681
;1681:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $752
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1682
;1682:		return;
ADDRGP4 $719
JUMPV
LABELV $747
line 1685
;1683:	}
;1684:
;1685:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $755
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $753
line 1688
;1686:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1687:
;1688:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $756
line 1689
;1689:			i = ent->client->ps.clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1690
;1690:		}
ADDRGP4 $757
JUMPV
LABELV $756
line 1691
;1691:		else {
line 1693
;1692:			// numeric values are just slot numbers
;1693:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $758
line 1694
;1694:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
ADDRLP4 2156
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2156
INDIRI4
CNSTI4 0
EQI4 $765
ADDRLP4 2156
INDIRI4
CNSTI4 48
LTI4 $765
ADDRLP4 2156
INDIRI4
CNSTI4 57
LEI4 $762
LABELV $765
line 1695
;1695:					break;
ADDRGP4 $760
JUMPV
LABELV $762
line 1696
;1696:			}
LABELV $759
line 1693
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $758
LABELV $760
line 1697
;1697:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $768
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $766
LABELV $768
line 1698
;1698:				i = atoi( arg2 );
ADDRLP4 4
ARGP4
ADDRLP4 2160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2160
INDIRI4
ASGNI4
line 1699
;1699:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $772
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $769
LABELV $772
line 1700
;1700:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $124
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2168
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1701
;1701:					return;
ADDRGP4 $719
JUMPV
LABELV $769
line 1704
;1702:				}
;1703:
;1704:				if ( !g_entities[i].inuse ) {
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $767
line 1705
;1705:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $127
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2168
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1706
;1706:					return;
ADDRGP4 $719
JUMPV
line 1708
;1707:				}
;1708:			}
LABELV $766
line 1709
;1709:			else {
line 1710
;1710:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2120
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1711
;1711:				Q_CleanStr(leader);
ADDRLP4 2120
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1712
;1712:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $779
JUMPV
LABELV $776
line 1713
;1713:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $781
line 1714
;1714:						continue;
ADDRGP4 $777
JUMPV
LABELV $781
line 1715
;1715:					if (level.clients[i].sess.sessionTeam != team)
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
ADDRLP4 1028
INDIRI4
EQI4 $783
line 1716
;1716:						continue;
ADDRGP4 $777
JUMPV
LABELV $783
line 1717
;1717:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2084
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1718
;1718:					Q_CleanStr(netname);
ADDRLP4 2084
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1719
;1719:					if ( !Q_stricmp(netname, leader) ) {
ADDRLP4 2084
ARGP4
ADDRLP4 2120
ARGP4
ADDRLP4 2160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2160
INDIRI4
CNSTI4 0
NEI4 $785
line 1720
;1720:						break;
ADDRGP4 $778
JUMPV
LABELV $785
line 1722
;1721:					}
;1722:				}
LABELV $777
line 1712
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $779
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $776
LABELV $778
line 1723
;1723:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $787
line 1724
;1724:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $790
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1725
;1725:					return;
ADDRGP4 $719
JUMPV
LABELV $787
line 1727
;1726:				}
;1727:			}
LABELV $767
line 1728
;1728:		}
LABELV $757
line 1729
;1729:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $233
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1730
;1730:	} else {
ADDRGP4 $754
JUMPV
LABELV $753
line 1731
;1731:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $752
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1732
;1732:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
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
ADDRGP4 $791
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1733
;1733:		return;
ADDRGP4 $719
JUMPV
LABELV $754
line 1736
;1734:	}
;1735:
;1736:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $794
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1738
;1737:
;1738:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $798
JUMPV
LABELV $795
line 1739
;1739:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
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
NEI4 $800
line 1740
;1740:			continue;
ADDRGP4 $796
JUMPV
LABELV $800
line 1741
;1741:		if (level.clients[i].sess.sessionTeam == team)
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
ADDRLP4 1028
INDIRI4
NEI4 $802
line 1742
;1742:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $804
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 2084
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $802
line 1743
;1743:	}
LABELV $796
line 1738
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $798
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $795
line 1746
;1744:
;1745:	// start the voting, the caller automatically votes yes
;1746:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1747
;1747:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
CNSTI4 1
ASGNI4
line 1748
;1748:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
CNSTI4 0
ASGNI4
line 1750
;1749:
;1750:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $812
JUMPV
LABELV $809
line 1751
;1751:		if ( level.clients[i].sess.sessionTeam == team ) {
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
ADDRLP4 1028
INDIRI4
NEI4 $814
line 1752
;1752:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2084
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1753
;1753:			level.clients[i].pers.teamVoted = 0;
ADDRLP4 0
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1754
;1754:		}
LABELV $814
line 1755
;1755:	}
LABELV $810
line 1750
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $812
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $809
line 1756
;1756:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 2084
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1757
;1757:	ent->client->pers.teamVoted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 1
ASGNI4
line 1759
;1758:
;1759:	ent->client->pers.teamVoteCount++;
ADDRLP4 2088
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1761
;1760:
;1761:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $669
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1762
;1762:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
ADDRLP4 1032
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1763
;1763:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $669
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1764
;1764:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $669
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1765
;1765:}
LABELV $719
endproc Cmd_CallTeamVote_f 2172 20
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 92 12
line 1773
;1766:
;1767:
;1768:/*
;1769:==================
;1770:Cmd_TeamVote_f
;1771:==================
;1772:*/
;1773:void Cmd_TeamVote_f( gentity_t *ent ) {
line 1777
;1774:	int			team, cs_offset;
;1775:	char		msg[64];
;1776:
;1777:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 1778
;1778:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $821
line 1779
;1779:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $822
JUMPV
LABELV $821
line 1780
;1780:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $820
line 1781
;1781:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1783
;1782:	else
;1783:		return;
LABELV $824
LABELV $822
line 1785
;1784:
;1785:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
NEI4 $825
line 1786
;1786:		trap_SendServerCommand( ent-g_entities, "print \"No team vote in progress.\n\"" );
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
ADDRGP4 $828
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1787
;1787:		return;
ADDRGP4 $820
JUMPV
LABELV $825
line 1789
;1788:	}
;1789:	if ( ent->client->pers.teamVoted != 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $829
line 1790
;1790:		trap_SendServerCommand( ent-g_entities, "print \"Team vote already cast.\n\"" );
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
ADDRGP4 $831
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1791
;1791:		return;
ADDRGP4 $820
JUMPV
LABELV $829
line 1793
;1792:	}
;1793:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $832
line 1794
;1794:		trap_SendServerCommand( ent-g_entities, "print \"Not allowed to vote as spectator.\n\"" );
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
ADDRGP4 $684
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1795
;1795:		return;
ADDRGP4 $820
JUMPV
LABELV $832
line 1798
;1796:	}
;1797:
;1798:	trap_SendServerCommand( ent-g_entities, "print \"Team vote cast.\n\"" );
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
ADDRGP4 $834
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1800
;1799:
;1800:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 72
ADDRFP4 0
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
CNSTI4 524288
BORI4
ASGNI4
line 1801
;1801:	ent->client->pers.teamVoteCount++;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1803
;1802:
;1803:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1805
;1804:
;1805:	if ( msg[0] == 'y' || msg[0] == 'Y' || msg[0] == '1' ) {
ADDRLP4 80
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 121
EQI4 $838
ADDRLP4 80
INDIRI4
CNSTI4 89
EQI4 $838
ADDRLP4 80
INDIRI4
CNSTI4 49
NEI4 $835
LABELV $838
line 1806
;1806:		level.teamVoteYes[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1807
;1807:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $669
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1808
;1808:	} else {
ADDRGP4 $836
JUMPV
LABELV $835
line 1809
;1809:		level.teamVoteNo[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1810
;1810:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $669
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1811
;1811:	}
LABELV $836
line 1815
;1812:
;1813:	// a majority will be determined in TeamCheckVote, which will also account
;1814:	// for players entering or leaving
;1815:}
LABELV $820
endproc Cmd_TeamVote_f 92 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1060 12
line 1823
;1816:
;1817:
;1818:/*
;1819:=================
;1820:Cmd_SetViewpos_f
;1821:=================
;1822:*/
;1823:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 1828
;1824:	vec3_t		origin, angles;
;1825:	char		buffer[MAX_TOKEN_CHARS];
;1826:	int			i;
;1827:
;1828:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $844
line 1829
;1829:		trap_SendServerCommand( ent-g_entities, "print \"Cheats are not enabled on this server.\n\"");
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
ADDRGP4 $96
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1830
;1830:		return;
ADDRGP4 $843
JUMPV
LABELV $844
line 1832
;1831:	}
;1832:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $847
line 1833
;1833:		trap_SendServerCommand( ent-g_entities, "print \"usage: setviewpos x y z yaw\n\"");
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
ADDRGP4 $849
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1834
;1834:		return;
ADDRGP4 $843
JUMPV
LABELV $847
line 1837
;1835:	}
;1836:
;1837:	VectorClear( angles );
ADDRLP4 1040
CNSTF4 0
ASGNF4
ADDRLP4 1040+4
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
CNSTF4 0
ASGNF4
line 1838
;1838:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $852
line 1839
;1839:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1840
;1840:		origin[i] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1841
;1841:	}
LABELV $853
line 1838
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $852
line 1843
;1842:
;1843:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1844
;1844:	angles[YAW] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1846
;1845:
;1846:	TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1847
;1847:}
LABELV $843
endproc Cmd_SetViewpos_f 1060 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 1856
;1848:
;1849:
;1850:
;1851:/*
;1852:=================
;1853:Cmd_Stats_f
;1854:=================
;1855:*/
;1856:void Cmd_Stats_f( gentity_t *ent ) {
line 1871
;1857:/*
;1858:	int max, n, i;
;1859:
;1860:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;1861:
;1862:	n = 0;
;1863:	for ( i = 0; i < max; i++ ) {
;1864:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;1865:			n++;
;1866:	}
;1867:
;1868:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;1869:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;1870:*/
;1871:}
LABELV $857
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1132 12
line 1879
;1872:
;1873:
;1874:/*
;1875:=================
;1876:ClientCommand
;1877:=================
;1878:*/
;1879:void ClientCommand( int clientNum ) {
line 1883
;1880:	gentity_t *ent;
;1881:	char	cmd[MAX_TOKEN_CHARS];
;1882:
;1883:	ent = g_entities + clientNum;
ADDRLP4 1024
ADDRFP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1884
;1884:	if ( !ent->client )
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $859
line 1885
;1885:		return;
ADDRGP4 $858
JUMPV
LABELV $859
line 1887
;1886:
;1887:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1889
;1888:
;1889:	if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $861
line 1890
;1890:		if ( ent->client->pers.connected == CON_CONNECTING && g_gametype.integer >= GT_TEAM ) {
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $858
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $858
line 1891
;1891:			if ( Q_stricmp( cmd, "team" ) == 0 && !level.restarted ) {
ADDRLP4 0
ARGP4
ADDRGP4 $868
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $858
ADDRGP4 level+72
INDIRI4
CNSTI4 0
NEI4 $858
line 1892
;1892:				Cmd_Team_f( ent ); // early team override
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
line 1893
;1893:			}
line 1894
;1894:		}
line 1895
;1895:		return;	// not fully in game yet
ADDRGP4 $858
JUMPV
LABELV $861
line 1898
;1896:	}
;1897:
;1898:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $872
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $870
line 1899
;1899:		Cmd_Say_f (ent, SAY_ALL, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1900
;1900:		return;
ADDRGP4 $858
JUMPV
LABELV $870
line 1902
;1901:	}
;1902:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $873
line 1903
;1903:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1904
;1904:		return;
ADDRGP4 $858
JUMPV
LABELV $873
line 1906
;1905:	}
;1906:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $878
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $876
line 1907
;1907:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 1908
;1908:		return;
ADDRGP4 $858
JUMPV
LABELV $876
line 1940
;1909:	}
;1910:#ifdef MISSIONPACK
;1911:	if (Q_stricmp (cmd, "vsay") == 0) {
;1912:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
;1913:		return;
;1914:	}
;1915:	if (Q_stricmp (cmd, "vsay_team") == 0) {
;1916:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
;1917:		return;
;1918:	}
;1919:	if (Q_stricmp (cmd, "vtell") == 0) {
;1920:		Cmd_VoiceTell_f ( ent, qfalse );
;1921:		return;
;1922:	}
;1923:	if (Q_stricmp (cmd, "vosay") == 0) {
;1924:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
;1925:		return;
;1926:	}
;1927:	if (Q_stricmp (cmd, "vosay_team") == 0) {
;1928:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
;1929:		return;
;1930:	}
;1931:	if (Q_stricmp (cmd, "votell") == 0) {
;1932:		Cmd_VoiceTell_f ( ent, qtrue );
;1933:		return;
;1934:	}
;1935:	if (Q_stricmp (cmd, "vtaunt") == 0) {
;1936:		Cmd_VoiceTaunt_f ( ent );
;1937:		return;
;1938:	}
;1939:#endif
;1940:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $290
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $879
line 1941
;1941:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 1942
;1942:		return;
ADDRGP4 $858
JUMPV
LABELV $879
line 1946
;1943:	}
;1944:
;1945:	// ignore all other commands when at intermission
;1946:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $881
line 1947
;1947:		Cmd_Say_f (ent, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1948
;1948:		return;
ADDRGP4 $858
JUMPV
LABELV $881
line 1951
;1949:	}
;1950:
;1951:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $886
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $884
line 1952
;1952:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $885
JUMPV
LABELV $884
line 1953
;1953:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $889
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $887
line 1954
;1954:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $888
JUMPV
LABELV $887
line 1955
;1955:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $892
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $890
line 1956
;1956:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $891
JUMPV
LABELV $890
line 1957
;1957:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $895
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $893
line 1958
;1958:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $894
JUMPV
LABELV $893
line 1959
;1959:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $898
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $896
line 1960
;1960:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $897
JUMPV
LABELV $896
line 1961
;1961:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $232
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $899
line 1962
;1962:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $900
JUMPV
LABELV $899
line 1963
;1963:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $903
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $901
line 1964
;1964:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $902
JUMPV
LABELV $901
line 1965
;1965:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $906
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $904
line 1966
;1966:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $905
JUMPV
LABELV $904
line 1967
;1967:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $909
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $907
line 1968
;1968:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $908
JUMPV
LABELV $907
line 1969
;1969:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $912
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $910
line 1970
;1970:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $911
JUMPV
LABELV $910
line 1971
;1971:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $868
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $913
line 1972
;1972:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $914
JUMPV
LABELV $913
line 1973
;1973:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $917
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $915
line 1974
;1974:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $916
JUMPV
LABELV $915
line 1975
;1975:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $920
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $918
line 1976
;1976:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $919
JUMPV
LABELV $918
line 1977
;1977:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $923
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $921
line 1978
;1978:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $922
JUMPV
LABELV $921
line 1979
;1979:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $926
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $924
line 1980
;1980:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $925
JUMPV
LABELV $924
line 1981
;1981:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $929
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $927
line 1982
;1982:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $928
JUMPV
LABELV $927
line 1983
;1983:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $932
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $930
line 1984
;1984:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $931
JUMPV
LABELV $930
line 1985
;1985:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $935
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $933
line 1986
;1986:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $934
JUMPV
LABELV $933
line 1987
;1987:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $938
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $936
line 1988
;1988:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $937
JUMPV
LABELV $936
line 1990
;1989://qlone - freezetag
;1990:	else if ( Q_stricmp( cmd, "drop" ) == 0 )
ADDRLP4 0
ARGP4
ADDRGP4 $941
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $939
line 1991
;1991:		Cmd_Drop_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Drop_f
CALLV
pop
ADDRGP4 $940
JUMPV
LABELV $939
line 1992
;1992:	else if ( Q_stricmp( cmd, "ready" ) == 0 )
ADDRLP4 0
ARGP4
ADDRGP4 $944
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $942
line 1993
;1993:		Cmd_Ready_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Ready_f
CALLV
pop
ADDRGP4 $943
JUMPV
LABELV $942
line 1996
;1994://qlone - freezetag
;1995:	else
;1996:		trap_SendServerCommand( clientNum, va( "print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $945
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1128
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $943
LABELV $940
LABELV $937
LABELV $934
LABELV $931
LABELV $928
LABELV $925
LABELV $922
LABELV $919
LABELV $916
LABELV $914
LABELV $911
LABELV $908
LABELV $905
LABELV $902
LABELV $900
LABELV $897
LABELV $894
LABELV $891
LABELV $888
LABELV $885
line 1997
;1997:}
LABELV $858
endproc ClientCommand 1132 12
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
LABELV $945
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $944
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $941
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $938
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $935
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $932
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $929
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $926
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $923
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $920
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $917
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $912
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $909
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $906
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $903
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $898
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $895
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $892
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $889
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $886
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $878
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $875
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $872
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $868
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $849
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $834
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $831
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $828
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $804
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $794
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $791
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $790
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $755
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $752
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $733
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $730
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $685
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $684
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $681
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $678
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $669
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $659
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $657
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $652
byte 1 59
byte 1 0
align 1
LABELV $636
byte 1 32
byte 1 0
align 1
LABELV $629
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $626
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $623
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 80
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 94
byte 1 49
byte 1 46
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $617
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $613
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $606
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $601
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $600
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $595
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $592
byte 1 116
byte 1 100
byte 1 109
byte 1 0
align 1
LABELV $589
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $586
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $581
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 10
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 60
byte 1 110
byte 1 124
byte 1 102
byte 1 102
byte 1 97
byte 1 124
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 124
byte 1 116
byte 1 100
byte 1 109
byte 1 124
byte 1 99
byte 1 116
byte 1 102
byte 1 62
byte 1 10
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 91
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 93
byte 1 44
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 10
byte 1 32
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 60
byte 1 48
byte 1 124
byte 1 49
byte 1 62
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 60
byte 1 45
byte 1 49
byte 1 124
byte 1 48
byte 1 124
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 62
byte 1 10
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 62
byte 1 44
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $565
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $559
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $558
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $557
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $556
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $555
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $554
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $553
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $552
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $551
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $550
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $549
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $548
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $547
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $540
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $539
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 0
align 1
LABELV $538
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 32
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
LABELV $537
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $536
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $535
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $534
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $531
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
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
LABELV $511
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $505
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $504
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $499
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $498
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $495
byte 1 115
byte 1 97
byte 1 121
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
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
LABELV $493
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $492
byte 1 115
byte 1 97
byte 1 121
byte 1 58
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
LABELV $481
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $480
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $479
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $434
byte 1 67
byte 1 109
byte 1 100
byte 1 95
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 102
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 100
byte 1 105
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $384
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 53
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $379
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $377
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $375
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $373
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $301
byte 1 115
byte 1 0
align 1
LABELV $300
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $297
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $294
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $290
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $289
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
LABELV $283
byte 1 98
byte 1 0
align 1
LABELV $282
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $278
byte 1 114
byte 1 0
align 1
LABELV $277
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $270
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $265
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $254
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $251
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $248
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 94
byte 1 52
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $245
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 94
byte 1 49
byte 1 114
byte 1 101
byte 1 100
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $233
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $232
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
LABELV $228
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $227
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $224
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 48
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $214
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $207
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $206
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $200
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $199
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $198
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $186
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $183
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $180
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $177
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $174
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $168
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $158
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $152
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $146
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $143
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $137
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $127
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $124
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
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
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $99
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $96
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
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
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $86
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $79
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $56
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
