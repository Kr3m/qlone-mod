code
proc BotSetUserInfo 1024 12
file "../../../../code/game/ai_dmq3.c"
line 98
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_dmq3.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_dmq3.c $
;10: *
;11: *****************************************************************************/
;12:
;13:
;14:#include "g_local.h"
;15:#include "botlib.h"
;16:#include "be_aas.h"
;17:#include "be_ea.h"
;18:#include "be_ai_char.h"
;19:#include "be_ai_chat.h"
;20:#include "be_ai_gen.h"
;21:#include "be_ai_goal.h"
;22:#include "be_ai_move.h"
;23:#include "be_ai_weap.h"
;24://
;25:#include "ai_main.h"
;26:#include "ai_dmq3.h"
;27:#include "ai_chat.h"
;28:#include "ai_cmd.h"
;29:#include "ai_dmnet.h"
;30:#include "ai_team.h"
;31://
;32:#include "chars.h"				//characteristics
;33:#include "inv.h"				//indexes into the inventory
;34:#include "syn.h"				//synonyms
;35:#include "match.h"				//string matching types and vars
;36:
;37:// for the voice chats
;38:#ifdef MISSIONPACK
;39:#include "../../ui/menudef.h" // sos001205 - for q3_ui also
;40:#endif
;41:
;42:// from aasfile.h
;43:#define AREACONTENTS_MOVER				1024
;44:#define AREACONTENTS_MODELNUMSHIFT		24
;45:#define AREACONTENTS_MAXMODELNUM		0xFF
;46:#define AREACONTENTS_MODELNUM			(AREACONTENTS_MAXMODELNUM << AREACONTENTS_MODELNUMSHIFT)
;47:
;48:#define IDEAL_ATTACKDIST			140
;49:
;50:#define MAX_WAYPOINTS		128
;51://
;52:bot_waypoint_t botai_waypoints[MAX_WAYPOINTS];
;53:bot_waypoint_t *botai_freewaypoints;
;54:
;55://NOTE: not using a cvars which can be updated because the game should be reloaded anyway
;56:int gametype;		//game type
;57://int maxclients;	//maximum number of clients
;58:
;59:vmCvar_t bot_grapple;
;60:vmCvar_t bot_rocketjump;
;61:vmCvar_t bot_fastchat;
;62:vmCvar_t bot_nochat;
;63:vmCvar_t bot_testrchat;
;64:vmCvar_t bot_challenge;
;65:vmCvar_t bot_predictobstacles;
;66:vmCvar_t g_spSkill;
;67:
;68:extern vmCvar_t bot_developer;
;69:
;70:vec3_t lastteleport_origin;		//last teleport event origin
;71:float lastteleport_time;		//last teleport event time
;72:int max_bspmodelindex;			//maximum BSP model index
;73:
;74://CTF flag goals
;75:bot_goal_t ctf_redflag;
;76:bot_goal_t ctf_blueflag;
;77:#ifdef MISSIONPACK
;78:bot_goal_t ctf_neutralflag;
;79:bot_goal_t redobelisk;
;80:bot_goal_t blueobelisk;
;81:bot_goal_t neutralobelisk;
;82:#endif
;83:
;84:#define MAX_ALTROUTEGOALS		32
;85:
;86:int altroutegoals_setup;
;87:aas_altroutegoal_t red_altroutegoals[MAX_ALTROUTEGOALS];
;88:int red_numaltroutegoals;
;89:aas_altroutegoal_t blue_altroutegoals[MAX_ALTROUTEGOALS];
;90:int blue_numaltroutegoals;
;91:
;92:
;93:/*
;94:==================
;95:BotSetUserInfo
;96:==================
;97:*/
;98:static void BotSetUserInfo( bot_state_t *bs, const char *key, const char *value ) {
line 101
;99:	char userinfo[MAX_INFO_STRING];
;100:
;101:	trap_GetUserinfo( bs->client, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 102
;102:	Info_SetValueForKey( userinfo, key, value );
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 103
;103:	trap_SetUserinfo( bs->client, userinfo );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 104
;104:	ClientUserinfoChanged( bs->client );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 105
;105:}
LABELV $55
endproc BotSetUserInfo 1024 12
export BotCTFCarryingFlag
proc BotCTFCarryingFlag 0 0
line 113
;106:
;107:
;108:/*
;109:==================
;110:BotCTFCarryingFlag
;111:==================
;112:*/
;113:int BotCTFCarryingFlag(bot_state_t *bs) {
line 114
;114:	if (gametype != GT_CTF) return CTF_FLAG_NONE;
ADDRGP4 gametype
INDIRI4
CNSTI4 4
EQI4 $57
CNSTI4 0
RETI4
ADDRGP4 $56
JUMPV
LABELV $57
line 116
;115:
;116:	if (bs->inventory[INVENTORY_REDFLAG] > 0) return CTF_FLAG_RED;
ADDRFP4 0
INDIRP4
CNSTI4 5132
ADDP4
INDIRI4
CNSTI4 0
LEI4 $59
CNSTI4 1
RETI4
ADDRGP4 $56
JUMPV
LABELV $59
line 117
;117:	else if (bs->inventory[INVENTORY_BLUEFLAG] > 0) return CTF_FLAG_BLUE;
ADDRFP4 0
INDIRP4
CNSTI4 5136
ADDP4
INDIRI4
CNSTI4 0
LEI4 $61
CNSTI4 2
RETI4
ADDRGP4 $56
JUMPV
LABELV $61
line 118
;118:	return CTF_FLAG_NONE;
CNSTI4 0
RETI4
LABELV $56
endproc BotCTFCarryingFlag 0 0
export BotTeam
proc BotTeam 1044 12
line 126
;119:}
;120:
;121:/*
;122:==================
;123:BotTeam
;124:==================
;125:*/
;126:int BotTeam(bot_state_t *bs) {
line 129
;127:	char info[1024];
;128:
;129:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
LTI4 $66
ADDRLP4 1024
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
LTI4 $64
LABELV $66
line 131
;130:		//BotAI_Print(PRT_ERROR, "BotCTFTeam: client out of range\n");
;131:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $63
JUMPV
LABELV $64
line 133
;132:	}
;133:	trap_GetConfigstring(CS_PLAYERS+bs->client, info, sizeof(info));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
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
line 135
;134:	//
;135:	if (atoi(Info_ValueForKey(info, "t")) == TEAM_RED) return TEAM_RED;
ADDRLP4 0
ARGP4
ADDRGP4 $69
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
NEI4 $67
CNSTI4 1
RETI4
ADDRGP4 $63
JUMPV
LABELV $67
line 136
;136:	else if (atoi(Info_ValueForKey(info, "t")) == TEAM_BLUE) return TEAM_BLUE;
ADDRLP4 0
ARGP4
ADDRGP4 $69
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
CNSTI4 2
NEI4 $70
CNSTI4 2
RETI4
ADDRGP4 $63
JUMPV
LABELV $70
line 137
;137:	return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $63
endproc BotTeam 1044 12
export BotOppositeTeam
proc BotOppositeTeam 12 4
line 145
;138:}
;139:
;140:/*
;141:==================
;142:BotOppositeTeam
;143:==================
;144:*/
;145:int BotOppositeTeam(bot_state_t *bs) {
line 146
;146:	switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $76
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $77
ADDRGP4 $73
JUMPV
LABELV $76
line 147
;147:		case TEAM_RED: return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $72
JUMPV
LABELV $77
line 148
;148:		case TEAM_BLUE: return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $72
JUMPV
LABELV $73
line 149
;149:		default: return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $72
endproc BotOppositeTeam 12 4
export BotEnemyFlag
proc BotEnemyFlag 4 4
line 158
;150:	}
;151:}
;152:
;153:/*
;154:==================
;155:BotEnemyFlag
;156:==================
;157:*/
;158:bot_goal_t *BotEnemyFlag(bot_state_t *bs) {
line 159
;159:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $79
line 160
;160:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
ADDRGP4 $78
JUMPV
LABELV $79
line 162
;161:	}
;162:	else {
line 163
;163:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
LABELV $78
endproc BotEnemyFlag 4 4
export BotTeamFlag
proc BotTeamFlag 4 4
line 172
;164:	}
;165:}
;166:
;167:/*
;168:==================
;169:BotTeamFlag
;170:==================
;171:*/
;172:bot_goal_t *BotTeamFlag(bot_state_t *bs) {
line 173
;173:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $82
line 174
;174:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
ADDRGP4 $81
JUMPV
LABELV $82
line 176
;175:	}
;176:	else {
line 177
;177:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
LABELV $81
endproc BotTeamFlag 4 4
export EntityIsDead
proc EntityIsDead 472 8
line 187
;178:	}
;179:}
;180:
;181:
;182:/*
;183:==================
;184:EntityIsDead
;185:==================
;186:*/
;187:qboolean EntityIsDead(aas_entityinfo_t *entinfo) {
line 190
;188:	playerState_t ps;
;189:
;190:	if (entinfo->number >= 0 && entinfo->number < MAX_CLIENTS) {
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
LTI4 $85
ADDRLP4 468
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 64
GEI4 $85
line 192
;191:		//retrieve the current client state
;192:		BotAI_GetClientState( entinfo->number, &ps );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 193
;193:		if (ps.pm_type != PM_NORMAL) return qtrue;
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $87
CNSTI4 1
RETI4
ADDRGP4 $84
JUMPV
LABELV $87
line 194
;194:	}
LABELV $85
line 195
;195:	return qfalse;
CNSTI4 0
RETI4
LABELV $84
endproc EntityIsDead 472 8
export EntityCarriesFlag
proc EntityCarriesFlag 0 0
line 203
;196:}
;197:
;198:/*
;199:==================
;200:EntityCarriesFlag
;201:==================
;202:*/
;203:qboolean EntityCarriesFlag(aas_entityinfo_t *entinfo) {
line 204
;204:	if ( entinfo->powerups & ( 1 << PW_REDFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $91
line 205
;205:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $90
JUMPV
LABELV $91
line 206
;206:	if ( entinfo->powerups & ( 1 << PW_BLUEFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $93
line 207
;207:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $90
JUMPV
LABELV $93
line 212
;208:#ifdef MISSIONPACK
;209:	if ( entinfo->powerups & ( 1 << PW_NEUTRALFLAG ) )
;210:		return qtrue;
;211:#endif
;212:	return qfalse;
CNSTI4 0
RETI4
LABELV $90
endproc EntityCarriesFlag 0 0
export EntityIsInvisible
proc EntityIsInvisible 4 4
line 220
;213:}
;214:
;215:/*
;216:==================
;217:EntityIsInvisible
;218:==================
;219:*/
;220:qboolean EntityIsInvisible(aas_entityinfo_t *entinfo) {
line 222
;221:	// the flag is always visible
;222:	if (EntityCarriesFlag(entinfo)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $96
line 223
;223:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $95
JUMPV
LABELV $96
line 225
;224:	}
;225:	if (entinfo->powerups & (1 << PW_INVIS)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $98
line 226
;226:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $95
JUMPV
LABELV $98
line 228
;227:	}
;228:	return qfalse;
CNSTI4 0
RETI4
LABELV $95
endproc EntityIsInvisible 4 4
export EntityIsShooting
proc EntityIsShooting 0 0
line 236
;229:}
;230:
;231:/*
;232:==================
;233:EntityIsShooting
;234:==================
;235:*/
;236:qboolean EntityIsShooting(aas_entityinfo_t *entinfo) {
line 237
;237:	if (entinfo->flags & EF_FIRING) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $101
line 238
;238:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $100
JUMPV
LABELV $101
line 240
;239:	}
;240:	return qfalse;
CNSTI4 0
RETI4
LABELV $100
endproc EntityIsShooting 0 0
export EntityIsChatting
proc EntityIsChatting 0 0
line 248
;241:}
;242:
;243:/*
;244:==================
;245:EntityIsChatting
;246:==================
;247:*/
;248:qboolean EntityIsChatting(aas_entityinfo_t *entinfo) {
line 249
;249:	if (entinfo->flags & EF_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $104
line 250
;250:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $103
JUMPV
LABELV $104
line 252
;251:	}
;252:	return qfalse;
CNSTI4 0
RETI4
LABELV $103
endproc EntityIsChatting 0 0
export EntityHasQuad
proc EntityHasQuad 0 0
line 260
;253:}
;254:
;255:/*
;256:==================
;257:EntityHasQuad
;258:==================
;259:*/
;260:qboolean EntityHasQuad(aas_entityinfo_t *entinfo) {
line 261
;261:	if (entinfo->powerups & (1 << PW_QUAD)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $107
line 262
;262:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $106
JUMPV
LABELV $107
line 264
;263:	}
;264:	return qfalse;
CNSTI4 0
RETI4
LABELV $106
endproc EntityHasQuad 0 0
export BotRememberLastOrderedTask
proc BotRememberLastOrderedTask 16 12
line 328
;265:}
;266:
;267:#ifdef MISSIONPACK
;268:/*
;269:==================
;270:EntityHasKamikze
;271:==================
;272:*/
;273:qboolean EntityHasKamikaze(aas_entityinfo_t *entinfo) {
;274:	if (entinfo->flags & EF_KAMIKAZE) {
;275:		return qtrue;
;276:	}
;277:	return qfalse;
;278:}
;279:
;280:/*
;281:==================
;282:EntityCarriesCubes
;283:==================
;284:*/
;285:qboolean EntityCarriesCubes(aas_entityinfo_t *entinfo) {
;286:	entityState_t state;
;287:
;288:	if (gametype != GT_HARVESTER)
;289:		return qfalse;
;290:	//FIXME: get this info from the aas_entityinfo_t ?
;291:	BotAI_GetEntityState(entinfo->number, &state);
;292:	if (state.generic1 > 0)
;293:		return qtrue;
;294:	return qfalse;
;295:}
;296:
;297:/*
;298:==================
;299:Bot1FCTFCarryingFlag
;300:==================
;301:*/
;302:int Bot1FCTFCarryingFlag(bot_state_t *bs) {
;303:	if (gametype != GT_1FCTF) return qfalse;
;304:
;305:	if (bs->inventory[INVENTORY_NEUTRALFLAG] > 0) return qtrue;
;306:	return qfalse;
;307:}
;308:
;309:/*
;310:==================
;311:BotHarvesterCarryingCubes
;312:==================
;313:*/
;314:int BotHarvesterCarryingCubes(bot_state_t *bs) {
;315:	if (gametype != GT_HARVESTER) return qfalse;
;316:
;317:	if (bs->inventory[INVENTORY_REDCUBE] > 0) return qtrue;
;318:	if (bs->inventory[INVENTORY_BLUECUBE] > 0) return qtrue;
;319:	return qfalse;
;320:}
;321:#endif
;322:
;323:/*
;324:==================
;325:BotRememberLastOrderedTask
;326:==================
;327:*/
;328:void BotRememberLastOrderedTask(bot_state_t *bs) {
line 329
;329:	if (!bs->ordered) {
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $110
line 330
;330:		return;
ADDRGP4 $109
JUMPV
LABELV $110
line 332
;331:	}
;332:	bs->lastgoal_decisionmaker = bs->decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ASGNI4
line 333
;333:	bs->lastgoal_ltgtype = bs->ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
line 334
;334:	memcpy(&bs->lastgoal_teamgoal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 335
;335:	bs->lastgoal_teammate = bs->teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ASGNI4
line 336
;336:}
LABELV $109
endproc BotRememberLastOrderedTask 16 12
export BotSetTeamStatus
proc BotSetTeamStatus 0 0
line 343
;337:
;338:/*
;339:==================
;340:BotSetTeamStatus
;341:==================
;342:*/
;343:void BotSetTeamStatus(bot_state_t *bs) {
line 405
;344:#ifdef MISSIONPACK
;345:	int teamtask;
;346:	aas_entityinfo_t entinfo;
;347:
;348:	teamtask = TEAMTASK_PATROL;
;349:
;350:	switch(bs->ltgtype) {
;351:		case LTG_TEAMHELP:
;352:			break;
;353:		case LTG_TEAMACCOMPANY:
;354:			BotEntityInfo(bs->teammate, &entinfo);
;355:			if ( ( (gametype == GT_CTF || gametype == GT_1FCTF) && EntityCarriesFlag(&entinfo))
;356:				|| ( gametype == GT_HARVESTER && EntityCarriesCubes(&entinfo)) ) {
;357:				teamtask = TEAMTASK_ESCORT;
;358:			}
;359:			else {
;360:				//qlone - freezetag
;361:				if ( g_freezeTag.integer && bs->formation_dist == 70 )
;362:					teamtask = TEAMTASK_ESCORT;
;363:				else
;364:				//qlone - freezetag
;365:				teamtask = TEAMTASK_FOLLOW;
;366:			}
;367:			break;
;368:		case LTG_DEFENDKEYAREA:
;369:			teamtask = TEAMTASK_DEFENSE;
;370:			break;
;371:		case LTG_GETFLAG:
;372:			teamtask = TEAMTASK_OFFENSE;
;373:			break;
;374:		case LTG_RUSHBASE:
;375:			teamtask = TEAMTASK_DEFENSE;
;376:			break;
;377:		case LTG_RETURNFLAG:
;378:			teamtask = TEAMTASK_RETRIEVE;
;379:			break;
;380:		case LTG_CAMP:
;381:		case LTG_CAMPORDER:
;382:			teamtask = TEAMTASK_CAMP;
;383:			break;
;384:		case LTG_PATROL:
;385:			teamtask = TEAMTASK_PATROL;
;386:			break;
;387:		case LTG_GETITEM:
;388:			teamtask = TEAMTASK_PATROL;
;389:			break;
;390:		case LTG_KILL:
;391:			teamtask = TEAMTASK_PATROL;
;392:			break;
;393:		case LTG_HARVEST:
;394:			teamtask = TEAMTASK_OFFENSE;
;395:			break;
;396:		case LTG_ATTACKENEMYBASE:
;397:			teamtask = TEAMTASK_OFFENSE;
;398:			break;
;399:		default:
;400:			teamtask = TEAMTASK_PATROL;
;401:			break;
;402:	}
;403:	BotSetUserInfo(bs, "teamtask", va("%d", teamtask));
;404:#endif
;405:}
LABELV $112
endproc BotSetTeamStatus 0 0
export BotSetLastOrderedTask
proc BotSetLastOrderedTask 60 16
line 412
;406:
;407:/*
;408:==================
;409:BotSetLastOrderedTask
;410:==================
;411:*/
;412:int BotSetLastOrderedTask(bot_state_t *bs) {
line 414
;413:
;414:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $114
line 416
;415:		// don't go back to returning the flag if it's at the base
;416:		if ( bs->lastgoal_ltgtype == LTG_RETURNFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 6
NEI4 $116
line 417
;417:			if ( BotTeam(bs) == TEAM_RED ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $118
line 418
;418:				if ( bs->redflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $119
line 419
;419:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 420
;420:				}
line 421
;421:			}
ADDRGP4 $119
JUMPV
LABELV $118
line 422
;422:			else {
line 423
;423:				if ( bs->blueflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 0
NEI4 $122
line 424
;424:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 425
;425:				}
LABELV $122
line 426
;426:			}
LABELV $119
line 427
;427:		}
LABELV $116
line 428
;428:	}
LABELV $114
line 430
;429:
;430:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $124
line 431
;431:		bs->decisionmaker = bs->lastgoal_decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
INDIRI4
ASGNI4
line 432
;432:		bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 433
;433:		bs->ltgtype = bs->lastgoal_ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ASGNI4
line 434
;434:		memcpy(&bs->teamgoal, &bs->lastgoal_teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 435
;435:		bs->teammate = bs->lastgoal_teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
INDIRI4
ASGNI4
line 436
;436:		bs->teamgoal_time = FloatTime() + 300;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1133903872
ADDF4
ASGNF4
line 437
;437:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 439
;438:		//
;439:		if ( gametype == GT_CTF ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $126
line 440
;440:			if ( bs->ltgtype == LTG_GETFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $128
line 444
;441:				bot_goal_t *tb, *eb;
;442:				int tt, et;
;443:
;444:				tb = BotTeamFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 BotTeamFlag
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 445
;445:				eb = BotEnemyFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotEnemyFlag
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 446
;446:				tt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, tb->areanum, TFL_DEFAULT);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 44
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 447
;447:				et = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, eb->areanum, TFL_DEFAULT);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 52
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 52
INDIRI4
ASGNI4
line 449
;448:				// if the travel time towards the enemy base is larger than towards our base
;449:				if (et > tt) {
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $130
line 451
;450:					//get an alternative route goal towards the enemy base
;451:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 452
;452:				}
LABELV $130
line 453
;453:			}
LABELV $128
line 454
;454:		}
LABELV $126
line 455
;455:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $113
JUMPV
LABELV $124
line 457
;456:	}
;457:	return qfalse;
CNSTI4 0
RETI4
LABELV $113
endproc BotSetLastOrderedTask 60 16
export BotRefuseOrder
proc BotRefuseOrder 4 8
line 465
;458:}
;459:
;460:/*
;461:==================
;462:BotRefuseOrder
;463:==================
;464:*/
;465:void BotRefuseOrder(bot_state_t *bs) {
line 466
;466:	if (!bs->ordered)
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $133
line 467
;467:		return;
ADDRGP4 $132
JUMPV
LABELV $133
line 469
;468:	// if the bot was ordered to do something
;469:	if ( bs->order_time && bs->order_time > FloatTime() - 10 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6616
ADDP4
INDIRF4
CNSTF4 0
EQF4 $135
ADDRLP4 0
INDIRP4
CNSTI4 6616
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
LEF4 $135
line 470
;470:		trap_EA_Action(bs->client, ACTION_NEGATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 2097152
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 474
;471:#ifdef MISSIONPACK
;472:		BotVoiceChat(bs, bs->decisionmaker, VOICECHAT_NO);
;473:#endif
;474:		bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 475
;475:	}
LABELV $135
line 476
;476:}
LABELV $132
endproc BotRefuseOrder 4 8
export BotCTFSeekGoals
proc BotCTFSeekGoals 224 12
line 484
;477:
;478:
;479:/*
;480:==================
;481:BotCTFSeekGoals
;482:==================
;483:*/
;484:void BotCTFSeekGoals(bot_state_t *bs) {
line 491
;485:	float rnd, l1, l2;
;486:	int flagstatus, c;
;487:	vec3_t dir;
;488:	aas_entityinfo_t entinfo;
;489:
;490:	//when carrying a flag in ctf the bot should rush to the base
;491:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $138
line 493
;492:		//if not already rushing to the base
;493:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $140
line 494
;494:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 495
;495:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 496
;496:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 497
;497:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 498
;498:			bs->decisionmaker = bs->client;
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 176
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 499
;499:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 501
;500:			//
;501:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
ADDRLP4 184
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
EQI4 $145
ADDRLP4 180
INDIRI4
CNSTI4 2
EQI4 $150
ADDRGP4 $142
JUMPV
LABELV $145
line 502
;502:				case TEAM_RED: VectorSubtract(bs->origin, ctf_blueflag.origin, dir); break;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 192
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 192
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $143
JUMPV
LABELV $150
line 503
;503:				case TEAM_BLUE: VectorSubtract(bs->origin, ctf_redflag.origin, dir); break;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 196
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_redflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 196
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $143
JUMPV
LABELV $142
line 504
;504:				default: VectorSet(dir, 999, 999, 999); break;
ADDRLP4 160
CNSTF4 1148829696
ASGNF4
ADDRLP4 160+4
CNSTF4 1148829696
ASGNF4
ADDRLP4 160+8
CNSTF4 1148829696
ASGNF4
LABELV $143
line 507
;505:			}
;506:			// if the bot picked up the flag very close to the enemy base
;507:			if ( VectorLength(dir) < 128 ) {
ADDRLP4 160
ARGP4
ADDRLP4 192
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 1124073472
GEF4 $157
line 509
;508:				// get an alternative route goal through the enemy base
;509:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 510
;510:			} else {
ADDRGP4 $158
JUMPV
LABELV $157
line 512
;511:				// don't use any alt route goal, just get the hell out of the base
;512:				bs->altroutegoal.areanum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
CNSTI4 0
ASGNI4
line 513
;513:			}
LABELV $158
line 514
;514:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $160
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 518
;515:#ifdef MISSIONPACK
;516:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
;517:#endif
;518:		}
ADDRGP4 $137
JUMPV
LABELV $140
line 519
;519:		else if (bs->rushbaseaway_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $137
line 520
;520:			if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $163
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $163
line 521
;521:			else flagstatus = bs->blueflagstatus;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
ASGNI4
LABELV $164
line 523
;522:			//if the flag is back
;523:			if (flagstatus == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $137
line 524
;524:				bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 525
;525:			}
line 526
;526:		}
line 527
;527:		return;
ADDRGP4 $137
JUMPV
LABELV $138
line 531
;528:	}
;529:	// if the bot decided to follow someone
;530://qlone - freezetag
;531:	if ( g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $167
line 532
;532:		BotTeamSeekGoals( bs );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamSeekGoals
CALLV
pop
line 533
;533:		if ( bs->ltgtype == LTG_TEAMACCOMPANY ) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $168
line 534
;534:			return;
ADDRGP4 $137
JUMPV
line 536
;535:		}
;536:	}
LABELV $167
line 537
;537:	else {
line 539
;538://qlone - freezetag
;539:		if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $172
ADDRLP4 176
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $172
line 541
;540:			// if the team mate being accompanied no longer carries the flag
;541:			BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 542
;542:			if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 20
ARGP4
ADDRLP4 180
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $174
line 543
;543:				bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 544
;544:			}
LABELV $174
line 545
;545:		}
LABELV $172
line 546
;546:	} //qlone - freezetag
LABELV $168
line 548
;547:	//
;548:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $176
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 180
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 180
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $177
JUMPV
LABELV $176
line 549
;549:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 184
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 184
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $177
line 551
;550:	//if our team has the enemy flag and our flag is at the base
;551:	if (flagstatus == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $178
line 553
;552:		//
;553:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $137
line 555
;554:			//if Not defending the base already
;555:			if (!(bs->ltgtype == LTG_DEFENDKEYAREA &&
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $186
ADDRLP4 188
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ADDRGP4 ctf_redflag+44
INDIRI4
EQI4 $137
ADDRLP4 188
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ADDRGP4 ctf_blueflag+44
INDIRI4
EQI4 $137
LABELV $186
line 557
;556:					(bs->teamgoal.number == ctf_redflag.number ||
;557:					bs->teamgoal.number == ctf_blueflag.number))) {
line 559
;558:				//if there is a visible team mate flag carrier
;559:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 192
INDIRI4
ASGNI4
line 560
;560:				if (c >= 0 &&
ADDRLP4 196
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
LTI4 $137
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $189
ADDRLP4 200
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ADDRLP4 196
INDIRI4
EQI4 $137
LABELV $189
line 562
;561:						// and not already following the team mate flag carrier
;562:						(bs->ltgtype != LTG_TEAMACCOMPANY || bs->teammate != c)) {
line 564
;563:					//
;564:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 566
;565:					//follow the flag carrier
;566:					bs->decisionmaker = bs->client;
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 204
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 567
;567:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 569
;568:					//the team mate
;569:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 571
;570:					//last time the team mate was visible
;571:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 573
;572:					//no message
;573:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 575
;574:					//no arrive message
;575:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 581
;576:					//
;577:#ifdef MISSIONPACK
;578:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;579:#endif
;580:					//get the team goal time
;581:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 582
;582:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 583
;583:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 584
;584:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 585
;585:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 586
;586:				}
line 587
;587:			}
line 588
;588:		}
line 589
;589:		return;
ADDRGP4 $137
JUMPV
LABELV $178
line 592
;590:	}
;591:	//if the enemy has our flag
;592:	else if (flagstatus == 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $190
line 594
;593:		//
;594:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $137
line 596
;595:			//if enemy flag carrier is visible
;596:			c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 188
INDIRI4
ASGNI4
line 597
;597:			if (c >= 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $194
line 599
;598:				//FIXME: fight enemy flag carrier
;599:			}
LABELV $194
line 601
;600:			//if not already doing something important
;601:			if (bs->ltgtype != LTG_GETFLAG &&
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $137
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $137
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $137
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $137
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $137
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $137
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $137
line 607
;602:				bs->ltgtype != LTG_RETURNFLAG &&
;603:				bs->ltgtype != LTG_TEAMHELP &&
;604:				bs->ltgtype != LTG_TEAMACCOMPANY &&
;605:				bs->ltgtype != LTG_CAMPORDER &&
;606:				bs->ltgtype != LTG_PATROL &&
;607:				bs->ltgtype != LTG_GETITEM) {
line 609
;608:
;609:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 610
;610:				bs->decisionmaker = bs->client;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 196
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 611
;611:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 613
;612:				//
;613:				if (random() < 0.5) {
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $198
line 615
;614:					//go for the enemy flag
;615:					bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 616
;616:				}
ADDRGP4 $199
JUMPV
LABELV $198
line 617
;617:				else {
line 618
;618:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 619
;619:				}
LABELV $199
line 621
;620:				//no team message
;621:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 623
;622:				//set the time the bot will stop getting the flag
;623:				bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 625
;624:				//get an alternative route goal towards the enemy base
;625:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 627
;626:				//
;627:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 628
;628:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 629
;629:			}
line 630
;630:		}
line 631
;631:		return;
ADDRGP4 $137
JUMPV
LABELV $190
line 634
;632:	}
;633:	//if both flags Not at their bases
;634:	else if (flagstatus == 3) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $200
line 636
;635:		//
;636:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $137
line 638
;637:			// if not trying to return the flag and not following the team flag carrier
;638:			if ( bs->ltgtype != LTG_RETURNFLAG && bs->ltgtype != LTG_TEAMACCOMPANY ) {
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $137
ADDRLP4 188
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $137
line 640
;639:				//
;640:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 192
INDIRI4
ASGNI4
line 642
;641:				// if there is a visible team mate flag carrier
;642:				if (c >= 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $206
line 643
;643:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 645
;644:					//follow the flag carrier
;645:					bs->decisionmaker = bs->client;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 196
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 646
;646:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 648
;647:					//the team mate
;648:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 650
;649:					//last time the team mate was visible
;650:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 652
;651:					//no message
;652:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 654
;653:					//no arrive message
;654:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 660
;655:					//
;656:#ifdef MISSIONPACK
;657:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;658:#endif
;659:					//get the team goal time
;660:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 661
;661:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 662
;662:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 664
;663:					//
;664:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 665
;665:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 666
;666:				}
ADDRGP4 $137
JUMPV
LABELV $206
line 667
;667:				else {
line 668
;668:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 669
;669:					bs->decisionmaker = bs->client;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 196
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 670
;670:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 672
;671:					//get the enemy flag
;672:					bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 200
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 674
;673:					//get the flag
;674:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 676
;675:					//set the time the bot will stop getting the flag
;676:					bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 678
;677:					//get an alternative route goal towards the enemy base
;678:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 680
;679:					//
;680:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 681
;681:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 682
;682:				}
line 683
;683:			}
line 684
;684:		}
line 685
;685:		return;
ADDRGP4 $137
JUMPV
LABELV $200
line 688
;686:	}
;687:	// don't just do something wait for the bot team leader to give orders
;688:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $208
line 689
;689:		return;
ADDRGP4 $137
JUMPV
LABELV $208
line 692
;690:	}
;691:	// if the bot is ordered to do something
;692:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
line 693
;693:		bs->teamgoal_time += 60;
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 694
;694:	}
LABELV $210
line 696
;695:	// if the bot decided to do something on it's own and has a last ordered goal
;696:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $212
ADDRLP4 192
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $212
line 697
;697:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 698
;698:	}
LABELV $212
line 700
;699:	//if already a CTF or team goal
;700:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 14
EQI4 $225
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 15
NEI4 $214
LABELV $225
line 710
;701:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;702:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;703:			bs->ltgtype == LTG_GETFLAG ||
;704:			bs->ltgtype == LTG_RUSHBASE ||
;705:			bs->ltgtype == LTG_RETURNFLAG ||
;706:			bs->ltgtype == LTG_CAMPORDER ||
;707:			bs->ltgtype == LTG_PATROL ||
;708:			bs->ltgtype == LTG_GETITEM ||
;709:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;710:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 711
;711:		return;
ADDRGP4 $137
JUMPV
LABELV $214
line 714
;712:	}
;713:	//
;714:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $226
line 715
;715:		return;
ADDRGP4 $137
JUMPV
LABELV $226
line 717
;716:	//
;717:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $228
line 718
;718:		return;;
ADDRGP4 $137
JUMPV
LABELV $228
line 720
;719:	//if the bot is roaming
;720:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $230
line 721
;721:		return;
ADDRGP4 $137
JUMPV
LABELV $230
line 723
;722:	//if the bot has anough aggression to decide what to do
;723:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 204
INDIRF4
CNSTF4 1112014848
GEF4 $232
line 724
;724:		return;
ADDRGP4 $137
JUMPV
LABELV $232
line 726
;725:	//set the time to send a message to the team mates
;726:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 208
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 208
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 728
;727:	//
;728:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $234
line 729
;729:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $236
line 730
;730:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 731
;731:		}
ADDRGP4 $237
JUMPV
LABELV $236
line 732
;732:		else {
line 733
;733:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 734
;734:		}
LABELV $237
line 735
;735:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 736
;736:	}
ADDRGP4 $235
JUMPV
LABELV $234
line 737
;737:	else {
line 738
;738:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 739
;739:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 740
;740:	}
LABELV $235
line 742
;741:	//get the flag or defend the base
;742:	rnd = random();
ADDRLP4 212
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 212
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ASGNF4
line 743
;743:	if (rnd < l1 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $238
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $238
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
EQI4 $238
line 744
;744:		bs->decisionmaker = bs->client;
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 745
;745:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 746
;746:		bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 748
;747:		//set the time the bot will stop getting the flag
;748:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 750
;749:		//get an alternative route goal towards the enemy base
;750:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 220
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 220
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 751
;751:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 752
;752:	}
ADDRGP4 $239
JUMPV
LABELV $238
line 753
;753:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $242
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $242
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
EQI4 $242
line 754
;754:		bs->decisionmaker = bs->client;
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 755
;755:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 757
;756:		//
;757:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 220
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 1
NEI4 $246
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $247
JUMPV
LABELV $246
line 758
;758:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $247
line 760
;759:		//set the ltg type
;760:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 762
;761:		//set the time the bot stops defending the base
;762:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 763
;763:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 764
;764:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 765
;765:	}
ADDRGP4 $243
JUMPV
LABELV $242
line 766
;766:	else {
line 767
;767:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 769
;768:		//set the time the bot will stop roaming
;769:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 770
;770:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 771
;771:	}
LABELV $243
LABELV $239
line 772
;772:	bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 776
;773:#ifdef DEBUG
;774:	BotPrintTeamGoal(bs);
;775:#endif //DEBUG
;776:}
LABELV $137
endproc BotCTFSeekGoals 224 12
export BotCTFRetreatGoals
proc BotCTFRetreatGoals 8 4
line 783
;777:
;778:/*
;779:==================
;780:BotCTFRetreatGoals
;781:==================
;782:*/
;783:void BotCTFRetreatGoals(bot_state_t *bs) {
line 785
;784:	//when carrying a flag in ctf the bot should rush to the base
;785:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $249
line 787
;786:		//if not already rushing to the base
;787:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $251
line 788
;788:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 789
;789:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 790
;790:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 791
;791:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 792
;792:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 793
;793:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 794
;794:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 795
;795:		}
LABELV $251
line 796
;796:	}
LABELV $249
line 797
;797:}
LABELV $248
endproc BotCTFRetreatGoals 8 4
export BotTeamGoals
proc BotTeamGoals 0 4
line 1339
;798:
;799:#ifdef MISSIONPACK
;800:/*
;801:==================
;802:Bot1FCTFSeekGoals
;803:==================
;804:*/
;805:void Bot1FCTFSeekGoals(bot_state_t *bs) {
;806:	aas_entityinfo_t entinfo;
;807:	float rnd, l1, l2;
;808:	int c;
;809:
;810:	//when carrying a flag in ctf the bot should rush to the base
;811:	if (Bot1FCTFCarryingFlag(bs)) {
;812:		//if not already rushing to the base
;813:		if (bs->ltgtype != LTG_RUSHBASE) {
;814:			BotRefuseOrder(bs);
;815:			bs->ltgtype = LTG_RUSHBASE;
;816:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;817:			bs->rushbaseaway_time = 0;
;818:			bs->decisionmaker = bs->client;
;819:			bs->ordered = qfalse;
;820:			//get an alternative route goal towards the enemy base
;821:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;822:			//
;823:			BotSetTeamStatus(bs);
;824:#ifdef MISSIONPACK
;825:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
;826:#endif
;827:		}
;828:		return;
;829:	}
;830:	// if the bot decided to follow someone
;831:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
;832:		// if the team mate being accompanied no longer carries the flag
;833:		BotEntityInfo(bs->teammate, &entinfo);
;834:		if (!EntityCarriesFlag(&entinfo)) {
;835:			bs->ltgtype = 0;
;836:		}
;837:	}
;838:	//our team has the flag
;839:	if (bs->neutralflagstatus == 1) {
;840:		if (bs->owndecision_time < FloatTime()) {
;841:			// if not already following someone
;842:			if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;843:				//if there is a visible team mate flag carrier
;844:				c = BotTeamFlagCarrierVisible(bs);
;845:				if (c >= 0) {
;846:					BotRefuseOrder(bs);
;847:					//follow the flag carrier
;848:					bs->decisionmaker = bs->client;
;849:					bs->ordered = qfalse;
;850:					//the team mate
;851:					bs->teammate = c;
;852:					//last time the team mate was visible
;853:					bs->teammatevisible_time = FloatTime();
;854:					//no message
;855:					bs->teammessage_time = 0;
;856:					//no arrive message
;857:					bs->arrive_time = 1;
;858:					//
;859:#ifdef MISSIONPACK
;860:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;861:#endif
;862:					//get the team goal time
;863:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
;864:					bs->ltgtype = LTG_TEAMACCOMPANY;
;865:					bs->formation_dist = 3.5 * 32;		//3.5 meter
;866:					BotSetTeamStatus(bs);
;867:					bs->owndecision_time = FloatTime() + 5;
;868:					return;
;869:				}
;870:			}
;871:			//if already a CTF or team goal
;872:			if (bs->ltgtype == LTG_TEAMHELP ||
;873:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;874:					bs->ltgtype == LTG_DEFENDKEYAREA ||
;875:					bs->ltgtype == LTG_GETFLAG ||
;876:					bs->ltgtype == LTG_RUSHBASE ||
;877:					bs->ltgtype == LTG_CAMPORDER ||
;878:					bs->ltgtype == LTG_PATROL ||
;879:					bs->ltgtype == LTG_ATTACKENEMYBASE ||
;880:					bs->ltgtype == LTG_GETITEM ||
;881:					bs->ltgtype == LTG_MAKELOVE_UNDER ||
;882:					bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;883:				return;
;884:			}
;885:			//if not already attacking the enemy base
;886:			if (bs->ltgtype != LTG_ATTACKENEMYBASE) {
;887:				BotRefuseOrder(bs);
;888:				bs->decisionmaker = bs->client;
;889:				bs->ordered = qfalse;
;890:				//
;891:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;892:				else memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;893:				//set the ltg type
;894:				bs->ltgtype = LTG_ATTACKENEMYBASE;
;895:				//set the time the bot will stop getting the flag
;896:				bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;897:				BotSetTeamStatus(bs);
;898:				bs->owndecision_time = FloatTime() + 5;
;899:			}
;900:		}
;901:		return;
;902:	}
;903:	//enemy team has the flag
;904:	else if (bs->neutralflagstatus == 2) {
;905:		if (bs->owndecision_time < FloatTime()) {
;906:			c = BotEnemyFlagCarrierVisible(bs);
;907:			if (c >= 0) {
;908:				//FIXME: attack enemy flag carrier
;909:			}
;910:			//if already a CTF or team goal
;911:			if (bs->ltgtype == LTG_TEAMHELP ||
;912:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;913:					bs->ltgtype == LTG_CAMPORDER ||
;914:					bs->ltgtype == LTG_PATROL ||
;915:					bs->ltgtype == LTG_GETITEM) {
;916:				return;
;917:			}
;918:			// if not already defending the base
;919:			if (bs->ltgtype != LTG_DEFENDKEYAREA) {
;920:				BotRefuseOrder(bs);
;921:				bs->decisionmaker = bs->client;
;922:				bs->ordered = qfalse;
;923:				//
;924:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;925:				else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;926:				//set the ltg type
;927:				bs->ltgtype = LTG_DEFENDKEYAREA;
;928:				//set the time the bot stops defending the base
;929:				bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;930:				bs->defendaway_time = 0;
;931:				BotSetTeamStatus(bs);
;932:				bs->owndecision_time = FloatTime() + 5;
;933:			}
;934:		}
;935:		return;
;936:	}
;937:	// don't just do something wait for the bot team leader to give orders
;938:	if (BotTeamLeader(bs)) {
;939:		return;
;940:	}
;941:	// if the bot is ordered to do something
;942:	if ( bs->lastgoal_ltgtype ) {
;943:		bs->teamgoal_time += 60;
;944:	}
;945:	// if the bot decided to do something on it's own and has a last ordered goal
;946:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
;947:		bs->ltgtype = 0;
;948:	}
;949:	//if already a CTF or team goal
;950:	if (bs->ltgtype == LTG_TEAMHELP ||
;951:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;952:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;953:			bs->ltgtype == LTG_GETFLAG ||
;954:			bs->ltgtype == LTG_RUSHBASE ||
;955:			bs->ltgtype == LTG_RETURNFLAG ||
;956:			bs->ltgtype == LTG_CAMPORDER ||
;957:			bs->ltgtype == LTG_PATROL ||
;958:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;959:			bs->ltgtype == LTG_GETITEM ||
;960:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;961:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;962:		return;
;963:	}
;964:	//
;965:	if (BotSetLastOrderedTask(bs))
;966:		return;
;967:	//
;968:	if (bs->owndecision_time > FloatTime())
;969:		return;;
;970:	//if the bot is roaming
;971:	if (bs->ctfroam_time > FloatTime())
;972:		return;
;973:	//if the bot has anough aggression to decide what to do
;974:	if (BotAggression(bs) < 50)
;975:		return;
;976:	//set the time to send a message to the team mates
;977:	bs->teammessage_time = FloatTime() + 2 * random();
;978:	//
;979:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;980:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;981:			l1 = 0.7f;
;982:		}
;983:		else {
;984:			l1 = 0.2f;
;985:		}
;986:		l2 = 0.9f;
;987:	}
;988:	else {
;989:		l1 = 0.4f;
;990:		l2 = 0.7f;
;991:	}
;992:	//get the flag or defend the base
;993:	rnd = random();
;994:	if (rnd < l1 && ctf_neutralflag.areanum) {
;995:		bs->decisionmaker = bs->client;
;996:		bs->ordered = qfalse;
;997:		bs->ltgtype = LTG_GETFLAG;
;998:		//set the time the bot will stop getting the flag
;999:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
;1000:		BotSetTeamStatus(bs);
;1001:	}
;1002:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
;1003:		bs->decisionmaker = bs->client;
;1004:		bs->ordered = qfalse;
;1005:		//
;1006:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;1007:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;1008:		//set the ltg type
;1009:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1010:		//set the time the bot stops defending the base
;1011:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1012:		bs->defendaway_time = 0;
;1013:		BotSetTeamStatus(bs);
;1014:	}
;1015:	else {
;1016:		bs->ltgtype = 0;
;1017:		//set the time the bot will stop roaming
;1018:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1019:		BotSetTeamStatus(bs);
;1020:	}
;1021:	bs->owndecision_time = FloatTime() + 5;
;1022:#ifdef DEBUG
;1023:	BotPrintTeamGoal(bs);
;1024:#endif //DEBUG
;1025:}
;1026:
;1027:/*
;1028:==================
;1029:Bot1FCTFRetreatGoals
;1030:==================
;1031:*/
;1032:void Bot1FCTFRetreatGoals(bot_state_t *bs) {
;1033:	//when carrying a flag in ctf the bot should rush to the enemy base
;1034:	if (Bot1FCTFCarryingFlag(bs)) {
;1035:		//if not already rushing to the base
;1036:		if (bs->ltgtype != LTG_RUSHBASE) {
;1037:			BotRefuseOrder(bs);
;1038:			bs->ltgtype = LTG_RUSHBASE;
;1039:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1040:			bs->rushbaseaway_time = 0;
;1041:			bs->decisionmaker = bs->client;
;1042:			bs->ordered = qfalse;
;1043:			//get an alternative route goal towards the enemy base
;1044:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1045:			BotSetTeamStatus(bs);
;1046:		}
;1047:	}
;1048:}
;1049:
;1050:/*
;1051:==================
;1052:BotObeliskSeekGoals
;1053:==================
;1054:*/
;1055:void BotObeliskSeekGoals(bot_state_t *bs) {
;1056:	float rnd, l1, l2;
;1057:
;1058:	// don't just do something wait for the bot team leader to give orders
;1059:	if (BotTeamLeader(bs)) {
;1060:		return;
;1061:	}
;1062:	// if the bot is ordered to do something
;1063:	if ( bs->lastgoal_ltgtype ) {
;1064:		bs->teamgoal_time += 60;
;1065:	}
;1066:	//if already a team goal
;1067:	if (bs->ltgtype == LTG_TEAMHELP ||
;1068:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1069:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1070:			bs->ltgtype == LTG_GETFLAG ||
;1071:			bs->ltgtype == LTG_RUSHBASE ||
;1072:			bs->ltgtype == LTG_RETURNFLAG ||
;1073:			bs->ltgtype == LTG_CAMPORDER ||
;1074:			bs->ltgtype == LTG_PATROL ||
;1075:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1076:			bs->ltgtype == LTG_GETITEM ||
;1077:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1078:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;1079:		return;
;1080:	}
;1081:	//
;1082:	if (BotSetLastOrderedTask(bs))
;1083:		return;
;1084:	//if the bot is roaming
;1085:	if (bs->ctfroam_time > FloatTime())
;1086:		return;
;1087:	//if the bot has anough aggression to decide what to do
;1088:	if (BotAggression(bs) < 50)
;1089:		return;
;1090:	//set the time to send a message to the team mates
;1091:	bs->teammessage_time = FloatTime() + 2 * random();
;1092:	//
;1093:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;1094:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1095:			l1 = 0.7f;
;1096:		}
;1097:		else {
;1098:			l1 = 0.2f;
;1099:		}
;1100:		l2 = 0.9f;
;1101:	}
;1102:	else {
;1103:		l1 = 0.4f;
;1104:		l2 = 0.7f;
;1105:	}
;1106:	//get the flag or defend the base
;1107:	rnd = random();
;1108:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1109:		bs->decisionmaker = bs->client;
;1110:		bs->ordered = qfalse;
;1111:		//
;1112:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1113:		else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1114:		//set the ltg type
;1115:		bs->ltgtype = LTG_ATTACKENEMYBASE;
;1116:		//set the time the bot will stop attacking the enemy base
;1117:		bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;1118:		//get an alternate route goal towards the enemy base
;1119:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1120:		BotSetTeamStatus(bs);
;1121:	}
;1122:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1123:		bs->decisionmaker = bs->client;
;1124:		bs->ordered = qfalse;
;1125:		//
;1126:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1127:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1128:		//set the ltg type
;1129:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1130:		//set the time the bot stops defending the base
;1131:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1132:		bs->defendaway_time = 0;
;1133:		BotSetTeamStatus(bs);
;1134:	}
;1135:	else {
;1136:		bs->ltgtype = 0;
;1137:		//set the time the bot will stop roaming
;1138:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1139:		BotSetTeamStatus(bs);
;1140:	}
;1141:}
;1142:
;1143:/*
;1144:==================
;1145:BotGoHarvest
;1146:==================
;1147:*/
;1148:void BotGoHarvest(bot_state_t *bs) {
;1149:	//
;1150:	if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1151:	else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1152:	//set the ltg type
;1153:	bs->ltgtype = LTG_HARVEST;
;1154:	//set the time the bot will stop harvesting
;1155:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
;1156:	bs->harvestaway_time = 0;
;1157:	BotSetTeamStatus(bs);
;1158:}
;1159:
;1160:/*
;1161:==================
;1162:BotObeliskRetreatGoals
;1163:==================
;1164:*/
;1165:void BotObeliskRetreatGoals(bot_state_t *bs) {
;1166:	//nothing special
;1167:}
;1168:
;1169:/*
;1170:==================
;1171:BotHarvesterSeekGoals
;1172:==================
;1173:*/
;1174:void BotHarvesterSeekGoals(bot_state_t *bs) {
;1175:	aas_entityinfo_t entinfo;
;1176:	float rnd, l1, l2;
;1177:	int c;
;1178:
;1179:	//when carrying cubes in harvester the bot should rush to the base
;1180:	if (BotHarvesterCarryingCubes(bs)) {
;1181:		//if not already rushing to the base
;1182:		if (bs->ltgtype != LTG_RUSHBASE) {
;1183:			BotRefuseOrder(bs);
;1184:			bs->ltgtype = LTG_RUSHBASE;
;1185:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1186:			bs->rushbaseaway_time = 0;
;1187:			bs->decisionmaker = bs->client;
;1188:			bs->ordered = qfalse;
;1189:			//get an alternative route goal towards the enemy base
;1190:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1191:			//
;1192:			BotSetTeamStatus(bs);
;1193:		}
;1194:		return;
;1195:	}
;1196:	// don't just do something wait for the bot team leader to give orders
;1197:	if (BotTeamLeader(bs)) {
;1198:		return;
;1199:	}
;1200:	// if the bot decided to follow someone
;1201:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
;1202:		// if the team mate being accompanied no longer carries the flag
;1203:		BotEntityInfo(bs->teammate, &entinfo);
;1204:		if (!EntityCarriesCubes(&entinfo)) {
;1205:			bs->ltgtype = 0;
;1206:		}
;1207:	}
;1208:	// if the bot is ordered to do something
;1209:	if ( bs->lastgoal_ltgtype ) {
;1210:		bs->teamgoal_time += 60;
;1211:	}
;1212:	//if not yet doing something
;1213:	if (bs->ltgtype == LTG_TEAMHELP ||
;1214:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1215:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1216:			bs->ltgtype == LTG_GETFLAG ||
;1217:			bs->ltgtype == LTG_CAMPORDER ||
;1218:			bs->ltgtype == LTG_PATROL ||
;1219:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1220:			bs->ltgtype == LTG_HARVEST ||
;1221:			bs->ltgtype == LTG_GETITEM ||
;1222:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1223:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;1224:		return;
;1225:	}
;1226:	//
;1227:	if (BotSetLastOrderedTask(bs))
;1228:		return;
;1229:	//if the bot is roaming
;1230:	if (bs->ctfroam_time > FloatTime())
;1231:		return;
;1232:	//if the bot has anough aggression to decide what to do
;1233:	if (BotAggression(bs) < 50)
;1234:		return;
;1235:	//set the time to send a message to the team mates
;1236:	bs->teammessage_time = FloatTime() + 2 * random();
;1237:	//
;1238:	c = BotEnemyCubeCarrierVisible(bs);
;1239:	if (c >= 0) {
;1240:		//FIXME: attack enemy cube carrier
;1241:	}
;1242:	if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;1243:		//if there is a visible team mate carrying cubes
;1244:		c = BotTeamCubeCarrierVisible(bs);
;1245:		if (c >= 0) {
;1246:			//follow the team mate carrying cubes
;1247:			bs->decisionmaker = bs->client;
;1248:			bs->ordered = qfalse;
;1249:			//the team mate
;1250:			bs->teammate = c;
;1251:			//last time the team mate was visible
;1252:			bs->teammatevisible_time = FloatTime();
;1253:			//no message
;1254:			bs->teammessage_time = 0;
;1255:			//no arrive message
;1256:			bs->arrive_time = 1;
;1257:			//
;1258:#ifdef MISSIONPACK
;1259:			BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;1260:#endif
;1261:			//get the team goal time
;1262:			bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
;1263:			bs->ltgtype = LTG_TEAMACCOMPANY;
;1264:			bs->formation_dist = 3.5 * 32;		//3.5 meter
;1265:			BotSetTeamStatus(bs);
;1266:			return;
;1267:		}
;1268:	}
;1269:	//
;1270:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;1271:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1272:			l1 = 0.7f;
;1273:		}
;1274:		else {
;1275:			l1 = 0.2f;
;1276:		}
;1277:		l2 = 0.9f;
;1278:	}
;1279:	else {
;1280:		l1 = 0.4f;
;1281:		l2 = 0.7f;
;1282:	}
;1283:	//
;1284:	rnd = random();
;1285:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1286:		bs->decisionmaker = bs->client;
;1287:		bs->ordered = qfalse;
;1288:		BotGoHarvest(bs);
;1289:	}
;1290:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1291:		bs->decisionmaker = bs->client;
;1292:		bs->ordered = qfalse;
;1293:		//
;1294:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1295:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1296:		//set the ltg type
;1297:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1298:		//set the time the bot stops defending the base
;1299:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1300:		bs->defendaway_time = 0;
;1301:		BotSetTeamStatus(bs);
;1302:	}
;1303:	else {
;1304:		bs->ltgtype = 0;
;1305:		//set the time the bot will stop roaming
;1306:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1307:		BotSetTeamStatus(bs);
;1308:	}
;1309:}
;1310:
;1311:/*
;1312:==================
;1313:BotHarvesterRetreatGoals
;1314:==================
;1315:*/
;1316:void BotHarvesterRetreatGoals(bot_state_t *bs) {
;1317:	//when carrying cubes in harvester the bot should rush to the base
;1318:	if (BotHarvesterCarryingCubes(bs)) {
;1319:		//if not already rushing to the base
;1320:		if (bs->ltgtype != LTG_RUSHBASE) {
;1321:			BotRefuseOrder(bs);
;1322:			bs->ltgtype = LTG_RUSHBASE;
;1323:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1324:			bs->rushbaseaway_time = 0;
;1325:			bs->decisionmaker = bs->client;
;1326:			bs->ordered = qfalse;
;1327:			BotSetTeamStatus(bs);
;1328:		}
;1329:		return;
;1330:	}
;1331:}
;1332:#endif
;1333:
;1334:/*
;1335:==================
;1336:BotTeamGoals
;1337:==================
;1338:*/
;1339:void BotTeamGoals(bot_state_t *bs, int retreat) {
line 1341
;1340:
;1341:	if ( retreat ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $254
line 1342
;1342:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $255
line 1343
;1343:			BotCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFRetreatGoals
CALLV
pop
line 1344
;1344:		}
line 1356
;1345:#ifdef MISSIONPACK
;1346:		else if (gametype == GT_1FCTF) {
;1347:			Bot1FCTFRetreatGoals(bs);
;1348:		}
;1349:		else if (gametype == GT_OBELISK) {
;1350:			BotObeliskRetreatGoals(bs);
;1351:		}
;1352:		else if (gametype == GT_HARVESTER) {
;1353:			BotHarvesterRetreatGoals(bs);
;1354:		}
;1355:#endif
;1356:	}
ADDRGP4 $255
JUMPV
LABELV $254
line 1357
;1357:	else {
line 1358
;1358:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $258
line 1360
;1359:			//decide what to do in CTF mode
;1360:			BotCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFSeekGoals
CALLV
pop
line 1361
;1361:		}
ADDRGP4 $259
JUMPV
LABELV $258
line 1374
;1362:#ifdef MISSIONPACK
;1363:		else if (gametype == GT_1FCTF) {
;1364:			Bot1FCTFSeekGoals(bs);
;1365:		}
;1366:		else if (gametype == GT_OBELISK) {
;1367:			BotObeliskSeekGoals(bs);
;1368:		}
;1369:		else if (gametype == GT_HARVESTER) {
;1370:			BotHarvesterSeekGoals(bs);
;1371:		}
;1372:#endif
;1373://qlone - freezetag
;1374:		else if ( g_freezeTag.integer && gametype == GT_TEAM ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $260
ADDRGP4 gametype
INDIRI4
CNSTI4 3
NEI4 $260
line 1375
;1375:			BotTeamSeekGoals( bs );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamSeekGoals
CALLV
pop
line 1376
;1376:		}
LABELV $260
LABELV $259
line 1378
;1377://qlone - freezetag
;1378:	}
LABELV $255
line 1381
;1379:	// reset the order time which is used to see if
;1380:	// we decided to refuse an order
;1381:	bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 1382
;1382:}
LABELV $253
endproc BotTeamGoals 0 4
export BotPointAreaNum
proc BotPointAreaNum 68 20
line 1389
;1383:
;1384:/*
;1385:==================
;1386:BotPointAreaNum
;1387:==================
;1388:*/
;1389:int BotPointAreaNum(vec3_t origin) {
line 1393
;1390:	int areanum, numareas, areas[10];
;1391:	vec3_t end;
;1392:
;1393:	areanum = trap_AAS_PointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 trap_AAS_PointAreaNum
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 1394
;1394:	if (areanum) return areanum;
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $264
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $263
JUMPV
LABELV $264
line 1395
;1395:	VectorCopy(origin, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1396
;1396:	end[2] += 10;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1397
;1397:	numareas = trap_AAS_TraceAreas(origin, end, areas, NULL, 10);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 64
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
ASGNI4
line 1398
;1398:	if (numareas > 0) return areas[0];
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $267
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $263
JUMPV
LABELV $267
line 1399
;1399:	return 0;
CNSTI4 0
RETI4
LABELV $263
endproc BotPointAreaNum 68 20
export ClientName
proc ClientName 1028 12
line 1408
;1400:}
;1401:
;1402:
;1403:/*
;1404:==================
;1405:ClientName
;1406:==================
;1407:*/
;1408:char *ClientName( int client, char *name, int size ) {
line 1411
;1409:	char buf[ MAX_INFO_STRING ];
;1410:
;1411:	if ( (unsigned) client >= MAX_CLIENTS ) {
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $270
line 1413
;1412://qlone - freezetag
;1413:		if ( !g_freezeTag.integer ) {
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
NEI4 $272
line 1415
;1414://qlone - freezetag
;1415:			BotAI_Print( PRT_ERROR, "ClientName: client out of range\n" );
CNSTI4 3
ARGI4
ADDRGP4 $275
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1416
;1416:		} //qlone - freezetag
LABELV $272
line 1417
;1417:		Q_strncpyz( name, "[client out of range]", size );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $276
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1418
;1418:		return name;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $269
JUMPV
LABELV $270
line 1421
;1419:	}
;1420:
;1421:	trap_GetConfigstring( CS_PLAYERS + client, buf, sizeof( buf ) );
ADDRFP4 0
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
line 1422
;1422:	Q_strncpyz( name, Info_ValueForKey( buf, "n" ), size );
ADDRLP4 0
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1423
;1423:	Q_CleanStr( name );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1425
;1424:
;1425:	return name;
ADDRFP4 4
INDIRP4
RETP4
LABELV $269
endproc ClientName 1028 12
export ClientSkin
proc ClientSkin 1028 12
line 1434
;1426:}
;1427:
;1428:
;1429:/*
;1430:==================
;1431:ClientSkin
;1432:==================
;1433:*/
;1434:char *ClientSkin( int client, char *skin, int size ) {
line 1437
;1435:	char buf[ MAX_INFO_STRING ];
;1436:
;1437:	if ( (unsigned) client >= MAX_CLIENTS ) {
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $279
line 1438
;1438:		BotAI_Print(PRT_ERROR, "ClientSkin: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $281
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1439
;1439:		return "[client out of range]";
ADDRGP4 $276
RETP4
ADDRGP4 $278
JUMPV
LABELV $279
line 1442
;1440:	}
;1441:
;1442:	trap_GetConfigstring( CS_PLAYERS + client, buf, sizeof( buf ) );
ADDRFP4 0
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
line 1443
;1443:	Q_strncpyz( skin, Info_ValueForKey( buf, "model" ), size );
ADDRLP4 0
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1445
;1444:
;1445:	return skin;
ADDRFP4 4
INDIRP4
RETP4
LABELV $278
endproc ClientSkin 1028 12
export ClientFromName
proc ClientFromName 1036 12
line 1454
;1446:}
;1447:
;1448:
;1449:/*
;1450:==================
;1451:ClientFromName
;1452:==================
;1453:*/
;1454:int ClientFromName( const char *name ) {
line 1458
;1455:	int i;
;1456:	char buf[ MAX_INFO_STRING ];
;1457:
;1458:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $284
line 1459
;1459:		trap_GetConfigstring( CS_PLAYERS + i, buf, sizeof( buf ) );
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
line 1460
;1460:		Q_CleanStr( buf );
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1461
;1461:		if ( !Q_stricmp( Info_ValueForKey( buf, "n" ), name ) )
ADDRLP4 0
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $289
line 1462
;1462:			return i;
ADDRLP4 1024
INDIRI4
RETI4
ADDRGP4 $283
JUMPV
LABELV $289
line 1463
;1463:	}
LABELV $285
line 1458
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $287
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $284
line 1464
;1464:	return -1;
CNSTI4 -1
RETI4
LABELV $283
endproc ClientFromName 1036 12
export ClientOnSameTeamFromName
proc ClientOnSameTeamFromName 1040 12
line 1473
;1465:}
;1466:
;1467:
;1468:/*
;1469:==================
;1470:ClientOnSameTeamFromName
;1471:==================
;1472:*/
;1473:int ClientOnSameTeamFromName( bot_state_t *bs, const char *name ) {
line 1477
;1474:	char buf[MAX_INFO_STRING];
;1475:	int i;
;1476:
;1477:	for ( i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $295
JUMPV
LABELV $292
line 1478
;1478:		if ( !BotSameTeam( bs, i ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $297
line 1479
;1479:			continue;
ADDRGP4 $293
JUMPV
LABELV $297
line 1480
;1480:		trap_GetConfigstring( CS_PLAYERS + i, buf, sizeof( buf ) );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1481
;1481:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1482
;1482:		if ( !Q_stricmp( Info_ValueForKey( buf, "n" ), name ) )
ADDRLP4 4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $299
line 1483
;1483:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $291
JUMPV
LABELV $299
line 1484
;1484:	}
LABELV $293
line 1477
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $295
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $292
line 1486
;1485:
;1486:	return -1;
CNSTI4 -1
RETI4
LABELV $291
endproc ClientOnSameTeamFromName 1040 12
export stristr
proc stristr 12 4
line 1495
;1487:}
;1488:
;1489:
;1490:/*
;1491:==================
;1492:stristr
;1493:==================
;1494:*/
;1495:const char *stristr(const char *str, const char *charset) {
ADDRGP4 $303
JUMPV
LABELV $302
line 1498
;1496:	int i;
;1497:
;1498:	while(*str) {
line 1499
;1499:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $305
line 1500
;1500:			if (toupper(charset[i]) != toupper(str[i])) break;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $309
ADDRGP4 $307
JUMPV
LABELV $309
line 1501
;1501:		}
LABELV $306
line 1499
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $308
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $311
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $305
LABELV $311
LABELV $307
line 1502
;1502:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $312
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $301
JUMPV
LABELV $312
line 1503
;1503:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1504
;1504:	}
LABELV $303
line 1498
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $302
line 1505
;1505:	return NULL;
CNSTP4 0
RETP4
LABELV $301
endproc stristr 12 4
export EasyClientName
proc EasyClientName 192 12
line 1514
;1506:}
;1507:
;1508:
;1509:/*
;1510:==================
;1511:EasyClientName
;1512:==================
;1513:*/
;1514:char *EasyClientName(int client, char *buf, int size) {
line 1519
;1515:	int i;
;1516:	char *str1, *str2, *ptr, c;
;1517:	char name[128];
;1518:
;1519:	ClientName( client, name, sizeof( name ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 5
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1520
;1520:	for (i = 0; name[i]; i++) name[i] &= 127;
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $318
JUMPV
LABELV $315
ADDRLP4 148
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVII1 4
ASGNI1
LABELV $316
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $318
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $315
line 1522
;1521:	//remove all spaces
;1522:	for (ptr = strchr(name, ' '); ptr; ptr = strchr(name, ' ')) {
ADDRLP4 5
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 152
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 152
INDIRP4
ASGNP4
ADDRGP4 $322
JUMPV
LABELV $319
line 1523
;1523:		memmove(ptr, ptr+1, strlen(ptr+1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 156
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1524
;1524:	}
LABELV $320
line 1522
ADDRLP4 5
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
LABELV $322
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $319
line 1526
;1525:	//check for [x] and ]x[ clan names
;1526:	str1 = strchr(name, '[');
ADDRLP4 5
ARGP4
CNSTI4 91
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 160
INDIRP4
ASGNP4
line 1527
;1527:	str2 = strchr(name, ']');
ADDRLP4 5
ARGP4
CNSTI4 93
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 144
ADDRLP4 164
INDIRP4
ASGNP4
line 1528
;1528:	if (str1 && str2) {
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $323
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $323
line 1529
;1529:		if (str2 > str1) memmove(str1, str2+1, strlen(str2+1)+1);
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRP4
CVPU4 4
LEU4 $325
ADDRLP4 144
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 168
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 168
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
ADDRGP4 $326
JUMPV
LABELV $325
line 1530
;1530:		else memmove(str2, str1+1, strlen(str1+1)+1);
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
LABELV $326
line 1531
;1531:	}
LABELV $323
line 1533
;1532:	//remove Mr prefix
;1533:	if ((name[0] == 'm' || name[0] == 'M') &&
ADDRLP4 168
ADDRLP4 5
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 109
EQI4 $331
ADDRLP4 168
INDIRI4
CNSTI4 77
NEI4 $327
LABELV $331
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 114
EQI4 $332
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 82
NEI4 $327
LABELV $332
line 1534
;1534:			(name[1] == 'r' || name[1] == 'R')) {
line 1535
;1535:		memmove(name, name+2, strlen(name+2)+1);
ADDRLP4 5+2
ARGP4
ADDRLP4 172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 5
ARGP4
ADDRLP4 5+2
ARGP4
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1536
;1536:	}
LABELV $327
line 1538
;1537:	//only allow lower case alphabet characters
;1538:	ptr = name;
ADDRLP4 0
ADDRLP4 5
ASGNP4
ADDRGP4 $336
JUMPV
LABELV $335
line 1539
;1539:	while(*ptr) {
line 1540
;1540:		c = *ptr;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1541
;1541:		if ((c >= 'a' && c <= 'z') ||
ADDRLP4 172
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 97
LTI4 $341
ADDRLP4 172
INDIRI4
CNSTI4 122
LEI4 $342
LABELV $341
ADDRLP4 176
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 48
LTI4 $343
ADDRLP4 176
INDIRI4
CNSTI4 57
LEI4 $342
LABELV $343
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $338
LABELV $342
line 1542
;1542:				(c >= '0' && c <= '9') || c == '_') {
line 1543
;1543:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1544
;1544:		}
ADDRGP4 $339
JUMPV
LABELV $338
line 1545
;1545:		else if (c >= 'A' && c <= 'Z') {
ADDRLP4 180
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 65
LTI4 $344
ADDRLP4 180
INDIRI4
CNSTI4 90
GTI4 $344
line 1546
;1546:			*ptr += 'a' - 'A';
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
ADDI4
CVII1 4
ASGNI1
line 1547
;1547:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1548
;1548:		}
ADDRGP4 $345
JUMPV
LABELV $344
line 1549
;1549:		else {
line 1550
;1550:			memmove(ptr, ptr+1, strlen(ptr + 1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 184
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1551
;1551:		}
LABELV $345
LABELV $339
line 1552
;1552:	}
LABELV $336
line 1539
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $335
line 1554
;1553:	
;1554:	Q_strncpyz( buf, name, size );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 5
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1556
;1555:
;1556:	return buf;
ADDRFP4 4
INDIRP4
RETP4
LABELV $314
endproc EasyClientName 192 12
export BotSynonymContext
proc BotSynonymContext 8 4
line 1564
;1557:}
;1558:
;1559:/*
;1560:==================
;1561:BotSynonymContext
;1562:==================
;1563:*/
;1564:int BotSynonymContext(bot_state_t *bs) {
line 1567
;1565:	int context;
;1566:
;1567:	context = CONTEXT_NORMAL|CONTEXT_NEARBYITEM|CONTEXT_NAMES;
ADDRLP4 0
CNSTI4 1027
ASGNI4
line 1569
;1568:	//
;1569:	if (gametype == GT_CTF
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $347
line 1573
;1570:#ifdef MISSIONPACK
;1571:		|| gametype == GT_1FCTF
;1572:#endif
;1573:		) {
line 1574
;1574:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_CTFREDTEAM;
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
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
line 1575
;1575:		else context |= CONTEXT_CTFBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $350
line 1576
;1576:	}
LABELV $347
line 1587
;1577:#ifdef MISSIONPACK
;1578:	else if (gametype == GT_OBELISK) {
;1579:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_OBELISKREDTEAM;
;1580:		else context |= CONTEXT_OBELISKBLUETEAM;
;1581:	}
;1582:	else if (gametype == GT_HARVESTER) {
;1583:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_HARVESTERREDTEAM;
;1584:		else context |= CONTEXT_HARVESTERBLUETEAM;
;1585:	}
;1586:#endif
;1587:	return context;
ADDRLP4 0
INDIRI4
RETI4
LABELV $346
endproc BotSynonymContext 8 4
export BotChooseWeapon
proc BotChooseWeapon 20 8
line 1595
;1588:}
;1589:
;1590:/*
;1591:==================
;1592:BotChooseWeapon
;1593:==================
;1594:*/
;1595:void BotChooseWeapon(bot_state_t *bs) {
line 1598
;1596:	int newweaponnum;
;1597:
;1598:	if (bs->cur_ps.weaponstate == WEAPON_RAISING ||
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
EQI4 $354
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $352
LABELV $354
line 1599
;1599:			bs->cur_ps.weaponstate == WEAPON_DROPPING) {
line 1600
;1600:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1601
;1601:	}
ADDRGP4 $353
JUMPV
LABELV $352
line 1602
;1602:	else {
line 1603
;1603:		newweaponnum = trap_BotChooseBestFightWeapon(bs->ws, bs->inventory);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_BotChooseBestFightWeapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1604
;1604:		if (bs->weaponnum != newweaponnum) bs->weaponchange_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $355
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $355
line 1605
;1605:		bs->weaponnum = newweaponnum;
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1607
;1606:		//BotAI_Print(PRT_MESSAGE, "bs->weaponnum = %d\n", bs->weaponnum);
;1607:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1608
;1608:	}
LABELV $353
line 1609
;1609:}
LABELV $351
endproc BotChooseWeapon 20 8
export BotSetupForMovement
proc BotSetupForMovement 76 12
line 1616
;1610:
;1611:/*
;1612:==================
;1613:BotSetupForMovement
;1614:==================
;1615:*/
;1616:void BotSetupForMovement(bot_state_t *bs) {
line 1619
;1617:	bot_initmove_t initmove;
;1618:
;1619:	memset(&initmove, 0, sizeof(bot_initmove_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 68
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1620
;1620:	VectorCopy(bs->cur_ps.origin, initmove.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1621
;1621:	VectorCopy(bs->cur_ps.velocity, initmove.velocity);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRB
ASGNB 12
line 1622
;1622:	VectorClear(initmove.viewoffset);
ADDRLP4 0+24
CNSTF4 0
ASGNF4
ADDRLP4 0+24+4
CNSTF4 0
ASGNF4
ADDRLP4 0+24+8
CNSTF4 0
ASGNF4
line 1623
;1623:	initmove.viewoffset[2] += bs->cur_ps.viewheight;
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1624
;1624:	initmove.entitynum = bs->entitynum;
ADDRLP4 0+36
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1625
;1625:	initmove.client = bs->client;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1626
;1626:	initmove.thinktime = bs->thinktime;
ADDRLP4 0+44
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ASGNF4
line 1628
;1627:	//set the onground flag
;1628:	if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE) initmove.or_moveflags |= MFL_ONGROUND;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $369
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $369
line 1630
;1629:	//set the teleported flag
;1630:	if ((bs->cur_ps.pm_flags & PMF_TIME_KNOCKBACK) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $372
ADDRLP4 68
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
LEI4 $372
line 1631
;1631:		initmove.or_moveflags |= MFL_TELEPORTED;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1632
;1632:	}
LABELV $372
line 1634
;1633:	//set the waterjump flag
;1634:	if ((bs->cur_ps.pm_flags & PMF_TIME_WATERJUMP) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $375
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
LEI4 $375
line 1635
;1635:		initmove.or_moveflags |= MFL_WATERJUMP;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1636
;1636:	}
LABELV $375
line 1638
;1637:	//set presence type
;1638:	if (bs->cur_ps.pm_flags & PMF_DUCKED) initmove.presencetype = PRESENCE_CROUCH;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $378
ADDRLP4 0+48
CNSTI4 4
ASGNI4
ADDRGP4 $379
JUMPV
LABELV $378
line 1639
;1639:	else initmove.presencetype = PRESENCE_NORMAL;
ADDRLP4 0+48
CNSTI4 2
ASGNI4
LABELV $379
line 1641
;1640:	//
;1641:	if (bs->walker > 0.5) initmove.or_moveflags |= MFL_WALK;
ADDRFP4 0
INDIRP4
CNSTI4 6056
ADDP4
INDIRF4
CNSTF4 1056964608
LEF4 $382
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $382
line 1643
;1642:	//
;1643:	VectorCopy(bs->viewangles, initmove.viewangles);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
INDIRB
ASGNB 12
line 1645
;1644:	//
;1645:	trap_BotInitMoveState(bs->ms, &initmove);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotInitMoveState
CALLV
pop
line 1646
;1646:}
LABELV $357
endproc BotSetupForMovement 76 12
export BotCheckItemPickup
proc BotCheckItemPickup 0 0
line 1653
;1647:
;1648:/*
;1649:==================
;1650:BotCheckItemPickup
;1651:==================
;1652:*/
;1653:void BotCheckItemPickup(bot_state_t *bs, int *oldinventory) {
line 1748
;1654:#ifdef MISSIONPACK
;1655:	int offence, leader;
;1656:
;1657:	if (gametype <= GT_TEAM)
;1658:		return;
;1659:
;1660:	offence = -1;
;1661:	// go into offence if picked up the kamikaze or invulnerability
;1662:	if (!oldinventory[INVENTORY_KAMIKAZE] && bs->inventory[INVENTORY_KAMIKAZE] >= 1) {
;1663:		offence = qtrue;
;1664:	}
;1665:	if (!oldinventory[INVENTORY_INVULNERABILITY] && bs->inventory[INVENTORY_INVULNERABILITY] >= 1) {
;1666:		offence = qtrue;
;1667:	}
;1668:	// if not already wearing the kamikaze or invulnerability
;1669:	if (!bs->inventory[INVENTORY_KAMIKAZE] && !bs->inventory[INVENTORY_INVULNERABILITY]) {
;1670:		if (!oldinventory[INVENTORY_SCOUT] && bs->inventory[INVENTORY_SCOUT] >= 1) {
;1671:			offence = qtrue;
;1672:		}
;1673:		if (!oldinventory[INVENTORY_GUARD] && bs->inventory[INVENTORY_GUARD] >= 1) {
;1674:			offence = qtrue;
;1675:		}
;1676:		if (!oldinventory[INVENTORY_DOUBLER] && bs->inventory[INVENTORY_DOUBLER] >= 1) {
;1677:			offence = qfalse;
;1678:		}
;1679:		if (!oldinventory[INVENTORY_AMMOREGEN] && bs->inventory[INVENTORY_AMMOREGEN] >= 1) {
;1680:			offence = qfalse;
;1681:		}
;1682:	}
;1683:
;1684:	if (offence >= 0) {
;1685:		leader = ClientFromName(bs->teamleader);
;1686:		if (offence) {
;1687:			if (!(bs->teamtaskpreference & TEAMTP_ATTACKER)) {
;1688:				// if we have a bot team leader
;1689:				if (BotTeamLeader(bs)) {
;1690:					// tell the leader we want to be on offence
;1691:#ifdef MISSIONPACK
;1692:					BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1693:#endif
;1694:					//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1695:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1696:				}
;1697:				else if (g_spSkill.integer <= 3) {
;1698:					if ( bs->ltgtype != LTG_GETFLAG &&
;1699:						 bs->ltgtype != LTG_ATTACKENEMYBASE &&
;1700:						 bs->ltgtype != LTG_HARVEST ) {
;1701:						//
;1702:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1703:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
;1704:							// tell the leader we want to be on offence
;1705:#ifdef MISSIONPACK
;1706:							BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1707:#endif
;1708:							//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1709:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1710:						}
;1711:					}
;1712:				}
;1713:				bs->teamtaskpreference |= TEAMTP_ATTACKER;
;1714:			}
;1715:			bs->teamtaskpreference &= ~TEAMTP_DEFENDER;
;1716:		}
;1717:		else {
;1718:			if (!(bs->teamtaskpreference & TEAMTP_DEFENDER)) {
;1719:				// if we have a bot team leader
;1720:				if (BotTeamLeader(bs)) {
;1721:					// tell the leader we want to be on defense
;1722:#ifdef MISSIONPACK
;1723:					BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1724:#endif
;1725:					//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1726:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1727:				}
;1728:				else if (g_spSkill.integer <= 3) {
;1729:					if ( bs->ltgtype != LTG_DEFENDKEYAREA ) {
;1730:						//
;1731:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1732:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
;1733:							// tell the leader we want to be on defense
;1734:#ifdef MISSIONPACK
;1735:							BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1736:#endif
;1737:							//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1738:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1739:						}
;1740:					}
;1741:				}
;1742:				bs->teamtaskpreference |= TEAMTP_DEFENDER;
;1743:			}
;1744:			bs->teamtaskpreference &= ~TEAMTP_ATTACKER;
;1745:		}
;1746:	}
;1747:#endif
;1748:}
LABELV $386
endproc BotCheckItemPickup 0 0
export BotUpdateInventory
proc BotUpdateInventory 1224 12
line 1755
;1749:
;1750:/*
;1751:==================
;1752:BotUpdateInventory
;1753:==================
;1754:*/
;1755:void BotUpdateInventory(bot_state_t *bs) {
line 1758
;1756:	int oldinventory[MAX_ITEMS];
;1757:
;1758:	memcpy(oldinventory, bs->inventory, sizeof(oldinventory));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1760
;1759:	//armor
;1760:	bs->inventory[INVENTORY_ARMOR] = bs->cur_ps.stats[STAT_ARMOR];
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 4956
ADDP4
ADDRLP4 1024
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 1762
;1761:	//weapons
;1762:	bs->inventory[INVENTORY_GAUNTLET] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GAUNTLET)) != 0;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $389
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $390
JUMPV
LABELV $389
ADDRLP4 1028
CNSTI4 0
ASGNI4
LABELV $390
ADDRLP4 1032
INDIRP4
CNSTI4 4968
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 1763
;1763:	bs->inventory[INVENTORY_SHOTGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SHOTGUN)) != 0;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $392
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $393
JUMPV
LABELV $392
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $393
ADDRLP4 1040
INDIRP4
CNSTI4 4972
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 1764
;1764:	bs->inventory[INVENTORY_MACHINEGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_MACHINEGUN)) != 0;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $395
ADDRLP4 1044
CNSTI4 1
ASGNI4
ADDRGP4 $396
JUMPV
LABELV $395
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $396
ADDRLP4 1048
INDIRP4
CNSTI4 4976
ADDP4
ADDRLP4 1044
INDIRI4
ASGNI4
line 1765
;1765:	bs->inventory[INVENTORY_GRENADELAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRENADE_LAUNCHER)) != 0;
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $398
ADDRLP4 1052
CNSTI4 1
ASGNI4
ADDRGP4 $399
JUMPV
LABELV $398
ADDRLP4 1052
CNSTI4 0
ASGNI4
LABELV $399
ADDRLP4 1056
INDIRP4
CNSTI4 4980
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1766
;1766:	bs->inventory[INVENTORY_ROCKETLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_ROCKET_LAUNCHER)) != 0;
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $401
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $402
JUMPV
LABELV $401
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $402
ADDRLP4 1064
INDIRP4
CNSTI4 4984
ADDP4
ADDRLP4 1060
INDIRI4
ASGNI4
line 1767
;1767:	bs->inventory[INVENTORY_LIGHTNING] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_LIGHTNING)) != 0;
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $404
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $405
JUMPV
LABELV $404
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $405
ADDRLP4 1072
INDIRP4
CNSTI4 4988
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1768
;1768:	bs->inventory[INVENTORY_RAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_RAILGUN)) != 0;
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $407
ADDRLP4 1076
CNSTI4 1
ASGNI4
ADDRGP4 $408
JUMPV
LABELV $407
ADDRLP4 1076
CNSTI4 0
ASGNI4
LABELV $408
ADDRLP4 1080
INDIRP4
CNSTI4 4992
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 1769
;1769:	bs->inventory[INVENTORY_PLASMAGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PLASMAGUN)) != 0;
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $410
ADDRLP4 1084
CNSTI4 1
ASGNI4
ADDRGP4 $411
JUMPV
LABELV $410
ADDRLP4 1084
CNSTI4 0
ASGNI4
LABELV $411
ADDRLP4 1088
INDIRP4
CNSTI4 4996
ADDP4
ADDRLP4 1084
INDIRI4
ASGNI4
line 1770
;1770:	bs->inventory[INVENTORY_BFG10K] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_BFG)) != 0;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $413
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $414
JUMPV
LABELV $413
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $414
ADDRLP4 1096
INDIRP4
CNSTI4 5004
ADDP4
ADDRLP4 1092
INDIRI4
ASGNI4
line 1771
;1771:	bs->inventory[INVENTORY_GRAPPLINGHOOK] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRAPPLING_HOOK)) != 0;
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $416
ADDRLP4 1100
CNSTI4 1
ASGNI4
ADDRGP4 $417
JUMPV
LABELV $416
ADDRLP4 1100
CNSTI4 0
ASGNI4
LABELV $417
ADDRLP4 1104
INDIRP4
CNSTI4 5008
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
line 1778
;1772:#ifdef MISSIONPACK
;1773:	bs->inventory[INVENTORY_NAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_NAILGUN)) != 0;;
;1774:	bs->inventory[INVENTORY_PROXLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PROX_LAUNCHER)) != 0;;
;1775:	bs->inventory[INVENTORY_CHAINGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_CHAINGUN)) != 0;;
;1776:#endif
;1777:	//ammo
;1778:	bs->inventory[INVENTORY_SHELLS] = bs->cur_ps.ammo[WP_SHOTGUN];
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 5024
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ASGNI4
line 1779
;1779:	bs->inventory[INVENTORY_BULLETS] = bs->cur_ps.ammo[WP_MACHINEGUN];
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 5028
ADDP4
ADDRLP4 1112
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
ASGNI4
line 1780
;1780:	bs->inventory[INVENTORY_GRENADES] = bs->cur_ps.ammo[WP_GRENADE_LAUNCHER];
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 5032
ADDP4
ADDRLP4 1116
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
ASGNI4
line 1781
;1781:	bs->inventory[INVENTORY_CELLS] = bs->cur_ps.ammo[WP_PLASMAGUN];
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 5036
ADDP4
ADDRLP4 1120
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 1782
;1782:	bs->inventory[INVENTORY_LIGHTNINGAMMO] = bs->cur_ps.ammo[WP_LIGHTNING];
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 5040
ADDP4
ADDRLP4 1124
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 1783
;1783:	bs->inventory[INVENTORY_ROCKETS] = bs->cur_ps.ammo[WP_ROCKET_LAUNCHER];
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 5044
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 1784
;1784:	bs->inventory[INVENTORY_SLUGS] = bs->cur_ps.ammo[WP_RAILGUN];
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 5048
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 1785
;1785:	bs->inventory[INVENTORY_BFGAMMO] = bs->cur_ps.ammo[WP_BFG];
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 5052
ADDP4
ADDRLP4 1136
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 1792
;1786:#ifdef MISSIONPACK
;1787:	bs->inventory[INVENTORY_NAILS] = bs->cur_ps.ammo[WP_NAILGUN];
;1788:	bs->inventory[INVENTORY_MINES] = bs->cur_ps.ammo[WP_PROX_LAUNCHER];
;1789:	bs->inventory[INVENTORY_BELT] = bs->cur_ps.ammo[WP_CHAINGUN];
;1790:#endif
;1791:	//powerups
;1792:	bs->inventory[INVENTORY_HEALTH] = bs->cur_ps.stats[STAT_HEALTH];
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 5068
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1793
;1793:	bs->inventory[INVENTORY_TELEPORTER] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_TELEPORTER;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 26
NEI4 $419
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRGP4 $420
JUMPV
LABELV $419
ADDRLP4 1144
CNSTI4 0
ASGNI4
LABELV $420
ADDRLP4 1148
INDIRP4
CNSTI4 5072
ADDP4
ADDRLP4 1144
INDIRI4
ASGNI4
line 1794
;1794:	bs->inventory[INVENTORY_MEDKIT] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_MEDKIT;
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 27
NEI4 $422
ADDRLP4 1152
CNSTI4 1
ASGNI4
ADDRGP4 $423
JUMPV
LABELV $422
ADDRLP4 1152
CNSTI4 0
ASGNI4
LABELV $423
ADDRLP4 1156
INDIRP4
CNSTI4 5076
ADDP4
ADDRLP4 1152
INDIRI4
ASGNI4
line 1800
;1795:#ifdef MISSIONPACK
;1796:	bs->inventory[INVENTORY_KAMIKAZE] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_KAMIKAZE;
;1797:	bs->inventory[INVENTORY_PORTAL] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_PORTAL;
;1798:	bs->inventory[INVENTORY_INVULNERABILITY] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_INVULNERABILITY;
;1799:#endif
;1800:	bs->inventory[INVENTORY_QUAD] = bs->cur_ps.powerups[PW_QUAD] != 0;
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $425
ADDRLP4 1160
CNSTI4 1
ASGNI4
ADDRGP4 $426
JUMPV
LABELV $425
ADDRLP4 1160
CNSTI4 0
ASGNI4
LABELV $426
ADDRLP4 1164
INDIRP4
CNSTI4 5092
ADDP4
ADDRLP4 1160
INDIRI4
ASGNI4
line 1801
;1801:	bs->inventory[INVENTORY_ENVIRONMENTSUIT] = bs->cur_ps.powerups[PW_BATTLESUIT] != 0;
ADDRLP4 1172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $428
ADDRLP4 1168
CNSTI4 1
ASGNI4
ADDRGP4 $429
JUMPV
LABELV $428
ADDRLP4 1168
CNSTI4 0
ASGNI4
LABELV $429
ADDRLP4 1172
INDIRP4
CNSTI4 5096
ADDP4
ADDRLP4 1168
INDIRI4
ASGNI4
line 1802
;1802:	bs->inventory[INVENTORY_HASTE] = bs->cur_ps.powerups[PW_HASTE] != 0;
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $431
ADDRLP4 1176
CNSTI4 1
ASGNI4
ADDRGP4 $432
JUMPV
LABELV $431
ADDRLP4 1176
CNSTI4 0
ASGNI4
LABELV $432
ADDRLP4 1180
INDIRP4
CNSTI4 5100
ADDP4
ADDRLP4 1176
INDIRI4
ASGNI4
line 1803
;1803:	bs->inventory[INVENTORY_INVISIBILITY] = bs->cur_ps.powerups[PW_INVIS] != 0;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $434
ADDRLP4 1184
CNSTI4 1
ASGNI4
ADDRGP4 $435
JUMPV
LABELV $434
ADDRLP4 1184
CNSTI4 0
ASGNI4
LABELV $435
ADDRLP4 1188
INDIRP4
CNSTI4 5104
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 1804
;1804:	bs->inventory[INVENTORY_REGEN] = bs->cur_ps.powerups[PW_REGEN] != 0;
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $437
ADDRLP4 1192
CNSTI4 1
ASGNI4
ADDRGP4 $438
JUMPV
LABELV $437
ADDRLP4 1192
CNSTI4 0
ASGNI4
LABELV $438
ADDRLP4 1196
INDIRP4
CNSTI4 5108
ADDP4
ADDRLP4 1192
INDIRI4
ASGNI4
line 1805
;1805:	bs->inventory[INVENTORY_FLIGHT] = bs->cur_ps.powerups[PW_FLIGHT] != 0;
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $440
ADDRLP4 1200
CNSTI4 1
ASGNI4
ADDRGP4 $441
JUMPV
LABELV $440
ADDRLP4 1200
CNSTI4 0
ASGNI4
LABELV $441
ADDRLP4 1204
INDIRP4
CNSTI4 5112
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 1812
;1806:#ifdef MISSIONPACK
;1807:	bs->inventory[INVENTORY_SCOUT] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_SCOUT;
;1808:	bs->inventory[INVENTORY_GUARD] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_GUARD;
;1809:	bs->inventory[INVENTORY_DOUBLER] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_DOUBLER;
;1810:	bs->inventory[INVENTORY_AMMOREGEN] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_AMMOREGEN;
;1811:#endif
;1812:	bs->inventory[INVENTORY_REDFLAG] = bs->cur_ps.powerups[PW_REDFLAG] != 0;
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $443
ADDRLP4 1208
CNSTI4 1
ASGNI4
ADDRGP4 $444
JUMPV
LABELV $443
ADDRLP4 1208
CNSTI4 0
ASGNI4
LABELV $444
ADDRLP4 1212
INDIRP4
CNSTI4 5132
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 1813
;1813:	bs->inventory[INVENTORY_BLUEFLAG] = bs->cur_ps.powerups[PW_BLUEFLAG] != 0;
ADDRLP4 1220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $446
ADDRLP4 1216
CNSTI4 1
ASGNI4
ADDRGP4 $447
JUMPV
LABELV $446
ADDRLP4 1216
CNSTI4 0
ASGNI4
LABELV $447
ADDRLP4 1220
INDIRP4
CNSTI4 5136
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 1825
;1814:#ifdef MISSIONPACK
;1815:	bs->inventory[INVENTORY_NEUTRALFLAG] = bs->cur_ps.powerups[PW_NEUTRALFLAG] != 0;
;1816:	if (BotTeam(bs) == TEAM_RED) {
;1817:		bs->inventory[INVENTORY_REDCUBE] = bs->cur_ps.generic1;
;1818:		bs->inventory[INVENTORY_BLUECUBE] = 0;
;1819:	}
;1820:	else {
;1821:		bs->inventory[INVENTORY_REDCUBE] = 0;
;1822:		bs->inventory[INVENTORY_BLUECUBE] = bs->cur_ps.generic1;
;1823:	}
;1824:#endif
;1825:	BotCheckItemPickup(bs, oldinventory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckItemPickup
CALLV
pop
line 1826
;1826:}
LABELV $387
endproc BotUpdateInventory 1224 12
export BotUpdateBattleInventory
proc BotUpdateBattleInventory 160 8
line 1833
;1827:
;1828:/*
;1829:==================
;1830:BotUpdateBattleInventory
;1831:==================
;1832:*/
;1833:void BotUpdateBattleInventory(bot_state_t *bs, int enemy) {
line 1837
;1834:	vec3_t dir;
;1835:	aas_entityinfo_t entinfo;
;1836:
;1837:	BotEntityInfo(enemy, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1838
;1838:	VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+24
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1839
;1839:	bs->inventory[ENEMY_HEIGHT] = (int) dir[2];
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
ADDRLP4 0+8
INDIRF4
CVFI4 4
ASGNI4
line 1840
;1840:	dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1841
;1841:	bs->inventory[ENEMY_HORIZONTAL_DIST] = (int) VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 5752
ADDP4
ADDRLP4 156
INDIRF4
CVFI4 4
ASGNI4
line 1843
;1842:	//FIXME: add num visible enemies and num visible team mates to the inventory
;1843:}
LABELV $448
endproc BotUpdateBattleInventory 160 8
export BotBattleUseItems
proc BotBattleUseItems 4 4
line 2070
;1844:
;1845:#ifdef MISSIONPACK
;1846:/*
;1847:==================
;1848:BotUseKamikaze
;1849:==================
;1850:*/
;1851:#define KAMIKAZE_DIST		1024
;1852:
;1853:void BotUseKamikaze(bot_state_t *bs) {
;1854:	int c, teammates, enemies;
;1855:	aas_entityinfo_t entinfo;
;1856:	vec3_t dir, target;
;1857:	bot_goal_t *goal;
;1858:	bsp_trace_t trace;
;1859:
;1860:	//if the bot has no kamikaze
;1861:	if (bs->inventory[INVENTORY_KAMIKAZE] <= 0)
;1862:		return;
;1863:	if (bs->kamikaze_time > FloatTime())
;1864:		return;
;1865:	bs->kamikaze_time = FloatTime() + 0.2;
;1866:	if (gametype == GT_CTF) {
;1867:		//never use kamikaze if the team flag carrier is visible
;1868:		if (BotCTFCarryingFlag(bs))
;1869:			return;
;1870:		c = BotTeamFlagCarrierVisible(bs);
;1871:		if (c >= 0) {
;1872:			BotEntityInfo(c, &entinfo);
;1873:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1874:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1875:				return;
;1876:		}
;1877:		c = BotEnemyFlagCarrierVisible(bs);
;1878:		if (c >= 0) {
;1879:			BotEntityInfo(c, &entinfo);
;1880:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1881:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1882:				trap_EA_Use(bs->client);
;1883:				return;
;1884:			}
;1885:		}
;1886:	}
;1887:	else if (gametype == GT_1FCTF) {
;1888:		//never use kamikaze if the team flag carrier is visible
;1889:		if (Bot1FCTFCarryingFlag(bs))
;1890:			return;
;1891:		c = BotTeamFlagCarrierVisible(bs);
;1892:		if (c >= 0) {
;1893:			BotEntityInfo(c, &entinfo);
;1894:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1895:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1896:				return;
;1897:		}
;1898:		c = BotEnemyFlagCarrierVisible(bs);
;1899:		if (c >= 0) {
;1900:			BotEntityInfo(c, &entinfo);
;1901:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1902:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1903:				trap_EA_Use(bs->client);
;1904:				return;
;1905:			}
;1906:		}
;1907:	}
;1908:	else if (gametype == GT_OBELISK) {
;1909:		switch(BotTeam(bs)) {
;1910:			case TEAM_RED: goal = &blueobelisk; break;
;1911:			default: goal = &redobelisk; break;
;1912:		}
;1913:		//if the obelisk is visible
;1914:		VectorCopy(goal->origin, target);
;1915:		target[2] += 1;
;1916:		VectorSubtract(bs->origin, target, dir);
;1917:		if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST * 0.9)) {
;1918:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1919:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1920:				trap_EA_Use(bs->client);
;1921:				return;
;1922:			}
;1923:		}
;1924:	}
;1925:	else if (gametype == GT_HARVESTER) {
;1926:		//
;1927:		if (BotHarvesterCarryingCubes(bs))
;1928:			return;
;1929:		//never use kamikaze if a team mate carrying cubes is visible
;1930:		c = BotTeamCubeCarrierVisible(bs);
;1931:		if (c >= 0) {
;1932:			BotEntityInfo(c, &entinfo);
;1933:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1934:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1935:				return;
;1936:		}
;1937:		c = BotEnemyCubeCarrierVisible(bs);
;1938:		if (c >= 0) {
;1939:			BotEntityInfo(c, &entinfo);
;1940:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1941:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1942:				trap_EA_Use(bs->client);
;1943:				return;
;1944:			}
;1945:		}
;1946:	}
;1947:	//
;1948:	BotVisibleTeamMatesAndEnemies(bs, &teammates, &enemies, KAMIKAZE_DIST);
;1949:	//
;1950:	if (enemies > 2 && enemies > teammates+1) {
;1951:		trap_EA_Use(bs->client);
;1952:		return;
;1953:	}
;1954:}
;1955:
;1956:/*
;1957:==================
;1958:BotUseInvulnerability
;1959:==================
;1960:*/
;1961:void BotUseInvulnerability(bot_state_t *bs) {
;1962:	int c;
;1963:	vec3_t dir, target;
;1964:	bot_goal_t *goal;
;1965:	bsp_trace_t trace;
;1966:
;1967:	//if the bot has no invulnerability
;1968:	if (bs->inventory[INVENTORY_INVULNERABILITY] <= 0)
;1969:		return;
;1970:	if (bs->invulnerability_time > FloatTime())
;1971:		return;
;1972:	bs->invulnerability_time = FloatTime() + 0.2;
;1973:	if (gametype == GT_CTF) {
;1974:		//never use kamikaze if the team flag carrier is visible
;1975:		if (BotCTFCarryingFlag(bs))
;1976:			return;
;1977:		c = BotEnemyFlagCarrierVisible(bs);
;1978:		if (c >= 0)
;1979:			return;
;1980:		//if near enemy flag and the flag is visible
;1981:		switch(BotTeam(bs)) {
;1982:			case TEAM_RED: goal = &ctf_blueflag; break;
;1983:			default: goal = &ctf_redflag; break;
;1984:		}
;1985:		//if the obelisk is visible
;1986:		VectorCopy(goal->origin, target);
;1987:		target[2] += 1;
;1988:		VectorSubtract(bs->origin, target, dir);
;1989:		if (VectorLengthSquared(dir) < Square(200)) {
;1990:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1991:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1992:				trap_EA_Use(bs->client);
;1993:				return;
;1994:			}
;1995:		}
;1996:	}
;1997:	else if (gametype == GT_1FCTF) {
;1998:		//never use kamikaze if the team flag carrier is visible
;1999:		if (Bot1FCTFCarryingFlag(bs))
;2000:			return;
;2001:		c = BotEnemyFlagCarrierVisible(bs);
;2002:		if (c >= 0)
;2003:			return;
;2004:		//if near enemy flag and the flag is visible
;2005:		switch(BotTeam(bs)) {
;2006:			case TEAM_RED: goal = &ctf_blueflag; break;
;2007:			default: goal = &ctf_redflag; break;
;2008:		}
;2009:		//if the obelisk is visible
;2010:		VectorCopy(goal->origin, target);
;2011:		target[2] += 1;
;2012:		VectorSubtract(bs->origin, target, dir);
;2013:		if (VectorLengthSquared(dir) < Square(200)) {
;2014:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2015:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2016:				trap_EA_Use(bs->client);
;2017:				return;
;2018:			}
;2019:		}
;2020:	}
;2021:	else if (gametype == GT_OBELISK) {
;2022:		switch(BotTeam(bs)) {
;2023:			case TEAM_RED: goal = &blueobelisk; break;
;2024:			default: goal = &redobelisk; break;
;2025:		}
;2026:		//if the obelisk is visible
;2027:		VectorCopy(goal->origin, target);
;2028:		target[2] += 1;
;2029:		VectorSubtract(bs->origin, target, dir);
;2030:		if (VectorLengthSquared(dir) < Square(300)) {
;2031:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2032:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2033:				trap_EA_Use(bs->client);
;2034:				return;
;2035:			}
;2036:		}
;2037:	}
;2038:	else if (gametype == GT_HARVESTER) {
;2039:		//
;2040:		if (BotHarvesterCarryingCubes(bs))
;2041:			return;
;2042:		c = BotEnemyCubeCarrierVisible(bs);
;2043:		if (c >= 0)
;2044:			return;
;2045:		//if near enemy base and enemy base is visible
;2046:		switch(BotTeam(bs)) {
;2047:			case TEAM_RED: goal = &blueobelisk; break;
;2048:			default: goal = &redobelisk; break;
;2049:		}
;2050:		//if the obelisk is visible
;2051:		VectorCopy(goal->origin, target);
;2052:		target[2] += 1;
;2053:		VectorSubtract(bs->origin, target, dir);
;2054:		if (VectorLengthSquared(dir) < Square(200)) {
;2055:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2056:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2057:				trap_EA_Use(bs->client);
;2058:				return;
;2059:			}
;2060:		}
;2061:	}
;2062:}
;2063:#endif
;2064:
;2065:/*
;2066:==================
;2067:BotBattleUseItems
;2068:==================
;2069:*/
;2070:void BotBattleUseItems(bot_state_t *bs) {
line 2071
;2071:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $459
line 2072
;2072:		if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $461
line 2073
;2073:			if (!BotCTFCarryingFlag(bs)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $463
line 2078
;2074:#ifdef MISSIONPACK
;2075:				&& !Bot1FCTFCarryingFlag(bs)
;2076:				&& !BotHarvesterCarryingCubes(bs)
;2077:#endif
;2078:				) {
line 2079
;2079:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2080
;2080:			}
LABELV $463
line 2081
;2081:		}
LABELV $461
line 2082
;2082:	}
LABELV $459
line 2083
;2083:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $465
line 2084
;2084:		if (bs->inventory[INVENTORY_MEDKIT] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5076
ADDP4
INDIRI4
CNSTI4 0
LEI4 $467
line 2085
;2085:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2086
;2086:		}
LABELV $467
line 2087
;2087:	}
LABELV $465
line 2092
;2088:#ifdef MISSIONPACK
;2089:	BotUseKamikaze(bs);
;2090:	BotUseInvulnerability(bs);
;2091:#endif
;2092:}
LABELV $458
endproc BotBattleUseItems 4 4
export BotSetTeleportTime
proc BotSetTeleportTime 8 0
line 2099
;2093:
;2094:/*
;2095:==================
;2096:BotSetTeleportTime
;2097:==================
;2098:*/
;2099:void BotSetTeleportTime(bot_state_t *bs) {
line 2100
;2100:	if ((bs->cur_ps.eFlags ^ bs->last_eFlags) & EF_TELEPORT_BIT) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $470
line 2101
;2101:		bs->teleport_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2102
;2102:	}
LABELV $470
line 2103
;2103:	bs->last_eFlags = bs->cur_ps.eFlags;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ASGNI4
line 2104
;2104:}
LABELV $469
endproc BotSetTeleportTime 8 0
export BotIsDead
proc BotIsDead 4 0
line 2111
;2105:
;2106:/*
;2107:==================
;2108:BotIsDead
;2109:==================
;2110:*/
;2111:qboolean BotIsDead(bot_state_t *bs) {
line 2112
;2112:	return (bs->cur_ps.pm_type == PM_DEAD);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 3
NEI4 $474
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $475
JUMPV
LABELV $474
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $475
ADDRLP4 0
INDIRI4
RETI4
LABELV $472
endproc BotIsDead 4 0
export BotIsObserver
proc BotIsObserver 1032 12
line 2120
;2113:}
;2114:
;2115:/*
;2116:==================
;2117:BotIsObserver
;2118:==================
;2119:*/
;2120:qboolean BotIsObserver(bot_state_t *bs) {
line 2122
;2121:	char buf[MAX_INFO_STRING];
;2122:	if (bs->cur_ps.pm_type == PM_SPECTATOR) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
NEI4 $477
CNSTI4 1
RETI4
ADDRGP4 $476
JUMPV
LABELV $477
line 2123
;2123:	trap_GetConfigstring(CS_PLAYERS+bs->client, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
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
line 2124
;2124:	if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) return qtrue;
ADDRLP4 0
ARGP4
ADDRGP4 $69
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 3
NEI4 $479
CNSTI4 1
RETI4
ADDRGP4 $476
JUMPV
LABELV $479
line 2125
;2125:	return qfalse;
CNSTI4 0
RETI4
LABELV $476
endproc BotIsObserver 1032 12
export BotIntermission
proc BotIntermission 8 0
line 2133
;2126:}
;2127:
;2128:/*
;2129:==================
;2130:BotIntermission
;2131:==================
;2132:*/
;2133:qboolean BotIntermission(bot_state_t *bs) {
line 2135
;2134:	//NOTE: we shouldn't be looking at the game code...
;2135:	if (level.intermissiontime) return qtrue;
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $482
CNSTI4 1
RETI4
ADDRGP4 $481
JUMPV
LABELV $482
line 2136
;2136:	return (bs->cur_ps.pm_type == PM_FREEZE || bs->cur_ps.pm_type == PM_INTERMISSION);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
EQI4 $488
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 5
NEI4 $486
LABELV $488
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $487
JUMPV
LABELV $486
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $487
ADDRLP4 0
INDIRI4
RETI4
LABELV $481
endproc BotIntermission 8 0
export BotInLavaOrSlime
proc BotInLavaOrSlime 16 4
line 2144
;2137:}
;2138:
;2139:/*
;2140:==================
;2141:BotInLavaOrSlime
;2142:==================
;2143:*/
;2144:qboolean BotInLavaOrSlime(bot_state_t *bs) {
line 2147
;2145:	vec3_t feet;
;2146:
;2147:	VectorCopy(bs->origin, feet);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2148
;2148:	feet[2] -= 23;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1102577664
SUBF4
ASGNF4
line 2149
;2149:	return (trap_AAS_PointContents(feet) & (CONTENTS_LAVA|CONTENTS_SLIME));
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 24
BANDI4
RETI4
LABELV $489
endproc BotInLavaOrSlime 16 4
data
align 4
LABELV $492
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $493
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCreateWayPoint
code
proc BotCreateWayPoint 32 12
line 2157
;2150:}
;2151:
;2152:/*
;2153:==================
;2154:BotCreateWayPoint
;2155:==================
;2156:*/
;2157:bot_waypoint_t *BotCreateWayPoint(char *name, vec3_t origin, int areanum) {
line 2159
;2158:	bot_waypoint_t *wp;
;2159:	vec3_t waypointmins = {-8, -8, -8}, waypointmaxs = {8, 8, 8};
ADDRLP4 4
ADDRGP4 $492
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $493
INDIRB
ASGNB 12
line 2161
;2160:
;2161:	wp = botai_freewaypoints;
ADDRLP4 0
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2162
;2162:	if ( !wp ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $494
line 2163
;2163:		BotAI_Print( PRT_WARNING, "BotCreateWayPoint: Out of waypoints\n" );
CNSTI4 2
ARGI4
ADDRGP4 $496
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 2164
;2164:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $491
JUMPV
LABELV $494
line 2166
;2165:	}
;2166:	botai_freewaypoints = botai_freewaypoints->next;
ADDRLP4 28
ADDRGP4 botai_freewaypoints
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2168
;2167:
;2168:	Q_strncpyz( wp->name, name, sizeof(wp->name) );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2169
;2169:	VectorCopy(origin, wp->goal.origin);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2170
;2170:	VectorCopy(waypointmins, wp->goal.mins);
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2171
;2171:	VectorCopy(waypointmaxs, wp->goal.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2172
;2172:	wp->goal.areanum = areanum;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2173
;2173:	wp->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTP4 0
ASGNP4
line 2174
;2174:	wp->prev = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTP4 0
ASGNP4
line 2175
;2175:	return wp;
ADDRLP4 0
INDIRP4
RETP4
LABELV $491
endproc BotCreateWayPoint 32 12
export BotFindWayPoint
proc BotFindWayPoint 8 8
line 2183
;2176:}
;2177:
;2178:/*
;2179:==================
;2180:BotFindWayPoint
;2181:==================
;2182:*/
;2183:bot_waypoint_t *BotFindWayPoint(bot_waypoint_t *waypoints, char *name) {
line 2186
;2184:	bot_waypoint_t *wp;
;2185:
;2186:	for (wp = waypoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $501
JUMPV
LABELV $498
line 2187
;2187:		if (!Q_stricmp(wp->name, name)) return wp;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $502
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $497
JUMPV
LABELV $502
line 2188
;2188:	}
LABELV $499
line 2186
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $501
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $498
line 2189
;2189:	return NULL;
CNSTP4 0
RETP4
LABELV $497
endproc BotFindWayPoint 8 8
export BotFreeWaypoints
proc BotFreeWaypoints 4 0
line 2197
;2190:}
;2191:
;2192:/*
;2193:==================
;2194:BotFreeWaypoints
;2195:==================
;2196:*/
;2197:void BotFreeWaypoints(bot_waypoint_t *wp) {
line 2200
;2198:	bot_waypoint_t *nextwp;
;2199:
;2200:	for (; wp; wp = nextwp) {
ADDRGP4 $508
JUMPV
LABELV $505
line 2201
;2201:		nextwp = wp->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2202
;2202:		wp->next = botai_freewaypoints;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2203
;2203:		botai_freewaypoints = wp;
ADDRGP4 botai_freewaypoints
ADDRFP4 0
INDIRP4
ASGNP4
line 2204
;2204:	}
LABELV $506
line 2200
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $508
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $505
line 2205
;2205:}
LABELV $504
endproc BotFreeWaypoints 4 0
export BotInitWaypoints
proc BotInitWaypoints 4 0
line 2212
;2206:
;2207:/*
;2208:==================
;2209:BotInitWaypoints
;2210:==================
;2211:*/
;2212:void BotInitWaypoints(void) {
line 2215
;2213:	int i;
;2214:
;2215:	botai_freewaypoints = NULL;
ADDRGP4 botai_freewaypoints
CNSTP4 0
ASGNP4
line 2216
;2216:	for (i = 0; i < MAX_WAYPOINTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $510
line 2217
;2217:		botai_waypoints[i].next = botai_freewaypoints;
ADDRLP4 0
INDIRI4
CNSTI4 100
MULI4
ADDRGP4 botai_waypoints+92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2218
;2218:		botai_freewaypoints = &botai_waypoints[i];
ADDRGP4 botai_freewaypoints
ADDRLP4 0
INDIRI4
CNSTI4 100
MULI4
ADDRGP4 botai_waypoints
ADDP4
ASGNP4
line 2219
;2219:	}
LABELV $511
line 2216
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $510
line 2220
;2220:}
LABELV $509
endproc BotInitWaypoints 4 0
export TeamPlayIsOn
proc TeamPlayIsOn 4 0
line 2227
;2221:
;2222:/*
;2223:==================
;2224:TeamPlayIsOn
;2225:==================
;2226:*/
;2227:int TeamPlayIsOn(void) {
line 2228
;2228:	return ( gametype >= GT_TEAM );
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $517
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $518
JUMPV
LABELV $517
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $518
ADDRLP4 0
INDIRI4
RETI4
LABELV $515
endproc TeamPlayIsOn 4 0
export BotAggression
proc BotAggression 28 0
line 2236
;2229:}
;2230:
;2231:/*
;2232:==================
;2233:BotAggression
;2234:==================
;2235:*/
;2236:float BotAggression(bot_state_t *bs) {
line 2238
;2237:	//if the bot has quad
;2238:	if (bs->inventory[INVENTORY_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $520
line 2240
;2239:		//if the bot is not holding the gauntlet or the enemy is really nearby
;2240:		if (bs->weaponnum != WP_GAUNTLET ||
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $524
ADDRLP4 0
INDIRP4
CNSTI4 5752
ADDP4
INDIRI4
CNSTI4 80
GEI4 $522
LABELV $524
line 2241
;2241:			bs->inventory[ENEMY_HORIZONTAL_DIST] < 80) {
line 2242
;2242:			return 70;
CNSTF4 1116471296
RETF4
ADDRGP4 $519
JUMPV
LABELV $522
line 2244
;2243:		}
;2244:	}
LABELV $520
line 2246
;2245:	//if the enemy is located way higher than the bot
;2246:	if (bs->inventory[ENEMY_HEIGHT] > 200) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
INDIRI4
CNSTI4 200
LEI4 $525
CNSTF4 0
RETF4
ADDRGP4 $519
JUMPV
LABELV $525
line 2248
;2247:	//if the bot is very low on health
;2248:	if (bs->inventory[INVENTORY_HEALTH] < 60) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $527
CNSTF4 0
RETF4
ADDRGP4 $519
JUMPV
LABELV $527
line 2250
;2249:	//if the bot is low on health
;2250:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $529
line 2252
;2251:		//if the bot has insufficient armor
;2252:		if (bs->inventory[INVENTORY_ARMOR] < 40) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $531
CNSTF4 0
RETF4
ADDRGP4 $519
JUMPV
LABELV $531
line 2253
;2253:	}
LABELV $529
line 2255
;2254:	//if the bot can use the bfg
;2255:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $533
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $533
line 2256
;2256:			bs->inventory[INVENTORY_BFGAMMO] > 7) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $519
JUMPV
LABELV $533
line 2258
;2257:	//if the bot can use the railgun
;2258:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $535
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $535
line 2259
;2259:			bs->inventory[INVENTORY_SLUGS] > 5) return 95;
CNSTF4 1119748096
RETF4
ADDRGP4 $519
JUMPV
LABELV $535
line 2261
;2260:	//if the bot can use the lightning gun
;2261:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $537
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $537
line 2262
;2262:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $519
JUMPV
LABELV $537
line 2264
;2263:	//if the bot can use the rocketlauncher
;2264:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $539
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $539
line 2265
;2265:			bs->inventory[INVENTORY_ROCKETS] > 5) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $519
JUMPV
LABELV $539
line 2267
;2266:	//if the bot can use the plasmagun
;2267:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $541
ADDRLP4 16
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 40
LEI4 $541
line 2268
;2268:			bs->inventory[INVENTORY_CELLS] > 40) return 85;
CNSTF4 1118437376
RETF4
ADDRGP4 $519
JUMPV
LABELV $541
line 2270
;2269:	//if the bot can use the grenade launcher
;2270:	if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4980
ADDP4
INDIRI4
CNSTI4 0
LEI4 $543
ADDRLP4 20
INDIRP4
CNSTI4 5032
ADDP4
INDIRI4
CNSTI4 10
LEI4 $543
line 2271
;2271:			bs->inventory[INVENTORY_GRENADES] > 10) return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $519
JUMPV
LABELV $543
line 2273
;2272:	//if the bot can use the shotgun
;2273:	if (bs->inventory[INVENTORY_SHOTGUN] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 4972
ADDP4
INDIRI4
CNSTI4 0
LEI4 $545
ADDRLP4 24
INDIRP4
CNSTI4 5024
ADDP4
INDIRI4
CNSTI4 10
LEI4 $545
line 2274
;2274:			bs->inventory[INVENTORY_SHELLS] > 10) return 50;
CNSTF4 1112014848
RETF4
ADDRGP4 $519
JUMPV
LABELV $545
line 2276
;2275:	//otherwise the bot is not feeling too good
;2276:	return 0;
CNSTF4 0
RETF4
LABELV $519
endproc BotAggression 28 0
export BotFeelingBad
proc BotFeelingBad 0 0
line 2284
;2277:}
;2278:
;2279:/*
;2280:==================
;2281:BotFeelingBad
;2282:==================
;2283:*/
;2284:float BotFeelingBad(bot_state_t *bs) {
line 2285
;2285:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $548
line 2286
;2286:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $547
JUMPV
LABELV $548
line 2288
;2287:	}
;2288:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $550
line 2289
;2289:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $547
JUMPV
LABELV $550
line 2291
;2290:	}
;2291:	if (bs->weaponnum == WP_MACHINEGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $552
line 2292
;2292:		return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $547
JUMPV
LABELV $552
line 2294
;2293:	}
;2294:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $554
line 2295
;2295:		return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $547
JUMPV
LABELV $554
line 2297
;2296:	}
;2297:	return 0;
CNSTF4 0
RETF4
LABELV $547
endproc BotFeelingBad 0 0
export BotWantsToRetreat
proc BotWantsToRetreat 144 8
line 2305
;2298:}
;2299:
;2300:/*
;2301:==================
;2302:BotWantsToRetreat
;2303:==================
;2304:*/
;2305:int BotWantsToRetreat(bot_state_t *bs) {
line 2308
;2306:	aas_entityinfo_t entinfo;
;2307:
;2308:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $557
line 2310
;2309:		//always retreat when carrying a CTF flag
;2310:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $559
line 2311
;2311:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $556
JUMPV
LABELV $559
line 2312
;2312:	}
LABELV $557
line 2338
;2313:#ifdef MISSIONPACK
;2314:	else if (gametype == GT_1FCTF) {
;2315:		//if carrying the flag then always retreat
;2316:		if (Bot1FCTFCarryingFlag(bs))
;2317:			return qtrue;
;2318:	}
;2319:	else if (gametype == GT_OBELISK) {
;2320:		//the bots should be dedicated to attacking the enemy obelisk
;2321:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2322:			if (bs->enemy != redobelisk.entitynum &&
;2323:						bs->enemy != blueobelisk.entitynum) {
;2324:				return qtrue;
;2325:			}
;2326:		}
;2327:		if (BotFeelingBad(bs) > 50) {
;2328:			return qtrue;
;2329:		}
;2330:		return qfalse;
;2331:	}
;2332:	else if (gametype == GT_HARVESTER) {
;2333:		//if carrying cubes then always retreat
;2334:		if (BotHarvesterCarryingCubes(bs)) return qtrue;
;2335:	}
;2336:#endif
;2337:	//
;2338:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $561
line 2340
;2339:		//if the enemy is carrying a flag
;2340:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2341
;2341:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $563
line 2342
;2342:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $556
JUMPV
LABELV $563
line 2343
;2343:	}
LABELV $561
line 2345
;2344:	//if the bot is getting the flag
;2345:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $565
line 2346
;2346:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $556
JUMPV
LABELV $565
line 2348
;2347:	//
;2348:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $567
line 2349
;2349:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $556
JUMPV
LABELV $567
line 2350
;2350:	return qfalse;
CNSTI4 0
RETI4
LABELV $556
endproc BotWantsToRetreat 144 8
export BotWantsToChase
proc BotWantsToChase 148 8
line 2358
;2351:}
;2352:
;2353:/*
;2354:==================
;2355:BotWantsToChase
;2356:==================
;2357:*/
;2358:int BotWantsToChase(bot_state_t *bs) {
line 2361
;2359:	aas_entityinfo_t entinfo;
;2360:
;2361:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $570
line 2363
;2362:		//never chase when carrying a CTF flag
;2363:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $572
line 2364
;2364:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $569
JUMPV
LABELV $572
line 2366
;2365:		//always chase if the enemy is carrying a flag
;2366:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2367
;2367:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $574
line 2368
;2368:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $569
JUMPV
LABELV $574
line 2369
;2369:	}
LABELV $570
line 2396
;2370:#ifdef MISSIONPACK
;2371:	else if (gametype == GT_1FCTF) {
;2372:		//never chase if carrying the flag
;2373:		if (Bot1FCTFCarryingFlag(bs))
;2374:			return qfalse;
;2375:		//always chase if the enemy is carrying a flag
;2376:		BotEntityInfo(bs->enemy, &entinfo);
;2377:		if (EntityCarriesFlag(&entinfo))
;2378:			return qtrue;
;2379:	}
;2380:	else if (gametype == GT_OBELISK) {
;2381:		//the bots should be dedicated to attacking the enemy obelisk
;2382:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2383:			if (bs->enemy != redobelisk.entitynum &&
;2384:						bs->enemy != blueobelisk.entitynum) {
;2385:				return qfalse;
;2386:			}
;2387:		}
;2388:	}
;2389:	else if (gametype == GT_HARVESTER) {
;2390:		//never chase if carrying cubes
;2391:		if (BotHarvesterCarryingCubes(bs))
;2392:			return qfalse;
;2393:	}
;2394:#endif
;2395:	//if the bot is getting the flag
;2396:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $576
line 2397
;2397:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $569
JUMPV
LABELV $576
line 2399
;2398:	//
;2399:	if (BotAggression(bs) > 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
LEF4 $578
line 2400
;2400:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $569
JUMPV
LABELV $578
line 2401
;2401:	return qfalse;
CNSTI4 0
RETI4
LABELV $569
endproc BotWantsToChase 148 8
export BotWantsToHelp
proc BotWantsToHelp 0 0
line 2409
;2402:}
;2403:
;2404:/*
;2405:==================
;2406:BotWantsToHelp
;2407:==================
;2408:*/
;2409:int BotWantsToHelp(bot_state_t *bs) {
line 2410
;2410:	return qtrue;
CNSTI4 1
RETI4
LABELV $580
endproc BotWantsToHelp 0 0
export BotCanAndWantsToRocketJump
proc BotCanAndWantsToRocketJump 8 16
line 2418
;2411:}
;2412:
;2413:/*
;2414:==================
;2415:BotCanAndWantsToRocketJump
;2416:==================
;2417:*/
;2418:int BotCanAndWantsToRocketJump(bot_state_t *bs) {
line 2422
;2419:	float rocketjumper;
;2420:
;2421:	//if rocket jumping is disabled
;2422:	if (!bot_rocketjump.integer) return qfalse;
ADDRGP4 bot_rocketjump+12
INDIRI4
CNSTI4 0
NEI4 $582
CNSTI4 0
RETI4
ADDRGP4 $581
JUMPV
LABELV $582
line 2424
;2423:	//if no rocket launcher
;2424:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
GTI4 $585
CNSTI4 0
RETI4
ADDRGP4 $581
JUMPV
LABELV $585
line 2426
;2425:	//if low on rockets
;2426:	if (bs->inventory[INVENTORY_ROCKETS] < 3) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 3
GEI4 $587
CNSTI4 0
RETI4
ADDRGP4 $581
JUMPV
LABELV $587
line 2428
;2427:	//never rocket jump with the Quad
;2428:	if (bs->inventory[INVENTORY_QUAD]) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $589
CNSTI4 0
RETI4
ADDRGP4 $581
JUMPV
LABELV $589
line 2430
;2429:	//if low on health
;2430:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $591
CNSTI4 0
RETI4
ADDRGP4 $581
JUMPV
LABELV $591
line 2432
;2431:	//if not full health
;2432:	if (bs->inventory[INVENTORY_HEALTH] < 90) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 90
GEI4 $593
line 2434
;2433:		//if the bot has insufficient armor
;2434:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $595
CNSTI4 0
RETI4
ADDRGP4 $581
JUMPV
LABELV $595
line 2435
;2435:	}
LABELV $593
line 2436
;2436:	rocketjumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WEAPONJUMPING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 38
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 4
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2437
;2437:	if (rocketjumper < 0.5) return qfalse;
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GEF4 $597
CNSTI4 0
RETI4
ADDRGP4 $581
JUMPV
LABELV $597
line 2438
;2438:	return qtrue;
CNSTI4 1
RETI4
LABELV $581
endproc BotCanAndWantsToRocketJump 8 16
export BotHasPersistantPowerupAndWeapon
proc BotHasPersistantPowerupAndWeapon 32 0
line 2446
;2439:}
;2440:
;2441:/*
;2442:==================
;2443:BotHasPersistantPowerupAndWeapon
;2444:==================
;2445:*/
;2446:int BotHasPersistantPowerupAndWeapon(bot_state_t *bs) {
line 2457
;2447:#ifdef MISSIONPACK
;2448:	// if the bot does not have a persistant powerup
;2449:	if (!bs->inventory[INVENTORY_SCOUT] &&
;2450:		!bs->inventory[INVENTORY_GUARD] &&
;2451:		!bs->inventory[INVENTORY_DOUBLER] &&
;2452:		!bs->inventory[INVENTORY_AMMOREGEN] ) {
;2453:		return qfalse;
;2454:	}
;2455:#endif
;2456:	//if the bot is very low on health
;2457:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $600
CNSTI4 0
RETI4
ADDRGP4 $599
JUMPV
LABELV $600
line 2459
;2458:	//if the bot is low on health
;2459:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $602
line 2461
;2460:		//if the bot has insufficient armor
;2461:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $604
CNSTI4 0
RETI4
ADDRGP4 $599
JUMPV
LABELV $604
line 2462
;2462:	}
LABELV $602
line 2464
;2463:	//if the bot can use the bfg
;2464:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $606
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $606
line 2465
;2465:			bs->inventory[INVENTORY_BFGAMMO] > 7) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $606
line 2467
;2466:	//if the bot can use the railgun
;2467:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $608
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $608
line 2468
;2468:			bs->inventory[INVENTORY_SLUGS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $608
line 2470
;2469:	//if the bot can use the lightning gun
;2470:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $610
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $610
line 2471
;2471:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $610
line 2473
;2472:	//if the bot can use the rocketlauncher
;2473:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $612
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $612
line 2474
;2474:			bs->inventory[INVENTORY_ROCKETS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $612
line 2476
;2475:	//
;2476:	if (bs->inventory[INVENTORY_NAILGUN] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 5012
ADDP4
INDIRI4
CNSTI4 0
LEI4 $614
ADDRLP4 16
INDIRP4
CNSTI4 5056
ADDP4
INDIRI4
CNSTI4 5
LEI4 $614
line 2477
;2477:			bs->inventory[INVENTORY_NAILS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $614
line 2479
;2478:	//
;2479:	if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 5016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $616
ADDRLP4 20
INDIRP4
CNSTI4 5060
ADDP4
INDIRI4
CNSTI4 5
LEI4 $616
line 2480
;2480:			bs->inventory[INVENTORY_MINES] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $616
line 2482
;2481:	//
;2482:	if (bs->inventory[INVENTORY_CHAINGUN] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 5020
ADDP4
INDIRI4
CNSTI4 0
LEI4 $618
ADDRLP4 24
INDIRP4
CNSTI4 5064
ADDP4
INDIRI4
CNSTI4 40
LEI4 $618
line 2483
;2483:			bs->inventory[INVENTORY_BELT] > 40) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $618
line 2485
;2484:	//if the bot can use the plasmagun
;2485:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $620
ADDRLP4 28
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 20
LEI4 $620
line 2486
;2486:			bs->inventory[INVENTORY_CELLS] > 20) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $599
JUMPV
LABELV $620
line 2487
;2487:	return qfalse;
CNSTI4 0
RETI4
LABELV $599
endproc BotHasPersistantPowerupAndWeapon 32 0
export BotGoCamp
proc BotGoCamp 16 16
line 2495
;2488:}
;2489:
;2490:/*
;2491:==================
;2492:BotGoCamp
;2493:==================
;2494:*/
;2495:void BotGoCamp(bot_state_t *bs, bot_goal_t *goal) {
line 2498
;2496:	float camper;
;2497:
;2498:	bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2500
;2499:	//set message time to zero so bot will NOT show any message
;2500:	bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 2502
;2501:	//set the ltg type
;2502:	bs->ltgtype = LTG_CAMP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 7
ASGNI4
line 2504
;2503:	//set the team goal
;2504:	memcpy(&bs->teamgoal, goal, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2506
;2505:	//get the team goal time
;2506:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 8
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2507
;2507:	if (camper > 0.99) bs->teamgoal_time = FloatTime() + 99999;
ADDRLP4 0
INDIRF4
CNSTF4 1065185444
LEF4 $623
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1203982208
ADDF4
ASGNF4
ADDRGP4 $624
JUMPV
LABELV $623
line 2508
;2508:	else bs->teamgoal_time = FloatTime() + 120 + 180 * camper + random() * 15;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
MULF4
ADDF4
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 972030432
MULF4
ADDF4
ASGNF4
LABELV $624
line 2510
;2509:	//set the last time the bot started camping
;2510:	bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2512
;2511:	//the teammate that requested the camping
;2512:	bs->teammate = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
CNSTI4 0
ASGNI4
line 2514
;2513:	//do NOT type arrive message
;2514:	bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 2515
;2515:}
LABELV $622
endproc BotGoCamp 16 16
export BotWantsToCamp
proc BotWantsToCamp 172 16
line 2522
;2516:
;2517:/*
;2518:==================
;2519:BotWantsToCamp
;2520:==================
;2521:*/
;2522:int BotWantsToCamp(bot_state_t *bs) {
line 2527
;2523:	float camper;
;2524:	int cs, traveltime, besttraveltime;
;2525:	bot_goal_t goal, bestgoal;
;2526:
;2527:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 128
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 128
INDIRF4
ASGNF4
line 2528
;2528:	if (camper < 0.1) return qfalse;
ADDRLP4 124
INDIRF4
CNSTF4 1036831949
GEF4 $626
CNSTI4 0
RETI4
ADDRGP4 $625
JUMPV
LABELV $626
line 2530
;2529:	//if the bot has a team goal
;2530:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $636
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $636
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $636
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $636
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $636
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 7
EQI4 $636
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $636
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
NEI4 $628
LABELV $636
line 2537
;2531:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;2532:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;2533:			bs->ltgtype == LTG_GETFLAG ||
;2534:			bs->ltgtype == LTG_RUSHBASE ||
;2535:			bs->ltgtype == LTG_CAMP ||
;2536:			bs->ltgtype == LTG_CAMPORDER ||
;2537:			bs->ltgtype == LTG_PATROL) {
line 2538
;2538:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $625
JUMPV
LABELV $628
line 2541
;2539:	}
;2540:	//if camped recently
;2541:	if (bs->camp_time > FloatTime() - 60 + 300 * (1-camper)) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
SUBF4
CNSTF4 1065353216
ADDRLP4 124
INDIRF4
SUBF4
CNSTF4 1133903872
MULF4
ADDF4
LEF4 $637
CNSTI4 0
RETI4
ADDRGP4 $625
JUMPV
LABELV $637
line 2543
;2542:	//
;2543:	if (random() > camper) {
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 124
INDIRF4
LEF4 $639
line 2544
;2544:		bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2545
;2545:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $625
JUMPV
LABELV $639
line 2548
;2546:	}
;2547:	//if the bot isn't healthy anough
;2548:	if (BotAggression(bs) < 50) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $641
CNSTI4 0
RETI4
ADDRGP4 $625
JUMPV
LABELV $641
line 2550
;2549:	//the bot should have at least have the rocket launcher, the railgun or the bfg10k with some ammo
;2550:	if ((bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0 || bs->inventory[INVENTORY_ROCKETS] < 10) &&
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $645
ADDRLP4 144
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 10
GEI4 $643
LABELV $645
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $646
ADDRLP4 148
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 10
GEI4 $643
LABELV $646
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $647
ADDRLP4 152
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 10
GEI4 $643
LABELV $647
line 2552
;2551:		(bs->inventory[INVENTORY_RAILGUN] <= 0 || bs->inventory[INVENTORY_SLUGS] < 10) &&
;2552:		(bs->inventory[INVENTORY_BFG10K] <= 0 || bs->inventory[INVENTORY_BFGAMMO] < 10)) {
line 2553
;2553:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $625
JUMPV
LABELV $643
line 2556
;2554:	}
;2555:	//find the closest camp spot
;2556:	besttraveltime = 99999;
ADDRLP4 64
CNSTI4 99999
ASGNI4
line 2557
;2557:	for (cs = trap_BotGetNextCampSpotGoal(0, &goal); cs; cs = trap_BotGetNextCampSpotGoal(cs, &goal)) {
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 156
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 156
INDIRI4
ASGNI4
ADDRGP4 $651
JUMPV
LABELV $648
line 2558
;2558:		traveltime = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal.areanum, TFL_DEFAULT);
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 8+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 164
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 164
INDIRI4
ASGNI4
line 2559
;2559:		if (traveltime && traveltime < besttraveltime) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $653
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $653
line 2560
;2560:			besttraveltime = traveltime;
ADDRLP4 64
ADDRLP4 0
INDIRI4
ASGNI4
line 2561
;2561:			memcpy(&bestgoal, &goal, sizeof(bot_goal_t));
ADDRLP4 68
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2562
;2562:		}
LABELV $653
line 2563
;2563:	}
LABELV $649
line 2557
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 160
INDIRI4
ASGNI4
LABELV $651
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $648
line 2564
;2564:	if (besttraveltime > 150) return qfalse;
ADDRLP4 64
INDIRI4
CNSTI4 150
LEI4 $655
CNSTI4 0
RETI4
ADDRGP4 $625
JUMPV
LABELV $655
line 2566
;2565:	//ok found a camp spot, go camp there
;2566:	BotGoCamp(bs, &bestgoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 BotGoCamp
CALLV
pop
line 2567
;2567:	bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 2569
;2568:	//
;2569:	return qtrue;
CNSTI4 1
RETI4
LABELV $625
endproc BotWantsToCamp 172 16
export BotDontAvoid
proc BotDontAvoid 68 12
line 2577
;2570:}
;2571:
;2572:/*
;2573:==================
;2574:BotDontAvoid
;2575:==================
;2576:*/
;2577:void BotDontAvoid(bot_state_t *bs, char *itemname) {
line 2581
;2578:	bot_goal_t goal;
;2579:	int num;
;2580:
;2581:	num = trap_BotGetLevelItemGoal(-1, itemname, &goal);
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 60
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
ADDRGP4 $659
JUMPV
LABELV $658
line 2582
;2582:	while(num >= 0) {
line 2583
;2583:		trap_BotRemoveFromAvoidGoals(bs->gs, goal.number);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 4+44
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveFromAvoidGoals
CALLV
pop
line 2584
;2584:		num = trap_BotGetLevelItemGoal(num, itemname, &goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 64
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ASGNI4
line 2585
;2585:	}
LABELV $659
line 2582
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $658
line 2586
;2586:}
LABELV $657
endproc BotDontAvoid 68 12
export BotGoForPowerups
proc BotGoForPowerups 0 8
line 2593
;2587:
;2588:/*
;2589:==================
;2590:BotGoForPowerups
;2591:==================
;2592:*/
;2593:void BotGoForPowerups(bot_state_t *bs) {
line 2596
;2594:
;2595:	//don't avoid any of the powerups anymore
;2596:	BotDontAvoid(bs, "Quad Damage");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $663
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2597
;2597:	BotDontAvoid(bs, "Regeneration");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $664
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2598
;2598:	BotDontAvoid(bs, "Battle Suit");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $665
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2599
;2599:	BotDontAvoid(bs, "Speed");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $666
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2600
;2600:	BotDontAvoid(bs, "Invisibility");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $667
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2604
;2601:	//BotDontAvoid(bs, "Flight");
;2602:	//reset the long term goal time so the bot will go for the powerup
;2603:	//NOTE: the long term goal type doesn't change
;2604:	bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2605
;2605:}
LABELV $662
endproc BotGoForPowerups 0 8
export BotRoamGoal
proc BotRoamGoal 168 28
line 2612
;2606:
;2607:/*
;2608:==================
;2609:BotRoamGoal
;2610:==================
;2611:*/
;2612:void BotRoamGoal(bot_state_t *bs, vec3_t goal) {
line 2618
;2613:	int pc, i;
;2614:	float len, rnd;
;2615:	vec3_t dir, bestorg, belowbestorg;
;2616:	bsp_trace_t trace;
;2617:
;2618:	for (i = 0; i < 10; i++) {
ADDRLP4 116
CNSTI4 0
ASGNI4
LABELV $669
line 2620
;2619:		//start at the bot origin
;2620:		VectorCopy(bs->origin, bestorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2621
;2621:		rnd = random();
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ASGNF4
line 2622
;2622:		if (rnd > 0.25) {
ADDRLP4 112
INDIRF4
CNSTF4 1048576000
LEF4 $673
line 2624
;2623:			//add a random value to the x-coordinate
;2624:			if (random() < 0.5) bestorg[0] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $675
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $676
JUMPV
LABELV $675
line 2625
;2625:			else bestorg[0] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $676
line 2626
;2626:		}
LABELV $673
line 2627
;2627:		if (rnd < 0.75) {
ADDRLP4 112
INDIRF4
CNSTF4 1061158912
GEF4 $677
line 2629
;2628:			//add a random value to the y-coordinate
;2629:			if (random() < 0.5) bestorg[1] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $679
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $680
JUMPV
LABELV $679
line 2630
;2630:			else bestorg[1] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $680
line 2631
;2631:		}
LABELV $677
line 2633
;2632:		//add a random value to the z-coordinate (NOTE: 48 = maxjump?)
;2633:		bestorg[2] += 2 * 48 * crandom();
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 140
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
CNSTF4 1119879168
MULF4
ADDF4
ASGNF4
line 2635
;2634:		//trace a line from the origin to the roam target
;2635:		BotAI_Trace(&trace, bs->origin, NULL, NULL, bestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2637
;2636:		//direction and length towards the roam target
;2637:		VectorSubtract(trace.endpos, bs->origin, dir);
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24+12
INDIRF4
ADDRLP4 148
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+12+4
INDIRF4
ADDRLP4 148
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2638
;2638:		len = VectorNormalize(dir);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 152
INDIRF4
ASGNF4
line 2640
;2639:		//if the roam target is far away anough
;2640:		if (len > 200) {
ADDRLP4 108
INDIRF4
CNSTF4 1128792064
LEF4 $691
line 2642
;2641:			//the roam target is in the given direction before walls
;2642:			VectorScale(dir, len * trace.fraction - 40, dir);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
line 2643
;2643:			VectorAdd(bs->origin, dir, bestorg);
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 160
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2645
;2644:			//get the coordinates of the floor below the roam target
;2645:			belowbestorg[0] = bestorg[0];
ADDRLP4 120
ADDRLP4 12
INDIRF4
ASGNF4
line 2646
;2646:			belowbestorg[1] = bestorg[1];
ADDRLP4 120+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2647
;2647:			belowbestorg[2] = bestorg[2] - 800;
ADDRLP4 120+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1145569280
SUBF4
ASGNF4
line 2648
;2648:			BotAI_Trace(&trace, bestorg, NULL, NULL, belowbestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2650
;2649:			//
;2650:			if (!trace.startsolid) {
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $708
line 2651
;2651:				trace.endpos[2]++;
ADDRLP4 24+12+8
ADDRLP4 24+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2652
;2652:				pc = trap_PointContents(trace.endpos, bs->entitynum);
ADDRLP4 24+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 164
INDIRI4
ASGNI4
line 2653
;2653:				if (!(pc & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 132
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
NEI4 $714
line 2654
;2654:					VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2655
;2655:					return;
ADDRGP4 $668
JUMPV
LABELV $714
line 2657
;2656:				}
;2657:			}
LABELV $708
line 2658
;2658:		}
LABELV $691
line 2659
;2659:	}
LABELV $670
line 2618
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 10
LTI4 $669
line 2660
;2660:	VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2661
;2661:}
LABELV $668
endproc BotRoamGoal 168 28
data
align 4
LABELV $718
byte 4 0
byte 4 0
byte 4 1065353216
export BotAttackMove
code
proc BotAttackMove 392 16
line 2668
;2662:
;2663:/*
;2664:==================
;2665:BotAttackMove
;2666:==================
;2667:*/
;2668:bot_moveresult_t BotAttackMove(bot_state_t *bs, int tfl) {
line 2672
;2669:	int movetype, i, attackentity;
;2670:	float attack_skill, jumper, croucher, dist, strafechange_time;
;2671:	float attack_dist, attack_range;
;2672:	vec3_t forward, backward, sideward, hordir, up = {0, 0, 1};
ADDRLP4 56
ADDRGP4 $718
INDIRB
ASGNB 12
line 2677
;2673:	aas_entityinfo_t entinfo;
;2674:	bot_moveresult_t moveresult;
;2675:	bot_goal_t goal;
;2676:
;2677:	attackentity = bs->enemy;
ADDRLP4 332
ADDRFP4 4
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 2679
;2678:	//
;2679:	if (bs->attackchase_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6124
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $719
line 2681
;2680:		//create the chase goal
;2681:		goal.entitynum = attackentity;
ADDRLP4 136+40
ADDRLP4 332
INDIRI4
ASGNI4
line 2682
;2682:		goal.areanum = bs->lastenemyareanum;
ADDRLP4 136+12
ADDRFP4 4
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ASGNI4
line 2683
;2683:		VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 2684
;2684:		VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 136+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+8
CNSTF4 3238002688
ASGNF4
line 2685
;2685:		VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 136+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+8
CNSTF4 1090519040
ASGNF4
line 2687
;2686:		//initialize the movement state
;2687:		BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2689
;2688:		//move towards the goal
;2689:		trap_BotMoveToGoal(&moveresult, bs->ms, &goal, tfl);
ADDRLP4 80
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2690
;2690:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $716
JUMPV
LABELV $719
line 2693
;2691:	}
;2692:	//
;2693:	memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 80
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2695
;2694:	//
;2695:	attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 348
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 132
ADDRLP4 348
INDIRF4
ASGNF4
line 2696
;2696:	jumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_JUMPER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 37
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 352
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 340
ADDRLP4 352
INDIRF4
ASGNF4
line 2697
;2697:	croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 36
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 356
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 344
ADDRLP4 356
INDIRF4
ASGNF4
line 2699
;2698:	//if the bot is really stupid
;2699:	if (attack_skill < 0.2) return moveresult;
ADDRLP4 132
INDIRF4
CNSTF4 1045220557
GEF4 $733
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $716
JUMPV
LABELV $733
line 2701
;2700:	//initialize the movement state
;2701:	BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2703
;2702:	//get the enemy entity info
;2703:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 332
INDIRI4
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2705
;2704:	//direction towards the enemy
;2705:	VectorSubtract(entinfo.origin, bs->origin, forward);
ADDRLP4 360
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 192+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 192+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 192+24+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2707
;2706:	//the distance towards the enemy
;2707:	dist = VectorNormalize(forward);
ADDRLP4 24
ARGP4
ADDRLP4 364
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 364
INDIRF4
ASGNF4
line 2708
;2708:	VectorNegate(forward, backward);
ADDRLP4 36
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 24+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 24+8
INDIRF4
NEGF4
ASGNF4
line 2710
;2709:	//walk, crouch or jump
;2710:	movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2712
;2711:	//
;2712:	if (bs->attackcrouch_time < FloatTime() - 1) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $746
line 2713
;2713:		if (random() < jumper) {
ADDRLP4 368
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 340
INDIRF4
GEF4 $748
line 2714
;2714:			movetype = MOVE_JUMP;
ADDRLP4 52
CNSTI4 4
ASGNI4
line 2715
;2715:		}
ADDRGP4 $749
JUMPV
LABELV $748
line 2717
;2716:		//wait at least one second before crouching again
;2717:		else if (bs->attackcrouch_time < FloatTime() - 1 && random() < croucher) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $750
ADDRLP4 372
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 344
INDIRF4
GEF4 $750
line 2718
;2718:			bs->attackcrouch_time = FloatTime() + croucher * 5;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 344
INDIRF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
line 2719
;2719:		}
LABELV $750
LABELV $749
line 2720
;2720:	}
LABELV $746
line 2721
;2721:	if (bs->attackcrouch_time > FloatTime()) movetype = MOVE_CROUCH;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $752
ADDRLP4 52
CNSTI4 2
ASGNI4
LABELV $752
line 2723
;2722:	//if the bot should jump
;2723:	if (movetype == MOVE_JUMP) {
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $754
line 2725
;2724:		//if jumped last frame
;2725:		if (bs->attackjump_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $756
line 2726
;2726:			movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2727
;2727:		}
ADDRGP4 $757
JUMPV
LABELV $756
line 2728
;2728:		else {
line 2729
;2729:			bs->attackjump_time = FloatTime() + 1;
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2730
;2730:		}
LABELV $757
line 2731
;2731:	}
LABELV $754
line 2732
;2732:	if (bs->cur_ps.weapon == WP_GAUNTLET) {
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $758
line 2733
;2733:		attack_dist = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 2734
;2734:		attack_range = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
line 2735
;2735:	}
ADDRGP4 $759
JUMPV
LABELV $758
line 2736
;2736:	else {
line 2737
;2737:		attack_dist = IDEAL_ATTACKDIST;
ADDRLP4 72
CNSTF4 1124859904
ASGNF4
line 2738
;2738:		attack_range = 40;
ADDRLP4 76
CNSTF4 1109393408
ASGNF4
line 2739
;2739:	}
LABELV $759
line 2741
;2740:	//if the bot is stupid
;2741:	if (attack_skill <= 0.4) {
ADDRLP4 132
INDIRF4
CNSTF4 1053609165
GTF4 $760
line 2743
;2742:		//just walk to or away from the enemy
;2743:		if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $762
line 2744
;2744:			if (trap_BotMoveInDirection(bs->ms, forward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $764
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $716
JUMPV
LABELV $764
line 2745
;2745:		}
LABELV $762
line 2746
;2746:		if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $766
line 2747
;2747:			if (trap_BotMoveInDirection(bs->ms, backward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $768
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $716
JUMPV
LABELV $768
line 2748
;2748:		}
LABELV $766
line 2749
;2749:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $716
JUMPV
LABELV $760
line 2752
;2750:	}
;2751:	//increase the strafe time
;2752:	bs->attackstrafe_time += bs->thinktime;
ADDRLP4 368
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 372
ADDRLP4 368
INDIRP4
CNSTI4 6116
ADDP4
ASGNP4
ADDRLP4 372
INDIRP4
ADDRLP4 372
INDIRP4
INDIRF4
ADDRLP4 368
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2754
;2753:	//get the strafe change time
;2754:	strafechange_time = 0.4 + (1 - attack_skill) * 0.2;
ADDRLP4 336
CNSTF4 1065353216
ADDRLP4 132
INDIRF4
SUBF4
CNSTF4 1045220557
MULF4
CNSTF4 1053609165
ADDF4
ASGNF4
line 2755
;2755:	if (attack_skill > 0.7) strafechange_time += crandom() * 0.2;
ADDRLP4 132
INDIRF4
CNSTF4 1060320051
LEF4 $770
ADDRLP4 376
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 336
INDIRF4
ADDRLP4 376
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1053609165
MULF4
ADDF4
ASGNF4
LABELV $770
line 2757
;2756:	//if the strafe direction should be changed
;2757:	if (bs->attackstrafe_time > strafechange_time) {
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
INDIRF4
ADDRLP4 336
INDIRF4
LEF4 $772
line 2759
;2758:		//some magic number :)
;2759:		if (random() > 0.935) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1064262697
LEF4 $774
line 2761
;2760:			//flip the strafe direction
;2761:			bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 384
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 384
INDIRP4
ADDRLP4 384
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2762
;2762:			bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2763
;2763:		}
LABELV $774
line 2764
;2764:	}
LABELV $772
line 2766
;2765:	//
;2766:	for (i = 0; i < 2; i++) {
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $776
line 2767
;2767:		hordir[0] = forward[0];
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 2768
;2768:		hordir[1] = forward[1];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 2769
;2769:		hordir[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2770
;2770:		VectorNormalize(hordir);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2772
;2771:		//get the sideward vector
;2772:		CrossProduct(hordir, up, sideward);
ADDRLP4 12
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2774
;2773:		//reverse the vector depending on the strafe direction
;2774:		if (bs->flags & BFL_STRAFERIGHT) VectorNegate(sideward, sideward);
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $783
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
NEGF4
ASGNF4
LABELV $783
line 2776
;2775:		//randomly go back a little
;2776:		if (random() > 0.9) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1063675494
LEF4 $789
line 2777
;2777:			VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2778
;2778:		}
ADDRGP4 $790
JUMPV
LABELV $789
line 2779
;2779:		else {
line 2781
;2780:			//walk forward or backward to get at the ideal attack distance
;2781:			if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $797
line 2782
;2782:				VectorAdd(sideward, forward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 2783
;2783:			}
ADDRGP4 $798
JUMPV
LABELV $797
line 2784
;2784:			else if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $805
line 2785
;2785:				VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2786
;2786:			}
LABELV $805
LABELV $798
line 2787
;2787:		}
LABELV $790
line 2789
;2788:		//perform the movement
;2789:		if (trap_BotMoveInDirection(bs->ms, sideward, 400, movetype))
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 384
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $813
line 2790
;2790:			return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $716
JUMPV
LABELV $813
line 2792
;2791:		//movement failed, flip the strafe direction
;2792:		bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 388
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 388
INDIRP4
ADDRLP4 388
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2793
;2793:		bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2794
;2794:	}
LABELV $777
line 2766
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 2
LTI4 $776
line 2797
;2795:	//bot couldn't do any usefull movement
;2796://	bs->attackchase_time = AAS_Time() + 6;
;2797:	return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
LABELV $716
endproc BotAttackMove 392 16
export BotSameTeam
proc BotSameTeam 0 0
line 2805
;2798:}
;2799:
;2800:/*
;2801:==================
;2802:BotSameTeam
;2803:==================
;2804:*/
;2805:int BotSameTeam(bot_state_t *bs, int entnum) {
line 2809
;2806:
;2807:	extern gclient_t g_clients[ MAX_CLIENTS ];
;2808:
;2809:	if ( (unsigned) bs->client >= MAX_CLIENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $816
line 2811
;2810:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2811:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $815
JUMPV
LABELV $816
line 2813
;2812:	}
;2813:	if ( (unsigned) entnum >= MAX_CLIENTS ) {
ADDRFP4 4
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $818
line 2815
;2814:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2815:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $815
JUMPV
LABELV $818
line 2817
;2816:	}
;2817:	if ( gametype >= GT_TEAM ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $820
line 2818
;2818:		if ( g_clients[bs->client].sess.sessionTeam == g_clients[entnum].sess.sessionTeam )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 g_clients+624
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1568
MULI4
ADDRGP4 g_clients+624
ADDP4
INDIRI4
NEI4 $822
line 2819
;2819:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $815
JUMPV
LABELV $822
line 2820
;2820:	}
LABELV $820
line 2821
;2821:	return qfalse;
CNSTI4 0
RETI4
LABELV $815
endproc BotSameTeam 0 0
export InFieldOfVision
proc InFieldOfVision 28 4
line 2830
;2822:}
;2823:
;2824:/*
;2825:==================
;2826:InFieldOfVision
;2827:==================
;2828:*/
;2829:qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;2830:{
line 2834
;2831:	int i;
;2832:	float diff, angle;
;2833:
;2834:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $827
line 2835
;2835:		angle = AngleMod(viewangles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ASGNF4
line 2836
;2836:		angles[i] = AngleMod(angles[i]);
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2837
;2837:		diff = angles[i] - angle;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 2838
;2838:		if (angles[i] > angle) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $831
line 2839
;2839:			if (diff > 180.0) diff -= 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $832
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 2840
;2840:		}
ADDRGP4 $832
JUMPV
LABELV $831
line 2841
;2841:		else {
line 2842
;2842:			if (diff < -180.0) diff += 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $835
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $835
line 2843
;2843:		}
LABELV $832
line 2844
;2844:		if (diff > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $837
line 2845
;2845:			if (diff > fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
CNSTF4 1056964608
MULF4
LEF4 $838
CNSTI4 0
RETI4
ADDRGP4 $826
JUMPV
line 2846
;2846:		}
LABELV $837
line 2847
;2847:		else {
line 2848
;2848:			if (diff < -fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
NEGF4
CNSTF4 1056964608
MULF4
GEF4 $841
CNSTI4 0
RETI4
ADDRGP4 $826
JUMPV
LABELV $841
line 2849
;2849:		}
LABELV $838
line 2850
;2850:	}
LABELV $828
line 2834
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $827
line 2851
;2851:	return qtrue;
CNSTI4 1
RETI4
LABELV $826
endproc InFieldOfVision 28 4
export BotEntityVisible
proc BotEntityVisible 360 28
line 2861
;2852:}
;2853:
;2854:/*
;2855:==================
;2856:BotEntityVisible
;2857:
;2858:returns visibility in the range [0, 1] taking fog and water surfaces into account
;2859:==================
;2860:*/
;2861:float BotEntityVisible(int viewer, vec3_t eye, vec3_t viewangles, float fov, int ent) {
line 2869
;2862:	int i, contents_mask, passent, hitent, infog, inwater, otherinfog, pc;
;2863:	float squaredfogdist, waterfactor, vis, bestvis;
;2864:	bsp_trace_t trace;
;2865:	aas_entityinfo_t entinfo;
;2866:	vec3_t dir, entangles, start, end, middle;
;2867:
;2868:	//calculate middle of bounding box
;2869:	BotEntityInfo(ent, &entinfo);
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2870
;2870:	if (!entinfo.valid)
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $844
line 2871
;2871:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $843
JUMPV
LABELV $844
line 2872
;2872:	VectorAdd(entinfo.mins, entinfo.maxs, middle);
ADDRLP4 84
ADDRLP4 148+72
INDIRF4
ADDRLP4 148+84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+72+4
INDIRF4
ADDRLP4 148+84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+72+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDF4
ASGNF4
line 2873
;2873:	VectorScale(middle, 0.5, middle);
ADDRLP4 84
ADDRLP4 84
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 84+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 2874
;2874:	VectorAdd(entinfo.origin, middle, middle);
ADDRLP4 84
ADDRLP4 148+24
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+24+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+24+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 2876
;2875:	//check if entity is within field of vision
;2876:	VectorSubtract(middle, eye, dir);
ADDRLP4 332
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 84
INDIRF4
ADDRLP4 332
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 84+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2877
;2877:	vectoangles(dir, entangles);
ADDRLP4 136
ARGP4
ADDRLP4 320
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2878
;2878:	if (!InFieldOfVision(viewangles, fov, entangles)) return 0;
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 320
ARGP4
ADDRLP4 336
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
NEI4 $875
CNSTF4 0
RETF4
ADDRGP4 $843
JUMPV
LABELV $875
line 2880
;2879:	//
;2880:	pc = trap_AAS_PointContents(eye);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 340
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 316
ADDRLP4 340
INDIRI4
ASGNI4
line 2881
;2881:	infog = (pc & CONTENTS_FOG);
ADDRLP4 312
ADDRLP4 316
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2882
;2882:	inwater = (pc & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER));
ADDRLP4 308
ADDRLP4 316
INDIRI4
CNSTI4 56
BANDI4
ASGNI4
line 2884
;2883:	//
;2884:	bestvis = 0;
ADDRLP4 296
CNSTF4 0
ASGNF4
line 2885
;2885:	for (i = 0; i < 3; i++) {
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $877
line 2889
;2886:		//if the point is not in potential visible sight
;2887:		//if (!AAS_inPVS(eye, middle)) continue;
;2888:		//
;2889:		contents_mask = CONTENTS_SOLID|CONTENTS_PLAYERCLIP;
ADDRLP4 96
CNSTI4 65537
ASGNI4
line 2890
;2890:		passent = viewer;
ADDRLP4 116
ADDRFP4 0
INDIRI4
ASGNI4
line 2891
;2891:		hitent = ent;
ADDRLP4 132
ADDRFP4 16
INDIRI4
ASGNI4
line 2892
;2892:		VectorCopy(eye, start);
ADDRLP4 120
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2893
;2893:		VectorCopy(middle, end);
ADDRLP4 104
ADDRLP4 84
INDIRB
ASGNB 12
line 2895
;2894:		//if the entity is in water, lava or slime
;2895:		if (trap_AAS_PointContents(middle) & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 84
ARGP4
ADDRLP4 344
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $881
line 2896
;2896:			contents_mask |= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BORI4
ASGNI4
line 2897
;2897:		}
LABELV $881
line 2899
;2898:		//if eye is in water, lava or slime
;2899:		if (inwater) {
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $883
line 2900
;2900:			if (!(contents_mask & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))) {
ADDRLP4 96
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $885
line 2901
;2901:				passent = ent;
ADDRLP4 116
ADDRFP4 16
INDIRI4
ASGNI4
line 2902
;2902:				hitent = viewer;
ADDRLP4 132
ADDRFP4 0
INDIRI4
ASGNI4
line 2903
;2903:				VectorCopy(middle, start);
ADDRLP4 120
ADDRLP4 84
INDIRB
ASGNB 12
line 2904
;2904:				VectorCopy(eye, end);
ADDRLP4 104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2905
;2905:			}
LABELV $885
line 2906
;2906:			contents_mask ^= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BXORI4
ASGNI4
line 2907
;2907:		}
LABELV $883
line 2909
;2908:		//trace from start to end
;2909:		BotAI_Trace(&trace, start, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2911
;2910:		//if water was hit
;2911:		waterfactor = 1.0;
ADDRLP4 288
CNSTF4 1065353216
ASGNF4
line 2912
;2912:		if (trace.contents & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 0+76
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $887
line 2914
;2913:			//if the water surface is translucent
;2914:			if (1) {
line 2916
;2915:				//trace through the water
;2916:				contents_mask &= ~(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 -57
BANDI4
ASGNI4
line 2917
;2917:				BotAI_Trace(&trace, trace.endpos, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 0+12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2918
;2918:				waterfactor = 0.5;
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
line 2919
;2919:			}
LABELV $890
line 2920
;2920:		}
LABELV $887
line 2922
;2921:		//if a full trace or the hitent was hit
;2922:		if (trace.fraction >= 1 || trace.ent == hitent) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $897
ADDRLP4 0+80
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $893
LABELV $897
line 2925
;2923:			//check for fog, assuming there's only one fog brush where
;2924:			//either the viewer or the entity is in or both are in
;2925:			otherinfog = (trap_AAS_PointContents(middle) & CONTENTS_FOG);
ADDRLP4 84
ARGP4
ADDRLP4 348
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 304
ADDRLP4 348
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2926
;2926:			if (infog && otherinfog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $898
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $898
line 2927
;2927:				VectorSubtract(trace.endpos, eye, dir);
ADDRLP4 352
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 0+12
INDIRF4
ADDRLP4 352
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2928
;2928:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 356
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 356
INDIRF4
ASGNF4
line 2929
;2929:			}
ADDRGP4 $899
JUMPV
LABELV $898
line 2930
;2930:			else if (infog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $907
line 2931
;2931:				VectorCopy(trace.endpos, start);
ADDRLP4 120
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2932
;2932:				BotAI_Trace(&trace, start, NULL, NULL, eye, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2933
;2933:				VectorSubtract(eye, trace.endpos, dir);
ADDRLP4 352
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 352
INDIRP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 352
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2934
;2934:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 356
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 356
INDIRF4
ASGNF4
line 2935
;2935:			}
ADDRGP4 $908
JUMPV
LABELV $907
line 2936
;2936:			else if (otherinfog) {
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $917
line 2937
;2937:				VectorCopy(trace.endpos, end);
ADDRLP4 104
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2938
;2938:				BotAI_Trace(&trace, eye, NULL, NULL, end, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 104
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2939
;2939:				VectorSubtract(end, trace.endpos, dir);
ADDRLP4 136
ADDRLP4 104
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 104+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 104+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2940
;2940:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 352
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 352
INDIRF4
ASGNF4
line 2941
;2941:			}
ADDRGP4 $918
JUMPV
LABELV $917
line 2942
;2942:			else {
line 2944
;2943:				//if the entity and the viewer are not in fog assume there's no fog in between
;2944:				squaredfogdist = 0;
ADDRLP4 300
CNSTF4 0
ASGNF4
line 2945
;2945:			}
LABELV $918
LABELV $908
LABELV $899
line 2947
;2946:			//decrease visibility with the view distance through fog
;2947:			vis = 1 / ((squaredfogdist * 0.001) < 1 ? 1 : (squaredfogdist * 0.001));
ADDRLP4 300
INDIRF4
CNSTF4 981668463
MULF4
CNSTF4 1065353216
GEF4 $930
ADDRLP4 352
CNSTF4 1065353216
ASGNF4
ADDRGP4 $931
JUMPV
LABELV $930
ADDRLP4 352
ADDRLP4 300
INDIRF4
CNSTF4 981668463
MULF4
ASGNF4
LABELV $931
ADDRLP4 292
CNSTF4 1065353216
ADDRLP4 352
INDIRF4
DIVF4
ASGNF4
line 2949
;2948:			//if entering water visibility is reduced
;2949:			vis *= waterfactor;
ADDRLP4 292
ADDRLP4 292
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ASGNF4
line 2951
;2950:			//
;2951:			if (vis > bestvis) bestvis = vis;
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
LEF4 $932
ADDRLP4 296
ADDRLP4 292
INDIRF4
ASGNF4
LABELV $932
line 2953
;2952:			//if pretty much no fog
;2953:			if (bestvis >= 0.95) return bestvis;
ADDRLP4 296
INDIRF4
CNSTF4 1064514355
LTF4 $934
ADDRLP4 296
INDIRF4
RETF4
ADDRGP4 $843
JUMPV
LABELV $934
line 2954
;2954:		}
LABELV $893
line 2956
;2955:		//check bottom and top of bounding box as well
;2956:		if (i == 0) middle[2] += entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $936
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $937
JUMPV
LABELV $936
line 2957
;2957:		else if (i == 1) middle[2] += entinfo.maxs[2] - entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $941
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
SUBF4
ADDF4
ASGNF4
LABELV $941
LABELV $937
line 2958
;2958:	}
LABELV $878
line 2885
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 3
LTI4 $877
line 2959
;2959:	return bestvis;
ADDRLP4 296
INDIRF4
RETF4
LABELV $843
endproc BotEntityVisible 360 28
export BotFindEnemy
proc BotFindEnemy 424 20
line 2967
;2960:}
;2961:
;2962:/*
;2963:==================
;2964:BotFindEnemy
;2965:==================
;2966:*/
;2967:int BotFindEnemy(bot_state_t *bs, int curenemy) {
line 2974
;2968:	int i, healthdecrease;
;2969:	float f, alertness, easyfragger, vis;
;2970:	float squaredist, cursquaredist;
;2971:	aas_entityinfo_t entinfo, curenemyinfo;
;2972:	vec3_t dir, angles;
;2973:
;2974:	alertness = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ALERTNESS, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 46
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 336
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 164
ADDRLP4 336
INDIRF4
ASGNF4
line 2975
;2975:	easyfragger = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_EASY_FRAGGER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 45
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 340
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 176
ADDRLP4 340
INDIRF4
ASGNF4
line 2977
;2976:	//check if the health decreased
;2977:	healthdecrease = bs->lasthealth > bs->inventory[INVENTORY_HEALTH];
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 5988
ADDP4
INDIRI4
ADDRLP4 348
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
LEI4 $950
ADDRLP4 344
CNSTI4 1
ASGNI4
ADDRGP4 $951
JUMPV
LABELV $950
ADDRLP4 344
CNSTI4 0
ASGNI4
LABELV $951
ADDRLP4 160
ADDRLP4 344
INDIRI4
ASGNI4
line 2979
;2978:	//remember the current health value
;2979:	bs->lasthealth = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 5988
ADDP4
ADDRLP4 352
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 2981
;2980:	//
;2981:	if (curenemy >= 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $952
line 2982
;2982:		BotEntityInfo(curenemy, &curenemyinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 196
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2983
;2983:		if (EntityCarriesFlag(&curenemyinfo)) return qfalse;
ADDRLP4 196
ARGP4
ADDRLP4 356
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $954
CNSTI4 0
RETI4
ADDRGP4 $948
JUMPV
LABELV $954
line 2984
;2984:		VectorSubtract(curenemyinfo.origin, bs->origin, dir);
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 196+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 196+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 196+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2985
;2985:		cursquaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 364
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 192
ADDRLP4 364
INDIRF4
ASGNF4
line 2986
;2986:	}
ADDRGP4 $953
JUMPV
LABELV $952
line 2987
;2987:	else {
line 2988
;2988:		cursquaredist = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
line 2989
;2989:	}
LABELV $953
line 3018
;2990:#ifdef MISSIONPACK
;2991:	if (gametype == GT_OBELISK) {
;2992:		vec3_t target;
;2993:		bot_goal_t *goal;
;2994:		bsp_trace_t trace;
;2995:
;2996:		if (BotTeam(bs) == TEAM_RED)
;2997:			goal = &blueobelisk;
;2998:		else
;2999:			goal = &redobelisk;
;3000:		//if the obelisk is visible
;3001:		VectorCopy(goal->origin, target);
;3002:		target[2] += 1;
;3003:		BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;3004:		if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;3005:			if (goal->entitynum == bs->enemy) {
;3006:				return qfalse;
;3007:			}
;3008:			bs->enemy = goal->entitynum;
;3009:			bs->enemysight_time = FloatTime();
;3010:			bs->enemysuicide = qfalse;
;3011:			bs->enemydeath_time = 0;
;3012:			bs->enemyvisible_time = FloatTime();
;3013:			return qtrue;
;3014:		}
;3015:	}
;3016:#endif
;3017:	//
;3018:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $966
JUMPV
LABELV $963
line 3020
;3019:
;3020:		if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $968
ADDRGP4 $964
JUMPV
LABELV $968
line 3022
;3021:		//if it's the current enemy
;3022:		if (i == curenemy) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $970
ADDRGP4 $964
JUMPV
LABELV $970
line 3024
;3023:		//if the enemy has targeting disabled
;3024:		if (g_entities[i].flags & FL_NOTARGET) continue;
ADDRLP4 140
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $972
ADDRGP4 $964
JUMPV
LABELV $972
line 3026
;3025:		//
;3026:		BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3028
;3027:		//
;3028:		if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $975
ADDRGP4 $964
JUMPV
LABELV $975
line 3030
;3029:		//if the enemy isn't dead and the enemy isn't the bot self
;3030:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 356
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
NEI4 $980
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $977
LABELV $980
ADDRGP4 $964
JUMPV
LABELV $977
line 3032
;3031:		//if the enemy is invisible and not shooting
;3032:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 360
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $981
ADDRLP4 0
ARGP4
ADDRLP4 364
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $981
line 3033
;3033:			continue;
ADDRGP4 $964
JUMPV
LABELV $981
line 3036
;3034:		}
;3035:		//if not an easy fragger don't shoot at chatting players
;3036:		if (easyfragger < 0.5 && EntityIsChatting(&entinfo)) continue;
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
GEF4 $983
ADDRLP4 0
ARGP4
ADDRLP4 368
ADDRGP4 EntityIsChatting
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $983
ADDRGP4 $964
JUMPV
LABELV $983
line 3038
;3037:		//
;3038:		if (lastteleport_time > FloatTime() - 3) {
ADDRGP4 lastteleport_time
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
LEF4 $985
line 3039
;3039:			VectorSubtract(entinfo.origin, lastteleport_origin, dir);
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRGP4 lastteleport_origin
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRGP4 lastteleport_origin+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRGP4 lastteleport_origin+8
INDIRF4
SUBF4
ASGNF4
line 3040
;3040:			if (VectorLengthSquared(dir) < Square(70)) continue;
ADDRLP4 144
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 372
INDIRF4
CNSTF4 1167663104
GEF4 $996
ADDRGP4 $964
JUMPV
LABELV $996
line 3041
;3041:		}
LABELV $985
line 3043
;3042:		//calculate the distance towards the enemy
;3043:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3044
;3044:		squaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 376
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 376
INDIRF4
ASGNF4
line 3046
;3045:		//if this entity is not carrying a flag
;3046:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 380
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $1005
line 3047
;3047:		{
line 3049
;3048:			//if this enemy is further away than the current one
;3049:			if (curenemy >= 0 && squaredist > cursquaredist) continue;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1007
ADDRLP4 156
INDIRF4
ADDRLP4 192
INDIRF4
LEF4 $1007
ADDRGP4 $964
JUMPV
LABELV $1007
line 3050
;3050:		} //end if
LABELV $1005
line 3052
;3051:		//if the bot has no
;3052:		if (squaredist > Square(900.0 + alertness * 4000.0)) continue;
ADDRLP4 156
INDIRF4
ADDRLP4 164
INDIRF4
CNSTF4 1165623296
MULF4
CNSTF4 1147207680
ADDF4
ADDRLP4 164
INDIRF4
CNSTF4 1165623296
MULF4
CNSTF4 1147207680
ADDF4
MULF4
LEF4 $1009
ADDRGP4 $964
JUMPV
LABELV $1009
line 3054
;3053:		//if on the same team
;3054:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $1011
ADDRGP4 $964
JUMPV
LABELV $1011
line 3056
;3055:		//if the bot's health decreased or the enemy is shooting
;3056:		if (curenemy < 0 && (healthdecrease || EntityIsShooting(&entinfo)))
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $1013
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1015
ADDRLP4 0
ARGP4
ADDRLP4 392
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 0
EQI4 $1013
LABELV $1015
line 3057
;3057:			f = 360;
ADDRLP4 168
CNSTF4 1135869952
ASGNF4
ADDRGP4 $1014
JUMPV
LABELV $1013
line 3059
;3058:		else
;3059:			f = 90 + 90 - (90 - (squaredist > Square(810) ? Square(810) : squaredist) / (810 * 9));
ADDRLP4 156
INDIRF4
CNSTF4 1226845760
LEF4 $1017
ADDRLP4 396
CNSTF4 1226845760
ASGNF4
ADDRGP4 $1018
JUMPV
LABELV $1017
ADDRLP4 396
ADDRLP4 156
INDIRF4
ASGNF4
LABELV $1018
ADDRLP4 168
CNSTF4 1127481344
CNSTF4 1119092736
ADDRLP4 396
INDIRF4
CNSTF4 957339244
MULF4
SUBF4
SUBF4
ASGNF4
LABELV $1014
line 3061
;3060:		//check if the enemy is visible
;3061:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, f, i);
ADDRLP4 400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 400
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 400
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 400
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 168
INDIRF4
ARGF4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 404
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 172
ADDRLP4 404
INDIRF4
ASGNF4
line 3062
;3062:		if (vis <= 0) continue;
ADDRLP4 172
INDIRF4
CNSTF4 0
GTF4 $1019
ADDRGP4 $964
JUMPV
LABELV $1019
line 3064
;3063:		//if the enemy is quite far away, not shooting and the bot is not damaged
;3064:		if (curenemy < 0 && squaredist > Square(100) && !healthdecrease && !EntityIsShooting(&entinfo))
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $1021
ADDRLP4 156
INDIRF4
CNSTF4 1176256512
LEF4 $1021
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1021
ADDRLP4 0
ARGP4
ADDRLP4 408
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
NEI4 $1021
line 3065
;3065:		{
line 3067
;3066:			//check if we can avoid this enemy
;3067:			VectorSubtract(bs->origin, entinfo.origin, dir);
ADDRLP4 412
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 412
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 412
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
SUBF4
ASGNF4
line 3068
;3068:			vectoangles(dir, angles);
ADDRLP4 144
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3070
;3069:			//if the bot isn't in the fov of the enemy
;3070:			if (!InFieldOfVision(entinfo.angles, 90, angles)) {
ADDRLP4 0+36
ARGP4
CNSTF4 1119092736
ARGF4
ADDRLP4 180
ARGP4
ADDRLP4 416
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $1030
line 3072
;3071:				//update some stuff for this enemy
;3072:				BotUpdateBattleInventory(bs, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 3074
;3073:				//if the bot doesn't really want to fight
;3074:				if (BotWantsToRetreat(bs)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 420
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 420
INDIRI4
CNSTI4 0
EQI4 $1033
ADDRGP4 $964
JUMPV
LABELV $1033
line 3075
;3075:			}
LABELV $1030
line 3076
;3076:		}
LABELV $1021
line 3078
;3077:		//found an enemy
;3078:		bs->enemy = entinfo.number;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
ADDRLP4 0+20
INDIRI4
ASGNI4
line 3079
;3079:		if (curenemy >= 0) bs->enemysight_time = FloatTime() - 2;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1036
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
ADDRGP4 $1037
JUMPV
LABELV $1036
line 3080
;3080:		else bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $1037
line 3081
;3081:		bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 0
ASGNI4
line 3082
;3082:		bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 3083
;3083:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3084
;3084:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $948
JUMPV
LABELV $964
line 3018
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $966
ADDRLP4 140
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $963
line 3086
;3085:	}
;3086:	return qfalse;
CNSTI4 0
RETI4
LABELV $948
endproc BotFindEnemy 424 20
export BotTeamFlagCarrierVisible
proc BotTeamFlagCarrierVisible 164 20
line 3094
;3087:}
;3088:
;3089:/*
;3090:==================
;3091:BotTeamFlagCarrierVisible
;3092:==================
;3093:*/
;3094:int BotTeamFlagCarrierVisible(bot_state_t *bs) {
line 3100
;3095:	int i;
;3096:	float vis;
;3097:	aas_entityinfo_t entinfo;
;3098:
;3099://qlone - freezetag
;3100:	if ( g_freezeTag.integer && gametype == GT_CTF )
ADDRGP4 g_freezeTag+12
INDIRI4
CNSTI4 0
EQI4 $1039
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $1039
line 3101
;3101:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1038
JUMPV
LABELV $1039
line 3104
;3102://qlone - freezetag
;3103:
;3104:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1045
JUMPV
LABELV $1042
line 3105
;3105:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1047
line 3106
;3106:			continue;
ADDRGP4 $1043
JUMPV
LABELV $1047
line 3108
;3107:		//
;3108:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3110
;3109:		//if this player is active
;3110:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1049
line 3111
;3111:			continue;
ADDRGP4 $1043
JUMPV
LABELV $1049
line 3113
;3112:		//if this player is carrying a flag
;3113:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1051
line 3114
;3114:			continue;
ADDRGP4 $1043
JUMPV
LABELV $1051
line 3116
;3115:		//if the flag carrier is not on the same team
;3116:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1053
line 3117
;3117:			continue;
ADDRGP4 $1043
JUMPV
LABELV $1053
line 3119
;3118:		//if the flag carrier is not visible
;3119:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3120
;3120:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1055
line 3121
;3121:			continue;
ADDRGP4 $1043
JUMPV
LABELV $1055
line 3123
;3122:		//
;3123:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1038
JUMPV
LABELV $1043
line 3104
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1045
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1042
line 3125
;3124:	}
;3125:	return -1;
CNSTI4 -1
RETI4
LABELV $1038
endproc BotTeamFlagCarrierVisible 164 20
export BotTeamFlagCarrier
proc BotTeamFlagCarrier 152 8
line 3133
;3126:}
;3127:
;3128:/*
;3129:==================
;3130:BotTeamFlagCarrier
;3131:==================
;3132:*/
;3133:int BotTeamFlagCarrier(bot_state_t *bs) {
line 3137
;3134:	int i;
;3135:	aas_entityinfo_t entinfo;
;3136:
;3137:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1061
JUMPV
LABELV $1058
line 3138
;3138:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1063
line 3139
;3139:			continue;
ADDRGP4 $1059
JUMPV
LABELV $1063
line 3141
;3140:		//
;3141:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3143
;3142:		//if this player is active
;3143:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1065
line 3144
;3144:			continue;
ADDRGP4 $1059
JUMPV
LABELV $1065
line 3146
;3145:		//if this player is carrying a flag
;3146:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1067
line 3147
;3147:			continue;
ADDRGP4 $1059
JUMPV
LABELV $1067
line 3149
;3148:		//if the flag carrier is not on the same team
;3149:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1069
line 3150
;3150:			continue;
ADDRGP4 $1059
JUMPV
LABELV $1069
line 3152
;3151:		//
;3152:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1057
JUMPV
LABELV $1059
line 3137
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1061
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1058
line 3154
;3153:	}
;3154:	return -1;
CNSTI4 -1
RETI4
LABELV $1057
endproc BotTeamFlagCarrier 152 8
export BotEnemyFlagCarrierVisible
proc BotEnemyFlagCarrierVisible 164 20
line 3162
;3155:}
;3156:
;3157:/*
;3158:==================
;3159:BotEnemyFlagCarrierVisible
;3160:==================
;3161:*/
;3162:int BotEnemyFlagCarrierVisible(bot_state_t *bs) {
line 3167
;3163:	int i;
;3164:	float vis;
;3165:	aas_entityinfo_t entinfo;
;3166:
;3167:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1075
JUMPV
LABELV $1072
line 3168
;3168:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1077
line 3169
;3169:			continue;
ADDRGP4 $1073
JUMPV
LABELV $1077
line 3171
;3170:		//
;3171:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3173
;3172:		//if this player is active
;3173:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1079
line 3174
;3174:			continue;
ADDRGP4 $1073
JUMPV
LABELV $1079
line 3176
;3175:		//if this player is carrying a flag
;3176:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1081
line 3177
;3177:			continue;
ADDRGP4 $1073
JUMPV
LABELV $1081
line 3179
;3178:		//if the flag carrier is on the same team
;3179:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1083
line 3180
;3180:			continue;
ADDRGP4 $1073
JUMPV
LABELV $1083
line 3182
;3181:		//if the flag carrier is not visible
;3182:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3183
;3183:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1085
line 3184
;3184:			continue;
ADDRGP4 $1073
JUMPV
LABELV $1085
line 3186
;3185:		//
;3186:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1071
JUMPV
LABELV $1073
line 3167
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1075
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1072
line 3188
;3187:	}
;3188:	return -1;
CNSTI4 -1
RETI4
LABELV $1071
endproc BotEnemyFlagCarrierVisible 164 20
export BotVisibleTeamMatesAndEnemies
proc BotVisibleTeamMatesAndEnemies 192 20
line 3196
;3189:}
;3190:
;3191:/*
;3192:==================
;3193:BotVisibleTeamMatesAndEnemies
;3194:==================
;3195:*/
;3196:void BotVisibleTeamMatesAndEnemies(bot_state_t *bs, int *teammates, int *enemies, float range) {
line 3202
;3197:	int i;
;3198:	float vis;
;3199:	aas_entityinfo_t entinfo;
;3200:	vec3_t dir;
;3201:
;3202:	if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1088
line 3203
;3203:		*teammates = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1088
line 3204
;3204:	if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1090
line 3205
;3205:		*enemies = 0;
ADDRFP4 8
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1090
line 3206
;3206:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1095
JUMPV
LABELV $1092
line 3207
;3207:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1097
line 3208
;3208:			continue;
ADDRGP4 $1093
JUMPV
LABELV $1097
line 3210
;3209:		//
;3210:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3212
;3211:		//if this player is active
;3212:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1099
line 3213
;3213:			continue;
ADDRGP4 $1093
JUMPV
LABELV $1099
line 3215
;3214:		//if this player is carrying a flag
;3215:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1101
line 3216
;3216:			continue;
ADDRGP4 $1093
JUMPV
LABELV $1101
line 3218
;3217:		//if not within range
;3218:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 4+24
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 4+24+4
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 4+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3219
;3219:		if (VectorLengthSquared(dir) > Square(range))
ADDRLP4 144
ARGP4
ADDRLP4 168
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 172
ADDRFP4 12
INDIRF4
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
LEF4 $1110
line 3220
;3220:			continue;
ADDRGP4 $1093
JUMPV
LABELV $1110
line 3222
;3221:		//if the flag carrier is not visible
;3222:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 180
INDIRF4
ASGNF4
line 3223
;3223:		if (vis <= 0)
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1112
line 3224
;3224:			continue;
ADDRGP4 $1093
JUMPV
LABELV $1112
line 3226
;3225:		//if the flag carrier is on the same team
;3226:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1114
line 3227
;3227:			if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1115
line 3228
;3228:				(*teammates)++;
ADDRLP4 188
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3229
;3229:		}
ADDRGP4 $1115
JUMPV
LABELV $1114
line 3230
;3230:		else {
line 3231
;3231:			if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1118
line 3232
;3232:				(*enemies)++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1118
line 3233
;3233:		}
LABELV $1115
line 3234
;3234:	}
LABELV $1093
line 3206
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1095
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1092
line 3235
;3235:}
LABELV $1087
endproc BotVisibleTeamMatesAndEnemies 192 20
data
align 4
LABELV $1121
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $1122
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
export BotAimAtEnemy
code
proc BotAimAtEnemy 1128 52
line 3306
;3236:
;3237:#ifdef MISSIONPACK
;3238:/*
;3239:==================
;3240:BotTeamCubeCarrierVisible
;3241:==================
;3242:*/
;3243:int BotTeamCubeCarrierVisible(bot_state_t *bs) {
;3244:	int i;
;3245:	float vis;
;3246:	aas_entityinfo_t entinfo;
;3247:
;3248:	for (i = 0; i < maxclients; i++) {
;3249:		if (i == bs->client) continue;
;3250:		//
;3251:		BotEntityInfo(i, &entinfo);
;3252:		//if this player is active
;3253:		if (!entinfo.valid) continue;
;3254:		//if this player is carrying a flag
;3255:		if (!EntityCarriesCubes(&entinfo)) continue;
;3256:		//if the flag carrier is not on the same team
;3257:		if (!BotSameTeam(bs, i)) continue;
;3258:		//if the flag carrier is not visible
;3259:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3260:		if (vis <= 0) continue;
;3261:		//
;3262:		return i;
;3263:	}
;3264:	return -1;
;3265:}
;3266:
;3267:/*
;3268:==================
;3269:BotEnemyCubeCarrierVisible
;3270:==================
;3271:*/
;3272:int BotEnemyCubeCarrierVisible(bot_state_t *bs) {
;3273:	int i;
;3274:	float vis;
;3275:	aas_entityinfo_t entinfo;
;3276:
;3277:	for (i = 0; i < maxclients; i++) {
;3278:		if (i == bs->client)
;3279:			continue;
;3280:		//
;3281:		BotEntityInfo(i, &entinfo);
;3282:		//if this player is active
;3283:		if (!entinfo.valid)
;3284:			continue;
;3285:		//if this player is carrying a flag
;3286:		if (!EntityCarriesCubes(&entinfo)) continue;
;3287:		//if the flag carrier is on the same team
;3288:		if (BotSameTeam(bs, i))
;3289:			continue;
;3290:		//if the flag carrier is not visible
;3291:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3292:		if (vis <= 0)
;3293:			continue;
;3294:		//
;3295:		return i;
;3296:	}
;3297:	return -1;
;3298:}
;3299:#endif
;3300:
;3301:/*
;3302:==================
;3303:BotAimAtEnemy
;3304:==================
;3305:*/
;3306:void BotAimAtEnemy(bot_state_t *bs) {
line 3310
;3307:	int i, enemyvisible;
;3308:	float dist, f, aim_skill, aim_accuracy, speed, reactiontime;
;3309:	vec3_t dir, bestorigin, end, start, groundtarget, cmdmove, enemyvelocity;
;3310:	vec3_t mins = {-4,-4,-4}, maxs = {4, 4, 4};
ADDRLP4 860
ADDRGP4 $1121
INDIRB
ASGNB 12
ADDRLP4 872
ADDRGP4 $1122
INDIRB
ASGNB 12
line 3318
;3311:	weaponinfo_t wi;
;3312:	aas_entityinfo_t entinfo;
;3313:	bot_goal_t goal;
;3314:	bsp_trace_t trace;
;3315:	vec3_t target;
;3316:
;3317:	//if the bot has no enemy
;3318:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1123
line 3319
;3319:		return;
ADDRGP4 $1120
JUMPV
LABELV $1123
line 3322
;3320:	}
;3321:	//get the enemy entity information
;3322:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3324
;3323:	//if this is not a player (should be an obelisk)
;3324:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1125
line 3326
;3325:		//if the obelisk is visible
;3326:		VectorCopy(entinfo.origin, target);
ADDRLP4 828
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3335
;3327:#ifdef MISSIONPACK
;3328:		// if attacking an obelisk
;3329:		if ( bs->enemy == redobelisk.entitynum ||
;3330:			bs->enemy == blueobelisk.entitynum ) {
;3331:			target[2] += 32;
;3332:		}
;3333:#endif
;3334:		//aim at the obelisk
;3335:		VectorSubtract(target, bs->eye, dir);
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 828
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 828+4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 828+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3336
;3336:		vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3338
;3337:		//set the aim target before trying to attack
;3338:		VectorCopy(target, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 828
INDIRB
ASGNB 12
line 3339
;3339:		return;
ADDRGP4 $1120
JUMPV
LABELV $1125
line 3344
;3340:	}
;3341:	//
;3342:	//BotAI_Print(PRT_MESSAGE, "client %d: aiming at client %d\n", bs->entitynum, bs->enemy);
;3343:	//
;3344:	aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 984
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 984
INDIRF4
ASGNF4
line 3345
;3345:	aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 988
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 988
INDIRF4
ASGNF4
line 3347
;3346:	//
;3347:	if (aim_skill > 0.95) {
ADDRLP4 736
INDIRF4
CNSTF4 1064514355
LEF4 $1132
line 3349
;3348:		//don't aim too early
;3349:		reactiontime = 0.5 * trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 992
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 856
ADDRLP4 992
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3350
;3350:		if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1134
ADDRGP4 $1120
JUMPV
LABELV $1134
line 3351
;3351:		if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1136
ADDRGP4 $1120
JUMPV
LABELV $1136
line 3352
;3352:	}
LABELV $1132
line 3355
;3353:
;3354:	//get the weapon information
;3355:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 992
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3357
;3356:	//get the weapon specific aim accuracy and or aim skill
;3357:	if (wi.number == WP_MACHINEGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 2
NEI4 $1138
line 3358
;3358:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3359
;3359:	}
ADDRGP4 $1139
JUMPV
LABELV $1138
line 3360
;3360:	else if (wi.number == WP_SHOTGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 3
NEI4 $1141
line 3361
;3361:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_SHOTGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3362
;3362:	}
ADDRGP4 $1142
JUMPV
LABELV $1141
line 3363
;3363:	else if (wi.number == WP_GRENADE_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1144
line 3364
;3364:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 11
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3365
;3365:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 18
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3366
;3366:	}
ADDRGP4 $1145
JUMPV
LABELV $1144
line 3367
;3367:	else if (wi.number == WP_ROCKET_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 5
NEI4 $1147
line 3368
;3368:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3369
;3369:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3370
;3370:	}
ADDRGP4 $1148
JUMPV
LABELV $1147
line 3371
;3371:	else if (wi.number == WP_LIGHTNING) {
ADDRLP4 160+4
INDIRI4
CNSTI4 6
NEI4 $1150
line 3372
;3372:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_LIGHTNING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3373
;3373:	}
ADDRGP4 $1151
JUMPV
LABELV $1150
line 3374
;3374:	else if (wi.number == WP_RAILGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1153
line 3375
;3375:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_RAILGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 14
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3376
;3376:	}
ADDRGP4 $1154
JUMPV
LABELV $1153
line 3377
;3377:	else if (wi.number == WP_PLASMAGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 8
NEI4 $1156
line 3378
;3378:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3379
;3379:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 19
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3380
;3380:	}
ADDRGP4 $1157
JUMPV
LABELV $1156
line 3381
;3381:	else if (wi.number == WP_BFG) {
ADDRLP4 160+4
INDIRI4
CNSTI4 9
NEI4 $1159
line 3382
;3382:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 15
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3383
;3383:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 20
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3384
;3384:	}
LABELV $1159
LABELV $1157
LABELV $1154
LABELV $1151
LABELV $1148
LABELV $1145
LABELV $1142
LABELV $1139
line 3386
;3385:	//
;3386:	if (aim_accuracy <= 0) aim_accuracy = 0.0001f;
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1162
ADDRLP4 156
CNSTF4 953267991
ASGNF4
LABELV $1162
line 3388
;3387:	//get the enemy entity information
;3388:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3390
;3389:	//if the enemy is invisible then shoot crappy most of the time
;3390:	if (EntityIsInvisible(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 996
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $1164
line 3391
;3391:		if (random() > 0.1) aim_accuracy *= 0.4f;
ADDRLP4 1000
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1036831949
LEF4 $1166
ADDRLP4 156
ADDRLP4 156
INDIRF4
CNSTF4 1053609165
MULF4
ASGNF4
LABELV $1166
line 3392
;3392:	}
LABELV $1164
line 3394
;3393:	//
;3394:	VectorSubtract(entinfo.origin, entinfo.lastvisorigin, enemyvelocity);
ADDRLP4 712
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3395
;3395:	VectorScale(enemyvelocity, 1 / entinfo.update_time, enemyvelocity);
ADDRLP4 712
ADDRLP4 712
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 712+4
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 712+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3397
;3396:	//enemy origin and velocity is remembered every 0.5 seconds
;3397:	if (bs->enemyposition_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1187
line 3399
;3398:		//
;3399:		bs->enemyposition_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3400
;3400:		VectorCopy(enemyvelocity, bs->enemyvelocity);
ADDRFP4 0
INDIRP4
CNSTI4 6232
ADDP4
ADDRLP4 712
INDIRB
ASGNB 12
line 3401
;3401:		VectorCopy(entinfo.origin, bs->enemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6244
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3402
;3402:	}
LABELV $1187
line 3404
;3403:	//if not extremely skilled
;3404:	if (aim_skill < 0.9) {
ADDRLP4 736
INDIRF4
CNSTF4 1063675494
GEF4 $1190
line 3405
;3405:		VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1000
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1000
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3407
;3406:		//if the enemy moved a bit
;3407:		if (VectorLengthSquared(dir) > Square(48)) {
ADDRLP4 140
ARGP4
ADDRLP4 1004
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1004
INDIRF4
CNSTF4 1158676480
LEF4 $1199
line 3409
;3408:			//if the enemy changed direction
;3409:			if (DotProduct(bs->enemyvelocity, enemyvelocity) < 0) {
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6232
ADDP4
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ADDRLP4 1008
INDIRP4
CNSTI4 6236
ADDP4
INDIRF4
ADDRLP4 712+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1008
INDIRP4
CNSTI4 6240
ADDP4
INDIRF4
ADDRLP4 712+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1201
line 3411
;3410:				//aim accuracy should be worse now
;3411:				aim_accuracy *= 0.7f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 3412
;3412:			}
LABELV $1201
line 3413
;3413:		}
LABELV $1199
line 3414
;3414:	}
LABELV $1190
line 3416
;3415:	//check visibility of enemy
;3416:	enemyvisible = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy);
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 1000
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 1000
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 1000
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1004
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 824
ADDRLP4 1004
INDIRF4
CVFI4 4
ASGNI4
line 3418
;3417:	//if the enemy is visible
;3418:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1205
line 3420
;3419:		//
;3420:		VectorCopy(entinfo.origin, bestorigin);
ADDRLP4 724
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3421
;3421:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3424
;3422:		//get the start point shooting from
;3423:		//NOTE: the x and y projectile start offsets are ignored
;3424:		VectorCopy(bs->origin, start);
ADDRLP4 844
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3425
;3425:		start[2] += bs->cur_ps.viewheight;
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3426
;3426:		start[2] += wi.offset[2];
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRLP4 160+292+8
INDIRF4
ADDF4
ASGNF4
line 3428
;3427:		//
;3428:		BotAI_Trace(&trace, start, mins, maxs, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
ADDRLP4 860
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 724
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3430
;3429:		//if the enemy is NOT hit
;3430:		if (trace.fraction <= 1 && trace.ent != entinfo.number) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
GTF4 $1213
ADDRLP4 740+80
INDIRI4
ADDRLP4 0+20
INDIRI4
EQI4 $1213
line 3431
;3431:			bestorigin[2] += 16;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3432
;3432:		}
LABELV $1213
line 3434
;3433:		//if it is not an instant hit weapon the bot might want to predict the enemy
;3434:		if (wi.speed) {
ADDRLP4 160+272
INDIRF4
CNSTF4 0
EQF4 $1219
line 3436
;3435:			//
;3436:			VectorSubtract(bestorigin, bs->origin, dir);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3437
;3437:			dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1012
INDIRF4
ASGNF4
line 3438
;3438:			VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3440
;3439:			//if the enemy is NOT pretty far away and strafing just small steps left and right
;3440:			if (!(dist > 100 && VectorLengthSquared(dir) < Square(32))) {
ADDRLP4 840
INDIRF4
CNSTF4 1120403456
LEF4 $1235
ADDRLP4 140
ARGP4
ADDRLP4 1020
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1020
INDIRF4
CNSTF4 1149239296
LTF4 $1233
LABELV $1235
line 3442
;3441:				//if skilled anough do exact prediction
;3442:				if (aim_skill > 0.8 &&
ADDRLP4 736
INDIRF4
CNSTF4 1061997773
LEF4 $1236
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1236
line 3444
;3443:						//if the weapon is ready to fire
;3444:						bs->cur_ps.weaponstate == WEAPON_READY) {
line 3448
;3445:					aas_clientmove_t move;
;3446:					vec3_t origin;
;3447:
;3448:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3450
;3449:					//distance towards the enemy
;3450:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1124
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1124
INDIRF4
ASGNF4
line 3452
;3451:					//direction the enemy is moving in
;3452:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3454
;3453:					//
;3454:					VectorScale(dir, 1 / entinfo.update_time, dir);
ADDRLP4 140
ADDRLP4 140
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3456
;3455:					//
;3456:					VectorCopy(entinfo.origin, origin);
ADDRLP4 1024
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3457
;3457:					origin[2] += 1;
ADDRLP4 1024+8
ADDRLP4 1024+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3459
;3458:					//
;3459:					VectorClear(cmdmove);
ADDRLP4 968
CNSTF4 0
ASGNF4
ADDRLP4 968+4
CNSTF4 0
ASGNF4
ADDRLP4 968+8
CNSTF4 0
ASGNF4
line 3461
;3460:					//AAS_ClearShownDebugLines();
;3461:					trap_AAS_PredictClientMovement(&move, bs->enemy, origin,
ADDRLP4 1036
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 140
ARGP4
ADDRLP4 968
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 840
INDIRF4
CNSTF4 1092616192
MULF4
ADDRLP4 160+272
INDIRF4
DIVF4
CVFI4 4
ARGI4
CNSTF4 1036831949
ARGF4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_AAS_PredictClientMovement
CALLI4
pop
line 3465
;3462:														PRESENCE_CROUCH, qfalse,
;3463:														dir, cmdmove, 0,
;3464:														dist * 10 / wi.speed, 0.1f, 0, 0, qfalse);
;3465:					VectorCopy(move.endpos, bestorigin);
ADDRLP4 724
ADDRLP4 1036
INDIRB
ASGNB 12
line 3467
;3466:					//BotAI_Print(PRT_MESSAGE, "%1.1f predicted speed = %f, frames = %f\n", FloatTime(), VectorLength(dir), dist * 10 / wi.speed);
;3467:				}
ADDRGP4 $1237
JUMPV
LABELV $1236
line 3469
;3468:				//if not that skilled do linear prediction
;3469:				else if (aim_skill > 0.4) {
ADDRLP4 736
INDIRF4
CNSTF4 1053609165
LEF4 $1269
line 3470
;3470:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3472
;3471:					//distance towards the enemy
;3472:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1028
INDIRF4
ASGNF4
line 3474
;3473:					//direction the enemy is moving in
;3474:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3475
;3475:					dir[2] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 3477
;3476:					//
;3477:					speed = VectorNormalize(dir) / entinfo.update_time;
ADDRLP4 140
ARGP4
ADDRLP4 1032
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 980
ADDRLP4 1032
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
ASGNF4
line 3480
;3478:					//botimport.Print(PRT_MESSAGE, "speed = %f, wi->speed = %f\n", speed, wi->speed);
;3479:					//best spot to aim at
;3480:					VectorMA(entinfo.origin, (dist / wi.speed) * speed, dir, bestorigin);
ADDRLP4 1036
ADDRLP4 840
INDIRF4
ASGNF4
ADDRLP4 1040
ADDRLP4 980
INDIRF4
ASGNF4
ADDRLP4 724
ADDRLP4 0+24
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 1036
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1040
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 140+4
INDIRF4
ADDRLP4 1036
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1040
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 140+8
INDIRF4
ADDRLP4 840
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 980
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 3481
;3481:				}
LABELV $1269
LABELV $1237
line 3482
;3482:			}
LABELV $1233
line 3483
;3483:		}
LABELV $1219
line 3485
;3484:		//if the projectile does radial damage
;3485:		if (aim_skill > 0.6 && wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 736
INDIRF4
CNSTF4 1058642330
LEF4 $1304
ADDRLP4 160+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1304
line 3487
;3486:			//if the enemy isn't standing significantly higher than the bot
;3487:			if (entinfo.origin[2] < bs->origin[2] + 16) {
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
GEF4 $1308
line 3489
;3488:				//try to aim at the ground in front of the enemy
;3489:				VectorCopy(entinfo.origin, end);
ADDRLP4 956
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3490
;3490:				end[2] -= 64;
ADDRLP4 956+8
ADDRLP4 956+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3491
;3491:				BotAI_Trace(&trace, entinfo.origin, NULL, NULL, end, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 0+24
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 956
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3493
;3492:				//
;3493:				VectorCopy(bestorigin, groundtarget);
ADDRLP4 944
ADDRLP4 724
INDIRB
ASGNB 12
line 3494
;3494:				if (trace.startsolid) groundtarget[2] = entinfo.origin[2] - 16;
ADDRLP4 740+4
INDIRI4
CNSTI4 0
EQI4 $1316
ADDRLP4 944+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
ADDRGP4 $1317
JUMPV
LABELV $1316
line 3495
;3495:				else groundtarget[2] = trace.endpos[2] - 8;
ADDRLP4 944+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
LABELV $1317
line 3497
;3496:				//trace a line from projectile start to ground target
;3497:				BotAI_Trace(&trace, start, NULL, NULL, groundtarget, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 944
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3499
;3498:				//if hitpoint is not vertically too far from the ground target
;3499:				if (fabs(trace.endpos[2] - groundtarget[2]) < 50) {
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ARGF4
ADDRLP4 1008
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1008
INDIRF4
CNSTF4 1112014848
GEF4 $1325
line 3500
;3500:					VectorSubtract(trace.endpos, groundtarget, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 944
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 944+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ASGNF4
line 3502
;3501:					//if the hitpoint is near enough the ground target
;3502:					if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1012
INDIRF4
CNSTF4 1163984896
GEF4 $1339
line 3503
;3503:						VectorSubtract(trace.endpos, start, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 844
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 844+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 844+8
INDIRF4
SUBF4
ASGNF4
line 3505
;3504:						//if the hitpoint is far enough from the bot
;3505:						if (VectorLengthSquared(dir) > Square(100)) {
ADDRLP4 140
ARGP4
ADDRLP4 1016
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1016
INDIRF4
CNSTF4 1176256512
LEF4 $1350
line 3507
;3506:							//check if the bot is visible from the ground target
;3507:							trace.endpos[2] += 1;
ADDRLP4 740+12+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3508
;3508:							BotAI_Trace(&trace, trace.endpos, NULL, NULL, entinfo.origin, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 740+12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3509
;3509:							if (trace.fraction >= 1) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
LTF4 $1357
line 3511
;3510:								//botimport.Print(PRT_MESSAGE, "%1.1f aiming at ground\n", AAS_Time());
;3511:								VectorCopy(groundtarget, bestorigin);
ADDRLP4 724
ADDRLP4 944
INDIRB
ASGNB 12
line 3512
;3512:							}
LABELV $1357
line 3513
;3513:						}
LABELV $1350
line 3514
;3514:					}
LABELV $1339
line 3515
;3515:				}
LABELV $1325
line 3516
;3516:			}
LABELV $1308
line 3517
;3517:		}
LABELV $1304
line 3518
;3518:		bestorigin[0] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1008
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724
ADDRLP4 724
INDIRF4
ADDRLP4 1008
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
CNSTF4 1101004800
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3519
;3519:		bestorigin[1] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1012
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
CNSTF4 1101004800
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3520
;3520:		bestorigin[2] += 10 * crandom() * (1 - aim_accuracy);
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
ADDRLP4 1016
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
CNSTF4 1092616192
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3521
;3521:	}
ADDRGP4 $1206
JUMPV
LABELV $1205
line 3522
;3522:	else {
line 3524
;3523:		//
;3524:		VectorCopy(bs->lastenemyorigin, bestorigin);
ADDRLP4 724
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 3525
;3525:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3527
;3526:		//if the bot is skilled enough
;3527:		if (aim_skill > 0.5) {
ADDRLP4 736
INDIRF4
CNSTF4 1056964608
LEF4 $1363
line 3529
;3528:			//do prediction shots around corners
;3529:			if (wi.number == WP_BFG ||
ADDRLP4 160+4
INDIRI4
CNSTI4 9
EQI4 $1371
ADDRLP4 160+4
INDIRI4
CNSTI4 5
EQI4 $1371
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1365
LABELV $1371
line 3531
;3530:				wi.number == WP_ROCKET_LAUNCHER ||
;3531:				wi.number == WP_GRENADE_LAUNCHER) {
line 3533
;3532:				//create the chase goal
;3533:				goal.entitynum = bs->client;
ADDRLP4 884+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 3534
;3534:				goal.areanum = bs->areanum;
ADDRLP4 884+12
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3535
;3535:				VectorCopy(bs->eye, goal.origin);
ADDRLP4 884
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
INDIRB
ASGNB 12
line 3536
;3536:				VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 884+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+8
CNSTF4 3238002688
ASGNF4
line 3537
;3537:				VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 884+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+8
CNSTF4 1090519040
ASGNF4
line 3539
;3538:				//
;3539:				if (trap_BotPredictVisiblePosition(bs->lastenemyorigin, bs->lastenemyareanum, &goal, TFL_DEFAULT, target)) {
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6548
ADDP4
ARGP4
ADDRLP4 1008
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ARGI4
ADDRLP4 884
ARGP4
CNSTI4 18616254
ARGI4
ADDRLP4 828
ARGP4
ADDRLP4 1012
ADDRGP4 trap_BotPredictVisiblePosition
CALLI4
ASGNI4
ADDRLP4 1012
INDIRI4
CNSTI4 0
EQI4 $1384
line 3540
;3540:					VectorSubtract(target, bs->eye, dir);
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 828
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 828+4
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 828+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3541
;3541:					if (VectorLengthSquared(dir) > Square(80)) {
ADDRLP4 140
ARGP4
ADDRLP4 1020
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1020
INDIRF4
CNSTF4 1170735104
LEF4 $1390
line 3542
;3542:						VectorCopy(target, bestorigin);
ADDRLP4 724
ADDRLP4 828
INDIRB
ASGNB 12
line 3543
;3543:						bestorigin[2] -= 20;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 3544
;3544:					}
LABELV $1390
line 3545
;3545:				}
LABELV $1384
line 3546
;3546:				aim_accuracy = 1;
ADDRLP4 156
CNSTF4 1065353216
ASGNF4
line 3547
;3547:			}
LABELV $1365
line 3548
;3548:		}
LABELV $1363
line 3549
;3549:	}
LABELV $1206
line 3551
;3550:	//
;3551:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1393
line 3552
;3552:		BotAI_Trace(&trace, bs->eye, NULL, NULL, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 724
ARGP4
ADDRLP4 1008
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3553
;3553:		VectorCopy(trace.endpos, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 740+12
INDIRB
ASGNB 12
line 3554
;3554:	}
ADDRGP4 $1394
JUMPV
LABELV $1393
line 3555
;3555:	else {
line 3556
;3556:		VectorCopy(bestorigin, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 724
INDIRB
ASGNB 12
line 3557
;3557:	}
LABELV $1394
line 3559
;3558:	//get aim direction
;3559:	VectorSubtract(bestorigin, bs->eye, dir);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3561
;3560:	//
;3561:	if (wi.number == WP_MACHINEGUN ||
ADDRLP4 160+4
INDIRI4
CNSTI4 2
EQI4 $1408
ADDRLP4 160+4
INDIRI4
CNSTI4 3
EQI4 $1408
ADDRLP4 160+4
INDIRI4
CNSTI4 6
EQI4 $1408
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1400
LABELV $1408
line 3564
;3562:		wi.number == WP_SHOTGUN ||
;3563:		wi.number == WP_LIGHTNING ||
;3564:		wi.number == WP_RAILGUN) {
line 3566
;3565:		//distance towards the enemy
;3566:		dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1012
INDIRF4
ASGNF4
line 3567
;3567:		if (dist > 150) dist = 150;
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
LEF4 $1409
ADDRLP4 840
CNSTF4 1125515264
ASGNF4
LABELV $1409
line 3568
;3568:		f = 0.6 + dist / 150 * 0.4;
ADDRLP4 940
ADDRLP4 840
INDIRF4
CNSTF4 992920382
MULF4
CNSTF4 1058642330
ADDF4
ASGNF4
line 3569
;3569:		aim_accuracy *= f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
ADDRLP4 940
INDIRF4
MULF4
ASGNF4
line 3570
;3570:	}
LABELV $1400
line 3572
;3571:	//add some random stuff to the aim direction depending on the aim accuracy
;3572:	if (aim_accuracy < 0.8) {
ADDRLP4 156
INDIRF4
CNSTF4 1061997773
GEF4 $1411
line 3573
;3573:		VectorNormalize(dir);
ADDRLP4 140
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3574
;3574:		for (i = 0; i < 3; i++) dir[i] += 0.3 * crandom() * (1 - aim_accuracy);
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $1413
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1016
ADDRLP4 152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
ADDP4
ASGNP4
ADDRLP4 1016
INDIRP4
ADDRLP4 1016
INDIRP4
INDIRF4
ADDRLP4 1012
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
CNSTF4 1050253722
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $1414
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 3
LTI4 $1413
line 3575
;3575:	}
LABELV $1411
line 3577
;3576:	//set the ideal view angles
;3577:	vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3579
;3578:	//take the weapon spread into account for lower skilled bots
;3579:	bs->ideal_viewangles[PITCH] += 6 * wi.vspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1016
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1016
INDIRP4
ADDRLP4 1016
INDIRP4
INDIRF4
ADDRLP4 160+268
INDIRF4
CNSTF4 1086324736
MULF4
ADDRLP4 1012
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
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3580
;3580:	bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 1020
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1020
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
ARGF4
ADDRLP4 1024
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1020
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 1024
INDIRF4
ASGNF4
line 3581
;3581:	bs->ideal_viewangles[YAW] += 6 * wi.hspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1028
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1032
INDIRP4
ADDRLP4 1032
INDIRP4
INDIRF4
ADDRLP4 160+264
INDIRF4
CNSTF4 1086324736
MULF4
ADDRLP4 1028
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
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3582
;3582:	bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 6580
ADDP4
INDIRF4
ARGF4
ADDRLP4 1040
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1036
INDIRP4
CNSTI4 6580
ADDP4
ADDRLP4 1040
INDIRF4
ASGNF4
line 3584
;3583:	//if the bots should be really challenging
;3584:	if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $1419
line 3586
;3585:		//if the bot is really accurate and has the enemy in view for some time
;3586:		if (aim_accuracy > 0.9 && bs->enemysight_time < FloatTime() - 1) {
ADDRLP4 156
INDIRF4
CNSTF4 1063675494
LEF4 $1422
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1422
line 3588
;3587:			//set the view angles directly
;3588:			if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $1424
ADDRLP4 1044
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $1424
line 3589
;3589:			VectorCopy(bs->ideal_viewangles, bs->viewangles);
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 6564
ADDP4
ADDRLP4 1048
INDIRP4
CNSTI4 6576
ADDP4
INDIRB
ASGNB 12
line 3590
;3590:			trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1052
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 3591
;3591:		}
LABELV $1422
line 3592
;3592:	}
LABELV $1419
line 3593
;3593:}
LABELV $1120
endproc BotAimAtEnemy 1128 52
data
align 4
LABELV $1427
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $1428
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCheckAttack
code
proc BotCheckAttack 1024 28
line 3600
;3594:
;3595:/*
;3596:==================
;3597:BotCheckAttack
;3598:==================
;3599:*/
;3600:void BotCheckAttack(bot_state_t *bs) {
line 3610
;3601:	float points, reactiontime, fov, firethrottle;
;3602:	int attackentity;
;3603:	bsp_trace_t bsptrace;
;3604:	//float selfpreservation;
;3605:	vec3_t forward, right, start, end, dir, angles;
;3606:	weaponinfo_t wi;
;3607:	bsp_trace_t trace;
;3608:	aas_entityinfo_t entinfo;
;3609:	weapon_t weapon;
;3610:	vec3_t mins = {-8, -8, -8}, maxs = {8, 8, 8};
ADDRLP4 812
ADDRGP4 $1427
INDIRB
ASGNB 12
ADDRLP4 824
ADDRGP4 $1428
INDIRB
ASGNB 12
line 3612
;3611:
;3612:	attackentity = bs->enemy;
ADDRLP4 576
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 3614
;3613:	//
;3614:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 576
INDIRI4
ARGI4
ADDRLP4 836
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3616
;3615:	// if not attacking a player
;3616:	if (attackentity >= MAX_CLIENTS) {
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1429
line 3628
;3617:#ifdef MISSIONPACK
;3618:		// if attacking an obelisk
;3619:		if ( entinfo.number == redobelisk.entitynum ||
;3620:			entinfo.number == blueobelisk.entitynum ) {
;3621:			// if obelisk is respawning return
;3622:			if ( g_entities[entinfo.number].activator &&
;3623:				g_entities[entinfo.number].activator->s.frame == 2 ) {
;3624:				return;
;3625:			}
;3626:		}
;3627:#endif
;3628:	}
LABELV $1429
line 3630
;3629:	//
;3630:	reactiontime = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 704
ADDRLP4 980
INDIRF4
ASGNF4
line 3631
;3631:	if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 704
INDIRF4
SUBF4
LEF4 $1431
ADDRGP4 $1426
JUMPV
LABELV $1431
line 3632
;3632:	if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 704
INDIRF4
SUBF4
LEF4 $1433
ADDRGP4 $1426
JUMPV
LABELV $1433
line 3634
;3633:	//if changing weapons
;3634:	if (bs->weaponchange_time > FloatTime() - 0.1) return;
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
SUBF4
LEF4 $1435
ADDRGP4 $1426
JUMPV
LABELV $1435
line 3636
;3635:	//check fire throttle characteristic
;3636:	if (bs->firethrottlewait_time > FloatTime()) return;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1437
ADDRGP4 $1426
JUMPV
LABELV $1437
line 3637
;3637:	firethrottle = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_FIRETHROTTLE, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 47
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 984
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 796
ADDRLP4 984
INDIRF4
ASGNF4
line 3638
;3638:	if (bs->firethrottleshoot_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1439
line 3639
;3639:		if (random() > firethrottle) {
ADDRLP4 988
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 988
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 796
INDIRF4
LEF4 $1441
line 3640
;3640:			bs->firethrottlewait_time = FloatTime() + firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 796
INDIRF4
ADDF4
ASGNF4
line 3641
;3641:			bs->firethrottleshoot_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
CNSTF4 0
ASGNF4
line 3642
;3642:		}
ADDRGP4 $1442
JUMPV
LABELV $1441
line 3643
;3643:		else {
line 3644
;3644:			bs->firethrottleshoot_time = FloatTime() + 1 - firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 796
INDIRF4
SUBF4
ASGNF4
line 3645
;3645:			bs->firethrottlewait_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
CNSTF4 0
ASGNF4
line 3646
;3646:		}
LABELV $1442
line 3647
;3647:	}
LABELV $1439
line 3650
;3648:	//
;3649:	//
;3650:	VectorSubtract(bs->aimtarget, bs->eye, dir);
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580
ADDRLP4 988
INDIRP4
CNSTI4 6220
ADDP4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 580+4
ADDRLP4 988
INDIRP4
CNSTI4 6224
ADDP4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580+8
ADDRLP4 992
INDIRP4
CNSTI4 6228
ADDP4
INDIRF4
ADDRLP4 992
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3652
;3651:	//
;3652:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1445
line 3653
;3653:		if (VectorLengthSquared(dir) > Square(60)) {
ADDRLP4 580
ARGP4
ADDRLP4 996
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 996
INDIRF4
CNSTF4 1163984896
LEF4 $1447
line 3654
;3654:			return;
ADDRGP4 $1426
JUMPV
LABELV $1447
line 3656
;3655:		}
;3656:	}
LABELV $1445
line 3657
;3657:	if (VectorLengthSquared(dir) < Square(100))
ADDRLP4 580
ARGP4
ADDRLP4 996
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 996
INDIRF4
CNSTF4 1176256512
GEF4 $1449
line 3658
;3658:		fov = 120;
ADDRLP4 792
CNSTF4 1123024896
ASGNF4
ADDRGP4 $1450
JUMPV
LABELV $1449
line 3660
;3659:	else
;3660:		fov = 50;
ADDRLP4 792
CNSTF4 1112014848
ASGNF4
LABELV $1450
line 3662
;3661:	//
;3662:	vectoangles(dir, angles);
ADDRLP4 580
ARGP4
ADDRLP4 800
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3663
;3663:	if (!InFieldOfVision(bs->viewangles, fov, angles))
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 792
INDIRF4
ARGF4
ADDRLP4 800
ARGP4
ADDRLP4 1000
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 0
NEI4 $1451
line 3664
;3664:		return;
ADDRGP4 $1426
JUMPV
LABELV $1451
line 3665
;3665:	BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->aimtarget, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 708
ARGP4
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 6220
ADDP4
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 65537
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3666
;3666:	if (bsptrace.fraction < 1 && bsptrace.ent != attackentity)
ADDRLP4 708+8
INDIRF4
CNSTF4 1065353216
GEF4 $1453
ADDRLP4 708+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1453
line 3667
;3667:		return;
ADDRGP4 $1426
JUMPV
LABELV $1453
line 3670
;3668:
;3669:	//get the weapon info
;3670:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 1008
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3672
;3671:	//get the start point shooting from
;3672:	VectorCopy(bs->origin, start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3673
;3673:	start[2] += bs->cur_ps.viewheight;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3674
;3674:	AngleVectors(bs->viewangles, forward, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 676
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3675
;3675:	start[0] += forward[0] * wi.offset[0] + right[0] * wi.offset[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3676
;3676:	start[1] += forward[1] * wi.offset[0] + right[1] * wi.offset[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+4
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3677
;3677:	start[2] += forward[2] * wi.offset[0] + right[2] * wi.offset[1] + wi.offset[2];
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+8
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+292+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 3679
;3678:	//end point aiming at
;3679:	VectorMA(start, 1000, forward, end);
ADDRLP4 688
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1148846080
MULF4
ADDF4
ASGNF4
ADDRLP4 688+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1148846080
MULF4
ADDF4
ASGNF4
ADDRLP4 688+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1148846080
MULF4
ADDF4
ASGNF4
line 3681
;3680:	//a little back to make sure not inside a very close enemy
;3681:	VectorMA(start, -12, forward, start);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3242196992
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 3242196992
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 3242196992
MULF4
ADDF4
ASGNF4
line 3682
;3682:	BotAI_Trace(&trace, start, mins, maxs, end, bs->entitynum, MASK_SHOT);
ADDRLP4 592
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 812
ARGP4
ADDRLP4 824
ARGP4
ADDRLP4 688
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3684
;3683:	//if the entity is a client
;3684:	if (trace.ent >= 0 && trace.ent < MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
CNSTI4 0
LTI4 $1487
ADDRLP4 592+80
INDIRI4
CNSTI4 64
GEI4 $1487
line 3685
;3685:		if (trace.ent != attackentity) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1491
line 3687
;3686:			//if a teammate is hit
;3687:			if (BotSameTeam(bs, trace.ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592+80
INDIRI4
ARGI4
ADDRLP4 1012
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1012
INDIRI4
CNSTI4 0
EQI4 $1494
line 3688
;3688:				return;
ADDRGP4 $1426
JUMPV
LABELV $1494
line 3689
;3689:		}
LABELV $1491
line 3690
;3690:	}
LABELV $1487
line 3692
;3691:	//if won't hit the enemy or not attacking a player (obelisk)
;3692:	if (trace.ent != attackentity || attackentity >= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
NEI4 $1500
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1497
LABELV $1500
line 3694
;3693:		//if the projectile does radial damage
;3694:		if (wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 24+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1501
line 3695
;3695:			if (trace.fraction * 1000 < wi.proj.radius) {
ADDRLP4 592+8
INDIRF4
CNSTF4 1148846080
MULF4
ADDRLP4 24+344+172
INDIRF4
GEF4 $1505
line 3696
;3696:				points = (wi.proj.damage - 0.5 * trace.fraction * 1000) * 0.5;
ADDRLP4 976
ADDRLP4 24+344+168
INDIRI4
CVIF4 4
ADDRLP4 592+8
INDIRF4
CNSTF4 1140457472
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3697
;3697:				if (points > 0) {
ADDRLP4 976
INDIRF4
CNSTF4 0
LEF4 $1513
line 3698
;3698:					return;
ADDRGP4 $1426
JUMPV
LABELV $1513
line 3700
;3699:				}
;3700:			}
LABELV $1505
line 3702
;3701:			//FIXME: check if a teammate gets radial damage
;3702:		}
LABELV $1501
line 3703
;3703:	}
LABELV $1497
line 3705
;3704:
;3705:	weapon = bs->cur_ps.weapon;
ADDRLP4 700
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 3706
;3706:	if ( weapon >= WP_MACHINEGUN && weapon <= WP_BFG && !bs->cur_ps.ammo[ weapon ] ) {
ADDRLP4 700
INDIRI4
CNSTI4 2
LTI4 $1515
ADDRLP4 700
INDIRI4
CNSTI4 9
GTI4 $1515
ADDRLP4 700
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1515
line 3707
;3707:		return;
ADDRGP4 $1426
JUMPV
LABELV $1515
line 3711
;3708:	}
;3709:
;3710:	//if fire has to be release to activate weapon
;3711:	if (wi.flags & WFL_FIRERELEASED) {
ADDRLP4 24+176
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1517
line 3712
;3712:		if (bs->flags & BFL_ATTACKED) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1518
line 3713
;3713:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3714
;3714:		}
line 3715
;3715:	}
ADDRGP4 $1518
JUMPV
LABELV $1517
line 3716
;3716:	else {
line 3717
;3717:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3718
;3718:	}
LABELV $1518
line 3719
;3719:	bs->flags ^= BFL_ATTACKED;
ADDRLP4 1020
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1020
INDIRP4
ADDRLP4 1020
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 3720
;3720:}
LABELV $1426
endproc BotCheckAttack 1024 28
data
align 4
LABELV $1526
byte 4 1143930880
byte 4 1129054208
byte 4 1143472128
align 4
LABELV $1527
byte 4 1148256256
byte 4 1139408896
byte 4 1143603200
align 4
LABELV $1528
byte 4 1134034944
byte 4 1135607808
byte 4 1147535360
export BotMapScripts
code
proc BotMapScripts 264 16
line 3727
;3721:
;3722:/*
;3723:==================
;3724:BotMapScripts
;3725:==================
;3726:*/
;3727:void BotMapScripts(bot_state_t *bs) {
line 3733
;3728:	int i, shootbutton;
;3729:	float aim_accuracy;
;3730:	aas_entityinfo_t entinfo;
;3731:	vec3_t dir;
;3732:
;3733:	if (!Q_stricmp(mapname, "q3tourney6")) {
ADDRGP4 mapname
ARGP4
ADDRGP4 $1525
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $1523
line 3734
;3734:		vec3_t mins = {700, 204, 672}, maxs = {964, 468, 680};
ADDRLP4 168
ADDRGP4 $1526
INDIRB
ASGNB 12
ADDRLP4 180
ADDRGP4 $1527
INDIRB
ASGNB 12
line 3735
;3735:		vec3_t buttonorg = {304, 352, 920};
ADDRLP4 192
ADDRGP4 $1528
INDIRB
ASGNB 12
line 3737
;3736:		//NOTE: NEVER use the func_bobbing in q3tourney6
;3737:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
ADDRLP4 204
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3739
;3738:		//if the bot is below the bounding box
;3739:		if (bs->origin[0] > mins[0] && bs->origin[0] < maxs[0]) {
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 168
INDIRF4
LEF4 $1529
ADDRLP4 208
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 180
INDIRF4
GEF4 $1529
line 3740
;3740:			if (bs->origin[1] > mins[1] && bs->origin[1] < maxs[1]) {
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 168+4
INDIRF4
LEF4 $1531
ADDRLP4 212
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 180+4
INDIRF4
GEF4 $1531
line 3741
;3741:				if (bs->origin[2] < mins[2]) {
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 168+8
INDIRF4
GEF4 $1535
line 3742
;3742:					return;
ADDRGP4 $1522
JUMPV
LABELV $1535
line 3744
;3743:				}
;3744:			}
LABELV $1531
line 3745
;3745:		}
LABELV $1529
line 3746
;3746:		shootbutton = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3748
;3747:		//if an enemy is below this bounding box then shoot the button
;3748:		for (i = 0; i < level.maxclients; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $1541
JUMPV
LABELV $1538
line 3750
;3749:
;3750:			if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1543
ADDRGP4 $1539
JUMPV
LABELV $1543
line 3752
;3751:			//
;3752:			BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3754
;3753:			//
;3754:			if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1545
ADDRGP4 $1539
JUMPV
LABELV $1545
line 3756
;3755:			//if the enemy isn't dead and the enemy isn't the bot self
;3756:			if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 212
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
NEI4 $1550
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $1547
LABELV $1550
ADDRGP4 $1539
JUMPV
LABELV $1547
line 3758
;3757:			//
;3758:			if (entinfo.origin[0] > mins[0] && entinfo.origin[0] < maxs[0]) {
ADDRLP4 0+24
INDIRF4
ADDRLP4 168
INDIRF4
LEF4 $1551
ADDRLP4 0+24
INDIRF4
ADDRLP4 180
INDIRF4
GEF4 $1551
line 3759
;3759:				if (entinfo.origin[1] > mins[1] && entinfo.origin[1] < maxs[1]) {
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 168+4
INDIRF4
LEF4 $1555
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 180+4
INDIRF4
GEF4 $1555
line 3760
;3760:					if (entinfo.origin[2] < mins[2]) {
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 168+8
INDIRF4
GEF4 $1563
line 3762
;3761:						//if there's a team mate below the crusher
;3762:						if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 216
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $1568
line 3763
;3763:							shootbutton = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3764
;3764:							break;
ADDRGP4 $1540
JUMPV
LABELV $1568
line 3766
;3765:						}
;3766:						else {
line 3767
;3767:							shootbutton = qtrue;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 3768
;3768:						}
line 3769
;3769:					}
LABELV $1563
line 3770
;3770:				}
LABELV $1555
line 3771
;3771:			}
LABELV $1551
line 3772
;3772:		}
LABELV $1539
line 3748
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1541
ADDRLP4 140
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1538
LABELV $1540
line 3773
;3773:		if (shootbutton) {
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1524
line 3774
;3774:			bs->flags |= BFL_IDEALVIEWSET;
ADDRLP4 212
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 212
INDIRP4
ADDRLP4 212
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3775
;3775:			VectorSubtract(buttonorg, bs->eye, dir);
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
ADDRLP4 192
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148+4
ADDRLP4 192+4
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148+8
ADDRLP4 192+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3776
;3776:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 148
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3777
;3777:			aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 220
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 160
ADDRLP4 220
INDIRF4
ASGNF4
line 3778
;3778:			bs->ideal_viewangles[PITCH] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 224
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 228
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRF4
ADDRLP4 224
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
CNSTF4 1090519040
MULF4
CNSTF4 1065353216
ADDRLP4 160
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3779
;3779:			bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
ARGF4
ADDRLP4 236
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 232
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 236
INDIRF4
ASGNF4
line 3780
;3780:			bs->ideal_viewangles[YAW] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 240
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 244
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 244
INDIRP4
ADDRLP4 244
INDIRP4
INDIRF4
ADDRLP4 240
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
CNSTF4 1090519040
MULF4
CNSTF4 1065353216
ADDRLP4 160
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3781
;3781:			bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 6580
ADDP4
INDIRF4
ARGF4
ADDRLP4 252
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 6580
ADDP4
ADDRLP4 252
INDIRF4
ASGNF4
line 3783
;3782:			//
;3783:			if (InFieldOfVision(bs->viewangles, 20, bs->ideal_viewangles)) {
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 256
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRLP4 260
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $1524
line 3784
;3784:				trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3785
;3785:			}
line 3786
;3786:		}
line 3787
;3787:	}
ADDRGP4 $1524
JUMPV
LABELV $1523
line 3788
;3788:	else if (!Q_stricmp(mapname, "mpq3tourney6")) {
ADDRGP4 mapname
ARGP4
ADDRGP4 $1580
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $1578
line 3790
;3789:		//NOTE: NEVER use the func_bobbing in mpq3tourney6
;3790:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3791
;3791:	}
LABELV $1578
LABELV $1524
line 3792
;3792:}
LABELV $1522
endproc BotMapScripts 264 16
data
align 4
LABELV VEC_UP
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV MOVEDIR_UP
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV VEC_DOWN
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV MOVEDIR_DOWN
byte 4 0
byte 4 0
byte 4 3212836864
export BotSetMovedir
code
proc BotSetMovedir 8 16
line 3805
;3793:
;3794:/*
;3795:==================
;3796:BotSetMovedir
;3797:==================
;3798:*/
;3799:// bk001205 - made these static
;3800:static vec3_t VEC_UP		= {0, -1,  0};
;3801:static vec3_t MOVEDIR_UP	= {0,  0,  1};
;3802:static vec3_t VEC_DOWN		= {0, -2,  0};
;3803:static vec3_t MOVEDIR_DOWN	= {0,  0, -1};
;3804:
;3805:void BotSetMovedir(vec3_t angles, vec3_t movedir) {
line 3806
;3806:	if (VectorCompare(angles, VEC_UP)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_UP
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1582
line 3807
;3807:		VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_UP
INDIRB
ASGNB 12
line 3808
;3808:	}
ADDRGP4 $1583
JUMPV
LABELV $1582
line 3809
;3809:	else if (VectorCompare(angles, VEC_DOWN)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_DOWN
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1584
line 3810
;3810:		VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_DOWN
INDIRB
ASGNB 12
line 3811
;3811:	}
ADDRGP4 $1585
JUMPV
LABELV $1584
line 3812
;3812:	else {
line 3813
;3813:		AngleVectors(angles, movedir, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3814
;3814:	}
LABELV $1585
LABELV $1583
line 3815
;3815:}
LABELV $1581
endproc BotSetMovedir 8 16
export BotModelMinsMaxs
proc BotModelMinsMaxs 40 0
line 3824
;3816:
;3817:/*
;3818:==================
;3819:BotModelMinsMaxs
;3820:
;3821:this is ugly
;3822:==================
;3823:*/
;3824:int BotModelMinsMaxs(int modelindex, int eType, int contents, vec3_t mins, vec3_t maxs) {
line 3828
;3825:	gentity_t *ent;
;3826:	int i;
;3827:
;3828:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 3829
;3829:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1590
JUMPV
LABELV $1587
line 3830
;3830:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1592
line 3831
;3831:			continue;
ADDRGP4 $1588
JUMPV
LABELV $1592
line 3833
;3832:		}
;3833:		if ( eType && ent->s.eType != eType) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1594
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1594
line 3834
;3834:			continue;
ADDRGP4 $1588
JUMPV
LABELV $1594
line 3836
;3835:		}
;3836:		if ( contents && ent->r.contents != contents) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1596
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1596
line 3837
;3837:			continue;
ADDRGP4 $1588
JUMPV
LABELV $1596
line 3839
;3838:		}
;3839:		if (ent->s.modelindex == modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1598
line 3840
;3840:			if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1600
line 3841
;3841:				VectorAdd(ent->r.currentOrigin, ent->r.mins, mins);
ADDRFP4 12
INDIRP4
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
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
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
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
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
ADDF4
ASGNF4
LABELV $1600
line 3842
;3842:			if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1602
line 3843
;3843:				VectorAdd(ent->r.currentOrigin, ent->r.maxs, maxs);
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $1602
line 3844
;3844:			return i;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $1586
JUMPV
LABELV $1598
line 3846
;3845:		}
;3846:	}
LABELV $1588
line 3829
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $1590
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1587
line 3847
;3847:	if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1604
line 3848
;3848:		VectorClear(mins);
ADDRFP4 12
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
LABELV $1604
line 3849
;3849:	if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1606
line 3850
;3850:		VectorClear(maxs);
ADDRFP4 16
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
LABELV $1606
line 3851
;3851:	return 0;
CNSTI4 0
RETI4
LABELV $1586
endproc BotModelMinsMaxs 40 0
data
align 4
LABELV $1609
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $1610
byte 4 3212836864
byte 4 3212836864
byte 4 3212836864
export BotFuncButtonActivateGoal
code
proc BotFuncButtonActivateGoal 628 28
line 3859
;3852:}
;3853:
;3854:/*
;3855:==================
;3856:BotFuncButtonGoal
;3857:==================
;3858:*/
;3859:int BotFuncButtonActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3865
;3860:	int i, areas[10], numareas, modelindex, entitynum;
;3861:	char model[128];
;3862:	float lip, dist, health, angle;
;3863:	vec3_t size, start, end, mins, maxs, angles, points[10];
;3864:	vec3_t movedir, origin, goalorigin, bboxmins, bboxmaxs;
;3865:	vec3_t extramins = {1, 1, 1}, extramaxs = {-1, -1, -1};
ADDRLP4 304
ADDRGP4 $1609
INDIRB
ASGNB 12
ADDRLP4 316
ADDRGP4 $1610
INDIRB
ASGNB 12
line 3868
;3866:	bsp_trace_t bsptrace;
;3867:
;3868:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3869
;3869:	VectorClear(activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 84
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 88
ADDP4
CNSTF4 0
ASGNF4
line 3871
;3870:	//create a bot goal towards the button
;3871:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $282
ARGP4
ADDRLP4 160
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3872
;3872:	if (!*model)
ADDRLP4 160
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1611
line 3873
;3873:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1608
JUMPV
LABELV $1611
line 3874
;3874:	modelindex = atoi(model+1);
ADDRLP4 160+1
ARGP4
ADDRLP4 560
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 288
ADDRLP4 560
INDIRI4
ASGNI4
line 3875
;3875:	if (!modelindex)
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $1614
line 3876
;3876:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1608
JUMPV
LABELV $1614
line 3877
;3877:	VectorClear(angles);
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96+4
CNSTF4 0
ASGNF4
ADDRLP4 96+8
CNSTF4 0
ASGNF4
line 3878
;3878:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 288
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 564
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 344
ADDRLP4 564
INDIRI4
ASGNI4
line 3880
;3879:	//get the lip of the button
;3880:	trap_AAS_FloatForBSPEpairKey(bspent, "lip", &lip);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1618
ARGP4
ADDRLP4 328
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3881
;3881:	if (!lip) lip = 4;
ADDRLP4 328
INDIRF4
CNSTF4 0
NEF4 $1619
ADDRLP4 328
CNSTF4 1082130432
ASGNF4
LABELV $1619
line 3883
;3882:	//get the move direction from the angle
;3883:	trap_AAS_FloatForBSPEpairKey(bspent, "angle", &angle);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1621
ARGP4
ADDRLP4 352
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3884
;3884:	VectorSet(angles, 0, angle, 0);
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96+4
ADDRLP4 352
INDIRF4
ASGNF4
ADDRLP4 96+8
CNSTF4 0
ASGNF4
line 3885
;3885:	BotSetMovedir(angles, movedir);
ADDRLP4 96
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BotSetMovedir
CALLV
pop
line 3887
;3886:	//button size
;3887:	VectorSubtract(maxs, mins, size);
ADDRLP4 112
ADDRLP4 84
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 72+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 72+8
INDIRF4
SUBF4
ASGNF4
line 3889
;3888:	//button origin
;3889:	VectorAdd(mins, maxs, origin);
ADDRLP4 16
ADDRLP4 72
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 72+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 72+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 3890
;3890:	VectorScale(origin, 0.5, origin);
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3892
;3891:	//touch distance of the button
;3892:	dist = fabs(movedir[0]) * size[0] + fabs(movedir[1]) * size[1] + fabs(movedir[2]) * size[2];
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 568
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+4
INDIRF4
ARGF4
ADDRLP4 572
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+8
INDIRF4
ARGF4
ADDRLP4 576
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 568
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDRLP4 572
INDIRF4
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ADDRLP4 576
INDIRF4
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3893
;3893:	dist *= 0.5;
ADDRLP4 28
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3895
;3894:	//
;3895:	trap_AAS_FloatForBSPEpairKey(bspent, "health", &health);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1644
ARGP4
ADDRLP4 348
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3897
;3896:	//if the button is shootable
;3897:	if (health) {
ADDRLP4 348
INDIRF4
CNSTF4 0
EQF4 $1645
line 3899
;3898:		//calculate the shoot target
;3899:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 580
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3901
;3900:		//
;3901:		VectorCopy(goalorigin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3902
;3902:		activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3904
;3903:		//
;3904:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, goalorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 356
ARGP4
ADDRLP4 584
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 584
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 584
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3906
;3905:		// if the button is visible from the current position
;3906:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == entitynum) {
ADDRLP4 356+8
INDIRF4
CNSTF4 1065353216
GEF4 $1657
ADDRLP4 356+80
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $1653
LABELV $1657
line 3908
;3907:			//
;3908:			activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable button
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3909
;3909:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3910
;3910:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3911
;3911:			VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3912
;3912:			activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3913
;3913:			VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 3914
;3914:			VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 3916
;3915:			//
;3916:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1608
JUMPV
LABELV $1653
line 3918
;3917:		}
;3918:		else {
line 3921
;3919:			//create a goal from where the button is visible and shoot at the button from there
;3920:			//add bounding box size to the dist
;3921:			trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3922
;3922:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1658
line 3923
;3923:				if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1662
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 588
INDIRF4
ADDRLP4 592
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1663
JUMPV
LABELV $1662
line 3924
;3924:				else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 596
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 600
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 596
INDIRF4
ADDRLP4 600
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1663
line 3925
;3925:			}
LABELV $1659
line 3922
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1658
line 3927
;3926:			//calculate the goal origin
;3927:			VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 588
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3929
;3928:			//
;3929:			VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3930
;3930:			start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3931
;3931:			VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3932
;3932:			end[2] -= 512;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1140850688
SUBF4
ASGNF4
line 3933
;3933:			numareas = trap_AAS_TraceAreas(start, end, areas, points, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 440
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 592
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 592
INDIRI4
ASGNI4
line 3935
;3934:			//
;3935:			for (i = numareas-1; i >= 0; i--) {
ADDRLP4 0
ADDRLP4 108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1675
JUMPV
LABELV $1672
line 3936
;3936:				if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 596
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 596
INDIRI4
CNSTI4 0
EQI4 $1676
line 3937
;3937:					break;
ADDRGP4 $1674
JUMPV
LABELV $1676
line 3939
;3938:				}
;3939:			}
LABELV $1673
line 3935
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1675
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1672
LABELV $1674
line 3940
;3940:			if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1678
line 3942
;3941:				// FIXME: trace forward and maybe in other directions to find a valid area
;3942:			}
LABELV $1678
line 3943
;3943:			if (i >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1680
line 3945
;3944:				//
;3945:				VectorCopy(points[i], activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 440
ADDP4
INDIRB
ASGNB 12
line 3946
;3946:				activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3947
;3947:				VectorSet(activategoal->goal.mins, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
line 3948
;3948:				VectorSet(activategoal->goal.maxs, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3238002688
ASGNF4
line 3950
;3949:				//
;3950:				for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1682
line 3951
;3951:				{
line 3952
;3952:					if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1686
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 600
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 608
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 608
INDIRP4
ADDRLP4 608
INDIRP4
INDIRF4
ADDRLP4 600
INDIRF4
ADDRLP4 604
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1687
JUMPV
LABELV $1686
line 3953
;3953:					else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 616
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 620
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 624
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 624
INDIRP4
ADDRLP4 624
INDIRP4
INDIRF4
ADDRLP4 616
INDIRF4
ADDRLP4 620
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1687
line 3954
;3954:				} //end for
LABELV $1683
line 3950
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1682
line 3956
;3955:				//
;3956:				activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3957
;3957:				activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3958
;3958:				activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3959
;3959:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1608
JUMPV
LABELV $1680
line 3961
;3960:			}
;3961:		}
line 3962
;3962:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1608
JUMPV
LABELV $1645
line 3964
;3963:	}
;3964:	else {
line 3966
;3965:		//add bounding box size to the dist
;3966:		trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3967
;3967:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1688
line 3968
;3968:			if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1692
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 580
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 584
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 580
INDIRF4
ADDRLP4 584
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1693
JUMPV
LABELV $1692
line 3969
;3969:			else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 588
INDIRF4
ADDRLP4 592
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1693
line 3970
;3970:		}
LABELV $1689
line 3967
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1688
line 3972
;3971:		//calculate the goal origin
;3972:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 580
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3974
;3973:		//
;3974:		VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3975
;3975:		start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3976
;3976:		VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3977
;3977:		end[2] -= 100;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 3978
;3978:		numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 584
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 584
INDIRI4
ASGNI4
line 3980
;3979:		//
;3980:		for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1705
JUMPV
LABELV $1702
line 3981
;3981:			if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 588
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $1706
line 3982
;3982:				break;
ADDRGP4 $1704
JUMPV
LABELV $1706
line 3984
;3983:			}
;3984:		}
LABELV $1703
line 3980
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1705
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $1702
LABELV $1704
line 3985
;3985:		if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $1708
line 3987
;3986:			//
;3987:			VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 3988
;3988:			activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3989
;3989:			VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3990
;3990:			VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 84
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 84+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 84+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3992
;3991:			//
;3992:			for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1718
line 3993
;3993:			{
line 3994
;3994:				if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1722
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 596
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 600
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 600
INDIRP4
ADDRLP4 600
INDIRP4
INDIRF4
ADDRLP4 592
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1723
JUMPV
LABELV $1722
line 3995
;3995:				else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 612
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 616
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 616
INDIRP4
ADDRLP4 616
INDIRP4
INDIRF4
ADDRLP4 608
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1723
line 3996
;3996:			} //end for
LABELV $1719
line 3992
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1718
line 3998
;3997:			//
;3998:			activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3999
;3999:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4000
;4000:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4001
;4001:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1608
JUMPV
LABELV $1708
line 4003
;4002:		}
;4003:	}
line 4004
;4004:	return qfalse;
CNSTI4 0
RETI4
LABELV $1608
endproc BotFuncButtonActivateGoal 628 28
export BotFuncDoorActivateGoal
proc BotFuncDoorActivateGoal 1076 20
line 4012
;4005:}
;4006:
;4007:/*
;4008:==================
;4009:BotFuncDoorGoal
;4010:==================
;4011:*/
;4012:int BotFuncDoorActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 4019
;4013:	int modelindex, entitynum;
;4014:	char model[MAX_INFO_STRING];
;4015:	vec3_t mins, maxs, origin;
;4016:	//vec3_t angles;
;4017:
;4018:	//shoot at the shootable door
;4019:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $282
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4020
;4020:	if (!*model)
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1725
line 4021
;4021:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1724
JUMPV
LABELV $1725
line 4022
;4022:	modelindex = atoi(model+1);
ADDRLP4 12+1
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1068
INDIRI4
ASGNI4
line 4023
;4023:	if (!modelindex)
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1728
line 4024
;4024:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1724
JUMPV
LABELV $1728
line 4026
;4025:	//VectorClear(angles);
;4026:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 1060
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1072
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1072
INDIRI4
ASGNI4
line 4028
;4027:	//door origin
;4028:	VectorAdd(mins, maxs, origin);
ADDRLP4 0
ADDRLP4 1036
INDIRF4
ADDRLP4 1048
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1036+4
INDIRF4
ADDRLP4 1048+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 1036+8
INDIRF4
ADDRLP4 1048+8
INDIRF4
ADDF4
ASGNF4
line 4029
;4029:	VectorScale(origin, 0.5, origin);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 4030
;4030:	VectorCopy(origin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 4031
;4031:	activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 4033
;4032:	//
;4033:	activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable door
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1064
INDIRI4
ASGNI4
line 4034
;4034:	activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4035
;4035:	activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4036
;4036:	VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 4037
;4037:	activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 4038
;4038:	VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 4039
;4039:	VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 4040
;4040:	return qtrue;
CNSTI4 1
RETI4
LABELV $1724
endproc BotFuncDoorActivateGoal 1076 20
export BotTriggerMultipleActivateGoal
proc BotTriggerMultipleActivateGoal 272 20
line 4048
;4041:}
;4042:
;4043:/*
;4044:==================
;4045:BotTriggerMultipleGoal
;4046:==================
;4047:*/
;4048:int BotTriggerMultipleActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 4055
;4049:	int i, areas[10], numareas, modelindex, entitynum;
;4050:	char model[128];
;4051:	vec3_t start, end, mins, maxs;
;4052:	//vec3_t angles;
;4053:	vec3_t origin, goalorigin;
;4054:
;4055:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 4056
;4056:	VectorClear(activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 84
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 88
ADDP4
CNSTF4 0
ASGNF4
line 4058
;4057:	//create a bot goal towards the trigger
;4058:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $282
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4059
;4059:	if (!*model)
ADDRLP4 84
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1741
line 4060
;4060:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1740
JUMPV
LABELV $1741
line 4061
;4061:	modelindex = atoi(model+1);
ADDRLP4 84+1
ARGP4
ADDRLP4 256
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 224
ADDRLP4 256
INDIRI4
ASGNI4
line 4062
;4062:	if (!modelindex)
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $1744
line 4063
;4063:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1740
JUMPV
LABELV $1744
line 4065
;4064:	//VectorClear(angles);
;4065:	entitynum = BotModelMinsMaxs(modelindex, 0, CONTENTS_TRIGGER, mins, maxs);
ADDRLP4 224
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1073741824
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 260
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 252
ADDRLP4 260
INDIRI4
ASGNI4
line 4067
;4066:	//trigger origin
;4067:	VectorAdd(mins, maxs, origin);
ADDRLP4 4
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
ADDF4
ASGNF4
line 4068
;4068:	VectorScale(origin, 0.5, origin);
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 4069
;4069:	VectorCopy(origin, goalorigin);
ADDRLP4 240
ADDRLP4 4
INDIRB
ASGNB 12
line 4071
;4070:	//
;4071:	VectorCopy(goalorigin, start);
ADDRLP4 212
ADDRLP4 240
INDIRB
ASGNB 12
line 4072
;4072:	start[2] += 24;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4073
;4073:	VectorCopy(start, end);
ADDRLP4 228
ADDRLP4 212
INDIRB
ASGNB 12
line 4074
;4074:	end[2] -= 100;
ADDRLP4 228+8
ADDRLP4 228+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 4075
;4075:	numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 212
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 264
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 264
INDIRI4
ASGNI4
line 4077
;4076:	//
;4077:	for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1761
JUMPV
LABELV $1758
line 4078
;4078:		if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $1762
line 4079
;4079:			break;
ADDRGP4 $1760
JUMPV
LABELV $1762
line 4081
;4080:		}
;4081:	}
LABELV $1759
line 4077
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1761
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $1758
LABELV $1760
line 4082
;4082:	if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $1764
line 4083
;4083:		VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 4084
;4084:		activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ASGNI4
line 4085
;4085:		VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 60
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 60+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4086
;4086:		VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4088
;4087:		//
;4088:		activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 252
INDIRI4
ASGNI4
line 4089
;4089:		activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4090
;4090:		activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4091
;4091:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1740
JUMPV
LABELV $1764
line 4093
;4092:	}
;4093:	return qfalse;
CNSTI4 0
RETI4
LABELV $1740
endproc BotTriggerMultipleActivateGoal 272 20
export BotPopFromActivateGoalStack
proc BotPopFromActivateGoalStack 4 8
line 4101
;4094:}
;4095:
;4096:/*
;4097:==================
;4098:BotPopFromActivateGoalStack
;4099:==================
;4100:*/
;4101:int BotPopFromActivateGoalStack(bot_state_t *bs) {
line 4102
;4102:	if (!bs->activatestack)
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1775
line 4103
;4103:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1774
JUMPV
LABELV $1775
line 4104
;4104:	BotEnableActivateGoalAreas(bs->activatestack, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4105
;4105:	bs->activatestack->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 0
ASGNI4
line 4106
;4106:	bs->activatestack->justused_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4107
;4107:	bs->activatestack = bs->activatestack->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
line 4108
;4108:	return qtrue;
CNSTI4 1
RETI4
LABELV $1774
endproc BotPopFromActivateGoalStack 4 8
export BotPushOntoActivateGoalStack
proc BotPushOntoActivateGoalStack 20 12
line 4116
;4109:}
;4110:
;4111:/*
;4112:==================
;4113:BotPushOntoActivateGoalStack
;4114:==================
;4115:*/
;4116:int BotPushOntoActivateGoalStack(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4120
;4117:	int i, best;
;4118:	float besttime;
;4119:
;4120:	best = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4121
;4121:	besttime = FloatTime() + 9999;
ADDRLP4 4
ADDRGP4 floattime
INDIRF4
CNSTF4 1176255488
ADDF4
ASGNF4
line 4123
;4122:	//
;4123:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1778
line 4124
;4124:		if (!bs->activategoalheap[i].inuse) {
ADDRLP4 0
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1782
line 4125
;4125:			if (bs->activategoalheap[i].justused_time < besttime) {
ADDRLP4 0
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $1784
line 4126
;4126:				besttime = bs->activategoalheap[i].justused_time;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ASGNF4
line 4127
;4127:				best = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4128
;4128:			}
LABELV $1784
line 4129
;4129:		}
LABELV $1782
line 4130
;4130:	}
LABELV $1779
line 4123
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1778
line 4131
;4131:	if (best != -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1786
line 4132
;4132:		memcpy(&bs->activategoalheap[best], activategoal, sizeof(bot_activategoal_t));
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 244
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4133
;4133:		bs->activategoalheap[best].inuse = qtrue;
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4134
;4134:		bs->activategoalheap[best].next = bs->activatestack;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 240
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
ASGNP4
line 4135
;4135:		bs->activatestack = &bs->activategoalheap[best];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 7120
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
ASGNP4
line 4136
;4136:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1777
JUMPV
LABELV $1786
line 4138
;4137:	}
;4138:	return qfalse;
CNSTI4 0
RETI4
LABELV $1777
endproc BotPushOntoActivateGoalStack 20 12
export BotClearActivateGoalStack
proc BotClearActivateGoalStack 0 4
line 4146
;4139:}
;4140:
;4141:/*
;4142:==================
;4143:BotClearActivateGoalStack
;4144:==================
;4145:*/
;4146:void BotClearActivateGoalStack(bot_state_t *bs) {
ADDRGP4 $1790
JUMPV
LABELV $1789
line 4148
;4147:	while(bs->activatestack)
;4148:		BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
LABELV $1790
line 4147
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1789
line 4149
;4149:}
LABELV $1788
endproc BotClearActivateGoalStack 0 4
export BotEnableActivateGoalAreas
proc BotEnableActivateGoalAreas 12 8
line 4156
;4150:
;4151:/*
;4152:==================
;4153:BotEnableActivateGoalAreas
;4154:==================
;4155:*/
;4156:void BotEnableActivateGoalAreas(bot_activategoal_t *activategoal, int enable) {
line 4159
;4157:	int i;
;4158:
;4159:	if (activategoal->areasdisabled == !enable)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1796
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $1797
JUMPV
LABELV $1796
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1797
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1793
line 4160
;4160:		return;
ADDRGP4 $1792
JUMPV
LABELV $1793
line 4161
;4161:	for (i = 0; i < activategoal->numareas; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1801
JUMPV
LABELV $1798
line 4162
;4162:		trap_AAS_EnableRoutingArea( activategoal->areas[i], enable );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_AAS_EnableRoutingArea
CALLI4
pop
LABELV $1799
line 4161
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1801
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
LTI4 $1798
line 4163
;4163:	activategoal->areasdisabled = !enable;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1803
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1804
JUMPV
LABELV $1803
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1804
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4164
;4164:}
LABELV $1792
endproc BotEnableActivateGoalAreas 12 8
export BotIsGoingToActivateEntity
proc BotIsGoingToActivateEntity 8 0
line 4171
;4165:
;4166:/*
;4167:==================
;4168:BotIsGoingToActivateEntity
;4169:==================
;4170:*/
;4171:int BotIsGoingToActivateEntity(bot_state_t *bs, int entitynum) {
line 4175
;4172:	bot_activategoal_t *a;
;4173:	int i;
;4174:
;4175:	for (a = bs->activatestack; a; a = a->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1809
JUMPV
LABELV $1806
line 4176
;4176:		if (a->time < FloatTime())
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1810
line 4177
;4177:			continue;
ADDRGP4 $1807
JUMPV
LABELV $1810
line 4178
;4178:		if (a->goal.entitynum == entitynum)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1812
line 4179
;4179:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1805
JUMPV
LABELV $1812
line 4180
;4180:	}
LABELV $1807
line 4175
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
LABELV $1809
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1806
line 4181
;4181:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1814
line 4182
;4182:		if (bs->activategoalheap[i].inuse)
ADDRLP4 4
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1818
line 4183
;4183:			continue;
ADDRGP4 $1815
JUMPV
LABELV $1818
line 4185
;4184:		//
;4185:		if (bs->activategoalheap[i].goal.entitynum == entitynum) {
ADDRLP4 4
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1820
line 4187
;4186:			// if the bot went for this goal less than 2 seconds ago
;4187:			if (bs->activategoalheap[i].justused_time > FloatTime() - 2)
ADDRLP4 4
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $1822
line 4188
;4188:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1805
JUMPV
LABELV $1822
line 4189
;4189:		}
LABELV $1820
line 4190
;4190:	}
LABELV $1815
line 4181
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $1814
line 4191
;4191:	return qfalse;
CNSTI4 0
RETI4
LABELV $1805
endproc BotIsGoingToActivateEntity 8 0
export BotGetActivateGoal
proc BotGetActivateGoal 3304 20
line 4204
;4192:}
;4193:
;4194:/*
;4195:==================
;4196:BotGetActivateGoal
;4197:
;4198:  returns the number of the bsp entity to activate
;4199:  goal->entitynum will be set to the game entity to activate
;4200:==================
;4201:*/
;4202://#define OBSTACLEDEBUG
;4203:
;4204:int BotGetActivateGoal(bot_state_t *bs, int entitynum, bot_activategoal_t *activategoal) {
line 4215
;4205:	int i, ent, cur_entities[10], spawnflags, modelindex, areas[MAX_ACTIVATEAREAS*2], numareas, t;
;4206:	char model[MAX_INFO_STRING], tmpmodel[128];
;4207:	char target[128], classname[128];
;4208:	float health;
;4209:	char targetname[10][128];
;4210:	aas_entityinfo_t entinfo;
;4211:	aas_areainfo_t areainfo;
;4212:	vec3_t origin, absmins, absmaxs;
;4213:	//vec3_t angles;
;4214:
;4215:	memset(activategoal, 0, sizeof(bot_activategoal_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4216
;4216:	BotEntityInfo(entitynum, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 3052
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4217
;4217:	Com_sprintf(model, sizeof( model ), "*%d", entinfo.modelindex);
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1825
ARGP4
ADDRLP4 3052+104
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 4218
;4218:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 3240
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3240
INDIRI4
ASGNI4
ADDRGP4 $1830
JUMPV
LABELV $1827
line 4219
;4219:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", tmpmodel, sizeof(tmpmodel))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $282
ARGP4
ADDRLP4 1584
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3244
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3244
INDIRI4
CNSTI4 0
NEI4 $1831
ADDRGP4 $1828
JUMPV
LABELV $1831
line 4220
;4220:		if (!strcmp(model, tmpmodel)) break;
ADDRLP4 1712
ARGP4
ADDRLP4 1584
ARGP4
ADDRLP4 3248
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3248
INDIRI4
CNSTI4 0
NEI4 $1833
ADDRGP4 $1829
JUMPV
LABELV $1833
line 4221
;4221:	}
LABELV $1828
line 4218
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3244
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3244
INDIRI4
ASGNI4
LABELV $1830
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1827
LABELV $1829
line 4222
;4222:	if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1835
line 4223
;4223:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity found with model %s\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1837
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4224
;4224:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1824
JUMPV
LABELV $1835
line 4226
;4225:	}
;4226:	trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1838
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4227
;4227:	if (!*classname) {
ADDRLP4 1456
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1839
line 4228
;4228:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model %s has no classname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1841
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4229
;4229:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1824
JUMPV
LABELV $1839
line 4232
;4230:	}
;4231:	//if it is a door
;4232:	if (!strcmp(classname, "func_door")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1844
ARGP4
ADDRLP4 3248
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3248
INDIRI4
CNSTI4 0
NEI4 $1842
line 4233
;4233:		if (trap_AAS_FloatForBSPEpairKey(ent, "health", &health)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1644
ARGP4
ADDRLP4 3208
ARGP4
ADDRLP4 3252
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3252
INDIRI4
CNSTI4 0
EQI4 $1845
line 4235
;4234:			//if the door has health then the door must be shot to open
;4235:			if (health) {
ADDRLP4 3208
INDIRF4
CNSTF4 0
EQF4 $1847
line 4236
;4236:				BotFuncDoorActivateGoal(bs, ent, activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotFuncDoorActivateGoal
CALLI4
pop
line 4237
;4237:				return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1824
JUMPV
LABELV $1847
line 4239
;4238:			}
;4239:		}
LABELV $1845
line 4241
;4240:		//
;4241:		trap_AAS_IntForBSPEpairKey(ent, "spawnflags", &spawnflags);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1849
ARGP4
ADDRLP4 3204
ARGP4
ADDRGP4 trap_AAS_IntForBSPEpairKey
CALLI4
pop
line 4243
;4242:		// if the door starts open then just wait for the door to return
;4243:		if ( spawnflags & 1 )
ADDRLP4 3204
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1850
line 4244
;4244:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1824
JUMPV
LABELV $1850
line 4246
;4245:		//get the door origin
;4246:		if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1854
ARGP4
ADDRLP4 3192
ARGP4
ADDRLP4 3256
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3256
INDIRI4
CNSTI4 0
NEI4 $1852
line 4247
;4247:			VectorClear(origin);
ADDRLP4 3192
CNSTF4 0
ASGNF4
ADDRLP4 3192+4
CNSTF4 0
ASGNF4
ADDRLP4 3192+8
CNSTF4 0
ASGNF4
line 4248
;4248:		}
LABELV $1852
line 4250
;4249:		//if the door is open or opening already
;4250:		if (!VectorCompare(origin, entinfo.origin))
ADDRLP4 3192
ARGP4
ADDRLP4 3052+24
ARGP4
ADDRLP4 3260
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $1857
line 4251
;4251:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1824
JUMPV
LABELV $1857
line 4253
;4252:		// store all the areas the door is in
;4253:		trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $282
ARGP4
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4254
;4254:		if (*model) {
ADDRLP4 1712
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1860
line 4255
;4255:			modelindex = atoi(model+1);
ADDRLP4 1712+1
ARGP4
ADDRLP4 3264
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3212
ADDRLP4 3264
INDIRI4
ASGNI4
line 4256
;4256:			if (modelindex) {
ADDRLP4 3212
INDIRI4
CNSTI4 0
EQI4 $1863
line 4258
;4257:				//VectorClear(angles);
;4258:				BotModelMinsMaxs(modelindex, ET_MOVER, 0, absmins, absmaxs);
ADDRLP4 3212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 3216
ARGP4
ADDRLP4 3228
ARGP4
ADDRGP4 BotModelMinsMaxs
CALLI4
pop
line 4260
;4259:				//
;4260:				numareas = trap_AAS_BBoxAreas(absmins, absmaxs, areas, MAX_ACTIVATEAREAS*2);
ADDRLP4 3216
ARGP4
ADDRLP4 3228
ARGP4
ADDRLP4 2740
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 3268
ADDRGP4 trap_AAS_BBoxAreas
CALLI4
ASGNI4
ADDRLP4 3048
ADDRLP4 3268
INDIRI4
ASGNI4
line 4262
;4261:				// store the areas with reachabilities first
;4262:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1868
JUMPV
LABELV $1865
line 4263
;4263:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1869
line 4264
;4264:						break;
ADDRGP4 $1867
JUMPV
LABELV $1869
line 4265
;4265:					if ( !trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $1871
line 4266
;4266:						continue;
ADDRGP4 $1866
JUMPV
LABELV $1871
line 4268
;4267:					}
;4268:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4269
;4269:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1873
line 4270
;4270:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3280
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3276
ADDRLP4 3280
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3280
INDIRP4
ADDRLP4 3276
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4271
;4271:					}
LABELV $1873
line 4272
;4272:				}
LABELV $1866
line 4262
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1868
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1865
LABELV $1867
line 4274
;4273:				// store any remaining areas
;4274:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1878
JUMPV
LABELV $1875
line 4275
;4275:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1879
line 4276
;4276:						break;
ADDRGP4 $1877
JUMPV
LABELV $1879
line 4277
;4277:					if ( trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
EQI4 $1881
line 4278
;4278:						continue;
ADDRGP4 $1876
JUMPV
LABELV $1881
line 4280
;4279:					}
;4280:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4281
;4281:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1883
line 4282
;4282:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3280
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3276
ADDRLP4 3280
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3280
INDIRP4
ADDRLP4 3276
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4283
;4283:					}
LABELV $1883
line 4284
;4284:				}
LABELV $1876
line 4274
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1878
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1875
LABELV $1877
line 4285
;4285:			}
LABELV $1863
line 4286
;4286:		}
LABELV $1860
line 4287
;4287:	}
LABELV $1842
line 4289
;4288:	// if the bot is blocked by or standing on top of a button
;4289:	if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1887
ARGP4
ADDRLP4 3252
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3252
INDIRI4
CNSTI4 0
NEI4 $1885
line 4290
;4290:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1824
JUMPV
LABELV $1885
line 4293
;4291:	}
;4292:	// get the targetname so we can find an entity with a matching target
;4293:	if (!trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[0], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1890
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3256
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3256
INDIRI4
CNSTI4 0
NEI4 $1888
line 4294
;4294:		if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1891
line 4295
;4295:			BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model \"%s\" has no targetname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1894
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4296
;4296:		}
LABELV $1891
line 4297
;4297:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1824
JUMPV
LABELV $1888
line 4300
;4298:	}
;4299:	// allow tree-like activation
;4300:	cur_entities[0] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3260
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 1416
ADDRLP4 3260
INDIRI4
ASGNI4
line 4301
;4301:	for (i = 0; i >= 0 && i < 10;) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1898
JUMPV
LABELV $1895
line 4302
;4302:		for (ent = cur_entities[i]; ent; ent = trap_AAS_NextBSPEntity(ent)) {
ADDRLP4 0
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1902
JUMPV
LABELV $1899
line 4303
;4303:			if (!trap_AAS_ValueForBSPEpairKey(ent, "target", target, sizeof(target))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1905
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3264
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
NEI4 $1903
ADDRGP4 $1900
JUMPV
LABELV $1903
line 4304
;4304:			if (!strcmp(targetname[i], target)) {
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 3268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $1906
line 4305
;4305:				cur_entities[i] = trap_AAS_NextBSPEntity(ent);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3272
INDIRI4
ASGNI4
line 4306
;4306:				break;
ADDRGP4 $1901
JUMPV
LABELV $1906
line 4308
;4307:			}
;4308:		}
LABELV $1900
line 4302
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3264
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3264
INDIRI4
ASGNI4
LABELV $1902
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1899
LABELV $1901
line 4309
;4309:		if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1908
line 4310
;4310:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1910
line 4311
;4311:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity with target \"%s\"\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1913
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4312
;4312:			}
LABELV $1910
line 4313
;4313:			i--;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4314
;4314:			continue;
ADDRGP4 $1896
JUMPV
LABELV $1908
line 4316
;4315:		}
;4316:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1838
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3268
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $1914
line 4317
;4317:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1896
line 4318
;4318:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with target \"%s\" has no classname\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1919
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4319
;4319:			}
line 4320
;4320:			continue;
ADDRGP4 $1896
JUMPV
LABELV $1914
line 4323
;4321:		}
;4322:		// BSP button model
;4323:		if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1887
ARGP4
ADDRLP4 3272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $1920
line 4325
;4324:			//
;4325:			if (!BotFuncButtonActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3276
ADDRGP4 BotFuncButtonActivateGoal
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $1922
line 4326
;4326:				continue;
ADDRGP4 $1896
JUMPV
LABELV $1922
line 4328
;4327:			// if the bot tries to activate this button already
;4328:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1924
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1924
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $1924
ADDRLP4 3284
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3284
INDIRF4
LEF4 $1924
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3284
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1924
line 4332
;4329:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4330:				 bs->activatestack->time > FloatTime() &&
;4331:				 bs->activatestack->start_time < FloatTime() - 2)
;4332:				continue;
ADDRGP4 $1896
JUMPV
LABELV $1924
line 4334
;4333:			// if the bot is in a reachability area
;4334:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
EQI4 $1926
line 4336
;4335:				// disable all areas the blocking entity is in
;4336:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4338
;4337:				//
;4338:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3292
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3296
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3296
INDIRI4
ASGNI4
line 4340
;4339:				// if the button is not reachable
;4340:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1928
line 4341
;4341:					continue;
ADDRGP4 $1896
JUMPV
LABELV $1928
line 4343
;4342:				}
;4343:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 2736
INDIRI4
CVIF4 4
CNSTF4 1008981770
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4344
;4344:			}
LABELV $1926
line 4345
;4345:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1824
JUMPV
LABELV $1920
line 4348
;4346:		}
;4347:		// invisible trigger multiple box
;4348:		else if (!strcmp(classname, "trigger_multiple")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1932
ARGP4
ADDRLP4 3276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $1930
line 4350
;4349:			//
;4350:			if (!BotTriggerMultipleActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3280
ADDRGP4 BotTriggerMultipleActivateGoal
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $1933
line 4351
;4351:				continue;
ADDRGP4 $1896
JUMPV
LABELV $1933
line 4353
;4352:			// if the bot tries to activate this trigger already
;4353:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1935
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1935
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $1935
ADDRLP4 3288
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3288
INDIRF4
LEF4 $1935
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3288
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1935
line 4357
;4354:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4355:				 bs->activatestack->time > FloatTime() &&
;4356:				 bs->activatestack->start_time < FloatTime() - 2)
;4357:				continue;
ADDRGP4 $1896
JUMPV
LABELV $1935
line 4359
;4358:			// if the bot is in a reachability area
;4359:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
EQI4 $1937
line 4361
;4360:				// disable all areas the blocking entity is in
;4361:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4363
;4362:				//
;4363:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3296
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3296
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3296
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3300
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3300
INDIRI4
ASGNI4
line 4365
;4364:				// if the trigger is not reachable
;4365:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1939
line 4366
;4366:					continue;
ADDRGP4 $1896
JUMPV
LABELV $1939
line 4368
;4367:				}
;4368:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 2736
INDIRI4
CVIF4 4
CNSTF4 1008981770
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4369
;4369:			}
LABELV $1937
line 4370
;4370:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1824
JUMPV
LABELV $1930
line 4372
;4371:		}
;4372:		else if (!strcmp(classname, "func_timer")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1943
ARGP4
ADDRLP4 3280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $1941
line 4374
;4373:			// just skip the func_timer
;4374:			continue;
ADDRGP4 $1896
JUMPV
LABELV $1941
line 4377
;4375:		}
;4376:		// the actual button or trigger might be linked through a target_relay or target_delay
;4377:		else if (!strcmp(classname, "target_relay") || !strcmp(classname, "target_delay")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1946
ARGP4
ADDRLP4 3284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3284
INDIRI4
CNSTI4 0
EQI4 $1948
ADDRLP4 1456
ARGP4
ADDRGP4 $1947
ARGP4
ADDRLP4 3288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $1944
LABELV $1948
line 4378
;4378:			if (trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[i+1], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1890
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136+128
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3292
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
EQI4 $1949
line 4379
;4379:				i++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4380
;4380:				cur_entities[i] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3296
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3296
INDIRI4
ASGNI4
line 4381
;4381:			}
LABELV $1949
line 4382
;4382:		}
LABELV $1944
line 4383
;4383:	}
LABELV $1896
line 4301
LABELV $1898
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $1952
ADDRLP4 132
INDIRI4
CNSTI4 10
LTI4 $1895
LABELV $1952
line 4387
;4384:#ifdef OBSTACLEDEBUG
;4385:	BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no valid activator for entity with target \"%s\"\n", targetname[0]);
;4386:#endif
;4387:	return 0;
CNSTI4 0
RETI4
LABELV $1824
endproc BotGetActivateGoal 3304 20
export BotGoForActivateGoal
proc BotGoForActivateGoal 144 8
line 4395
;4388:}
;4389:
;4390:/*
;4391:==================
;4392:BotGoForActivateGoal
;4393:==================
;4394:*/
;4395:int BotGoForActivateGoal(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4398
;4396:	aas_entityinfo_t activateinfo;
;4397:
;4398:	activategoal->inuse = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 4399
;4399:	if (!activategoal->time)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1954
line 4400
;4400:		activategoal->time = FloatTime() + 10;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
LABELV $1954
line 4401
;4401:	activategoal->start_time = FloatTime();
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4402
;4402:	BotEntityInfo(activategoal->goal.entitynum, &activateinfo);
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4403
;4403:	VectorCopy(activateinfo.origin, activategoal->origin);
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4405
;4404:	//
;4405:	if (BotPushOntoActivateGoalStack(bs, activategoal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotPushOntoActivateGoalStack
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1957
line 4407
;4406:		// enter the activate entity AI node
;4407:		AIEnter_Seek_ActivateEntity(bs, "BotGoForActivateGoal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1959
ARGP4
ADDRGP4 AIEnter_Seek_ActivateEntity
CALLV
pop
line 4408
;4408:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1953
JUMPV
LABELV $1957
line 4410
;4409:	}
;4410:	else {
line 4412
;4411:		// enable any routing areas that were disabled
;4412:		BotEnableActivateGoalAreas(activategoal, qtrue);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4413
;4413:		return qfalse;
CNSTI4 0
RETI4
LABELV $1953
endproc BotGoForActivateGoal 144 8
export BotPrintActivateGoalInfo
proc BotPrintActivateGoalInfo 296 36
line 4422
;4414:	}
;4415:}
;4416:
;4417:/*
;4418:==================
;4419:BotPrintActivateGoalInfo
;4420:==================
;4421:*/
;4422:void BotPrintActivateGoalInfo(bot_state_t *bs, bot_activategoal_t *activategoal, int bspent) {
line 4427
;4423:	char netname[MAX_NETNAME];
;4424:	char classname[128];
;4425:	char buf[128];
;4426:
;4427:	ClientName(bs->client, netname, sizeof(netname));
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
line 4428
;4428:	trap_AAS_ValueForBSPEpairKey(bspent, "classname", classname, sizeof(classname));
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1838
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4429
;4429:	if (activategoal->shoot) {
ADDRFP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1961
line 4430
;4430:		Com_sprintf(buf, sizeof(buf), "%s: I have to shoot at a %s from %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $1963
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 4436
;4431:						netname, classname,
;4432:						activategoal->goal.origin[0],
;4433:						activategoal->goal.origin[1],
;4434:						activategoal->goal.origin[2],
;4435:						activategoal->goal.areanum);
;4436:	}
ADDRGP4 $1962
JUMPV
LABELV $1961
line 4437
;4437:	else {
line 4438
;4438:		Com_sprintf(buf, sizeof(buf), "%s: I have to activate a %s at %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $1964
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 4444
;4439:						netname, classname,
;4440:						activategoal->goal.origin[0],
;4441:						activategoal->goal.origin[1],
;4442:						activategoal->goal.origin[2],
;4443:						activategoal->goal.areanum);
;4444:	}
LABELV $1962
line 4445
;4445:	trap_EA_Say(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 4446
;4446:}
LABELV $1960
endproc BotPrintActivateGoalInfo 296 36
export BotRandomMove
proc BotRandomMove 28 16
line 4453
;4447:
;4448:/*
;4449:==================
;4450:BotRandomMove
;4451:==================
;4452:*/
;4453:void BotRandomMove(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 4456
;4454:	vec3_t dir, angles;
;4455:
;4456:	angles[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4457
;4457:	angles[1] = random() * 360;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1010041192
MULF4
ASGNF4
line 4458
;4458:	angles[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4459
;4459:	AngleVectors(angles, dir, NULL, NULL);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4461
;4460:
;4461:	trap_BotMoveInDirection(bs->ms, dir, 400, MOVE_WALK);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4463
;4462:
;4463:	moveresult->failure = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4464
;4464:	VectorCopy(dir, moveresult->movedir);
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4465
;4465:}
LABELV $1965
endproc BotRandomMove 28 16
data
align 4
LABELV $1969
byte 4 0
byte 4 0
byte 4 1065353216
export BotAIBlocked
code
proc BotAIBlocked 504 16
line 4478
;4466:
;4467:/*
;4468:==================
;4469:BotAIBlocked
;4470:
;4471:Very basic handling of bots being blocked by other entities.
;4472:Check what kind of entity is blocking the bot and try to activate
;4473:it. If that's not an option then try to walk around or over the entity.
;4474:Before the bot ends in this part of the AI it should predict which doors to
;4475:open, which buttons to activate etc.
;4476:==================
;4477:*/
;4478:void BotAIBlocked(bot_state_t *bs, bot_moveresult_t *moveresult, int activate) {
line 4480
;4479:	int movetype, bspent;
;4480:	vec3_t hordir, start, end, mins, maxs, sideward, angles, up = {0, 0, 1};
ADDRLP4 228
ADDRGP4 $1969
INDIRB
ASGNB 12
line 4485
;4481:	aas_entityinfo_t entinfo;
;4482:	bot_activategoal_t activategoal;
;4483:
;4484:	// if the bot is not blocked by anything
;4485:	if (!moveresult->blocked) {
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1970
line 4486
;4486:		bs->notblocked_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4487
;4487:		return;
ADDRGP4 $1968
JUMPV
LABELV $1970
line 4490
;4488:	}
;4489:	// if stuck in a solid area
;4490:	if ( moveresult->type == RESULTTYPE_INSOLIDAREA ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1972
line 4492
;4491:		// move in a random direction in the hope to get out
;4492:		BotRandomMove(bs, moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRandomMove
CALLV
pop
line 4494
;4493:		//
;4494:		return;
ADDRGP4 $1968
JUMPV
LABELV $1972
line 4497
;4495:	}
;4496:	// get info for the entity that is blocking the bot
;4497:	BotEntityInfo(moveresult->blockentity, &entinfo);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4503
;4498:#ifdef OBSTACLEDEBUG
;4499:	ClientName(bs->client, netname, sizeof(netname));
;4500:	BotAI_Print(PRT_MESSAGE, "%s: I'm blocked by model %d\n", netname, entinfo.modelindex);
;4501:#endif
;4502:	// if blocked by a bsp model and the bot wants to activate it
;4503:	if (activate && entinfo.modelindex > 0 && entinfo.modelindex <= max_bspmodelindex) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1974
ADDRLP4 36+104
INDIRI4
CNSTI4 0
LEI4 $1974
ADDRLP4 36+104
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
GTI4 $1974
line 4505
;4504:		// find the bsp entity which should be activated in order to get the blocking entity out of the way
;4505:		bspent = BotGetActivateGoal(bs, entinfo.number, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36+20
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 488
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 484
ADDRLP4 488
INDIRI4
ASGNI4
line 4506
;4506:		if (bspent) {
ADDRLP4 484
INDIRI4
CNSTI4 0
EQI4 $1979
line 4508
;4507:			//
;4508:			if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 492
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 492
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1981
ADDRLP4 492
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1981
line 4509
;4509:				bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
CNSTP4 0
ASGNP4
LABELV $1981
line 4511
;4510:			// if not already trying to activate this entity
;4511:			if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240+4+40
INDIRI4
ARGI4
ADDRLP4 496
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 496
INDIRI4
CNSTI4 0
NEI4 $1983
line 4513
;4512:				//
;4513:				BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4514
;4514:			}
LABELV $1983
line 4518
;4515:			// if ontop of an obstacle or
;4516:			// if the bot is not in a reachability area it'll still
;4517:			// need some dynamic obstacle avoidance, otherwise return
;4518:			if (!(moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) &&
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1980
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 500
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 500
INDIRI4
CNSTI4 0
EQI4 $1980
line 4520
;4519:				trap_AAS_AreaReachability(bs->areanum))
;4520:				return;
ADDRGP4 $1968
JUMPV
line 4521
;4521:		}
LABELV $1979
line 4522
;4522:		else {
line 4524
;4523:			// enable any routing areas that were disabled
;4524:			BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 240
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4525
;4525:		}
LABELV $1980
line 4526
;4526:	}
LABELV $1974
line 4528
;4527:	// just some basic dynamic obstacle avoidance code
;4528:	hordir[0] = moveresult->movedir[0];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 4529
;4529:	hordir[1] = moveresult->movedir[1];
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 4530
;4530:	hordir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4532
;4531:	// if no direction just take a random direction
;4532:	if (VectorNormalize(hordir) < 0.1) {
ADDRLP4 0
ARGP4
ADDRLP4 488
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 488
INDIRF4
CNSTF4 1036831949
GEF4 $1991
line 4533
;4533:		VectorSet(angles, 0, 360 * random(), 0);
ADDRLP4 216
CNSTF4 0
ASGNF4
ADDRLP4 492
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 216+4
ADDRLP4 492
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1135869952
MULF4
ASGNF4
ADDRLP4 216+8
CNSTF4 0
ASGNF4
line 4534
;4534:		AngleVectors(angles, hordir, NULL, NULL);
ADDRLP4 216
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
line 4535
;4535:	}
LABELV $1991
line 4539
;4536:	//
;4537:	//if (moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) movetype = MOVE_JUMP;
;4538:	//else
;4539:	movetype = MOVE_WALK;
ADDRLP4 212
CNSTI4 1
ASGNI4
line 4542
;4540:	// if there's an obstacle at the bot's feet and head then
;4541:	// the bot might be able to crouch through
;4542:	VectorCopy(bs->origin, start);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 4543
;4543:	start[2] += 18;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 4544
;4544:	VectorMA(start, 5, hordir, end);
ADDRLP4 176
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
ADDRLP4 176+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 0+8
INDIRF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
line 4545
;4545:	VectorSet(mins, -16, -16, -24);
ADDRLP4 188
CNSTF4 3246391296
ASGNF4
ADDRLP4 188+4
CNSTF4 3246391296
ASGNF4
ADDRLP4 188+8
CNSTF4 3250585600
ASGNF4
line 4546
;4546:	VectorSet(maxs, 16, 16, 4);
ADDRLP4 200
CNSTF4 1098907648
ASGNF4
ADDRLP4 200+4
CNSTF4 1098907648
ASGNF4
ADDRLP4 200+8
CNSTF4 1082130432
ASGNF4
line 4551
;4547:	//
;4548:	//bsptrace = AAS_Trace(start, mins, maxs, end, bs->entitynum, MASK_PLAYERSOLID);
;4549:	//if (bsptrace.fraction >= 1) movetype = MOVE_CROUCH;
;4550:	// get the sideward vector
;4551:	CrossProduct(hordir, up, sideward);
ADDRLP4 0
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4553
;4552:	//
;4553:	if (bs->flags & BFL_AVOIDRIGHT) VectorNegate(sideward, sideward);
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2006
ADDRLP4 12
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
NEGF4
ASGNF4
LABELV $2006
line 4555
;4554:	// try to crouch straight forward?
;4555:	if (!trap_BotMoveInDirection(bs->ms, hordir, 400, movetype)) {
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 212
INDIRI4
ARGI4
ADDRLP4 492
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 492
INDIRI4
CNSTI4 0
NEI4 $2012
line 4557
;4556:		// perform the movement
;4557:		if (!trap_BotMoveInDirection(bs->ms, sideward, 400, movetype)) {
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 212
INDIRI4
ARGI4
ADDRLP4 496
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 496
INDIRI4
CNSTI4 0
NEI4 $2014
line 4559
;4558:			// flip the avoid direction flag
;4559:			bs->flags ^= BFL_AVOIDRIGHT;
ADDRLP4 500
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 500
INDIRP4
ADDRLP4 500
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 4562
;4560:			// flip the direction
;4561:			// VectorNegate(sideward, sideward);
;4562:			VectorMA(sideward, -1, hordir, sideward);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
line 4564
;4563:			// move in the other direction
;4564:			trap_BotMoveInDirection(bs->ms, sideward, 400, movetype);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 212
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4565
;4565:		}
LABELV $2014
line 4566
;4566:	}
LABELV $2012
line 4568
;4567:	//
;4568:	if (bs->notblocked_time < FloatTime() - 0.4) {
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1053609165
SUBF4
GEF4 $2022
line 4571
;4569:		// just reset goals and hope the bot will go into another direction?
;4570:		// is this still needed??
;4571:		if (bs->ainode == AINode_Seek_NBG) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_NBG
CVPU4 4
NEU4 $2024
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $2025
JUMPV
LABELV $2024
line 4572
;4572:		else if (bs->ainode == AINode_Seek_LTG) bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_LTG
CVPU4 4
NEU4 $2026
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
LABELV $2026
LABELV $2025
line 4573
;4573:	}
LABELV $2022
line 4574
;4574:}
LABELV $1968
endproc BotAIBlocked 504 16
export BotAIPredictObstacles
proc BotAIPredictObstacles 316 44
line 4586
;4575:
;4576:/*
;4577:==================
;4578:BotAIPredictObstacles
;4579:
;4580:Predict the route towards the goal and check if the bot
;4581:will be blocked by certain obstacles. When the bot has obstacles
;4582:on it's path the bot should figure out if they can be removed
;4583:by activating certain entities.
;4584:==================
;4585:*/
;4586:int BotAIPredictObstacles(bot_state_t *bs, bot_goal_t *goal) {
line 4591
;4587:	int modelnum, entitynum, bspent;
;4588:	bot_activategoal_t activategoal;
;4589:	aas_predictroute_t route;
;4590:
;4591:	if (!bot_predictobstacles.integer)
ADDRGP4 bot_predictobstacles+12
INDIRI4
CNSTI4 0
NEI4 $2029
line 4592
;4592:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2028
JUMPV
LABELV $2029
line 4595
;4593:
;4594:	// always predict when the goal change or at regular intervals
;4595:	if (bs->predictobstacles_goalareanum == goal->areanum &&
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 6216
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $2032
ADDRLP4 292
INDIRP4
CNSTI4 6212
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
LEF4 $2032
line 4596
;4596:		bs->predictobstacles_time > FloatTime() - 6) {
line 4597
;4597:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2028
JUMPV
LABELV $2032
line 4599
;4598:	}
;4599:	bs->predictobstacles_goalareanum = goal->areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6216
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 4600
;4600:	bs->predictobstacles_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6212
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4603
;4601:
;4602:	// predict at most 100 areas or 10 seconds ahead
;4603:	trap_AAS_PredictRoute(&route, bs->areanum, bs->origin,
ADDRLP4 0
ARGP4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTI4 100
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1024
ARGI4
CNSTI4 67108864
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_AAS_PredictRoute
CALLI4
pop
line 4608
;4604:							goal->areanum, bs->tfl, 100, 1000,
;4605:							RSE_USETRAVELTYPE|RSE_ENTERCONTENTS,
;4606:							AREACONTENTS_MOVER, TFL_BRIDGE, 0);
;4607:	// if bot has to travel through an area with a mover
;4608:	if (route.stopevent & RSE_ENTERCONTENTS) {
ADDRLP4 0+16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2034
line 4610
;4609:		// if the bot will run into a mover
;4610:		if (route.endcontents & AREACONTENTS_MOVER) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2035
line 4612
;4611:			//NOTE: this only works with bspc 2.1 or higher
;4612:			modelnum = (route.endcontents & AREACONTENTS_MODELNUM) >> AREACONTENTS_MODELNUMSHIFT;
ADDRLP4 36
ADDRLP4 0+20
INDIRI4
CNSTI4 255
CNSTI4 24
LSHI4
BANDI4
CNSTI4 24
RSHI4
ASGNI4
line 4613
;4613:			if (modelnum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2035
line 4615
;4614:				//
;4615:				entitynum = BotModelMinsMaxs(modelnum, ET_MOVER, 0, NULL, NULL);
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 300
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 300
INDIRI4
ASGNI4
line 4616
;4616:				if (entitynum) {
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2035
line 4618
;4617:					//NOTE: BotGetActivateGoal already checks if the door is open or not
;4618:					bspent = BotGetActivateGoal(bs, entitynum, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 304
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 304
INDIRI4
ASGNI4
line 4619
;4619:					if (bspent) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2035
line 4621
;4620:						//
;4621:						if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2047
ADDRLP4 308
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2047
line 4622
;4622:							bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
CNSTP4 0
ASGNP4
LABELV $2047
line 4624
;4623:						// if not already trying to activate this entity
;4624:						if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48+4+40
INDIRI4
ARGI4
ADDRLP4 312
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
NEI4 $2049
line 4628
;4625:							//
;4626:							//BotAI_Print(PRT_MESSAGE, "blocked by mover model %d, entity %d ?\n", modelnum, entitynum);
;4627:							//
;4628:							BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4629
;4629:							return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2028
JUMPV
LABELV $2049
line 4631
;4630:						}
;4631:						else {
line 4633
;4632:							// enable any routing areas that were disabled
;4633:							BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 48
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4634
;4634:						}
line 4635
;4635:					}
line 4636
;4636:				}
line 4637
;4637:			}
line 4638
;4638:		}
line 4639
;4639:	}
ADDRGP4 $2035
JUMPV
LABELV $2034
line 4640
;4640:	else if (route.stopevent & RSE_USETRAVELTYPE) {
ADDRLP4 0+16
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2053
line 4641
;4641:		if (route.endtravelflags & TFL_BRIDGE) {
ADDRLP4 0+24
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $2056
line 4643
;4642:			//FIXME: check if the bridge is available to travel over
;4643:		}
LABELV $2056
line 4644
;4644:	}
LABELV $2053
LABELV $2035
line 4645
;4645:	return qfalse;
CNSTI4 0
RETI4
LABELV $2028
endproc BotAIPredictObstacles 316 44
export BotCheckConsoleMessages
proc BotCheckConsoleMessages 1008 48
line 4653
;4646:}
;4647:
;4648:/*
;4649:==================
;4650:BotCheckConsoleMessages
;4651:==================
;4652:*/
;4653:void BotCheckConsoleMessages(bot_state_t *bs) {
line 4661
;4654:	char botname[MAX_NETNAME], message[MAX_MESSAGE_SIZE], netname[MAX_NETNAME], *ptr;
;4655:	float chat_reply;
;4656:	int context, handle;
;4657:	bot_consolemessage_t m;
;4658:	bot_match_t match;
;4659:
;4660:	//the name of this bot
;4661:	ClientName(bs->client, botname, sizeof(botname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 908
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $2061
JUMPV
LABELV $2060
line 4663
;4662:	//
;4663:	while((handle = trap_BotNextConsoleMessage(bs->cs, &m)) != 0) {
line 4665
;4664:		//if the chat state is flooded with messages the bot will read them quickly
;4665:		if (trap_BotNumConsoleMessages(bs->cs) < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 948
ADDRGP4 trap_BotNumConsoleMessages
CALLI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 10
GEI4 $2063
line 4667
;4666:			//if it is a chat message the bot needs some time to read it
;4667:			if (m.type == CMS_CHAT && m.time > FloatTime() - (1 + random())) break;
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2065
ADDRLP4 952
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 952
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1065353216
ADDF4
SUBF4
LEF4 $2065
ADDRGP4 $2062
JUMPV
LABELV $2065
line 4668
;4668:		}
LABELV $2063
line 4670
;4669:		//
;4670:		ptr = m.message;
ADDRLP4 276
ADDRLP4 0+12
ASGNP4
line 4673
;4671:		//if it is a chat message then don't unify white spaces and don't
;4672:		//replace synonyms in the netname
;4673:		if (m.type == CMS_CHAT) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2070
line 4675
;4674:			//
;4675:			if (trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 952
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 952
INDIRI4
CNSTI4 0
EQI4 $2073
line 4676
;4676:				ptr = m.message + match.variables[MESSAGE].offset;
ADDRLP4 276
ADDRLP4 288+264+16
INDIRI1
CVII4 1
ADDRLP4 0+12
ADDP4
ASGNP4
line 4677
;4677:			}
LABELV $2073
line 4678
;4678:		}
LABELV $2070
line 4680
;4679:		//unify the white spaces in the message
;4680:		trap_UnifyWhiteSpaces(ptr);
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4682
;4681:		//replace synonyms in the right context
;4682:		context = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 952
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 284
ADDRLP4 952
INDIRI4
ASGNI4
line 4683
;4683:		trap_BotReplaceSynonyms(ptr, context);
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 trap_BotReplaceSynonyms
CALLV
pop
line 4685
;4684:		//if there's no match
;4685:		if (!BotMatchMessage(bs, m.message)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 956
ADDRGP4 BotMatchMessage
CALLI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
NEI4 $2079
line 4687
;4686:			//if it is a chat message
;4687:			if (m.type == CMS_CHAT && !bot_nochat.integer) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2082
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
NEI4 $2082
line 4689
;4688:				//
;4689:				if (!trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 960
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 960
INDIRI4
CNSTI4 0
NEI4 $2086
line 4690
;4690:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4691
;4691:					continue;
ADDRGP4 $2061
JUMPV
LABELV $2086
line 4694
;4692:				}
;4693:				//don't use eliza chats with team messages
;4694:				if (match.subtype & ST_TEAM) {
ADDRLP4 288+260
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $2089
line 4695
;4695:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4696
;4696:					continue;
ADDRGP4 $2061
JUMPV
LABELV $2089
line 4699
;4697:				}
;4698:				//
;4699:				trap_BotMatchVariable(&match, NETNAME, netname, sizeof(netname));
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 872
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4700
;4700:				trap_BotMatchVariable(&match, MESSAGE, message, sizeof(message));
ADDRLP4 288
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4702
;4701:				//if this is a message from the bot self
;4702:				if (bs->client == ClientFromName(netname)) {
ADDRLP4 872
ARGP4
ADDRLP4 964
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 964
INDIRI4
NEI4 $2092
line 4703
;4703:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4704
;4704:					continue;
ADDRGP4 $2061
JUMPV
LABELV $2092
line 4707
;4705:				}
;4706:				//unify the message
;4707:				trap_UnifyWhiteSpaces(message);
ADDRLP4 616
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4709
;4708:				//
;4709:				trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 4710
;4710:				if (bot_testrchat.integer) {
ADDRGP4 bot_testrchat+12
INDIRI4
CNSTI4 0
EQI4 $2094
line 4712
;4711:					//
;4712:					trap_BotLibVarSet("bot_testrchat", "1");
ADDRGP4 $2097
ARGP4
ADDRGP4 $2098
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 4714
;4713:					//if bot replies with a chat message
;4714:					if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 968
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 968
INDIRI4
CNSTI4 0
EQI4 $2099
line 4718
;4715:															NULL, NULL,
;4716:															NULL, NULL,
;4717:															NULL, NULL,
;4718:															botname, netname)) {
line 4719
;4719:						BotAI_Print(PRT_MESSAGE, "------------------------\n");
CNSTI4 1
ARGI4
ADDRGP4 $2101
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4720
;4720:					}
ADDRGP4 $2095
JUMPV
LABELV $2099
line 4721
;4721:					else {
line 4722
;4722:						BotAI_Print(PRT_MESSAGE, "**** no valid reply ****\n");
CNSTI4 1
ARGI4
ADDRGP4 $2102
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4723
;4723:					}
line 4724
;4724:				}
ADDRGP4 $2095
JUMPV
LABELV $2094
line 4726
;4725:				//if at a valid chat position and not chatting already and not in teamplay
;4726:				else if (bs->ainode != AINode_Stand && BotValidChatPosition(bs) && !TeamPlayIsOn()) {
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 968
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Stand
CVPU4 4
EQU4 $2103
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 972
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 972
INDIRI4
CNSTI4 0
EQI4 $2103
ADDRLP4 976
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 976
INDIRI4
CNSTI4 0
NEI4 $2103
line 4727
;4727:					chat_reply = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_REPLY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 35
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 944
ADDRLP4 980
INDIRF4
ASGNF4
line 4728
;4728:					if (random() < 1.5 / (NumBots()+1) && random() < chat_reply) {
ADDRLP4 984
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 988
ADDRGP4 NumBots
CALLI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1069547520
ADDRLP4 988
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
DIVF4
GEF4 $2105
ADDRLP4 992
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 944
INDIRF4
GEF4 $2105
line 4730
;4729:						//if bot replies with a chat message
;4730:						if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 996
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $2107
line 4734
;4731:																NULL, NULL,
;4732:																NULL, NULL,
;4733:																NULL, NULL,
;4734:																botname, netname)) {
line 4736
;4735:							//remove the console message
;4736:							trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4737
;4737:							bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRLP4 1004
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1000
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1004
INDIRF4
ADDF4
ASGNF4
line 4738
;4738:							AIEnter_Stand(bs, "BotCheckConsoleMessages: reply chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2109
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 4740
;4739:							//EA_Say(bs->client, bs->cs.chatmessage);
;4740:							break;
ADDRGP4 $2062
JUMPV
LABELV $2107
line 4742
;4741:						}
;4742:					}
LABELV $2105
line 4743
;4743:				}
LABELV $2103
LABELV $2095
line 4744
;4744:			}
LABELV $2082
line 4745
;4745:		}
LABELV $2079
line 4747
;4746:		//remove the console message
;4747:		trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4748
;4748:	}
LABELV $2061
line 4663
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 948
ADDRGP4 trap_BotNextConsoleMessage
CALLI4
ASGNI4
ADDRLP4 280
ADDRLP4 948
INDIRI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 0
NEI4 $2060
LABELV $2062
line 4749
;4749:}
LABELV $2059
endproc BotCheckConsoleMessages 1008 48
export BotCheckForGrenades
proc BotCheckForGrenades 4 16
line 4756
;4750:
;4751:/*
;4752:==================
;4753:BotCheckEvents
;4754:==================
;4755:*/
;4756:void BotCheckForGrenades(bot_state_t *bs, entityState_t *state) {
line 4758
;4757:	// if this is not a grenade
;4758:	if (state->eType != ET_MISSILE || state->weapon != WP_GRENADE_LAUNCHER)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2113
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
EQI4 $2111
LABELV $2113
line 4759
;4759:		return;
ADDRGP4 $2110
JUMPV
LABELV $2111
line 4761
;4760:	// try to avoid the grenade
;4761:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1126170624
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4762
;4762:}
LABELV $2110
endproc BotCheckForGrenades 4 16
export BotCheckEvents
proc BotCheckEvents 164 12
line 4814
;4763:
;4764:#ifdef MISSIONPACK
;4765:/*
;4766:==================
;4767:BotCheckForProxMines
;4768:==================
;4769:*/
;4770:void BotCheckForProxMines(bot_state_t *bs, entityState_t *state) {
;4771:	// if this is not a prox mine
;4772:	if (state->eType != ET_MISSILE || state->weapon != WP_PROX_LAUNCHER)
;4773:		return;
;4774:	// if this prox mine is from someone on our own team
;4775:	if (state->generic1 == BotTeam(bs))
;4776:		return;
;4777:	// if the bot doesn't have a weapon to deactivate the mine
;4778:	if (!(bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0) &&
;4779:		!(bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0) &&
;4780:		!(bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0) ) {
;4781:		return;
;4782:	}
;4783:	// try to avoid the prox mine
;4784:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
;4785:	//
;4786:	if (bs->numproxmines >= MAX_PROXMINES)
;4787:		return;
;4788:	bs->proxmines[bs->numproxmines] = state->number;
;4789:	bs->numproxmines++;
;4790:}
;4791:
;4792:/*
;4793:==================
;4794:BotCheckForKamikazeBody
;4795:==================
;4796:*/
;4797:void BotCheckForKamikazeBody(bot_state_t *bs, entityState_t *state) {
;4798:	// if this entity is not wearing the kamikaze
;4799:	if (!(state->eFlags & EF_KAMIKAZE))
;4800:		return;
;4801:	// if this entity isn't dead
;4802:	if (!(state->eFlags & EF_DEAD))
;4803:		return;
;4804:	//remember this kamikaze body
;4805:	bs->kamikazebody = state->number;
;4806:}
;4807:#endif
;4808:
;4809:/*
;4810:==================
;4811:BotCheckEvents
;4812:==================
;4813:*/
;4814:void BotCheckEvents(bot_state_t *bs, entityState_t *state) {
line 4823
;4815:	int event;
;4816:	char buf[128];
;4817:#ifdef MISSIONPACK
;4818:	aas_entityinfo_t entinfo;
;4819:#endif
;4820:
;4821:	//NOTE: this sucks, we're accessing the gentity_t directly
;4822:	//but there's no other fast way to do it right now
;4823:	if (bs->entityeventTime[state->number] == g_entities[state->number].eventTime) {
ADDRLP4 132
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
NEI4 $2115
line 4824
;4824:		return;
ADDRGP4 $2114
JUMPV
LABELV $2115
line 4826
;4825:	}
;4826:	bs->entityeventTime[state->number] = g_entities[state->number].eventTime;
ADDRLP4 136
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
ADDRLP4 136
INDIRI4
CNSTI4 824
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
ASGNI4
line 4828
;4827:	//if it's an event only entity
;4828:	if (state->eType > ET_EVENTS) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $2119
line 4829
;4829:		event = (state->eType - ET_EVENTS) & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
SUBI4
CNSTI4 -769
BANDI4
ASGNI4
line 4830
;4830:	}
ADDRGP4 $2120
JUMPV
LABELV $2119
line 4831
;4831:	else {
line 4832
;4832:		event = state->event & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 4833
;4833:	}
LABELV $2120
line 4835
;4834:	//
;4835:	switch(event) {
ADDRLP4 140
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 1
LTI4 $2121
ADDRLP4 140
INDIRI4
CNSTI4 76
GTI4 $2121
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2170-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $2170
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2121
address $2121
address $2155
address $2121
address $2121
address $2156
address $2134
address $2142
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2123
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2121
address $2122
code
LABELV $2123
line 4838
;4836:		//client obituary event
;4837:		case EV_OBITUARY:
;4838:		{
line 4841
;4839:			int target, attacker, mod;
;4840:
;4841:			target = state->otherEntityNum;
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 4842
;4842:			attacker = state->otherEntityNum2;
ADDRLP4 148
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 4843
;4843:			mod = state->eventParm;
ADDRLP4 152
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 4845
;4844:			//
;4845:			if (target == bs->client) {
ADDRLP4 144
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2124
line 4846
;4846:				bs->botdeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4847
;4847:				bs->lastkilledby = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 4849
;4848:				//
;4849:				if (target == attacker ||
ADDRLP4 156
ADDRLP4 144
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $2129
ADDRLP4 156
INDIRI4
CNSTI4 1023
EQI4 $2129
ADDRLP4 156
INDIRI4
CNSTI4 1022
NEI4 $2126
LABELV $2129
line 4851
;4850:					target == ENTITYNUM_NONE ||
;4851:					target == ENTITYNUM_WORLD) bs->botsuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $2127
JUMPV
LABELV $2126
line 4852
;4852:				else bs->botsuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 0
ASGNI4
LABELV $2127
line 4854
;4853:				//
;4854:				bs->num_deaths++;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 6028
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4855
;4855:			}
ADDRGP4 $2122
JUMPV
LABELV $2124
line 4857
;4856:			//else if this client was killed by the bot
;4857:			else if (attacker == bs->client) {
ADDRLP4 148
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2130
line 4858
;4858:				bs->enemydeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4859
;4859:				bs->lastkilledplayer = target;
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 4860
;4860:				bs->killedenemy_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4862
;4861:				//
;4862:				bs->num_kills++;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 6032
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4863
;4863:			}
ADDRGP4 $2122
JUMPV
LABELV $2130
line 4864
;4864:			else if (attacker == bs->enemy && target == attacker) {
ADDRLP4 156
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $2122
ADDRLP4 144
INDIRI4
ADDRLP4 156
INDIRI4
NEI4 $2122
line 4865
;4865:				bs->enemysuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 1
ASGNI4
line 4866
;4866:			}
line 4880
;4867:			//
;4868:#ifdef MISSIONPACK			
;4869:			if (gametype == GT_1FCTF) {
;4870:				//
;4871:				BotEntityInfo(target, &entinfo);
;4872:				if ( entinfo.powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;4873:					if (!BotSameTeam(bs, target)) {
;4874:						bs->neutralflagstatus = 3;	//enemy dropped the flag
;4875:						bs->flagstatuschanged = qtrue;
;4876:					}
;4877:				}
;4878:			}
;4879:#endif
;4880:			break;
ADDRGP4 $2122
JUMPV
LABELV $2134
line 4883
;4881:		}
;4882:		case EV_GLOBAL_SOUND:
;4883:		{
line 4884
;4884:			if (state->eventParm < 0 || state->eventParm >= MAX_SOUNDS) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2137
ADDRLP4 144
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 256
LTI4 $2135
LABELV $2137
line 4885
;4885:				BotAI_Print(PRT_ERROR, "EV_GLOBAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2138
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4886
;4886:				break;
ADDRGP4 $2122
JUMPV
LABELV $2135
line 4888
;4887:			}
;4888:			trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 4908
;4889:			/*
;4890:			if (!strcmp(buf, "sound/teamplay/flagret_red.wav")) {
;4891:				//red flag is returned
;4892:				bs->redflagstatus = 0;
;4893:				bs->flagstatuschanged = qtrue;
;4894:			}
;4895:			else if (!strcmp(buf, "sound/teamplay/flagret_blu.wav")) {
;4896:				//blue flag is returned
;4897:				bs->blueflagstatus = 0;
;4898:				bs->flagstatuschanged = qtrue;
;4899:			}
;4900:			else*/
;4901:#ifdef MISSIONPACK
;4902:			if (!strcmp(buf, "sound/items/kamikazerespawn.wav" )) {
;4903:				//the kamikaze respawned so dont avoid it
;4904:				BotDontAvoid(bs, "Kamikaze");
;4905:			}
;4906:			else
;4907:#endif
;4908:				if (!strcmp(buf, "sound/items/poweruprespawn.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2141
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2122
line 4910
;4909:				//powerup respawned... go get it
;4910:				BotGoForPowerups(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoForPowerups
CALLV
pop
line 4911
;4911:			}
line 4912
;4912:			break;
ADDRGP4 $2122
JUMPV
LABELV $2142
line 4915
;4913:		}
;4914:		case EV_GLOBAL_TEAM_SOUND:
;4915:		{
line 4916
;4916:			if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2122
line 4917
;4917:				switch(state->eventParm) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
LTI4 $2122
ADDRLP4 144
INDIRI4
CNSTI4 5
GTI4 $2122
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2154
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $2154
address $2148
address $2149
address $2150
address $2151
address $2152
address $2153
code
LABELV $2148
line 4919
;4918:					case GTS_RED_CAPTURE:
;4919:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4920
;4920:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4921
;4921:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4922
;4922:						break; //see BotMatch_CTF
ADDRGP4 $2122
JUMPV
LABELV $2149
line 4924
;4923:					case GTS_BLUE_CAPTURE:
;4924:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4925
;4925:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4926
;4926:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4927
;4927:						break; //see BotMatch_CTF
ADDRGP4 $2122
JUMPV
LABELV $2150
line 4930
;4928:					case GTS_RED_RETURN:
;4929:						//blue flag is returned
;4930:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4931
;4931:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4932
;4932:						break;
ADDRGP4 $2122
JUMPV
LABELV $2151
line 4935
;4933:					case GTS_BLUE_RETURN:
;4934:						//red flag is returned
;4935:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4936
;4936:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4937
;4937:						break;
ADDRGP4 $2122
JUMPV
LABELV $2152
line 4940
;4938:					case GTS_RED_TAKEN:
;4939:						//blue flag is taken
;4940:						bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 1
ASGNI4
line 4941
;4941:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4942
;4942:						break; //see BotMatch_CTF
ADDRGP4 $2122
JUMPV
LABELV $2153
line 4945
;4943:					case GTS_BLUE_TAKEN:
;4944:						//red flag is taken
;4945:						bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 4946
;4946:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4947
;4947:						break; //see BotMatch_CTF
line 4949
;4948:				}
;4949:			}
line 4982
;4950:#ifdef MISSIONPACK
;4951:			else if (gametype == GT_1FCTF) {
;4952:				switch(state->eventParm) {
;4953:					case GTS_RED_CAPTURE:
;4954:						bs->neutralflagstatus = 0;
;4955:						bs->flagstatuschanged = qtrue;
;4956:						break;
;4957:					case GTS_BLUE_CAPTURE:
;4958:						bs->neutralflagstatus = 0;
;4959:						bs->flagstatuschanged = qtrue;
;4960:						break;
;4961:					case GTS_RED_RETURN:
;4962:						//flag has returned
;4963:						bs->neutralflagstatus = 0;
;4964:						bs->flagstatuschanged = qtrue;
;4965:						break;
;4966:					case GTS_BLUE_RETURN:
;4967:						//flag has returned
;4968:						bs->neutralflagstatus = 0;
;4969:						bs->flagstatuschanged = qtrue;
;4970:						break;
;4971:					case GTS_RED_TAKEN:
;4972:						bs->neutralflagstatus = BotTeam(bs) == TEAM_RED ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
;4973:						bs->flagstatuschanged = qtrue;
;4974:						break;
;4975:					case GTS_BLUE_TAKEN:
;4976:						bs->neutralflagstatus = BotTeam(bs) == TEAM_BLUE ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
;4977:						bs->flagstatuschanged = qtrue;
;4978:						break;
;4979:				}
;4980:			}
;4981:#endif
;4982:			break;
ADDRGP4 $2122
JUMPV
LABELV $2155
line 4985
;4983:		}
;4984:		case EV_PLAYER_TELEPORT_IN:
;4985:		{
line 4986
;4986:			VectorCopy(state->origin, lastteleport_origin);
ADDRGP4 lastteleport_origin
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4987
;4987:			lastteleport_time = FloatTime();
ADDRGP4 lastteleport_time
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4988
;4988:			break;
ADDRGP4 $2122
JUMPV
LABELV $2156
line 4991
;4989:		}
;4990:		case EV_GENERAL_SOUND:
;4991:		{
line 4993
;4992:			//if this sound is played on the bot
;4993:			if (state->number == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2122
line 4994
;4994:				if (state->eventParm < 0 || state->eventParm >= MAX_SOUNDS) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2161
ADDRLP4 144
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 256
LTI4 $2159
LABELV $2161
line 4995
;4995:					BotAI_Print(PRT_ERROR, "EV_GENERAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2162
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4996
;4996:					break;
ADDRGP4 $2122
JUMPV
LABELV $2159
line 4999
;4997:				}
;4998:				//check out the sound
;4999:				trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 5001
;5000:				//if falling into a death pit
;5001:				if (!strcmp(buf, "*falling1.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2165
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2122
line 5003
;5002:					//if the bot has a personal teleporter
;5003:					if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2122
line 5005
;5004:						//use the holdable item
;5005:						trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 5006
;5006:					}
line 5007
;5007:				}
line 5008
;5008:			}
line 5009
;5009:			break;
line 5036
;5010:		}
;5011:		case EV_FOOTSTEP:
;5012:		case EV_FOOTSTEP_METAL:
;5013:		case EV_FOOTSPLASH:
;5014:		case EV_FOOTWADE:
;5015:		case EV_SWIM:
;5016:		case EV_FALL_SHORT:
;5017:		case EV_FALL_MEDIUM:
;5018:		case EV_FALL_FAR:
;5019:		case EV_STEP_4:
;5020:		case EV_STEP_8:
;5021:		case EV_STEP_12:
;5022:		case EV_STEP_16:
;5023:		case EV_JUMP_PAD:
;5024:		case EV_JUMP:
;5025:		case EV_TAUNT:
;5026:		case EV_WATER_TOUCH:
;5027:		case EV_WATER_LEAVE:
;5028:		case EV_WATER_UNDER:
;5029:		case EV_WATER_CLEAR:
;5030:		case EV_ITEM_PICKUP:
;5031:		case EV_GLOBAL_ITEM_PICKUP:
;5032:		case EV_NOAMMO:
;5033:		case EV_CHANGE_WEAPON:
;5034:		case EV_FIRE_WEAPON:
;5035:			//FIXME: either add to sound queue or mark player as someone making noise
;5036:			break;
line 5053
;5037:		case EV_USE_ITEM0:
;5038:		case EV_USE_ITEM1:
;5039:		case EV_USE_ITEM2:
;5040:		case EV_USE_ITEM3:
;5041:		case EV_USE_ITEM4:
;5042:		case EV_USE_ITEM5:
;5043:		case EV_USE_ITEM6:
;5044:		case EV_USE_ITEM7:
;5045:		case EV_USE_ITEM8:
;5046:		case EV_USE_ITEM9:
;5047:		case EV_USE_ITEM10:
;5048:		case EV_USE_ITEM11:
;5049:		case EV_USE_ITEM12:
;5050:		case EV_USE_ITEM13:
;5051:		case EV_USE_ITEM14:
;5052:		case EV_USE_ITEM15:
;5053:			break;
LABELV $2121
LABELV $2122
line 5055
;5054:	}
;5055:}
LABELV $2114
endproc BotCheckEvents 164 12
export BotCheckSnapshot
proc BotCheckSnapshot 216 16
line 5062
;5056:
;5057:/*
;5058:==================
;5059:BotCheckSnapshot
;5060:==================
;5061:*/
;5062:void BotCheckSnapshot(bot_state_t *bs) {
line 5067
;5063:	int ent;
;5064:	entityState_t state;
;5065:
;5066:	//remove all avoid spots
;5067:	trap_BotAddAvoidSpot(bs->ms, vec3_origin, 0, AVOID_CLEAR);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 5069
;5068:	//reset kamikaze body
;5069:	bs->kamikazebody = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
CNSTI4 0
ASGNI4
line 5071
;5070:	//reset number of proxmines
;5071:	bs->numproxmines = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
CNSTI4 0
ASGNI4
line 5073
;5072:	//
;5073:	ent = 0;
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRGP4 $2174
JUMPV
LABELV $2173
line 5074
;5074:	while( ( ent = BotAI_GetSnapshotEntity( bs->client, ent, &state ) ) != -1 ) {
line 5076
;5075:		//check the entity state for events
;5076:		BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5078
;5077:		//check for grenades the bot should avoid
;5078:		BotCheckForGrenades(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForGrenades
CALLV
pop
line 5086
;5079:		//
;5080:#ifdef MISSIONPACK
;5081:		//check for proximity mines which the bot should deactivate
;5082:		BotCheckForProxMines(bs, &state);
;5083:		//check for dead bodies with the kamikaze effect which should be gibbed
;5084:		BotCheckForKamikazeBody(bs, &state);
;5085:#endif
;5086:	}
LABELV $2174
line 5074
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 208
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 212
ADDRGP4 BotAI_GetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 208
ADDRLP4 212
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 -1
NEI4 $2173
line 5088
;5087:	//check the player state for events
;5088:	BotAI_GetEntityState(bs->client, &state);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 5090
;5089:	//copy the player state events to the entity state
;5090:	state.event = bs->cur_ps.externalEvent;
ADDRLP4 0+180
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 5091
;5091:	state.eventParm = bs->cur_ps.externalEventParm;
ADDRLP4 0+184
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 5093
;5092:	//
;5093:	BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5094
;5094:}
LABELV $2172
endproc BotCheckSnapshot 216 16
export BotCheckAir
proc BotCheckAir 4 4
line 5101
;5095:
;5096:/*
;5097:==================
;5098:BotCheckAir
;5099:==================
;5100:*/
;5101:void BotCheckAir(bot_state_t *bs) {
line 5102
;5102:	if (bs->inventory[INVENTORY_ENVIRONMENTSUIT] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5096
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2179
line 5103
;5103:		if (trap_AAS_PointContents(bs->eye) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $2181
line 5104
;5104:			return;
ADDRGP4 $2178
JUMPV
LABELV $2181
line 5106
;5105:		}
;5106:	}
LABELV $2179
line 5107
;5107:	bs->lastair_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5108
;5108:}
LABELV $2178
endproc BotCheckAir 4 4
export BotAlternateRoute
proc BotAlternateRoute 16 16
line 5115
;5109:
;5110:/*
;5111:==================
;5112:BotAlternateRoute
;5113:==================
;5114:*/
;5115:bot_goal_t *BotAlternateRoute(bot_state_t *bs, bot_goal_t *goal) {
line 5119
;5116:	int t;
;5117:
;5118:	// if the bot has an alternative route goal
;5119:	if (bs->altroutegoal.areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2184
line 5121
;5120:		//
;5121:		if (bs->reachedaltroutegoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2186
line 5122
;5122:			return goal;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $2183
JUMPV
LABELV $2186
line 5124
;5123:		// travel time towards alternative route goal
;5124:		t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, bs->altroutegoal.areanum, bs->tfl);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 5125
;5125:		if (t && t < 20) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2188
ADDRLP4 12
INDIRI4
CNSTI4 20
GEI4 $2188
line 5127
;5126:			//BotAI_Print(PRT_MESSAGE, "reached alternate route goal\n");
;5127:			bs->reachedaltroutegoal_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5128
;5128:		}
LABELV $2188
line 5129
;5129:		memcpy(goal, &bs->altroutegoal, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 5130
;5130:		return &bs->altroutegoal;
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
RETP4
ADDRGP4 $2183
JUMPV
LABELV $2184
line 5132
;5131:	}
;5132:	return goal;
ADDRFP4 4
INDIRP4
RETP4
LABELV $2183
endproc BotAlternateRoute 16 16
export BotGetAlternateRouteGoal
proc BotGetAlternateRouteGoal 20 0
line 5140
;5133:}
;5134:
;5135:/*
;5136:==================
;5137:BotGetAlternateRouteGoal
;5138:==================
;5139:*/
;5140:int BotGetAlternateRouteGoal(bot_state_t *bs, int base) {
line 5145
;5141:	aas_altroutegoal_t *altroutegoals;
;5142:	bot_goal_t *goal;
;5143:	int numaltroutegoals, rnd;
;5144:
;5145:	if (base == TEAM_RED) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $2191
line 5146
;5146:		altroutegoals = red_altroutegoals;
ADDRLP4 12
ADDRGP4 red_altroutegoals
ASGNP4
line 5147
;5147:		numaltroutegoals = red_numaltroutegoals;
ADDRLP4 4
ADDRGP4 red_numaltroutegoals
INDIRI4
ASGNI4
line 5148
;5148:	}
ADDRGP4 $2192
JUMPV
LABELV $2191
line 5149
;5149:	else {
line 5150
;5150:		altroutegoals = blue_altroutegoals;
ADDRLP4 12
ADDRGP4 blue_altroutegoals
ASGNP4
line 5151
;5151:		numaltroutegoals = blue_numaltroutegoals;
ADDRLP4 4
ADDRGP4 blue_numaltroutegoals
INDIRI4
ASGNI4
line 5152
;5152:	}
LABELV $2192
line 5153
;5153:	if (!numaltroutegoals)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2193
line 5154
;5154:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2190
JUMPV
LABELV $2193
line 5155
;5155:	rnd = (float) random() * numaltroutegoals;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5156
;5156:	if (rnd >= numaltroutegoals)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2195
line 5157
;5157:		rnd = numaltroutegoals-1;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2195
line 5158
;5158:	goal = &bs->altroutegoal;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ASGNP4
line 5159
;5159:	goal->areanum = altroutegoals[rnd].areanum;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 24
MULI4
ADDRLP4 12
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 5160
;5160:	VectorCopy(altroutegoals[rnd].origin, goal->origin);
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 24
MULI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 5161
;5161:	VectorSet(goal->mins, -8, -8, -8);
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
line 5162
;5162:	VectorSet(goal->maxs, 8, 8, 8);
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
line 5163
;5163:	goal->entitynum = 0;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 5164
;5164:	goal->iteminfo = 0;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 5165
;5165:	goal->number = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 5166
;5166:	goal->flags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 5168
;5167:	//
;5168:	bs->reachedaltroutegoal_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
CNSTF4 0
ASGNF4
line 5169
;5169:	return qtrue;
CNSTI4 1
RETI4
LABELV $2190
endproc BotGetAlternateRouteGoal 20 0
export BotSetupAlternativeRouteGoals
proc BotSetupAlternativeRouteGoals 0 0
line 5177
;5170:}
;5171:
;5172:/*
;5173:==================
;5174:BotSetupAlternateRouteGoals
;5175:==================
;5176:*/
;5177:void BotSetupAlternativeRouteGoals(void) {
line 5179
;5178:
;5179:	if (altroutegoals_setup)
ADDRGP4 altroutegoals_setup
INDIRI4
CNSTI4 0
EQI4 $2198
line 5180
;5180:		return;
ADDRGP4 $2197
JUMPV
LABELV $2198
line 5249
;5181:#ifdef MISSIONPACK
;5182:	if (gametype == GT_CTF) {
;5183:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5184:			BotAI_Print(PRT_WARNING, "no alt routes without Neutral Flag\n");
;5185:		if (ctf_neutralflag.areanum) {
;5186:			//
;5187:			red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5188:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5189:										ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5190:										red_altroutegoals, MAX_ALTROUTEGOALS,
;5191:										ALTROUTEGOAL_CLUSTERPORTALS|
;5192:										ALTROUTEGOAL_VIEWPORTALS);
;5193:			blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5194:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5195:										ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5196:										blue_altroutegoals, MAX_ALTROUTEGOALS,
;5197:										ALTROUTEGOAL_CLUSTERPORTALS|
;5198:										ALTROUTEGOAL_VIEWPORTALS);
;5199:		}
;5200:	}
;5201:	else if (gametype == GT_1FCTF) {
;5202:		//
;5203:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5204:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5205:									ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5206:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5207:									ALTROUTEGOAL_CLUSTERPORTALS|
;5208:									ALTROUTEGOAL_VIEWPORTALS);
;5209:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5210:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5211:									ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5212:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5213:									ALTROUTEGOAL_CLUSTERPORTALS|
;5214:									ALTROUTEGOAL_VIEWPORTALS);
;5215:	}
;5216:	else if (gametype == GT_OBELISK) {
;5217:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5218:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5219:		//
;5220:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5221:									neutralobelisk.origin, neutralobelisk.areanum,
;5222:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5223:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5224:									ALTROUTEGOAL_CLUSTERPORTALS|
;5225:									ALTROUTEGOAL_VIEWPORTALS);
;5226:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5227:									neutralobelisk.origin, neutralobelisk.areanum,
;5228:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5229:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5230:									ALTROUTEGOAL_CLUSTERPORTALS|
;5231:									ALTROUTEGOAL_VIEWPORTALS);
;5232:	}
;5233:	else if (gametype == GT_HARVESTER) {
;5234:		//
;5235:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5236:									neutralobelisk.origin, neutralobelisk.areanum,
;5237:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5238:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5239:									ALTROUTEGOAL_CLUSTERPORTALS|
;5240:									ALTROUTEGOAL_VIEWPORTALS);
;5241:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5242:									neutralobelisk.origin, neutralobelisk.areanum,
;5243:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5244:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5245:									ALTROUTEGOAL_CLUSTERPORTALS|
;5246:									ALTROUTEGOAL_VIEWPORTALS);
;5247:	}
;5248:#endif
;5249:	altroutegoals_setup = qtrue;
ADDRGP4 altroutegoals_setup
CNSTI4 1
ASGNI4
line 5250
;5250:}
LABELV $2197
endproc BotSetupAlternativeRouteGoals 0 0
export BotDeathmatchAI
proc BotDeathmatchAI 1492 20
line 5257
;5251:
;5252:/*
;5253:==================
;5254:BotDeathmatchAI
;5255:==================
;5256:*/
;5257:void BotDeathmatchAI(bot_state_t *bs, float thinktime) {
line 5263
;5258:	char gender[144], name[144], buf[144];
;5259:	char userinfo[MAX_INFO_STRING];
;5260:	int i;
;5261:
;5262:	//if the bot has just been setup
;5263:	if (bs->setupcount > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2201
line 5264
;5264:		bs->setupcount--;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5265
;5265:		if (bs->setupcount > 0) return;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2203
ADDRGP4 $2200
JUMPV
LABELV $2203
line 5267
;5266:		//get the gender characteristic
;5267:		trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, sizeof(gender));
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 148
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 5269
;5268:		//set the bot gender
;5269:		trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 5270
;5270:		Info_SetValueForKey(userinfo, "sex", gender);
ADDRLP4 292
ARGP4
ADDRGP4 $2205
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 5271
;5271:		trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 5273
;5272:		//set the team
;5273:		if ( !bs->map_restart && g_gametype.integer != GT_TOURNAMENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2206
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $2206
line 5274
;5274:			Com_sprintf(buf, sizeof(buf), "team %s", bs->settings.team);
ADDRLP4 1316
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $2209
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4756
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 5275
;5275:			trap_EA_Command(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1316
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 5276
;5276:		}
LABELV $2206
line 5278
;5277:		//set the chat gender
;5278:		if (gender[0] == 'm') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 109
NEI4 $2210
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $2211
JUMPV
LABELV $2210
line 5279
;5279:		else if (gender[0] == 'f')  trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $2212
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $2213
JUMPV
LABELV $2212
line 5280
;5280:		else  trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
LABELV $2213
LABELV $2211
line 5282
;5281:		//set the chat name
;5282:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5283
;5283:		trap_BotSetChatName(bs->cs, name, bs->client);
ADDRLP4 1464
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1464
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1464
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotSetChatName
CALLV
pop
line 5285
;5284:		//
;5285:		bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1468
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1468
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5286
;5286:		bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1472
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1472
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5288
;5287:		//
;5288:		bs->setupcount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 0
ASGNI4
line 5290
;5289:		//
;5290:		BotSetupAlternativeRouteGoals();
ADDRGP4 BotSetupAlternativeRouteGoals
CALLV
pop
line 5291
;5291:	}
LABELV $2201
line 5293
;5292:	//no ideal view set
;5293:	bs->flags &= ~BFL_IDEALVIEWSET;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 5295
;5294:	//
;5295:	if (!BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1464
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1464
INDIRI4
CNSTI4 0
NEI4 $2214
line 5297
;5296:		//set the teleport time
;5297:		BotSetTeleportTime(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeleportTime
CALLV
pop
line 5299
;5298:		//update some inventory values
;5299:		BotUpdateInventory(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUpdateInventory
CALLV
pop
line 5301
;5300:		//check out the snapshot
;5301:		BotCheckSnapshot(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckSnapshot
CALLV
pop
line 5303
;5302:		//check for air
;5303:		BotCheckAir(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAir
CALLV
pop
line 5304
;5304:	}
LABELV $2214
line 5306
;5305:	//check the console messages
;5306:	BotCheckConsoleMessages(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckConsoleMessages
CALLV
pop
line 5308
;5307:	//if not in the intermission and not in observer mode
;5308:	if (!BotIntermission(bs) && !BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1468
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1468
INDIRI4
CNSTI4 0
NEI4 $2216
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1472
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 1472
INDIRI4
CNSTI4 0
NEI4 $2216
line 5310
;5309:		//do team AI
;5310:		BotTeamAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamAI
CALLV
pop
line 5311
;5311:	}
LABELV $2216
line 5313
;5312:	//if the bot has no ai node
;5313:	if (!bs->ainode) {
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2218
line 5314
;5314:		AIEnter_Seek_LTG(bs, "BotDeathmatchAI: no ai node");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2220
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 5315
;5315:	}
LABELV $2218
line 5317
;5316:	//if the bot entered the game less than 8 seconds ago
;5317:	if (!bs->entergamechat && bs->entergame_time > FloatTime() - 8) {
ADDRLP4 1476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1476
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2221
ADDRLP4 1476
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
SUBF4
LEF4 $2221
line 5318
;5318:		if (BotChat_EnterGame(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1480
ADDRGP4 BotChat_EnterGame
CALLI4
ASGNI4
ADDRLP4 1480
INDIRI4
CNSTI4 0
EQI4 $2223
line 5319
;5319:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
ARGP4
ADDRLP4 1488
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1484
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1488
INDIRF4
ADDF4
ASGNF4
line 5320
;5320:			AIEnter_Stand(bs, "BotDeathmatchAI: chat enter game");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2225
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 5321
;5321:		}
LABELV $2223
line 5322
;5322:		bs->entergamechat = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6024
ADDP4
CNSTI4 1
ASGNI4
line 5323
;5323:	}
LABELV $2221
line 5325
;5324:	//reset the node switches from the previous frame
;5325:	BotResetNodeSwitches();
ADDRGP4 BotResetNodeSwitches
CALLV
pop
line 5327
;5326:	//execute AI nodes
;5327:	for (i = 0; i < MAX_NODESWITCHES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2226
line 5328
;5328:		if (bs->ainode(bs)) break;
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
ARGP4
ADDRLP4 1484
ADDRLP4 1480
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1484
INDIRI4
CNSTI4 0
EQI4 $2230
ADDRGP4 $2228
JUMPV
LABELV $2230
line 5329
;5329:	}
LABELV $2227
line 5327
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2226
LABELV $2228
line 5331
;5330:	//if the bot removed itself :)
;5331:	if (!bs->inuse) return;
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2232
ADDRGP4 $2200
JUMPV
LABELV $2232
line 5333
;5332:	//if the bot executed too many AI nodes
;5333:	if (i >= MAX_NODESWITCHES) {
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2234
line 5334
;5334:		trap_BotDumpGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpGoalStack
CALLV
pop
line 5335
;5335:		trap_BotDumpAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpAvoidGoals
CALLV
pop
line 5336
;5336:		BotDumpNodeSwitches(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDumpNodeSwitches
CALLV
pop
line 5337
;5337:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5338
;5338:		BotAI_Print(PRT_ERROR, "%s at %1.1f switched more than %d AI nodes\n", name, FloatTime(), MAX_NODESWITCHES);
CNSTI4 3
ARGI4
ADDRGP4 $2236
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
CNSTI4 50
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 5339
;5339:	}
LABELV $2234
line 5341
;5340:	//
;5341:	bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1480
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5342
;5342:	bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1484
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5343
;5343:}
LABELV $2200
endproc BotDeathmatchAI 1492 20
export BotSetEntityNumForGoalWithModel
proc BotSetEntityNumForGoalWithModel 44 4
line 5350
;5344:
;5345:/*
;5346:==================
;5347:BotSetEntityNumForGoalWithModel
;5348:==================
;5349:*/
;5350:void BotSetEntityNumForGoalWithModel(bot_goal_t *goal, int eType, char *modelname) {
line 5355
;5351:	gentity_t *ent;
;5352:	int i, modelindex;
;5353:	vec3_t dir;
;5354:
;5355:	modelindex = G_ModelIndex( modelname );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 5356
;5356:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5357
;5357:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2241
JUMPV
LABELV $2238
line 5358
;5358:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2243
line 5359
;5359:			continue;
ADDRGP4 $2239
JUMPV
LABELV $2243
line 5361
;5360:		}
;5361:		if ( eType && ent->s.eType != eType) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2245
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2245
line 5362
;5362:			continue;
ADDRGP4 $2239
JUMPV
LABELV $2245
line 5364
;5363:		}
;5364:		if (ent->s.modelindex != modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2247
line 5365
;5365:			continue;
ADDRGP4 $2239
JUMPV
LABELV $2247
line 5367
;5366:		}
;5367:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5368
;5368:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
GEF4 $2251
line 5369
;5369:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5370
;5370:			return;
ADDRGP4 $2237
JUMPV
LABELV $2251
line 5372
;5371:		}
;5372:	}
LABELV $2239
line 5357
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $2241
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2238
line 5373
;5373:}
LABELV $2237
endproc BotSetEntityNumForGoalWithModel 44 4
export BotSetEntityNumForGoal
proc BotSetEntityNumForGoal 36 8
line 5380
;5374:
;5375:/*
;5376:==================
;5377:BotSetEntityNumForGoal
;5378:==================
;5379:*/
;5380:void BotSetEntityNumForGoal(bot_goal_t *goal, char *classname) {
line 5385
;5381:	gentity_t *ent;
;5382:	int i;
;5383:	vec3_t dir;
;5384:
;5385:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5386
;5386:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2257
JUMPV
LABELV $2254
line 5387
;5387:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2259
line 5388
;5388:			continue;
ADDRGP4 $2255
JUMPV
LABELV $2259
line 5390
;5389:		}
;5390:		if ( !Q_stricmp(ent->classname, classname) ) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2261
line 5391
;5391:			continue;
ADDRGP4 $2255
JUMPV
LABELV $2261
line 5393
;5392:		}
;5393:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5394
;5394:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $2265
line 5395
;5395:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5396
;5396:			return;
ADDRGP4 $2253
JUMPV
LABELV $2265
line 5398
;5397:		}
;5398:	}
LABELV $2255
line 5386
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $2257
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2254
line 5399
;5399:}
LABELV $2253
endproc BotSetEntityNumForGoal 36 8
export BotGoalForBSPEntity
proc BotGoalForBSPEntity 1128 20
line 5406
;5400:
;5401:/*
;5402:==================
;5403:BotGoalForBSPEntity
;5404:==================
;5405:*/
;5406:int BotGoalForBSPEntity( char *classname, bot_goal_t *goal ) {
line 5411
;5407:	char value[MAX_INFO_STRING];
;5408:	vec3_t origin, start, end;
;5409:	int ent, numareas, areas[10];
;5410:
;5411:	memset(goal, 0, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5412
;5412:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 1108
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1108
INDIRI4
ASGNI4
ADDRGP4 $2271
JUMPV
LABELV $2268
line 5413
;5413:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", value, sizeof(value)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1838
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2272
line 5414
;5414:			continue;
ADDRGP4 $2269
JUMPV
LABELV $2272
line 5415
;5415:		if (!strcmp(value, classname)) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2274
line 5416
;5416:			if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1854
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1120
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2276
line 5417
;5417:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2267
JUMPV
LABELV $2276
line 5418
;5418:			VectorCopy(origin, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 12
line 5419
;5419:			VectorCopy(origin, start);
ADDRLP4 1040
ADDRLP4 1028
INDIRB
ASGNB 12
line 5420
;5420:			start[2] -= 32;
ADDRLP4 1040+8
ADDRLP4 1040+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5421
;5421:			VectorCopy(origin, end);
ADDRLP4 1052
ADDRLP4 1028
INDIRB
ASGNB 12
line 5422
;5422:			end[2] += 32;
ADDRLP4 1052+8
ADDRLP4 1052+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 5423
;5423:			numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 1040
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1068
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 1124
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1124
INDIRI4
ASGNI4
line 5424
;5424:			if (!numareas)
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2280
line 5425
;5425:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2267
JUMPV
LABELV $2280
line 5426
;5426:			goal->areanum = areas[0];
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 5427
;5427:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2267
JUMPV
LABELV $2274
line 5429
;5428:		}
;5429:	}
LABELV $2269
line 5412
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1112
INDIRI4
ASGNI4
LABELV $2271
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2268
line 5430
;5430:	return qfalse;
CNSTI4 0
RETI4
LABELV $2267
endproc BotGoalForBSPEntity 1128 20
export BotSetupDeathmatchAI
proc BotSetupDeathmatchAI 152 16
line 5438
;5431:}
;5432:
;5433:/*
;5434:==================
;5435:BotSetupDeathmatchAI
;5436:==================
;5437:*/
;5438:void BotSetupDeathmatchAI(void) {
line 5442
;5439:	int ent, modelnum;
;5440:	char model[128];
;5441:
;5442:	gametype = trap_Cvar_VariableIntegerValue( "g_gametype" );
ADDRGP4 $2283
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 gametype
ADDRLP4 136
INDIRI4
ASGNI4
line 5444
;5443:
;5444:	trap_Cvar_Register(&bot_rocketjump, "bot_rocketjump", "1", 0);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 $2284
ARGP4
ADDRGP4 $2098
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5445
;5445:	trap_Cvar_Register(&bot_grapple, "bot_grapple", "0", 0);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 $2285
ARGP4
ADDRGP4 $2286
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5446
;5446:	trap_Cvar_Register(&bot_fastchat, "bot_fastchat", "0", 0);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 $2287
ARGP4
ADDRGP4 $2286
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5447
;5447:	trap_Cvar_Register(&bot_nochat, "bot_nochat", "0", 0);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 $2288
ARGP4
ADDRGP4 $2286
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5448
;5448:	trap_Cvar_Register(&bot_testrchat, "bot_testrchat", "0", 0);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 $2097
ARGP4
ADDRGP4 $2286
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5449
;5449:	trap_Cvar_Register(&bot_challenge, "bot_challenge", "0", 0);
ADDRGP4 bot_challenge
ARGP4
ADDRGP4 $2289
ARGP4
ADDRGP4 $2286
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5450
;5450:	trap_Cvar_Register(&bot_predictobstacles, "bot_predictobstacles", "1", 0);
ADDRGP4 bot_predictobstacles
ARGP4
ADDRGP4 $2290
ARGP4
ADDRGP4 $2098
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5451
;5451:	trap_Cvar_Register(&g_spSkill, "g_spSkill", "2", 0);
ADDRGP4 g_spSkill
ARGP4
ADDRGP4 $2291
ARGP4
ADDRGP4 $2292
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5453
;5452:	//
;5453:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2293
line 5454
;5454:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2297
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 140
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
GEI4 $2295
line 5455
;5455:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2298
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2295
line 5456
;5456:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2301
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $2299
line 5457
;5457:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2302
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2299
line 5458
;5458:	}
LABELV $2293
line 5489
;5459:#ifdef MISSIONPACK
;5460:	else if (gametype == GT_1FCTF) {
;5461:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5462:			BotAI_Print(PRT_WARNING, "One Flag CTF without Neutral Flag\n");
;5463:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
;5464:			BotAI_Print(PRT_WARNING, "One Flag CTF without Red Flag\n");
;5465:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
;5466:			BotAI_Print(PRT_WARNING, "One Flag CTF without Blue Flag\n");
;5467:	}
;5468:	else if (gametype == GT_OBELISK) {
;5469:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5470:			BotAI_Print(PRT_WARNING, "Obelisk without red obelisk\n");
;5471:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5472:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5473:			BotAI_Print(PRT_WARNING, "Obelisk without blue obelisk\n");
;5474:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5475:	}
;5476:	else if (gametype == GT_HARVESTER) {
;5477:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5478:			BotAI_Print(PRT_WARNING, "Harvester without red obelisk\n");
;5479:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5480:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5481:			BotAI_Print(PRT_WARNING, "Harvester without blue obelisk\n");
;5482:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5483:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5484:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5485:		BotSetEntityNumForGoal(&neutralobelisk, "team_neutralobelisk");
;5486:	}
;5487:#endif
;5488:
;5489:	max_bspmodelindex = 0;
ADDRGP4 max_bspmodelindex
CNSTI4 0
ASGNI4
line 5490
;5490:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 140
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 140
INDIRI4
ASGNI4
ADDRGP4 $2306
JUMPV
LABELV $2303
line 5491
;5491:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $282
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 144
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $2307
ADDRGP4 $2304
JUMPV
LABELV $2307
line 5492
;5492:		if (model[0] == '*') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $2309
line 5493
;5493:			modelnum = atoi(model+1);
ADDRLP4 4+1
ARGP4
ADDRLP4 148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 148
INDIRI4
ASGNI4
line 5494
;5494:			if (modelnum > max_bspmodelindex)
ADDRLP4 132
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
LEI4 $2312
line 5495
;5495:				max_bspmodelindex = modelnum;
ADDRGP4 max_bspmodelindex
ADDRLP4 132
INDIRI4
ASGNI4
LABELV $2312
line 5496
;5496:		}
LABELV $2309
line 5497
;5497:	}
LABELV $2304
line 5490
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 144
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 144
INDIRI4
ASGNI4
LABELV $2306
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2303
line 5499
;5498:	//initialize the waypoint heap
;5499:	BotInitWaypoints();
ADDRGP4 BotInitWaypoints
CALLV
pop
line 5500
;5500:}
LABELV $2282
endproc BotSetupDeathmatchAI 152 16
export BotShutdownDeathmatchAI
proc BotShutdownDeathmatchAI 0 0
line 5507
;5501:
;5502:/*
;5503:==================
;5504:BotShutdownDeathmatchAI
;5505:==================
;5506:*/
;5507:void BotShutdownDeathmatchAI(void) {
line 5508
;5508:	altroutegoals_setup = qfalse;
ADDRGP4 altroutegoals_setup
CNSTI4 0
ASGNI4
line 5509
;5509:}
LABELV $2314
endproc BotShutdownDeathmatchAI 0 0
import g_clients
bss
export blue_numaltroutegoals
align 4
LABELV blue_numaltroutegoals
skip 4
export blue_altroutegoals
align 4
LABELV blue_altroutegoals
skip 768
export red_numaltroutegoals
align 4
LABELV red_numaltroutegoals
skip 4
export red_altroutegoals
align 4
LABELV red_altroutegoals
skip 768
export altroutegoals_setup
align 4
LABELV altroutegoals_setup
skip 4
export max_bspmodelindex
align 4
LABELV max_bspmodelindex
skip 4
export lastteleport_time
align 4
LABELV lastteleport_time
skip 4
export lastteleport_origin
align 4
LABELV lastteleport_origin
skip 12
import bot_developer
export g_spSkill
align 4
LABELV g_spSkill
skip 272
export bot_predictobstacles
align 4
LABELV bot_predictobstacles
skip 272
export botai_freewaypoints
align 4
LABELV botai_freewaypoints
skip 4
export botai_waypoints
align 4
LABELV botai_waypoints
skip 12800
import BotVoiceChatOnly
import BotVoiceChat
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
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
export ctf_blueflag
align 4
LABELV ctf_blueflag
skip 56
export ctf_redflag
align 4
LABELV ctf_redflag
skip 56
export bot_challenge
align 4
LABELV bot_challenge
skip 272
export bot_testrchat
align 4
LABELV bot_testrchat
skip 272
export bot_nochat
align 4
LABELV bot_nochat
skip 272
export bot_fastchat
align 4
LABELV bot_fastchat
skip 272
export bot_rocketjump
align 4
LABELV bot_rocketjump
skip 272
export bot_grapple
align 4
LABELV bot_grapple
skip 272
import mapname
export gametype
align 4
LABELV gametype
skip 4
import BotTeamSeekGoals
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
LABELV $2302
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2301
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
LABELV $2298
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2297
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
LABELV $2292
byte 1 50
byte 1 0
align 1
LABELV $2291
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2290
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 98
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2289
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2288
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2287
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2286
byte 1 48
byte 1 0
align 1
LABELV $2285
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2284
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $2283
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
LABELV $2236
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
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
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 73
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2225
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2220
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2209
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2205
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2165
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
LABELV $2162
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2141
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
LABELV $2138
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2109
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2102
byte 1 42
byte 1 42
byte 1 42
byte 1 42
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
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 42
byte 1 10
byte 1 0
align 1
LABELV $2101
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $2098
byte 1 49
byte 1 0
align 1
LABELV $2097
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1964
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1963
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1959
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 111
byte 1 70
byte 1 111
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1947
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1946
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1943
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1932
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1919
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1913
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1905
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1894
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1890
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1887
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1854
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1849
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $1844
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1841
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1838
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1837
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1825
byte 1 42
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1644
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1621
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1618
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1580
byte 1 109
byte 1 112
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $1525
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $667
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $666
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $665
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $664
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $663
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $496
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 87
byte 1 97
byte 1 121
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 79
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $282
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $281
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $277
byte 1 110
byte 1 0
align 1
LABELV $276
byte 1 91
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 93
byte 1 0
align 1
LABELV $275
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $160
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $159
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
LABELV $69
byte 1 116
byte 1 0
