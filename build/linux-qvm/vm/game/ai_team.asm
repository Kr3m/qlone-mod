export BotValidTeamLeader
code
proc BotValidTeamLeader 8 4
file "../../../../code/game/ai_team.c"
line 54
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_team.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_team.c $
;10: *
;11: *****************************************************************************/
;12:
;13:#include "g_local.h"
;14:#include "botlib.h"
;15:#include "be_aas.h"
;16:#include "be_ea.h"
;17:#include "be_ai_char.h"
;18:#include "be_ai_chat.h"
;19:#include "be_ai_gen.h"
;20:#include "be_ai_goal.h"
;21:#include "be_ai_move.h"
;22:#include "be_ai_weap.h"
;23://
;24:#include "ai_main.h"
;25:#include "ai_dmq3.h"
;26:#include "ai_chat.h"
;27:#include "ai_cmd.h"
;28:#include "ai_dmnet.h"
;29:#include "ai_team.h"
;30:#include "ai_vcmd.h"
;31:
;32:#include "match.h"
;33:
;34:// for the voice chats
;35:#ifdef MISSIONPACK
;36:#include "../../ui/menudef.h"
;37:#endif
;38:
;39://ctf task preferences for a client
;40:typedef struct bot_ctftaskpreference_s
;41:{
;42:	char		name[36];
;43:	int			preference;
;44:} bot_ctftaskpreference_t;
;45:
;46:bot_ctftaskpreference_t ctftaskpreferences[MAX_CLIENTS];
;47:
;48:
;49:/*
;50:==================
;51:BotValidTeamLeader
;52:==================
;53:*/
;54:int BotValidTeamLeader(bot_state_t *bs) {
line 55
;55:	if (!strlen(bs->teamleader)) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $56
CNSTI4 0
RETI4
ADDRGP4 $55
JUMPV
LABELV $56
line 56
;56:	if (ClientFromName(bs->teamleader) == -1) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $58
CNSTI4 0
RETI4
ADDRGP4 $55
JUMPV
LABELV $58
line 57
;57:	return qtrue;
CNSTI4 1
RETI4
LABELV $55
endproc BotValidTeamLeader 8 4
export BotNumTeamMates
proc BotNumTeamMates 1048 12
line 65
;58:}
;59:
;60:/*
;61:==================
;62:BotNumTeamMates
;63:==================
;64:*/
;65:int BotNumTeamMates(bot_state_t *bs) {
line 69
;66:	int i, numplayers;
;67:	char buf[MAX_INFO_STRING];
;68:
;69:	numplayers = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 70
;70:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $64
JUMPV
LABELV $61
line 71
;71:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 73
;72:		//if no config string or no name
;73:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $69
ADDRLP4 0
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $66
LABELV $69
ADDRGP4 $62
JUMPV
LABELV $66
line 75
;74:		//skip spectators
;75:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 0
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 3
NEI4 $70
ADDRGP4 $62
JUMPV
LABELV $70
line 77
;76:		//
;77:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $73
line 78
;78:			numplayers++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 79
;79:		}
LABELV $73
line 80
;80:	}
LABELV $62
line 70
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $64
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $61
line 81
;81:	return numplayers;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $60
endproc BotNumTeamMates 1048 12
export BotClientTravelTimeToGoal
proc BotClientTravelTimeToGoal 480 16
line 89
;82:}
;83:
;84:/*
;85:==================
;86:BotClientTravelTimeToGoal
;87:==================
;88:*/
;89:int BotClientTravelTimeToGoal(int client, bot_goal_t *goal) {
line 93
;90:	playerState_t ps;
;91:	int areanum;
;92:
;93:	BotAI_GetClientState(client, &ps);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 94
;94:	areanum = BotPointAreaNum(ps.origin);
ADDRLP4 0+20
ARGP4
ADDRLP4 472
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 468
ADDRLP4 472
INDIRI4
ASGNI4
line 95
;95:	if (!areanum) return 1;
ADDRLP4 468
INDIRI4
CNSTI4 0
NEI4 $77
CNSTI4 1
RETI4
ADDRGP4 $75
JUMPV
LABELV $77
line 96
;96:	return trap_AAS_AreaTravelTimeToGoalArea(areanum, ps.origin, goal->areanum, TFL_DEFAULT);
ADDRLP4 468
INDIRI4
ARGI4
ADDRLP4 0+20
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 476
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 476
INDIRI4
RETI4
LABELV $75
endproc BotClientTravelTimeToGoal 480 16
export BotSortTeamMatesByBaseTravelTime
proc BotSortTeamMatesByBaseTravelTime 1336 12
line 104
;97:}
;98:
;99:/*
;100:==================
;101:BotSortTeamMatesByBaseTravelTime
;102:==================
;103:*/
;104:int BotSortTeamMatesByBaseTravelTime(bot_state_t *bs, int *teammates, int maxteammates) {
line 109
;105:
;106:	int i, j, k, numteammates, traveltime;
;107:	char buf[MAX_INFO_STRING];
;108:	int traveltimes[MAX_CLIENTS];
;109:	bot_goal_t *goal = NULL;
ADDRLP4 1300
CNSTP4 0
ASGNP4
line 114
;110:
;111:#ifdef MISSIONPACK
;112:	if (gametype == GT_CTF || gametype == GT_1FCTF)
;113:#else
;114:	if (gametype == GT_CTF)
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $81
line 116
;115:#endif
;116:	{
line 117
;117:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1304
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 1304
INDIRI4
CNSTI4 1
NEI4 $83
line 118
;118:			goal = &ctf_redflag;
ADDRLP4 1300
ADDRGP4 ctf_redflag
ASGNP4
ADDRGP4 $84
JUMPV
LABELV $83
line 120
;119:		else
;120:			goal = &ctf_blueflag;
ADDRLP4 1300
ADDRGP4 ctf_blueflag
ASGNP4
LABELV $84
line 121
;121:	}
LABELV $81
line 131
;122:#ifdef MISSIONPACK
;123:	else {
;124:		if (BotTeam(bs) == TEAM_RED)
;125:			goal = &redobelisk;
;126:		else
;127:			goal = &blueobelisk;
;128:	}
;129:#endif
;130:
;131:	numteammates = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 132
;132:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 272
CNSTI4 0
ASGNI4
ADDRGP4 $88
JUMPV
LABELV $85
line 133
;133:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 272
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 276
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 135
;134:		//if no config string or no name
;135:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 276
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $92
ADDRLP4 276
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1304
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $90
LABELV $92
ADDRGP4 $86
JUMPV
LABELV $90
line 137
;136:		//skip spectators
;137:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 276
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 1308
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1308
INDIRP4
ARGP4
ADDRLP4 1312
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1312
INDIRI4
CNSTI4 3
NEI4 $93
ADDRGP4 $86
JUMPV
LABELV $93
line 139
;138:		//
;139:		if (BotSameTeam(bs, i) && goal) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 1316
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1316
INDIRI4
CNSTI4 0
EQI4 $95
ADDRLP4 1300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $95
line 141
;140:			//
;141:			traveltime = BotClientTravelTimeToGoal(i, goal);
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 1300
INDIRP4
ARGP4
ADDRLP4 1320
ADDRGP4 BotClientTravelTimeToGoal
CALLI4
ASGNI4
ADDRLP4 268
ADDRLP4 1320
INDIRI4
ASGNI4
line 143
;142:			//
;143:			for (j = 0; j < numteammates; j++) {
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 $100
JUMPV
LABELV $97
line 144
;144:				if (traveltime < traveltimes[j]) {
ADDRLP4 268
INDIRI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
GEI4 $101
line 145
;145:					for (k = numteammates; k > j; k--) {
ADDRLP4 0
ADDRLP4 264
INDIRI4
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $103
line 146
;146:						traveltimes[k] = traveltimes[k-1];
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
INDIRI4
ASGNI4
line 147
;147:						teammates[k] = teammates[k-1];
ADDRLP4 1332
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1332
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 1332
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 148
;148:					}
LABELV $104
line 145
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $106
ADDRLP4 0
INDIRI4
ADDRLP4 260
INDIRI4
GTI4 $103
line 149
;149:					break;
ADDRGP4 $99
JUMPV
LABELV $101
line 151
;150:				}
;151:			}
LABELV $98
line 143
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $100
ADDRLP4 260
INDIRI4
ADDRLP4 264
INDIRI4
LTI4 $97
LABELV $99
line 152
;152:			traveltimes[j] = traveltime;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 153
;153:			teammates[j] = i;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 154
;154:			numteammates++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 155
;155:			if (numteammates >= maxteammates) break;
ADDRLP4 264
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $108
ADDRGP4 $87
JUMPV
LABELV $108
line 156
;156:		}
LABELV $95
line 157
;157:	}
LABELV $86
line 132
ADDRLP4 272
ADDRLP4 272
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $88
ADDRLP4 272
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $85
LABELV $87
line 158
;158:	return numteammates;
ADDRLP4 264
INDIRI4
RETI4
LABELV $80
endproc BotSortTeamMatesByBaseTravelTime 1336 12
export BotSetTeamMateTaskPreference
proc BotSetTeamMateTaskPreference 36 12
line 166
;159:}
;160:
;161:/*
;162:==================
;163:BotSetTeamMateTaskPreference
;164:==================
;165:*/
;166:void BotSetTeamMateTaskPreference(bot_state_t *bs, int teammate, int preference) {
line 169
;167:	char teammatename[MAX_NETNAME];
;168:
;169:	ctftaskpreferences[teammate].preference = preference;
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 170
;170:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 171
;171:	strcpy(ctftaskpreferences[teammate].name, teammatename);
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 172
;172:}
LABELV $110
endproc BotSetTeamMateTaskPreference 36 12
export BotGetTeamMateTaskPreference
proc BotGetTeamMateTaskPreference 40 12
line 179
;173:
;174:/*
;175:==================
;176:BotGetTeamMateTaskPreference
;177:==================
;178:*/
;179:int BotGetTeamMateTaskPreference(bot_state_t *bs, int teammate) {
line 182
;180:	char teammatename[MAX_NETNAME];
;181:
;182:	if (!ctftaskpreferences[teammate].preference) return 0;
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $113
CNSTI4 0
RETI4
ADDRGP4 $112
JUMPV
LABELV $113
line 183
;183:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 184
;184:	if (Q_stricmp(teammatename, ctftaskpreferences[teammate].name)) return 0;
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $116
CNSTI4 0
RETI4
ADDRGP4 $112
JUMPV
LABELV $116
line 185
;185:	return ctftaskpreferences[teammate].preference;
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
RETI4
LABELV $112
endproc BotGetTeamMateTaskPreference 40 12
export BotSortTeamMatesByTaskPreference
proc BotSortTeamMatesByTaskPreference 800 12
line 193
;186:}
;187:
;188:/*
;189:==================
;190:BotSortTeamMatesByTaskPreference
;191:==================
;192:*/
;193:int BotSortTeamMatesByTaskPreference(bot_state_t *bs, int *teammates, int numteammates) {
line 199
;194:	int defenders[MAX_CLIENTS], numdefenders;
;195:	int attackers[MAX_CLIENTS], numattackers;
;196:	int roamers[MAX_CLIENTS], numroamers;
;197:	int i, preference;
;198:
;199:	numdefenders = numattackers = numroamers = 0;
ADDRLP4 788
CNSTI4 0
ASGNI4
ADDRLP4 272
ADDRLP4 788
INDIRI4
ASGNI4
ADDRLP4 268
ADDRLP4 788
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 788
INDIRI4
ASGNI4
line 200
;200:	for (i = 0; i < numteammates; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $123
JUMPV
LABELV $120
line 201
;201:		preference = BotGetTeamMateTaskPreference(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 792
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 792
INDIRI4
ASGNI4
line 202
;202:		if (preference & TEAMTP_DEFENDER) {
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $124
line 203
;203:			defenders[numdefenders++] = teammates[i];
ADDRLP4 796
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 204
;204:		}
ADDRGP4 $125
JUMPV
LABELV $124
line 205
;205:		else if (preference & TEAMTP_ATTACKER) {
ADDRLP4 4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $126
line 206
;206:			attackers[numattackers++] = teammates[i];
ADDRLP4 796
ADDRLP4 268
INDIRI4
ASGNI4
ADDRLP4 268
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 207
;207:		}
ADDRGP4 $127
JUMPV
LABELV $126
line 208
;208:		else {
line 209
;209:			roamers[numroamers++] = teammates[i];
ADDRLP4 796
ADDRLP4 272
INDIRI4
ASGNI4
ADDRLP4 272
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 532
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 210
;210:		}
LABELV $127
LABELV $125
line 211
;211:	}
LABELV $121
line 200
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $123
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $120
line 212
;212:	numteammates = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 214
;213:	//defenders at the front of the list
;214:	memcpy(&teammates[numteammates], defenders, numdefenders * sizeof(int));
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 215
;215:	numteammates += numdefenders;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 217
;216:	//roamers in the middle
;217:	memcpy(&teammates[numteammates], roamers, numroamers * sizeof(int));
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 532
ARGP4
ADDRLP4 272
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 218
;218:	numteammates += numroamers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 272
INDIRI4
ADDI4
ASGNI4
line 220
;219:	//attacker in the back of the list
;220:	memcpy(&teammates[numteammates], attackers, numattackers * sizeof(int));
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 268
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 221
;221:	numteammates += numattackers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 268
INDIRI4
ADDI4
ASGNI4
line 223
;222:
;223:	return numteammates;
ADDRFP4 8
INDIRI4
RETI4
LABELV $119
endproc BotSortTeamMatesByTaskPreference 800 12
export BotSayTeamOrderAlways
proc BotSayTeamOrderAlways 548 20
line 231
;224:}
;225:
;226:/*
;227:==================
;228:BotSayTeamOrders
;229:==================
;230:*/
;231:void BotSayTeamOrderAlways(bot_state_t *bs, int toclient) {
line 237
;232:	char teamchat[MAX_MESSAGE_SIZE];
;233:	char buf[MAX_MESSAGE_SIZE];
;234:	char name[MAX_NETNAME];
;235:
;236:	//if the bot is talking to itself
;237:	if (bs->client == toclient) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $129
line 239
;238:		//don't show the message just put it in the console message queue
;239:		trap_BotGetChatMessage(bs->cs, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGetChatMessage
CALLV
pop
line 240
;240:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 241
;241:		Com_sprintf(teamchat, sizeof(teamchat), EC"(%s"EC")"EC": %s", name, buf);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $131
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 242
;242:		trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, teamchat);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 243
;243:	}
ADDRGP4 $130
JUMPV
LABELV $129
line 244
;244:	else {
line 245
;245:		trap_BotEnterChat(bs->cs, toclient, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 246
;246:	}
LABELV $130
line 247
;247:}
LABELV $128
endproc BotSayTeamOrderAlways 548 20
export BotSayTeamOrder
proc BotSayTeamOrder 0 8
line 254
;248:
;249:/*
;250:==================
;251:BotSayTeamOrders
;252:==================
;253:*/
;254:void BotSayTeamOrder(bot_state_t *bs, int toclient) {
line 261
;255:#ifdef MISSIONPACK
;256:	// voice chats only
;257:	char buf[MAX_MESSAGE_SIZE];
;258:
;259:	trap_BotGetChatMessage(bs->cs, buf, sizeof(buf));
;260:#else
;261:	BotSayTeamOrderAlways(bs, toclient);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrderAlways
CALLV
pop
line 263
;262:#endif
;263:}
LABELV $132
endproc BotSayTeamOrder 0 8
export BotVoiceChat
proc BotVoiceChat 0 0
line 270
;264:
;265:/*
;266:==================
;267:BotVoiceChat
;268:==================
;269:*/
;270:void BotVoiceChat(bot_state_t *bs, int toclient, char *voicechat) {
line 279
;271:#ifdef MISSIONPACK
;272:	if (toclient == -1)
;273:		// voice only say team
;274:		trap_EA_Command(bs->client, va("vsay_team %s", voicechat));
;275:	else
;276:		// voice only tell single player
;277:		trap_EA_Command(bs->client, va("vtell %d %s", toclient, voicechat));
;278:#endif
;279:}
LABELV $133
endproc BotVoiceChat 0 0
export BotVoiceChatOnly
proc BotVoiceChatOnly 0 0
line 286
;280:
;281:/*
;282:==================
;283:BotVoiceChatOnly
;284:==================
;285:*/
;286:void BotVoiceChatOnly(bot_state_t *bs, int toclient, char *voicechat) {
line 295
;287:#ifdef MISSIONPACK
;288:	if (toclient == -1)
;289:		// voice only say team
;290:		trap_EA_Command(bs->client, va("vosay_team %s", voicechat));
;291:	else
;292:		// voice only tell single player
;293:		trap_EA_Command(bs->client, va("votell %d %s", toclient, voicechat));
;294:#endif
;295:}
LABELV $134
endproc BotVoiceChatOnly 0 0
export BotSayVoiceTeamOrder
proc BotSayVoiceTeamOrder 0 0
line 302
;296:
;297:/*
;298:==================
;299:BotSayVoiceTeamOrder
;300:==================
;301:*/
;302:void BotSayVoiceTeamOrder(bot_state_t *bs, int toclient, char *voicechat) {
line 306
;303:#ifdef MISSIONPACK
;304:	BotVoiceChat(bs, toclient, voicechat);
;305:#endif
;306:}
LABELV $135
endproc BotSayVoiceTeamOrder 0 0
export BotCTFOrders_BothFlagsNotAtBase
proc BotCTFOrders_BothFlagsNotAtBase 364 20
line 313
;307:
;308:/*
;309:==================
;310:BotCTFOrders
;311:==================
;312:*/
;313:void BotCTFOrders_BothFlagsNotAtBase(bot_state_t *bs) {
line 318
;314:	int numteammates, defenders, attackers, i, other;
;315:	int teammates[MAX_CLIENTS];
;316:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;317:
;318:	memset( teammates, 0, sizeof( teammates ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 319
;319:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 348
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 348
INDIRI4
ASGNI4
line 320
;320:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 322
;321:	//different orders based on the number of team mates
;322:	switch(bs->numteammates) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 1
EQI4 $138
ADDRLP4 352
INDIRI4
CNSTI4 2
EQI4 $141
ADDRLP4 352
INDIRI4
CNSTI4 3
EQI4 $146
ADDRGP4 $137
JUMPV
line 323
;323:		case 1: break;
LABELV $141
line 325
;324:		case 2:
;325:		{
line 327
;326:			//tell the one not carrying the flag to attack the enemy base
;327:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $142
ADDRLP4 308
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $142
line 328
;328:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 0+4
INDIRI4
ASGNI4
LABELV $143
line 329
;329:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 330
;330:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 331
;331:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 335
;332:#ifdef MISSIONPACK
;333:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
;334:#endif
;335:			break;
ADDRGP4 $138
JUMPV
LABELV $146
line 338
;336:		}
;337:		case 3:
;338:		{
line 340
;339:			//tell the one closest to the base not carrying the flag to accompany the flag carrier
;340:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $147
ADDRLP4 308
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $147
line 341
;341:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 0+4
INDIRI4
ASGNI4
LABELV $148
line 342
;342:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 343
;343:			if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $150
line 344
;344:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 345
;345:				if (bs->flagcarrier == bs->client) {
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 360
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $152
line 346
;346:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 350
;347:#ifdef MISSIONPACK
;348:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
;349:#endif
;350:				}
ADDRGP4 $151
JUMPV
LABELV $152
line 351
;351:				else {
line 352
;352:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 356
;353:#ifdef MISSIONPACK
;354:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
;355:#endif
;356:				}
line 357
;357:			}
ADDRGP4 $151
JUMPV
LABELV $150
line 358
;358:			else {
line 360
;359:				//
;360:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 364
;361:#ifdef MISSIONPACK
;362:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
;363:#endif
;364:			}
LABELV $151
line 365
;365:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 367
;366:			//tell the one furthest from the the base not carrying the flag to get the enemy flag
;367:			if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 0+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $156
ADDRLP4 308
ADDRLP4 0+8
INDIRI4
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 368
;368:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 0+4
INDIRI4
ASGNI4
LABELV $157
line 369
;369:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 370
;370:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 371
;371:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 375
;372:#ifdef MISSIONPACK
;373:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_RETURNFLAG);
;374:#endif
;375:			break;
ADDRGP4 $138
JUMPV
LABELV $137
line 378
;376:		}
;377:		default:
;378:		{
line 379
;379:			defenders = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 380
;380:			if (defenders > 4) defenders = 4;
ADDRLP4 300
INDIRI4
CNSTI4 4
LEI4 $161
ADDRLP4 300
CNSTI4 4
ASGNI4
LABELV $161
line 381
;381:			attackers = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 382
;382:			if (attackers > 5) attackers = 5;
ADDRLP4 304
INDIRI4
CNSTI4 5
LEI4 $163
ADDRLP4 304
CNSTI4 5
ASGNI4
LABELV $163
line 383
;383:			if (bs->flagcarrier != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $165
line 384
;384:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 385
;385:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $167
line 387
;386:					//
;387:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $171
line 388
;388:						continue;
ADDRGP4 $168
JUMPV
LABELV $171
line 391
;389:					}
;390:					//
;391:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 392
;392:					if (bs->flagcarrier == bs->client) {
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 360
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $173
line 393
;393:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 397
;394:#ifdef MISSIONPACK
;395:						BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_FOLLOWME);
;396:#endif
;397:					}
ADDRGP4 $174
JUMPV
LABELV $173
line 398
;398:					else {
line 399
;399:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 403
;400:#ifdef MISSIONPACK
;401:						BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_FOLLOWFLAGCARRIER);
;402:#endif
;403:					}
LABELV $174
line 404
;404:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 405
;405:				}
LABELV $168
line 385
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $170
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $167
line 406
;406:			}
ADDRGP4 $166
JUMPV
LABELV $165
line 407
;407:			else {
line 408
;408:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $175
line 410
;409:					//
;410:					if (teammates[i] == bs->flagcarrier) {
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $179
line 411
;411:						continue;
ADDRGP4 $176
JUMPV
LABELV $179
line 414
;412:					}
;413:					//
;414:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 415
;415:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 419
;416:#ifdef MISSIONPACK
;417:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_GETFLAG);
;418:#endif
;419:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 420
;420:				}
LABELV $176
line 408
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $178
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $175
line 421
;421:			}
LABELV $166
line 422
;422:			for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $184
JUMPV
LABELV $181
line 424
;423:				//
;424:				if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $185
line 425
;425:					continue;
ADDRGP4 $182
JUMPV
LABELV $185
line 428
;426:				}
;427:				//
;428:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 429
;429:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 430
;430:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 434
;431:#ifdef MISSIONPACK
;432:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_RETURNFLAG);
;433:#endif
;434:			}
LABELV $182
line 422
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $184
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $181
line 436
;435:			//
;436:			break;
LABELV $138
line 439
;437:		}
;438:	}
;439:}
LABELV $136
endproc BotCTFOrders_BothFlagsNotAtBase 364 20
export BotCTFOrders_FlagNotAtBase
proc BotCTFOrders_FlagNotAtBase 320 16
line 446
;440:
;441:/*
;442:==================
;443:BotCTFOrders
;444:==================
;445:*/
;446:void BotCTFOrders_FlagNotAtBase(bot_state_t *bs) {
line 451
;447:	int numteammates, defenders, attackers, i;
;448:	int teammates[MAX_CLIENTS];
;449:	char name[MAX_NETNAME];
;450:
;451:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 452
;452:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 454
;453:	//passive strategy
;454:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $191
line 456
;455:		//different orders based on the number of team mates
;456:		switch(bs->numteammates) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $192
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $197
ADDRLP4 312
INDIRI4
CNSTI4 3
EQI4 $201
ADDRGP4 $193
JUMPV
line 457
;457:			case 1: break;
LABELV $197
line 459
;458:			case 2:
;459:			{
line 461
;460:				//both will go for the enemy flag
;461:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 462
;462:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 463
;463:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 468
;464:#ifdef MISSIONPACK
;465:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
;466:#endif
;467:				//
;468:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 469
;469:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 470
;470:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 474
;471:#ifdef MISSIONPACK
;472:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;473:#endif
;474:				break;
ADDRGP4 $192
JUMPV
LABELV $201
line 477
;475:			}
;476:			case 3:
;477:			{
line 479
;478:				//keep one near the base for when the flag is returned
;479:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 480
;480:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 481
;481:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 486
;482:#ifdef MISSIONPACK
;483:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;484:#endif
;485:				//the other two get the flag
;486:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 487
;487:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 488
;488:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 493
;489:#ifdef MISSIONPACK
;490:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;491:#endif
;492:      			//
;493:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 494
;494:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 495
;495:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 499
;496:#ifdef MISSIONPACK
;497:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;498:#endif
;499:				break;
ADDRGP4 $192
JUMPV
LABELV $193
line 502
;500:			}
;501:			default:
;502:			{
line 504
;503:				//keep some people near the base for when the flag is returned
;504:				defenders = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 505
;505:				if (defenders > 3) defenders = 3;
ADDRLP4 300
INDIRI4
CNSTI4 3
LEI4 $206
ADDRLP4 300
CNSTI4 3
ASGNI4
LABELV $206
line 506
;506:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 507
;507:				if (attackers > 6) attackers = 6;
ADDRLP4 304
INDIRI4
CNSTI4 6
LEI4 $208
ADDRLP4 304
CNSTI4 6
ASGNI4
LABELV $208
line 508
;508:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $213
JUMPV
LABELV $210
line 510
;509:					//
;510:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 511
;511:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 512
;512:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 516
;513:#ifdef MISSIONPACK
;514:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;515:#endif
;516:				}
LABELV $211
line 508
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $213
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $210
line 517
;517:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $214
line 519
;518:					//
;519:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 520
;520:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 521
;521:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 525
;522:#ifdef MISSIONPACK
;523:					BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
;524:#endif
;525:				}
LABELV $215
line 517
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $217
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $214
line 527
;526:				//
;527:				break;
line 530
;528:			}
;529:		}
;530:	}
ADDRGP4 $192
JUMPV
LABELV $191
line 531
;531:	else {
line 533
;532:		//different orders based on the number of team mates
;533:		switch(bs->numteammates) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $221
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $224
ADDRLP4 312
INDIRI4
CNSTI4 3
EQI4 $227
ADDRGP4 $220
JUMPV
line 534
;534:			case 1: break;
LABELV $224
line 536
;535:			case 2:
;536:			{
line 538
;537:				//both will go for the enemy flag
;538:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 539
;539:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 540
;540:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 545
;541:#ifdef MISSIONPACK
;542:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
;543:#endif
;544:				//
;545:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 546
;546:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 547
;547:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 551
;548:#ifdef MISSIONPACK
;549:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;550:#endif
;551:				break;
ADDRGP4 $221
JUMPV
LABELV $227
line 554
;552:			}
;553:			case 3:
;554:			{
line 556
;555:				//everyone go for the flag
;556:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 557
;557:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 558
;558:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 563
;559:#ifdef MISSIONPACK
;560:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
;561:#endif
;562:				//
;563:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 564
;564:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 565
;565:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 570
;566:#ifdef MISSIONPACK
;567:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;568:#endif
;569:				//
;570:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 571
;571:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 572
;572:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 576
;573:#ifdef MISSIONPACK
;574:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;575:#endif
;576:				break;
ADDRGP4 $221
JUMPV
LABELV $220
line 579
;577:			}
;578:			default:
;579:			{
line 581
;580:				//keep some people near the base for when the flag is returned
;581:				defenders = (int) (float) numteammates * 0.2 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1045220557
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 582
;582:				if (defenders > 2) defenders = 2;
ADDRLP4 300
INDIRI4
CNSTI4 2
LEI4 $232
ADDRLP4 300
CNSTI4 2
ASGNI4
LABELV $232
line 583
;583:				attackers = (int) (float) numteammates * 0.7 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 584
;584:				if (attackers > 7) attackers = 7;
ADDRLP4 304
INDIRI4
CNSTI4 7
LEI4 $234
ADDRLP4 304
CNSTI4 7
ASGNI4
LABELV $234
line 585
;585:				for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $239
JUMPV
LABELV $236
line 587
;586:					//
;587:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 588
;588:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 589
;589:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 593
;590:#ifdef MISSIONPACK
;591:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;592:#endif
;593:				}
LABELV $237
line 585
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $239
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $236
line 594
;594:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $243
JUMPV
LABELV $240
line 596
;595:					//
;596:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 597
;597:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 598
;598:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 602
;599:#ifdef MISSIONPACK
;600:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;601:#endif
;602:				}
LABELV $241
line 594
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $243
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $240
line 604
;603:				//
;604:				break;
LABELV $221
line 607
;605:			}
;606:		}
;607:	}
LABELV $192
line 608
;608:}
LABELV $190
endproc BotCTFOrders_FlagNotAtBase 320 16
export BotCTFOrders_EnemyFlagNotAtBase
proc BotCTFOrders_EnemyFlagNotAtBase 360 20
line 615
;609:
;610:/*
;611:==================
;612:BotCTFOrders
;613:==================
;614:*/
;615:void BotCTFOrders_EnemyFlagNotAtBase(bot_state_t *bs) {
line 620
;616:	int numteammates, defenders, attackers, i, other;
;617:	int teammates[MAX_CLIENTS];
;618:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;619:
;620:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 348
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 348
INDIRI4
ASGNI4
line 621
;621:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 623
;622:	//different orders based on the number of team mates
;623:	switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $248
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $250
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $254
ADDRGP4 $247
JUMPV
line 624
;624:		case 1: break;
LABELV $250
line 626
;625:		case 2:
;626:		{
line 628
;627:			//tell the one not carrying the flag to defend the base
;628:			if (teammates[0] == bs->flagcarrier) other = teammates[1];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $251
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRGP4 $252
JUMPV
LABELV $251
line 629
;629:			else other = teammates[0];
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $252
line 630
;630:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 631
;631:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 632
;632:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 636
;633:#ifdef MISSIONPACK
;634:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;635:#endif
;636:			break;
ADDRGP4 $248
JUMPV
LABELV $254
line 639
;637:		}
;638:		case 3:
;639:		{
line 641
;640:			//tell the one closest to the base not carrying the flag to defend the base
;641:			if (teammates[0] != bs->flagcarrier) other = teammates[0];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $255
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $256
JUMPV
LABELV $255
line 642
;642:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $256
line 643
;643:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 644
;644:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 645
;645:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 650
;646:#ifdef MISSIONPACK
;647:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;648:#endif
;649:			//tell the other also to defend the base
;650:			if (teammates[2] != bs->flagcarrier) other = teammates[2];
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $258
ADDRLP4 308
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
line 651
;651:			else other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $259
line 652
;652:			ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 653
;653:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 654
;654:			BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 658
;655:#ifdef MISSIONPACK
;656:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;657:#endif
;658:			break;
ADDRGP4 $248
JUMPV
LABELV $247
line 661
;659:		}
;660:		default:
;661:		{
line 663
;662:			//60% will defend the base
;663:			defenders = (int) (float) numteammates * 0.6 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1058642330
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 664
;664:			if (defenders > 6) defenders = 6;
ADDRLP4 300
INDIRI4
CNSTI4 6
LEI4 $263
ADDRLP4 300
CNSTI4 6
ASGNI4
LABELV $263
line 666
;665:			//30% accompanies the flag carrier
;666:			attackers = (int) (float) numteammates * 0.3 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 667
;667:			if (attackers > 3) attackers = 3;
ADDRLP4 304
INDIRI4
CNSTI4 3
LEI4 $265
ADDRLP4 304
CNSTI4 3
ASGNI4
LABELV $265
line 668
;668:			for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $270
JUMPV
LABELV $267
line 670
;669:				//
;670:				if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $271
line 671
;671:					continue;
ADDRGP4 $268
JUMPV
LABELV $271
line 673
;672:				}
;673:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 674
;674:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 675
;675:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 679
;676:#ifdef MISSIONPACK
;677:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;678:#endif
;679:			}
LABELV $268
line 668
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $270
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $267
line 681
;680:			// if we have a flag carrier
;681:			if ( bs->flagcarrier != -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $273
line 682
;682:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 683
;683:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 685
;684:					//
;685:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $279
line 686
;686:						continue;
ADDRGP4 $276
JUMPV
LABELV $279
line 689
;687:					}
;688:					//
;689:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 690
;690:					if (bs->flagcarrier == bs->client) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $283
line 691
;691:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 695
;692:#ifdef MISSIONPACK
;693:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
;694:#endif
;695:					}
ADDRGP4 $284
JUMPV
LABELV $283
line 696
;696:					else {
line 697
;697:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 701
;698:#ifdef MISSIONPACK
;699:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
;700:#endif
;701:					}
LABELV $284
line 702
;702:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 703
;703:				}
LABELV $276
line 683
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $275
line 704
;704:			}
ADDRGP4 $248
JUMPV
LABELV $273
line 705
;705:			else {
line 706
;706:				for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $286
line 708
;707:					//
;708:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $290
line 709
;709:						continue;
ADDRGP4 $287
JUMPV
LABELV $290
line 712
;710:					}
;711:					//
;712:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 713
;713:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 717
;714:#ifdef MISSIONPACK
;715:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;716:#endif
;717:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 718
;718:				}
LABELV $287
line 706
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $289
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $286
line 719
;719:			}
line 721
;720:			//
;721:			break;
LABELV $248
line 724
;722:		}
;723:	}
;724:}
LABELV $246
endproc BotCTFOrders_EnemyFlagNotAtBase 360 20
export BotCTFOrders_BothFlagsAtBase
proc BotCTFOrders_BothFlagsAtBase 316 16
line 732
;725:
;726:
;727:/*
;728:==================
;729:BotCTFOrders
;730:==================
;731:*/
;732:void BotCTFOrders_BothFlagsAtBase(bot_state_t *bs) {
line 737
;733:	int numteammates, defenders, attackers, i;
;734:	int teammates[MAX_CLIENTS];
;735:	char name[MAX_NETNAME];
;736:
;737:	memset( teammates, 0, sizeof( teammates ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 739
;738:	//sort team mates by travel time to base
;739:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 741
;740:	//sort team mates by CTF preference
;741:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 743
;742:	//passive strategy
;743:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $296
line 745
;744:		//different orders based on the number of team mates
;745:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $297
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $301
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $304
ADDRGP4 $298
JUMPV
line 746
;746:			case 1: break;
LABELV $301
line 748
;747:			case 2:
;748:			{
line 750
;749:				//the one closest to the base will defend the base
;750:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 751
;751:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 752
;752:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 757
;753:#ifdef MISSIONPACK
;754:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;755:#endif
;756:				//the other will get the flag
;757:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 758
;758:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 759
;759:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 763
;760:#ifdef MISSIONPACK
;761:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;762:#endif
;763:				break;
ADDRGP4 $297
JUMPV
LABELV $304
line 766
;764:			}
;765:			case 3:
;766:			{
line 768
;767:				//the one closest to the base will defend the base
;768:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 769
;769:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 770
;770:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 775
;771:#ifdef MISSIONPACK
;772:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;773:#endif
;774:				//the second one closest to the base will defend the base
;775:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 776
;776:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 777
;777:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 782
;778:#ifdef MISSIONPACK
;779:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;780:#endif
;781:				//the other will get the flag
;782:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 783
;783:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 784
;784:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 788
;785:#ifdef MISSIONPACK
;786:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;787:#endif
;788:				break;
ADDRGP4 $297
JUMPV
LABELV $298
line 791
;789:			}
;790:			default:
;791:			{
line 792
;792:				defenders = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 793
;793:				if (defenders > 5) defenders = 5;
ADDRLP4 300
INDIRI4
CNSTI4 5
LEI4 $309
ADDRLP4 300
CNSTI4 5
ASGNI4
LABELV $309
line 794
;794:				attackers = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 795
;795:				if (attackers > 4) attackers = 4;
ADDRLP4 304
INDIRI4
CNSTI4 4
LEI4 $311
ADDRLP4 304
CNSTI4 4
ASGNI4
LABELV $311
line 796
;796:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $313
line 798
;797:					//
;798:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 799
;799:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 800
;800:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 804
;801:#ifdef MISSIONPACK
;802:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;803:#endif
;804:				}
LABELV $314
line 796
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $316
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $313
line 805
;805:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $320
JUMPV
LABELV $317
line 807
;806:					//
;807:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 808
;808:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 809
;809:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 813
;810:#ifdef MISSIONPACK
;811:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;812:#endif
;813:				}
LABELV $318
line 805
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $320
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $317
line 815
;814:				//
;815:				break;
line 818
;816:			}
;817:		}
;818:	}
ADDRGP4 $297
JUMPV
LABELV $296
line 819
;819:	else {
line 821
;820:		//different orders based on the number of team mates
;821:		switch(numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $324
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $326
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $329
ADDRGP4 $323
JUMPV
line 822
;822:			case 1: break;
LABELV $326
line 824
;823:			case 2:
;824:			{
line 826
;825:				//the one closest to the base will defend the base
;826:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 827
;827:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 828
;828:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 833
;829:#ifdef MISSIONPACK
;830:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;831:#endif
;832:				//the other will get the flag
;833:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 834
;834:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 835
;835:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 839
;836:#ifdef MISSIONPACK
;837:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;838:#endif
;839:				break;
ADDRGP4 $324
JUMPV
LABELV $329
line 842
;840:			}
;841:			case 3:
;842:			{
line 844
;843:				//the one closest to the base will defend the base
;844:				ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 845
;845:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 846
;846:				BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 851
;847:#ifdef MISSIONPACK
;848:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;849:#endif
;850:				//the others should go for the enemy flag
;851:				ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 852
;852:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 853
;853:				BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 858
;854:#ifdef MISSIONPACK
;855:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;856:#endif
;857:				//
;858:				ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 859
;859:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 860
;860:				BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 864
;861:#ifdef MISSIONPACK
;862:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;863:#endif
;864:				break;
ADDRGP4 $324
JUMPV
LABELV $323
line 867
;865:			}
;866:			default:
;867:			{
line 868
;868:				defenders = (int) (float) numteammates * 0.4 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 869
;869:				if (defenders > 4) defenders = 4;
ADDRLP4 300
INDIRI4
CNSTI4 4
LEI4 $334
ADDRLP4 300
CNSTI4 4
ASGNI4
LABELV $334
line 870
;870:				attackers = (int) (float) numteammates * 0.5 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 871
;871:				if (attackers > 5) attackers = 5;
ADDRLP4 304
INDIRI4
CNSTI4 5
LEI4 $336
ADDRLP4 304
CNSTI4 5
ASGNI4
LABELV $336
line 872
;872:				for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $341
JUMPV
LABELV $338
line 874
;873:					//
;874:					ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 875
;875:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 876
;876:					BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 880
;877:#ifdef MISSIONPACK
;878:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;879:#endif
;880:				}
LABELV $339
line 872
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $341
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $338
line 881
;881:				for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $345
JUMPV
LABELV $342
line 883
;882:					//
;883:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 884
;884:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 885
;885:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 889
;886:#ifdef MISSIONPACK
;887:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;888:#endif
;889:				}
LABELV $343
line 881
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $345
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $342
line 891
;890:				//
;891:				break;
LABELV $324
line 894
;892:			}
;893:		}
;894:	}
LABELV $297
line 895
;895:}
LABELV $295
endproc BotCTFOrders_BothFlagsAtBase 316 16
export BotCTFOrders
proc BotCTFOrders 20 4
line 902
;896:
;897:/*
;898:==================
;899:BotCTFOrders
;900:==================
;901:*/
;902:void BotCTFOrders(bot_state_t *bs) {
line 906
;903:	int flagstatus;
;904:
;905:	//
;906:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $349
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
line 907
;907:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $350
line 909
;908:	//
;909:	switch(flagstatus) {
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $351
ADDRLP4 16
INDIRI4
CNSTI4 3
GTI4 $351
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $357
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $357
address $353
address $354
address $355
address $356
code
LABELV $353
line 910
;910:		case 0: BotCTFOrders_BothFlagsAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsAtBase
CALLV
pop
ADDRGP4 $352
JUMPV
LABELV $354
line 911
;911:		case 1: BotCTFOrders_EnemyFlagNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_EnemyFlagNotAtBase
CALLV
pop
ADDRGP4 $352
JUMPV
LABELV $355
line 912
;912:		case 2: BotCTFOrders_FlagNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_FlagNotAtBase
CALLV
pop
ADDRGP4 $352
JUMPV
LABELV $356
line 913
;913:		case 3: BotCTFOrders_BothFlagsNotAtBase(bs); break;
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsNotAtBase
CALLV
pop
LABELV $351
LABELV $352
line 915
;914:	}
;915:}
LABELV $348
endproc BotCTFOrders 20 4
export BotCreateGroup
proc BotCreateGroup 76 20
line 923
;916:
;917:
;918:/*
;919:==================
;920:BotCreateGroup
;921:==================
;922:*/
;923:void BotCreateGroup(bot_state_t *bs, int *teammates, int groupsize) {
line 928
;924:	char name[MAX_NETNAME], leadername[MAX_NETNAME];
;925:	int i;
;926:
;927:	// the others in the group will follow the teammates[0]
;928:	ClientName(teammates[0], leadername, sizeof(leadername));
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 929
;929:	for (i = 1; i < groupsize; i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $362
JUMPV
LABELV $359
line 930
;930:	{
line 931
;931:		ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 932
;932:		if (teammates[0] == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $363
line 933
;933:			BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 934
;934:		}
ADDRGP4 $364
JUMPV
LABELV $363
line 935
;935:		else {
line 936
;936:			BotAI_BotInitialChat(bs, "cmd_accompany", name, leadername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 937
;937:		}
LABELV $364
line 938
;938:		BotSayTeamOrderAlways(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrderAlways
CALLV
pop
line 939
;939:	}
LABELV $360
line 929
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $362
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $359
line 940
;940:}
LABELV $358
endproc BotCreateGroup 76 20
export BotTeamOrders
proc BotTeamOrders 1304 12
line 949
;941:
;942:/*
;943:==================
;944:BotTeamOrders
;945:
;946:  FIXME: defend key areas?
;947:==================
;948:*/
;949:void BotTeamOrders(bot_state_t *bs) {
line 954
;950:	int teammates[MAX_CLIENTS];
;951:	int numteammates, i;
;952:	char buf[MAX_INFO_STRING];
;953:
;954:	numteammates = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 955
;955:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $366
line 956
;956:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 958
;957:		//if no config string or no name
;958:		if (!buf[0] || !*Info_ValueForKey(buf, "n")) continue;
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $373
ADDRLP4 0
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1288
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1288
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $371
LABELV $373
ADDRGP4 $367
JUMPV
LABELV $371
line 960
;959:		//skip spectators
;960:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) continue;
ADDRLP4 0
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 1292
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1292
INDIRP4
ARGP4
ADDRLP4 1296
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 3
NEI4 $374
ADDRGP4 $367
JUMPV
LABELV $374
line 962
;961:		//
;962:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1300
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 0
EQI4 $376
line 963
;963:			teammates[numteammates] = i;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
ADDRLP4 1024
INDIRI4
ASGNI4
line 964
;964:			numteammates++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 965
;965:		}
LABELV $376
line 966
;966:	}
LABELV $367
line 955
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $369
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $366
line 968
;967:	//
;968:	switch(numteammates) {
ADDRLP4 1028
INDIRI4
CNSTI4 1
LTI4 $378
ADDRLP4 1028
INDIRI4
CNSTI4 5
GTI4 $378
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $393-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $393
address $379
address $379
address $382
address $383
address $385
code
line 969
;969:		case 1: break;
line 971
;970:		case 2:
;971:		{
line 973
;972:			//nothing special
;973:			break;
LABELV $382
line 976
;974:		}
;975:		case 3:
;976:		{
line 978
;977:			//have one follow another and one free roaming
;978:			BotCreateGroup(bs, teammates, 2);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 979
;979:			break;
ADDRGP4 $379
JUMPV
LABELV $383
line 982
;980:		}
;981:		case 4:
;982:		{
line 983
;983:			BotCreateGroup(bs, teammates, 2);		//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 984
;984:			BotCreateGroup(bs, &teammates[2], 2);	//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 985
;985:			break;
ADDRGP4 $379
JUMPV
LABELV $385
line 988
;986:		}
;987:		case 5:
;988:		{
line 989
;989:			BotCreateGroup(bs, teammates, 2);		//a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 990
;990:			BotCreateGroup(bs, &teammates[2], 3);	//a group of 3
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 991
;991:			break;
ADDRGP4 $379
JUMPV
LABELV $378
line 994
;992:		}
;993:		default:
;994:		{
line 995
;995:			if (numteammates <= 10) {
ADDRLP4 1028
INDIRI4
CNSTI4 10
GTI4 $379
line 996
;996:				for (i = 0; i < numteammates / 2; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $389
line 997
;997:					BotCreateGroup(bs, &teammates[i*2], 2);	//groups of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 998
;998:				}
LABELV $390
line 996
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $392
ADDRLP4 1024
INDIRI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
DIVI4
LTI4 $389
line 999
;999:			}
line 1000
;1000:			break;
LABELV $379
line 1003
;1001:		}
;1002:	}
;1003:}
LABELV $365
endproc BotTeamOrders 1304 12
export FindHumanTeamLeader
proc FindHumanTeamLeader 12 12
line 1966
;1004:
;1005:#ifdef MISSIONPACK
;1006:
;1007:/*
;1008:==================
;1009:Bot1FCTFOrders_FlagAtCenter
;1010:
;1011:  X% defend the base, Y% get the flag
;1012:==================
;1013:*/
;1014:void Bot1FCTFOrders_FlagAtCenter(bot_state_t *bs) {
;1015:	int numteammates, defenders, attackers, i;
;1016:	int teammates[MAX_CLIENTS];
;1017:	char name[MAX_NETNAME];
;1018:
;1019:	//sort team mates by travel time to base
;1020:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1021:	//sort team mates by CTF preference
;1022:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1023:	//passive strategy
;1024:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1025:		//different orders based on the number of team mates
;1026:		switch(numteammates) {
;1027:			case 1: break;
;1028:			case 2:
;1029:			{
;1030:				//the one closest to the base will defend the base
;1031:				ClientName(teammates[0], name, sizeof(name));
;1032:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1033:				BotSayTeamOrder(bs, teammates[0]);
;1034:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1035:				//the other will get the flag
;1036:				ClientName(teammates[1], name, sizeof(name));
;1037:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1038:				BotSayTeamOrder(bs, teammates[1]);
;1039:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1040:				break;
;1041:			}
;1042:			case 3:
;1043:			{
;1044:				//the one closest to the base will defend the base
;1045:				ClientName(teammates[0], name, sizeof(name));
;1046:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1047:				BotSayTeamOrder(bs, teammates[0]);
;1048:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1049:				//the second one closest to the base will defend the base
;1050:				ClientName(teammates[1], name, sizeof(name));
;1051:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1052:				BotSayTeamOrder(bs, teammates[1]);
;1053:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1054:				//the other will get the flag
;1055:				ClientName(teammates[2], name, sizeof(name));
;1056:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1057:				BotSayTeamOrder(bs, teammates[2]);
;1058:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1059:				break;
;1060:			}
;1061:			default:
;1062:			{
;1063:				//50% defend the base
;1064:				defenders = (int) (float) numteammates * 0.5 + 0.5;
;1065:				if (defenders > 5) defenders = 5;
;1066:				//40% get the flag
;1067:				attackers = (int) (float) numteammates * 0.4 + 0.5;
;1068:				if (attackers > 4) attackers = 4;
;1069:				for (i = 0; i < defenders; i++) {
;1070:					//
;1071:					ClientName(teammates[i], name, sizeof(name));
;1072:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1073:					BotSayTeamOrder(bs, teammates[i]);
;1074:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1075:				}
;1076:				for (i = 0; i < attackers; i++) {
;1077:					//
;1078:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1079:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1080:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1081:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1082:				}
;1083:				//
;1084:				break;
;1085:			}
;1086:		}
;1087:	}
;1088:	else { //agressive
;1089:		//different orders based on the number of team mates
;1090:		switch(numteammates) {
;1091:			case 1: break;
;1092:			case 2:
;1093:			{
;1094:				//the one closest to the base will defend the base
;1095:				ClientName(teammates[0], name, sizeof(name));
;1096:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1097:				BotSayTeamOrder(bs, teammates[0]);
;1098:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1099:				//the other will get the flag
;1100:				ClientName(teammates[1], name, sizeof(name));
;1101:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1102:				BotSayTeamOrder(bs, teammates[1]);
;1103:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1104:				break;
;1105:			}
;1106:			case 3:
;1107:			{
;1108:				//the one closest to the base will defend the base
;1109:				ClientName(teammates[0], name, sizeof(name));
;1110:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1111:				BotSayTeamOrder(bs, teammates[0]);
;1112:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1113:				//the others should go for the enemy flag
;1114:				ClientName(teammates[1], name, sizeof(name));
;1115:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1116:				BotSayTeamOrder(bs, teammates[1]);
;1117:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1118:				//
;1119:				ClientName(teammates[2], name, sizeof(name));
;1120:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1121:				BotSayTeamOrder(bs, teammates[2]);
;1122:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1123:				break;
;1124:			}
;1125:			default:
;1126:			{
;1127:				//30% defend the base
;1128:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1129:				if (defenders > 3) defenders = 3;
;1130:				//60% get the flag
;1131:				attackers = (int) (float) numteammates * 0.6 + 0.5;
;1132:				if (attackers > 6) attackers = 6;
;1133:				for (i = 0; i < defenders; i++) {
;1134:					//
;1135:					ClientName(teammates[i], name, sizeof(name));
;1136:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1137:					BotSayTeamOrder(bs, teammates[i]);
;1138:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1139:				}
;1140:				for (i = 0; i < attackers; i++) {
;1141:					//
;1142:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1143:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1144:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1145:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1146:				}
;1147:				//
;1148:				break;
;1149:			}
;1150:		}
;1151:	}
;1152:}
;1153:
;1154:/*
;1155:==================
;1156:Bot1FCTFOrders_TeamHasFlag
;1157:
;1158:  X% towards neutral flag, Y% go towards enemy base and accompany flag carrier if visible
;1159:==================
;1160:*/
;1161:void Bot1FCTFOrders_TeamHasFlag(bot_state_t *bs) {
;1162:	int numteammates, defenders, attackers, i, other;
;1163:	int teammates[MAX_CLIENTS];
;1164:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;1165:
;1166:	//sort team mates by travel time to base
;1167:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1168:	//sort team mates by CTF preference
;1169:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1170:	//passive strategy
;1171:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1172:		//different orders based on the number of team mates
;1173:		switch(numteammates) {
;1174:			case 1: break;
;1175:			case 2:
;1176:			{
;1177:				//tell the one not carrying the flag to attack the enemy base
;1178:				if (teammates[0] == bs->flagcarrier) other = teammates[1];
;1179:				else other = teammates[0];
;1180:				ClientName(other, name, sizeof(name));
;1181:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1182:				BotSayTeamOrder(bs, other);
;1183:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_OFFENSE);
;1184:				break;
;1185:			}
;1186:			case 3:
;1187:			{
;1188:				//tell the one closest to the base not carrying the flag to defend the base
;1189:				if (teammates[0] != bs->flagcarrier) other = teammates[0];
;1190:				else other = teammates[1];
;1191:				ClientName(other, name, sizeof(name));
;1192:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1193:				BotSayTeamOrder(bs, other);
;1194:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;1195:				//tell the one furthest from the base not carrying the flag to accompany the flag carrier
;1196:				if (teammates[2] != bs->flagcarrier) other = teammates[2];
;1197:				else other = teammates[1];
;1198:				ClientName(other, name, sizeof(name));
;1199:				if ( bs->flagcarrier != -1 ) {
;1200:					ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1201:					if (bs->flagcarrier == bs->client) {
;1202:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1203:						BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
;1204:					}
;1205:					else {
;1206:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1207:						BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
;1208:					}
;1209:				}
;1210:				else {
;1211:					//
;1212:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1213:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
;1214:				}
;1215:				BotSayTeamOrder(bs, other);
;1216:				break;
;1217:			}
;1218:			default:
;1219:			{
;1220:				//30% will defend the base
;1221:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1222:				if (defenders > 3) defenders = 3;
;1223:				//70% accompanies the flag carrier
;1224:				attackers = (int) (float) numteammates * 0.7 + 0.5;
;1225:				if (attackers > 7) attackers = 7;
;1226:				for (i = 0; i < defenders; i++) {
;1227:					//
;1228:					if (teammates[i] == bs->flagcarrier) {
;1229:						continue;
;1230:					}
;1231:					ClientName(teammates[i], name, sizeof(name));
;1232:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1233:					BotSayTeamOrder(bs, teammates[i]);
;1234:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1235:				}
;1236:				if (bs->flagcarrier != -1) {
;1237:					ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1238:					for (i = 0; i < attackers; i++) {
;1239:						//
;1240:						if (teammates[numteammates - i - 1] == bs->flagcarrier) {
;1241:							continue;
;1242:						}
;1243:						//
;1244:						ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1245:						if (bs->flagcarrier == bs->client) {
;1246:							BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1247:							BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
;1248:						}
;1249:						else {
;1250:							BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1251:							BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
;1252:						}
;1253:						BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1254:					}
;1255:				}
;1256:				else {
;1257:					for (i = 0; i < attackers; i++) {
;1258:						//
;1259:						if (teammates[numteammates - i - 1] == bs->flagcarrier) {
;1260:							continue;
;1261:						}
;1262:						//
;1263:						ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1264:						BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1265:						BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1266:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1267:					}
;1268:				}
;1269:				//
;1270:				break;
;1271:			}
;1272:		}
;1273:	}
;1274:	else { //agressive
;1275:		//different orders based on the number of team mates
;1276:		switch(numteammates) {
;1277:			case 1: break;
;1278:			case 2:
;1279:			{
;1280:				//tell the one not carrying the flag to defend the base
;1281:				if (teammates[0] == bs->flagcarrier) other = teammates[1];
;1282:				else other = teammates[0];
;1283:				ClientName(other, name, sizeof(name));
;1284:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1285:				BotSayTeamOrder(bs, other);
;1286:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;1287:				break;
;1288:			}
;1289:			case 3:
;1290:			{
;1291:				//tell the one closest to the base not carrying the flag to defend the base
;1292:				if (teammates[0] != bs->flagcarrier) other = teammates[0];
;1293:				else other = teammates[1];
;1294:				ClientName(other, name, sizeof(name));
;1295:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1296:				BotSayTeamOrder(bs, other);
;1297:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;1298:				//tell the one furthest from the base not carrying the flag to accompany the flag carrier
;1299:				if (teammates[2] != bs->flagcarrier) other = teammates[2];
;1300:				else other = teammates[1];
;1301:				ClientName(other, name, sizeof(name));
;1302:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1303:				if (bs->flagcarrier == bs->client) {
;1304:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1305:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
;1306:				}
;1307:				else {
;1308:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1309:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
;1310:				}
;1311:				BotSayTeamOrder(bs, other);
;1312:				break;
;1313:			}
;1314:			default:
;1315:			{
;1316:				//20% will defend the base
;1317:				defenders = (int) (float) numteammates * 0.2 + 0.5;
;1318:				if (defenders > 2) defenders = 2;
;1319:				//80% accompanies the flag carrier
;1320:				attackers = (int) (float) numteammates * 0.8 + 0.5;
;1321:				if (attackers > 8) attackers = 8;
;1322:				for (i = 0; i < defenders; i++) {
;1323:					//
;1324:					if (teammates[i] == bs->flagcarrier) {
;1325:						continue;
;1326:					}
;1327:					ClientName(teammates[i], name, sizeof(name));
;1328:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1329:					BotSayTeamOrder(bs, teammates[i]);
;1330:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1331:				}
;1332:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1333:				for (i = 0; i < attackers; i++) {
;1334:					//
;1335:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
;1336:						continue;
;1337:					}
;1338:					//
;1339:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1340:					if (bs->flagcarrier == bs->client) {
;1341:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1342:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
;1343:					}
;1344:					else {
;1345:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1346:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
;1347:					}
;1348:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1349:				}
;1350:				//
;1351:				break;
;1352:			}
;1353:		}
;1354:	}
;1355:}
;1356:
;1357:/*
;1358:==================
;1359:Bot1FCTFOrders_EnemyHasFlag
;1360:
;1361:  X% defend the base, Y% towards neutral flag
;1362:==================
;1363:*/
;1364:void Bot1FCTFOrders_EnemyHasFlag(bot_state_t *bs) {
;1365:	int numteammates, defenders, attackers, i;
;1366:	int teammates[MAX_CLIENTS];
;1367:	char name[MAX_NETNAME];
;1368:
;1369:	//sort team mates by travel time to base
;1370:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1371:	//sort team mates by CTF preference
;1372:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1373:	//passive strategy
;1374:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1375:		//different orders based on the number of team mates
;1376:		switch(numteammates) {
;1377:			case 1: break;
;1378:			case 2:
;1379:			{
;1380:				//both defend the base
;1381:				ClientName(teammates[0], name, sizeof(name));
;1382:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1383:				BotSayTeamOrder(bs, teammates[0]);
;1384:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1385:				//
;1386:				ClientName(teammates[1], name, sizeof(name));
;1387:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1388:				BotSayTeamOrder(bs, teammates[1]);
;1389:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1390:				break;
;1391:			}
;1392:			case 3:
;1393:			{
;1394:				//the one closest to the base will defend the base
;1395:				ClientName(teammates[0], name, sizeof(name));
;1396:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1397:				BotSayTeamOrder(bs, teammates[0]);
;1398:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1399:				//the second one closest to the base will defend the base
;1400:				ClientName(teammates[1], name, sizeof(name));
;1401:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1402:				BotSayTeamOrder(bs, teammates[1]);
;1403:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1404:				//the other will also defend the base
;1405:				ClientName(teammates[2], name, sizeof(name));
;1406:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1407:				BotSayTeamOrder(bs, teammates[2]);
;1408:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_DEFEND);
;1409:				break;
;1410:			}
;1411:			default:
;1412:			{
;1413:				//80% will defend the base
;1414:				defenders = (int) (float) numteammates * 0.8 + 0.5;
;1415:				if (defenders > 8) defenders = 8;
;1416:				//10% will try to return the flag
;1417:				attackers = (int) (float) numteammates * 0.1 + 0.5;
;1418:				if (attackers > 1) attackers = 1;
;1419:				for (i = 0; i < defenders; i++) {
;1420:					//
;1421:					ClientName(teammates[i], name, sizeof(name));
;1422:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1423:					BotSayTeamOrder(bs, teammates[i]);
;1424:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1425:				}
;1426:				for (i = 0; i < attackers; i++) {
;1427:					//
;1428:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1429:					BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
;1430:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1431:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1432:				}
;1433:				//
;1434:				break;
;1435:			}
;1436:		}
;1437:	}
;1438:	else { //agressive
;1439:		//different orders based on the number of team mates
;1440:		switch(numteammates) {
;1441:			case 1: break;
;1442:			case 2:
;1443:			{
;1444:				//the one closest to the base will defend the base
;1445:				ClientName(teammates[0], name, sizeof(name));
;1446:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1447:				BotSayTeamOrder(bs, teammates[0]);
;1448:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1449:				//the other will get the flag
;1450:				ClientName(teammates[1], name, sizeof(name));
;1451:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1452:				BotSayTeamOrder(bs, teammates[1]);
;1453:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1454:				break;
;1455:			}
;1456:			case 3:
;1457:			{
;1458:				//the one closest to the base will defend the base
;1459:				ClientName(teammates[0], name, sizeof(name));
;1460:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1461:				BotSayTeamOrder(bs, teammates[0]);
;1462:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1463:				//the others should go for the enemy flag
;1464:				ClientName(teammates[1], name, sizeof(name));
;1465:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1466:				BotSayTeamOrder(bs, teammates[1]);
;1467:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1468:				//
;1469:				ClientName(teammates[2], name, sizeof(name));
;1470:				BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
;1471:				BotSayTeamOrder(bs, teammates[2]);
;1472:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1473:				break;
;1474:			}
;1475:			default:
;1476:			{
;1477:				//70% defend the base
;1478:				defenders = (int) (float) numteammates * 0.7 + 0.5;
;1479:				if (defenders > 7) defenders = 7;
;1480:				//20% try to return the flag
;1481:				attackers = (int) (float) numteammates * 0.2 + 0.5;
;1482:				if (attackers > 2) attackers = 2;
;1483:				for (i = 0; i < defenders; i++) {
;1484:					//
;1485:					ClientName(teammates[i], name, sizeof(name));
;1486:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1487:					BotSayTeamOrder(bs, teammates[i]);
;1488:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1489:				}
;1490:				for (i = 0; i < attackers; i++) {
;1491:					//
;1492:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1493:					BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
;1494:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1495:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1496:				}
;1497:				//
;1498:				break;
;1499:			}
;1500:		}
;1501:	}
;1502:}
;1503:
;1504:/*
;1505:==================
;1506:Bot1FCTFOrders_EnemyDroppedFlag
;1507:
;1508:  X% defend the base, Y% get the flag
;1509:==================
;1510:*/
;1511:void Bot1FCTFOrders_EnemyDroppedFlag(bot_state_t *bs) {
;1512:	int numteammates, defenders, attackers, i;
;1513:	int teammates[MAX_CLIENTS];
;1514:	char name[MAX_NETNAME];
;1515:
;1516:	//sort team mates by travel time to base
;1517:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1518:	//sort team mates by CTF preference
;1519:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1520:	//passive strategy
;1521:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1522:		//different orders based on the number of team mates
;1523:		switch(numteammates) {
;1524:			case 1: break;
;1525:			case 2:
;1526:			{
;1527:				//the one closest to the base will defend the base
;1528:				ClientName(teammates[0], name, sizeof(name));
;1529:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1530:				BotSayTeamOrder(bs, teammates[0]);
;1531:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1532:				//the other will get the flag
;1533:				ClientName(teammates[1], name, sizeof(name));
;1534:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1535:				BotSayTeamOrder(bs, teammates[1]);
;1536:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1537:				break;
;1538:			}
;1539:			case 3:
;1540:			{
;1541:				//the one closest to the base will defend the base
;1542:				ClientName(teammates[0], name, sizeof(name));
;1543:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1544:				BotSayTeamOrder(bs, teammates[0]);
;1545:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1546:				//the second one closest to the base will defend the base
;1547:				ClientName(teammates[1], name, sizeof(name));
;1548:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1549:				BotSayTeamOrder(bs, teammates[1]);
;1550:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1551:				//the other will get the flag
;1552:				ClientName(teammates[2], name, sizeof(name));
;1553:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1554:				BotSayTeamOrder(bs, teammates[2]);
;1555:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1556:				break;
;1557:			}
;1558:			default:
;1559:			{
;1560:				//50% defend the base
;1561:				defenders = (int) (float) numteammates * 0.5 + 0.5;
;1562:				if (defenders > 5) defenders = 5;
;1563:				//40% get the flag
;1564:				attackers = (int) (float) numteammates * 0.4 + 0.5;
;1565:				if (attackers > 4) attackers = 4;
;1566:				for (i = 0; i < defenders; i++) {
;1567:					//
;1568:					ClientName(teammates[i], name, sizeof(name));
;1569:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1570:					BotSayTeamOrder(bs, teammates[i]);
;1571:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1572:				}
;1573:				for (i = 0; i < attackers; i++) {
;1574:					//
;1575:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1576:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1577:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1578:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1579:				}
;1580:				//
;1581:				break;
;1582:			}
;1583:		}
;1584:	}
;1585:	else { //agressive
;1586:		//different orders based on the number of team mates
;1587:		switch(numteammates) {
;1588:			case 1: break;
;1589:			case 2:
;1590:			{
;1591:				//the one closest to the base will defend the base
;1592:				ClientName(teammates[0], name, sizeof(name));
;1593:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1594:				BotSayTeamOrder(bs, teammates[0]);
;1595:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1596:				//the other will get the flag
;1597:				ClientName(teammates[1], name, sizeof(name));
;1598:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1599:				BotSayTeamOrder(bs, teammates[1]);
;1600:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1601:				break;
;1602:			}
;1603:			case 3:
;1604:			{
;1605:				//the one closest to the base will defend the base
;1606:				ClientName(teammates[0], name, sizeof(name));
;1607:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1608:				BotSayTeamOrder(bs, teammates[0]);
;1609:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1610:				//the others should go for the enemy flag
;1611:				ClientName(teammates[1], name, sizeof(name));
;1612:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1613:				BotSayTeamOrder(bs, teammates[1]);
;1614:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1615:				//
;1616:				ClientName(teammates[2], name, sizeof(name));
;1617:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1618:				BotSayTeamOrder(bs, teammates[2]);
;1619:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1620:				break;
;1621:			}
;1622:			default:
;1623:			{
;1624:				//30% defend the base
;1625:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1626:				if (defenders > 3) defenders = 3;
;1627:				//60% get the flag
;1628:				attackers = (int) (float) numteammates * 0.6 + 0.5;
;1629:				if (attackers > 6) attackers = 6;
;1630:				for (i = 0; i < defenders; i++) {
;1631:					//
;1632:					ClientName(teammates[i], name, sizeof(name));
;1633:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1634:					BotSayTeamOrder(bs, teammates[i]);
;1635:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1636:				}
;1637:				for (i = 0; i < attackers; i++) {
;1638:					//
;1639:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1640:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1641:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1642:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1643:				}
;1644:				//
;1645:				break;
;1646:			}
;1647:		}
;1648:	}
;1649:}
;1650:
;1651:/*
;1652:==================
;1653:Bot1FCTFOrders
;1654:==================
;1655:*/
;1656:void Bot1FCTFOrders(bot_state_t *bs) {
;1657:	switch(bs->neutralflagstatus) {
;1658:		case 0: Bot1FCTFOrders_FlagAtCenter(bs); break;
;1659:		case 1: Bot1FCTFOrders_TeamHasFlag(bs); break;
;1660:		case 2: Bot1FCTFOrders_EnemyHasFlag(bs); break;
;1661:		case 3: Bot1FCTFOrders_EnemyDroppedFlag(bs); break;
;1662:	}
;1663:}
;1664:
;1665:/*
;1666:==================
;1667:BotObeliskOrders
;1668:
;1669:  X% in defence Y% in offence
;1670:==================
;1671:*/
;1672:void BotObeliskOrders(bot_state_t *bs) {
;1673:	int numteammates, defenders, attackers, i;
;1674:	int teammates[MAX_CLIENTS];
;1675:	char name[MAX_NETNAME];
;1676:
;1677:	//sort team mates by travel time to base
;1678:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1679:	//sort team mates by CTF preference
;1680:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1681:	//passive strategy
;1682:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1683:		//different orders based on the number of team mates
;1684:		switch(numteammates) {
;1685:			case 1: break;
;1686:			case 2:
;1687:			{
;1688:				//the one closest to the base will defend the base
;1689:				ClientName(teammates[0], name, sizeof(name));
;1690:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1691:				BotSayTeamOrder(bs, teammates[0]);
;1692:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1693:				//the other will attack the enemy base
;1694:				ClientName(teammates[1], name, sizeof(name));
;1695:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1696:				BotSayTeamOrder(bs, teammates[1]);
;1697:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1698:				break;
;1699:			}
;1700:			case 3:
;1701:			{
;1702:				//the one closest to the base will defend the base
;1703:				ClientName(teammates[0], name, sizeof(name));
;1704:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1705:				BotSayTeamOrder(bs, teammates[0]);
;1706:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1707:				//the one second closest to the base also defends the base
;1708:				ClientName(teammates[1], name, sizeof(name));
;1709:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1710:				BotSayTeamOrder(bs, teammates[1]);
;1711:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1712:				//the other one attacks the enemy base
;1713:				ClientName(teammates[2], name, sizeof(name));
;1714:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1715:				BotSayTeamOrder(bs, teammates[2]);
;1716:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1717:				break;
;1718:			}
;1719:			default:
;1720:			{
;1721:				//50% defend the base
;1722:				defenders = (int) (float) numteammates * 0.5 + 0.5;
;1723:				if (defenders > 5) defenders = 5;
;1724:				//40% attack the enemy base
;1725:				attackers = (int) (float) numteammates * 0.4 + 0.5;
;1726:				if (attackers > 4) attackers = 4;
;1727:				for (i = 0; i < defenders; i++) {
;1728:					//
;1729:					ClientName(teammates[i], name, sizeof(name));
;1730:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1731:					BotSayTeamOrder(bs, teammates[i]);
;1732:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1733:				}
;1734:				for (i = 0; i < attackers; i++) {
;1735:					//
;1736:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1737:					BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1738:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1739:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1740:				}
;1741:				//
;1742:				break;
;1743:			}
;1744:		}
;1745:	}
;1746:	else {
;1747:		//different orders based on the number of team mates
;1748:		switch(numteammates) {
;1749:			case 1: break;
;1750:			case 2:
;1751:			{
;1752:				//the one closest to the base will defend the base
;1753:				ClientName(teammates[0], name, sizeof(name));
;1754:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1755:				BotSayTeamOrder(bs, teammates[0]);
;1756:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1757:				//the other will attack the enemy base
;1758:				ClientName(teammates[1], name, sizeof(name));
;1759:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1760:				BotSayTeamOrder(bs, teammates[1]);
;1761:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1762:				break;
;1763:			}
;1764:			case 3:
;1765:			{
;1766:				//the one closest to the base will defend the base
;1767:				ClientName(teammates[0], name, sizeof(name));
;1768:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1769:				BotSayTeamOrder(bs, teammates[0]);
;1770:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1771:				//the others attack the enemy base
;1772:				ClientName(teammates[1], name, sizeof(name));
;1773:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1774:				BotSayTeamOrder(bs, teammates[1]);
;1775:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1776:				//
;1777:				ClientName(teammates[2], name, sizeof(name));
;1778:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1779:				BotSayTeamOrder(bs, teammates[2]);
;1780:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1781:				break;
;1782:			}
;1783:			default:
;1784:			{
;1785:				//30% defend the base
;1786:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1787:				if (defenders > 3) defenders = 3;
;1788:				//70% attack the enemy base
;1789:				attackers = (int) (float) numteammates * 0.7 + 0.5;
;1790:				if (attackers > 7) attackers = 7;
;1791:				for (i = 0; i < defenders; i++) {
;1792:					//
;1793:					ClientName(teammates[i], name, sizeof(name));
;1794:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1795:					BotSayTeamOrder(bs, teammates[i]);
;1796:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1797:				}
;1798:				for (i = 0; i < attackers; i++) {
;1799:					//
;1800:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1801:					BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1802:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1803:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1804:				}
;1805:				//
;1806:				break;
;1807:			}
;1808:		}
;1809:	}
;1810:}
;1811:
;1812:/*
;1813:==================
;1814:BotHarvesterOrders
;1815:
;1816:  X% defend the base, Y% harvest
;1817:==================
;1818:*/
;1819:void BotHarvesterOrders(bot_state_t *bs) {
;1820:	int numteammates, defenders, attackers, i;
;1821:	int teammates[MAX_CLIENTS];
;1822:	char name[MAX_NETNAME];
;1823:
;1824:	memset( teammates, 0, sizeof( teammates ) );
;1825:	//sort team mates by travel time to base
;1826:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1827:	//sort team mates by CTF preference
;1828:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1829:	//passive strategy
;1830:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1831:		//different orders based on the number of team mates
;1832:		switch(numteammates) {
;1833:			case 1: break;
;1834:			case 2:
;1835:			{
;1836:				//the one closest to the base will defend the base
;1837:				ClientName(teammates[0], name, sizeof(name));
;1838:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1839:				BotSayTeamOrder(bs, teammates[0]);
;1840:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1841:				//the other will harvest
;1842:				ClientName(teammates[1], name, sizeof(name));
;1843:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1844:				BotSayTeamOrder(bs, teammates[1]);
;1845:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1846:				break;
;1847:			}
;1848:			case 3:
;1849:			{
;1850:				//the one closest to the base will defend the base
;1851:				ClientName(teammates[0], name, sizeof(name));
;1852:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1853:				BotSayTeamOrder(bs, teammates[0]);
;1854:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1855:				//the one second closest to the base also defends the base
;1856:				ClientName(teammates[1], name, sizeof(name));
;1857:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1858:				BotSayTeamOrder(bs, teammates[1]);
;1859:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1860:				//the other one goes harvesting
;1861:				ClientName(teammates[2], name, sizeof(name));
;1862:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1863:				BotSayTeamOrder(bs, teammates[2]);
;1864:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1865:				break;
;1866:			}
;1867:			default:
;1868:			{
;1869:				//50% defend the base
;1870:				defenders = (int) (float) numteammates * 0.5 + 0.5;
;1871:				if (defenders > 5) defenders = 5;
;1872:				//40% goes harvesting
;1873:				attackers = (int) (float) numteammates * 0.4 + 0.5;
;1874:				if (attackers > 4) attackers = 4;
;1875:				for (i = 0; i < defenders; i++) {
;1876:					//
;1877:					ClientName(teammates[i], name, sizeof(name));
;1878:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1879:					BotSayTeamOrder(bs, teammates[i]);
;1880:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1881:				}
;1882:				for (i = 0; i < attackers; i++) {
;1883:					//
;1884:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1885:					BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1886:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1887:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1888:				}
;1889:				//
;1890:				break;
;1891:			}
;1892:		}
;1893:	}
;1894:	else {
;1895:		//different orders based on the number of team mates
;1896:		switch(numteammates) {
;1897:			case 1: break;
;1898:			case 2:
;1899:			{
;1900:				//the one closest to the base will defend the base
;1901:				ClientName(teammates[0], name, sizeof(name));
;1902:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1903:				BotSayTeamOrder(bs, teammates[0]);
;1904:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1905:				//the other will harvest
;1906:				ClientName(teammates[1], name, sizeof(name));
;1907:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1908:				BotSayTeamOrder(bs, teammates[1]);
;1909:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1910:				break;
;1911:			}
;1912:			case 3:
;1913:			{
;1914:				//the one closest to the base will defend the base
;1915:				ClientName(teammates[0], name, sizeof(name));
;1916:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1917:				BotSayTeamOrder(bs, teammates[0]);
;1918:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1919:				//the others go harvesting
;1920:				ClientName(teammates[1], name, sizeof(name));
;1921:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1922:				BotSayTeamOrder(bs, teammates[1]);
;1923:				BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1924:				//
;1925:				ClientName(teammates[2], name, sizeof(name));
;1926:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1927:				BotSayTeamOrder(bs, teammates[2]);
;1928:				BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1929:				break;
;1930:			}
;1931:			default:
;1932:			{
;1933:				//30% defend the base
;1934:				defenders = (int) (float) numteammates * 0.3 + 0.5;
;1935:				if (defenders > 3) defenders = 3;
;1936:				//70% go harvesting
;1937:				attackers = (int) (float) numteammates * 0.7 + 0.5;
;1938:				if (attackers > 7) attackers = 7;
;1939:				for (i = 0; i < defenders; i++) {
;1940:					//
;1941:					ClientName(teammates[i], name, sizeof(name));
;1942:					BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1943:					BotSayTeamOrder(bs, teammates[i]);
;1944:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1945:				}
;1946:				for (i = 0; i < attackers; i++) {
;1947:					//
;1948:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1949:					BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1950:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1951:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1952:				}
;1953:				//
;1954:				break;
;1955:			}
;1956:		}
;1957:	}
;1958:}
;1959:#endif
;1960:
;1961:/*
;1962:==================
;1963:FindHumanTeamLeader
;1964:==================
;1965:*/
;1966:int FindHumanTeamLeader(bot_state_t *bs) {
line 1969
;1967:	int i;
;1968:
;1969:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $396
line 1970
;1970:		if ( g_entities[i].inuse ) {
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $400
line 1972
;1971:			// if this player is not a bot
;1972:			if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
ADDRLP4 0
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $403
line 1974
;1973:				// if this player is ok with being the leader
;1974:				if (!notleader[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
INDIRI4
CNSTI4 0
NEI4 $407
line 1976
;1975:					// if this player is on the same team
;1976:					if ( BotSameTeam(bs, i) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $409
line 1977
;1977:						ClientName(i, bs->teamleader, sizeof(bs->teamleader));
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1979
;1978:						// if not yet ordered to do anything
;1979:						if ( !BotSetLastOrderedTask(bs) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $411
line 1981
;1980:							// go on defense by default
;1981:							BotVoiceChat_Defend(bs, i, SAY_TELL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 BotVoiceChat_Defend
CALLV
pop
line 1982
;1982:						}
LABELV $411
line 1983
;1983:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $395
JUMPV
LABELV $409
line 1985
;1984:					}
;1985:				}
LABELV $407
line 1986
;1986:			}
LABELV $403
line 1987
;1987:		}
LABELV $400
line 1988
;1988:	}
LABELV $397
line 1969
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $396
line 1989
;1989:	return qfalse;
CNSTI4 0
RETI4
LABELV $395
endproc FindHumanTeamLeader 12 12
export BotTeamAI
proc BotTeamAI 68 12
line 1997
;1990:}
;1991:
;1992:/*
;1993:==================
;1994:BotTeamAI
;1995:==================
;1996:*/
;1997:void BotTeamAI(bot_state_t *bs) {
line 2002
;1998:	int numteammates;
;1999:	char netname[MAX_NETNAME];
;2000:
;2001:	//
;2002:	if ( gametype < GT_TEAM  )
ADDRGP4 gametype
INDIRI4
CNSTI4 3
GEI4 $414
line 2003
;2003:		return;
ADDRGP4 $413
JUMPV
LABELV $414
line 2005
;2004:	// make sure we've got a valid team leader
;2005:	if (!BotValidTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotValidTeamLeader
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $416
line 2007
;2006:		//
;2007:		if (!FindHumanTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 FindHumanTeamLeader
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $418
line 2009
;2008:			//
;2009:			if (!bs->askteamleader_time && !bs->becometeamleader_time) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
CNSTF4 0
NEF4 $420
ADDRLP4 48
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
CNSTF4 0
NEF4 $420
line 2010
;2010:				if (bs->entergame_time + 10 > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ADDRGP4 floattime
INDIRF4
LEF4 $422
line 2011
;2011:					bs->askteamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 966787392
MULF4
ADDF4
ASGNF4
line 2012
;2012:				}
ADDRGP4 $423
JUMPV
LABELV $422
line 2013
;2013:				else {
line 2014
;2014:					bs->becometeamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 966787392
MULF4
ADDF4
ASGNF4
line 2015
;2015:				}
LABELV $423
line 2016
;2016:			}
LABELV $420
line 2017
;2017:			if (bs->askteamleader_time && bs->askteamleader_time < FloatTime()) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
CNSTF4 0
EQF4 $424
ADDRLP4 52
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $424
line 2019
;2018:				// if asked for a team leader and no response
;2019:				BotAI_BotInitialChat(bs, "whoisteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2020
;2020:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 2021
;2021:				bs->askteamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
CNSTF4 0
ASGNF4
line 2022
;2022:				bs->becometeamleader_time = FloatTime() + 8 + random() * 10;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
ADDF4
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 966787392
MULF4
ADDF4
ASGNF4
line 2023
;2023:			}
LABELV $424
line 2024
;2024:			if (bs->becometeamleader_time && bs->becometeamleader_time < FloatTime()) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
CNSTF4 0
EQF4 $413
ADDRLP4 56
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $413
line 2025
;2025:				BotAI_BotInitialChat(bs, "iamteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $429
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2026
;2026:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 2030
;2027:#ifdef MISSIONPACK
;2028:				BotSayVoiceTeamOrder(bs, -1, VOICECHAT_STARTLEADER);
;2029:#endif
;2030:				ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2031
;2031:				Q_strncpyz( bs->teamleader, netname, sizeof( bs->teamleader ) );
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2032
;2032:				bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
CNSTF4 0
ASGNF4
line 2033
;2033:			}
line 2034
;2034:			return;
ADDRGP4 $413
JUMPV
LABELV $418
line 2036
;2035:		}
;2036:	}
LABELV $416
line 2037
;2037:	bs->askteamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
CNSTF4 0
ASGNF4
line 2038
;2038:	bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
CNSTF4 0
ASGNF4
line 2041
;2039:
;2040:	//return if this bot is NOT the team leader
;2041:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2042
;2042:	if (Q_stricmp(netname, bs->teamleader) != 0) return;
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $430
ADDRGP4 $413
JUMPV
LABELV $430
line 2044
;2043:	//
;2044:	numteammates = BotNumTeamMates(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotNumTeamMates
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 48
INDIRI4
ASGNI4
line 2046
;2045:	//give orders
;2046:	switch(gametype) {
ADDRLP4 52
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 3
EQI4 $434
ADDRLP4 52
INDIRI4
CNSTI4 4
EQI4 $440
ADDRGP4 $432
JUMPV
LABELV $434
line 2048
;2047:		case GT_TEAM:
;2048:		{
line 2049
;2049:			if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $437
ADDRLP4 56
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $435
LABELV $437
line 2050
;2050:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2051
;2051:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2052
;2052:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 2053
;2053:			}
LABELV $435
line 2055
;2054:			//if it's time to give orders
;2055:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
CNSTF4 0
EQF4 $433
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $433
line 2056
;2056:				BotTeamOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamOrders
CALLV
pop
line 2058
;2057:				//give orders again after 120 seconds
;2058:				bs->teamgiveorders_time = FloatTime() + 120;
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 2059
;2059:			}
line 2060
;2060:			break;
ADDRGP4 $433
JUMPV
LABELV $440
line 2063
;2061:		}
;2062:		case GT_CTF:
;2063:		{
line 2066
;2064:			//if the number of team mates changed or the flag status changed
;2065:			//or someone wants to know what to do
;2066:			if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $444
ADDRLP4 56
INDIRP4
CNSTI4 6968
ADDP4
INDIRI4
CNSTI4 0
NEI4 $444
ADDRLP4 56
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $441
LABELV $444
line 2067
;2067:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2068
;2068:				bs->numteammates = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2069
;2069:				bs->flagstatuschanged = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 0
ASGNI4
line 2070
;2070:				bs->forceorders = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 2071
;2071:			}
LABELV $441
line 2073
;2072:			//if there were no flag captures the last 3 minutes
;2073:			if (bs->lastflagcapture_time < FloatTime() - 240) {
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1131413504
SUBF4
GEF4 $445
line 2074
;2074:				bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2076
;2075:				//randomly change the CTF strategy
;2076:				if (random() < 0.4) {
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1053609165
GEF4 $447
line 2077
;2077:					bs->ctfstrategy ^= CTFS_AGRESSIVE;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2078
;2078:					bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2079
;2079:				}
LABELV $447
line 2080
;2080:			}
LABELV $445
line 2082
;2081:			//if it's time to give orders
;2082:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 3) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
CNSTF4 0
EQF4 $433
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
GEF4 $433
line 2083
;2083:				BotCTFOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders
CALLV
pop
line 2085
;2084:				//
;2085:				bs->teamgiveorders_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
CNSTF4 0
ASGNF4
line 2086
;2086:			}
line 2087
;2087:			break;
LABELV $432
LABELV $433
line 2147
;2088:		}
;2089:#ifdef MISSIONPACK
;2090:		case GT_1FCTF:
;2091:		{
;2092:			if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
;2093:				bs->teamgiveorders_time = FloatTime();
;2094:				bs->numteammates = numteammates;
;2095:				bs->flagstatuschanged = qfalse;
;2096:				bs->forceorders = qfalse;
;2097:			}
;2098:			//if there were no flag captures the last 4 minutes
;2099:			if (bs->lastflagcapture_time < FloatTime() - 240) {
;2100:				bs->lastflagcapture_time = FloatTime();
;2101:				//randomly change the CTF strategy
;2102:				if (random() < 0.4) {
;2103:					bs->ctfstrategy ^= CTFS_AGRESSIVE;
;2104:					bs->teamgiveorders_time = FloatTime();
;2105:				}
;2106:			}
;2107:			//if it's time to give orders
;2108:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 2) {
;2109:				Bot1FCTFOrders(bs);
;2110:				//
;2111:				bs->teamgiveorders_time = 0;
;2112:			}
;2113:			break;
;2114:		}
;2115:		case GT_OBELISK:
;2116:		{
;2117:			if (bs->numteammates != numteammates || bs->forceorders) {
;2118:				bs->teamgiveorders_time = FloatTime();
;2119:				bs->numteammates = numteammates;
;2120:				bs->forceorders = qfalse;
;2121:			}
;2122:			//if it's time to give orders
;2123:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
;2124:				BotObeliskOrders(bs);
;2125:				//give orders again after 30 seconds
;2126:				bs->teamgiveorders_time = FloatTime() + 30;
;2127:			}
;2128:			break;
;2129:		}
;2130:		case GT_HARVESTER:
;2131:		{
;2132:			if (bs->numteammates != numteammates || bs->forceorders) {
;2133:				bs->teamgiveorders_time = FloatTime();
;2134:				bs->numteammates = numteammates;
;2135:				bs->forceorders = qfalse;
;2136:			}
;2137:			//if it's time to give orders
;2138:			if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
;2139:				BotHarvesterOrders(bs);
;2140:				//give orders again after 30 seconds
;2141:				bs->teamgiveorders_time = FloatTime() + 30;
;2142:			}
;2143:			break;
;2144:		}
;2145:#endif
;2146:	}
;2147:}
LABELV $413
endproc BotTeamAI 68 12
bss
export ctftaskpreferences
align 4
LABELV ctftaskpreferences
skip 2560
import BotVoiceChat_Defend
import BotVoiceChatCommand
import BotDumpNodeSwitches
import BotResetNodeSwitches
import AINode_Battle_NBG
import AINode_Battle_Retreat
import AINode_Battle_Chase
import AINode_Battle_Fight
import AINode_Seek_LTG
import AINode_Seek_NBG
import AINode_Seek_ActivateEntity
import AINode_Stand
import AINode_Respawn
import AINode_Observer
import AINode_Intermission
import AIEnter_Battle_NBG
import AIEnter_Battle_Retreat
import AIEnter_Battle_Chase
import AIEnter_Battle_Fight
import AIEnter_Seek_Camp
import AIEnter_Seek_LTG
import AIEnter_Seek_NBG
import AIEnter_Seek_ActivateEntity
import AIEnter_Stand
import AIEnter_Respawn
import AIEnter_Observer
import AIEnter_Intermission
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
import ctf_blueflag
import ctf_redflag
import bot_challenge
import bot_testrchat
import bot_nochat
import bot_fastchat
import bot_rocketjump
import bot_grapple
import mapname
import gametype
import BotTeamSeekGoals
import BotMapScripts
import BotPointAreaNum
import ClientOnSameTeamFromName
import ClientFromName
import stristr
import BotFindWayPoint
import BotCreateWayPoint
import BotAlternateRoute
import BotGetAlternateRouteGoal
import BotCTFRetreatGoals
import BotCTFSeekGoals
import BotRememberLastOrderedTask
import BotCTFCarryingFlag
import BotOppositeTeam
import BotTeam
import BotClearActivateGoalStack
import BotPopFromActivateGoalStack
import BotEnableActivateGoalAreas
import BotAIPredictObstacles
import BotAIBlocked
import BotCheckAttack
import BotAimAtEnemy
import BotEntityVisible
import BotRoamGoal
import BotFindEnemy
import InFieldOfVision
import BotVisibleTeamMatesAndEnemies
import BotEnemyFlagCarrierVisible
import BotTeamFlagCarrierVisible
import BotTeamFlagCarrier
import TeamPlayIsOn
import BotSameTeam
import BotAttackMove
import BotWantsToCamp
import BotHasPersistantPowerupAndWeapon
import BotCanAndWantsToRocketJump
import BotWantsToHelp
import BotWantsToChase
import BotWantsToRetreat
import BotFeelingBad
import BotAggression
import BotTeamGoals
import BotSetLastOrderedTask
import BotSynonymContext
import ClientSkin
import EasyClientName
import ClientName
import BotSetTeamStatus
import EntityIsShooting
import EntityIsInvisible
import EntityIsDead
import BotInLavaOrSlime
import BotIntermission
import BotIsObserver
import BotIsDead
import BotBattleUseItems
import BotUpdateBattleInventory
import BotUpdateInventory
import BotSetupForMovement
import BotChooseWeapon
import BotFreeWaypoints
import BotDeathmatchAI
import BotShutdownDeathmatchAI
import BotSetupDeathmatchAI
import BotTeamLeader
import BotAI_GetSnapshotEntity
import BotAI_GetEntityState
import BotAI_GetClientState
import BotAI_Trace
import BotAI_BotInitialChat
import BotAI_Print
import floattime
import BotEntityInfo
import NumBots
import BotResetState
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
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
LABELV $429
byte 1 105
byte 1 97
byte 1 109
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $426
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $131
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $72
byte 1 116
byte 1 0
align 1
LABELV $68
byte 1 110
byte 1 0
