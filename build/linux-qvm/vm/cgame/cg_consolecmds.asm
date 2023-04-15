code
proc CG_TargetCommand_f 20 12
file "../../../../code/cgame/cg_consolecmds.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_consolecmds.c -- text commands typed in at the local console, or
;4:// executed by a key binding
;5:
;6:#include "cg_local.h"
;7:#ifdef MISSIONPACK
;8:#include "../ui/ui_shared.h"
;9:extern menuDef_t *menuScoreboard;
;10:#endif
;11:
;12:
;13:/*
;14:=================
;15:CG_TargetCommand_f
;16:=================
;17:*/
;18:static void CG_TargetCommand_f( void ) {
line 22
;19:	int		targetNum;
;20:	char	cmd[4];
;21:
;22:	targetNum = CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 23
;23:	if ( targetNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $73
line 24
;24:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 27
;25:	}
;26:
;27:	trap_Argv( 1, cmd, sizeof( cmd ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 28
;28:	trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( cmd ) ) );
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $75
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 29
;29:}
LABELV $72
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
line 40
;30:
;31:
;32:
;33:/*
;34:=================
;35:CG_SizeUp_f
;36:
;37:Keybinding command
;38:=================
;39:*/
;40:static void CG_SizeUp_f (void) {
line 41
;41:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer+10)));
ADDRGP4 $78
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $77
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 42
;42:}
LABELV $76
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 52
;43:
;44:
;45:/*
;46:=================
;47:CG_SizeDown_f
;48:
;49:Keybinding command
;50:=================
;51:*/
;52:static void CG_SizeDown_f (void) {
line 53
;53:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer-10)));
ADDRGP4 $78
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $77
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 54
;54:}
LABELV $80
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
line 64
;55:
;56:
;57:/*
;58:=============
;59:CG_Viewpos_f
;60:
;61:Debugging command to print the current position
;62:=============
;63:*/
;64:static void CG_Viewpos_f (void) {
line 65
;65:	CG_Printf ("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0],
ADDRGP4 $83
ARGP4
ADDRGP4 cg+109056+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109056+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109056+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109424+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 68
;66:		(int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
;67:		(int)cg.refdefViewAngles[YAW]);
;68:}
LABELV $82
endproc CG_Viewpos_f 0 20
proc CG_ScoresDown_f 0 4
line 71
;69:
;70:
;71:static void CG_ScoresDown_f( void ) {
line 76
;72:
;73:#ifdef MISSIONPACK
;74:	CG_BuildSpectatorString();
;75:#endif
;76:	if ( cg.scoresRequestTime + 2000 < cg.time && !cg.demoPlayback ) {
ADDRGP4 cg+110472
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $95
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $95
line 79
;77:		// the scores are more than two seconds out of data,
;78:		// so request new ones
;79:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110472
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 80
;80:		trap_SendClientCommand( "score" );
ADDRGP4 $102
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 84
;81:
;82:		// leave the current scores up if they were already
;83:		// displayed, but if this is the first hit, clear them out
;84:		if ( !cg.showScores ) {
ADDRGP4 cg+115356
INDIRI4
CNSTI4 0
NEI4 $96
line 85
;85:			cg.showScores = qtrue;
ADDRGP4 cg+115356
CNSTI4 1
ASGNI4
line 86
;86:			cg.numScores = 0;
ADDRGP4 cg+110476
CNSTI4 0
ASGNI4
line 87
;87:		}
line 88
;88:	} else {
ADDRGP4 $96
JUMPV
LABELV $95
line 91
;89:		// show the cached contents even if they just pressed if it
;90:		// is within two seconds
;91:		cg.showScores = qtrue;
ADDRGP4 cg+115356
CNSTI4 1
ASGNI4
line 92
;92:	}
LABELV $96
line 94
;93:
;94:	CG_SetScoreCatcher( cg.showScores );
ADDRGP4 cg+115356
INDIRI4
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
line 95
;95:}
LABELV $94
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 4
line 98
;96:
;97:
;98:static void CG_ScoresUp_f( void ) {
line 100
;99:
;100:	if ( cgs.filterKeyUpEvent ) {
ADDRGP4 cgs+149704
INDIRI4
CNSTI4 0
EQI4 $111
line 101
;101:		cgs.filterKeyUpEvent = qfalse;
ADDRGP4 cgs+149704
CNSTI4 0
ASGNI4
line 102
;102:		return;
ADDRGP4 $110
JUMPV
LABELV $111
line 105
;103:	}
;104:
;105:	if ( cg.showScores ) {
ADDRGP4 cg+115356
INDIRI4
CNSTI4 0
EQI4 $115
line 106
;106:		cg.showScores = qfalse;
ADDRGP4 cg+115356
CNSTI4 0
ASGNI4
line 107
;107:		cg.scoreFadeTime = cg.time;
ADDRGP4 cg+115364
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 108
;108:	}
LABELV $115
line 110
;109:
;110:	CG_SetScoreCatcher( cg.showScores );
ADDRGP4 cg+115356
INDIRI4
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
line 111
;111:}
LABELV $110
endproc CG_ScoresUp_f 0 4
proc CG_TellTarget_f 264 20
line 184
;112:
;113:
;114:#ifdef MISSIONPACK
;115:extern menuDef_t *menuScoreboard;
;116:void Menu_Reset( void );			// FIXME: add to right include file
;117:
;118:static void CG_LoadHud_f( void) {
;119:  char buff[1024];
;120:	const char *hudSet;
;121:  memset(buff, 0, sizeof(buff));
;122:
;123:	String_Init();
;124:	Menu_Reset();
;125:	
;126:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;127:	hudSet = buff;
;128:	if (hudSet[0] == '\0') {
;129:		hudSet = "ui/hud.txt";
;130:	}
;131:
;132:	CG_LoadMenus(hudSet);
;133:  menuScoreboard = NULL;
;134:}
;135:
;136:
;137:static void CG_scrollScoresDown_f( void) {
;138:	if (menuScoreboard && cg.scoreBoardShowing) {
;139:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qtrue);
;140:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qtrue);
;141:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qtrue);
;142:	}
;143:}
;144:
;145:
;146:static void CG_scrollScoresUp_f( void) {
;147:	if (menuScoreboard && cg.scoreBoardShowing) {
;148:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qfalse);
;149:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qfalse);
;150:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qfalse);
;151:	}
;152:}
;153:
;154:
;155:static void CG_spWin_f( void) {
;156:	trap_Cvar_Set("cg_cameraOrbit", "2");
;157:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;158:	trap_Cvar_Set("cg_thirdPerson", "1");
;159:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;160:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;161:	CG_AddBufferedSound(cgs.media.winnerSound);
;162:	//trap_S_StartLocalSound(cgs.media.winnerSound, CHAN_ANNOUNCER);
;163:	CG_CenterPrint("YOU WIN!", SCREEN_HEIGHT * .30, 0);
;164:}
;165:
;166:static void CG_spLose_f( void) {
;167:	trap_Cvar_Set("cg_cameraOrbit", "2");
;168:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;169:	trap_Cvar_Set("cg_thirdPerson", "1");
;170:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;171:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;172:	CG_AddBufferedSound(cgs.media.loserSound);
;173:	//trap_S_StartLocalSound(cgs.media.loserSound, CHAN_ANNOUNCER);
;174:	CG_CenterPrint("YOU LOSE...", SCREEN_HEIGHT * .30, 0);
;175:}
;176:
;177:#endif
;178:
;179:/*
;180:==================
;181:CG_TellTarget_f
;182:==================
;183:*/
;184:static void CG_TellTarget_f( void ) {
line 189
;185:	int		clientNum;
;186:	char	command[128];
;187:	char	message[128];
;188:
;189:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 190
;190:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $123
line 191
;191:		return;
ADDRGP4 $122
JUMPV
LABELV $123
line 194
;192:	}
;193:
;194:	trap_Args( message, sizeof( message ) );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 195
;195:	Com_sprintf( command, sizeof( command ), "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $125
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 196
;196:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 197
;197:}
LABELV $122
endproc CG_TellTarget_f 264 20
proc CG_TellAttacker_f 264 20
line 205
;198:
;199:
;200:/*
;201:==================
;202:CG_TellAttacker_f
;203:==================
;204:*/
;205:static void CG_TellAttacker_f( void ) {
line 210
;206:	int		clientNum;
;207:	char	command[128];
;208:	char	message[128];
;209:
;210:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 211
;211:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $127
line 212
;212:		return;
ADDRGP4 $126
JUMPV
LABELV $127
line 215
;213:	}
;214:
;215:	trap_Args( message, sizeof( message ) );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 216
;216:	Com_sprintf( command, sizeof( command ), "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $125
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 217
;217:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 218
;218:}
LABELV $126
endproc CG_TellAttacker_f 264 20
proc CG_StartOrbit_f 1028 12
line 435
;219:
;220:
;221:#ifdef MISSIONPACK
;222:/*
;223:==================
;224:CG_VoiceTellTarget_f
;225:==================
;226:*/
;227:static void CG_VoiceTellTarget_f( void ) {
;228:	int		clientNum;
;229:	char	command[128];
;230:	char	message[128];
;231:
;232:	clientNum = CG_CrosshairPlayer();
;233:	if ( clientNum == -1 ) {
;234:		return;
;235:	}
;236:
;237:	trap_Args( message, sizeof( message ) );
;238:	Com_sprintf( command, sizeof( command ), "vtell %i %s", clientNum, message );
;239:	trap_SendClientCommand( command );
;240:}
;241:
;242:
;243:/*
;244:==================
;245:CG_VoiceTellAttacker_f
;246:==================
;247:*/
;248:static void CG_VoiceTellAttacker_f( void ) {
;249:	int		clientNum;
;250:	char	command[128];
;251:	char	message[128];
;252:
;253:	clientNum = CG_LastAttacker();
;254:	if ( clientNum == -1 ) {
;255:		return;
;256:	}
;257:
;258:	trap_Args( message, sizeof( message ) );
;259:	Com_sprintf( command, sizeof( command ), "vtell %i %s", clientNum, message );
;260:	trap_SendClientCommand( command );
;261:}
;262:
;263:static void CG_NextTeamMember_f( void ) {
;264:  CG_SelectNextPlayer();
;265:}
;266:
;267:static void CG_PrevTeamMember_f( void ) {
;268:  CG_SelectPrevPlayer();
;269:}
;270:
;271:// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
;272://
;273:static void CG_NextOrder_f( void ) {
;274:	clientInfo_t *ci = cgs.clientinfo + cg.snap->ps.clientNum;
;275:	if (ci) {
;276:		if (!ci->teamLeader && sortedTeamPlayers[cg_currentSelectedPlayer.integer] != cg.snap->ps.clientNum) {
;277:			return;
;278:		}
;279:	}
;280:	if (cgs.currentOrder < TEAMTASK_CAMP) {
;281:		cgs.currentOrder++;
;282:
;283:		if (cgs.currentOrder == TEAMTASK_RETRIEVE) {
;284:			if (!CG_OtherTeamHasFlag()) {
;285:				cgs.currentOrder++;
;286:			}
;287:		}
;288:
;289:		if (cgs.currentOrder == TEAMTASK_ESCORT) {
;290:			if (!CG_YourTeamHasFlag()) {
;291:				cgs.currentOrder++;
;292:			}
;293:		}
;294:
;295:	} else {
;296:		cgs.currentOrder = TEAMTASK_OFFENSE;
;297:	}
;298:	cgs.orderPending = qtrue;
;299:	cgs.orderTime = cg.time + 3000;
;300:}
;301:
;302:
;303:static void CG_ConfirmOrder_f (void ) {
;304:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_YES));
;305:	trap_SendConsoleCommand("+button5; wait; -button5");
;306:	if (cg.time < cgs.acceptOrderTime) {
;307:		trap_SendClientCommand(va("teamtask %d\n", cgs.acceptTask));
;308:		cgs.acceptOrderTime = 0;
;309:	}
;310:}
;311:
;312:static void CG_DenyOrder_f (void ) {
;313:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_NO));
;314:	trap_SendConsoleCommand("+button6; wait; -button6");
;315:	if (cg.time < cgs.acceptOrderTime) {
;316:		cgs.acceptOrderTime = 0;
;317:	}
;318:}
;319:
;320:static void CG_TaskOffense_f (void ) {
;321:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF) {
;322:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONGETFLAG));
;323:	} else {
;324:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONOFFENSE));
;325:	}
;326:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_OFFENSE));
;327:}
;328:
;329:static void CG_TaskDefense_f (void ) {
;330:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONDEFENSE));
;331:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_DEFENSE));
;332:}
;333:
;334:static void CG_TaskPatrol_f (void ) {
;335:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONPATROL));
;336:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_PATROL));
;337:}
;338:
;339:static void CG_TaskCamp_f (void ) {
;340:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONCAMPING));
;341:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_CAMP));
;342:}
;343:
;344:static void CG_TaskFollow_f (void ) {
;345:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOW));
;346:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_FOLLOW));
;347:}
;348:
;349:static void CG_TaskRetrieve_f (void ) {
;350:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONRETURNFLAG));
;351:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_RETRIEVE));
;352:}
;353:
;354:static void CG_TaskEscort_f (void ) {
;355:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOWCARRIER));
;356:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_ESCORT));
;357:}
;358:
;359:static void CG_TaskOwnFlag_f (void ) {
;360:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_IHAVEFLAG));
;361:}
;362:
;363:static void CG_TauntKillInsult_f (void ) {
;364:	trap_SendConsoleCommand("cmd vsay kill_insult\n");
;365:}
;366:
;367:static void CG_TauntPraise_f (void ) {
;368:	trap_SendConsoleCommand("cmd vsay praise\n");
;369:}
;370:
;371:static void CG_TauntTaunt_f (void ) {
;372:	trap_SendConsoleCommand("cmd vtaunt\n");
;373:}
;374:
;375:static void CG_TauntDeathInsult_f (void ) {
;376:	trap_SendConsoleCommand("cmd vsay death_insult\n");
;377:}
;378:
;379:static void CG_TauntGauntlet_f (void ) {
;380:	trap_SendConsoleCommand("cmd vsay kill_gauntlet\n");
;381:}
;382:
;383:static void CG_TaskSuicide_f (void ) {
;384:	int		clientNum;
;385:	char	command[128];
;386:
;387:	clientNum = CG_CrosshairPlayer();
;388:	if ( clientNum == -1 ) {
;389:		return;
;390:	}
;391:
;392:	Com_sprintf( command, 128, "tell %i suicide", clientNum );
;393:	trap_SendClientCommand( command );
;394:}
;395:
;396:
;397:
;398:/*
;399:==================
;400:CG_TeamMenu_f
;401:==================
;402:*/
;403:/*
;404:static void CG_TeamMenu_f( void ) {
;405:  if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
;406:    CG_EventHandling(CGAME_EVENT_NONE);
;407:    trap_Key_SetCatcher(0);
;408:  } else {
;409:    CG_EventHandling(CGAME_EVENT_TEAMMENU);
;410:    //trap_Key_SetCatcher(KEYCATCH_CGAME);
;411:  }
;412:}
;413:*/
;414:
;415:/*
;416:==================
;417:CG_EditHud_f
;418:==================
;419:*/
;420:/*
;421:static void CG_EditHud_f( void ) {
;422:  //cls.keyCatchers ^= KEYCATCH_CGAME;
;423:  //VM_Call (cgvm, CG_EVENT_HANDLING, (cls.keyCatchers & KEYCATCH_CGAME) ? CGAME_EVENT_EDITHUD : CGAME_EVENT_NONE);
;424:}
;425:*/
;426:
;427:#endif
;428:
;429:/*
;430:==================
;431:CG_StartOrbit_f
;432:==================
;433:*/
;434:
;435:static void CG_StartOrbit_f( void ) {
line 438
;436:	char var[MAX_TOKEN_CHARS];
;437:
;438:	trap_Cvar_VariableStringBuffer( "developer", var, sizeof( var ) );
ADDRGP4 $130
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 439
;439:	if ( !atoi(var) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $131
line 440
;440:		return;
ADDRGP4 $129
JUMPV
LABELV $131
line 442
;441:	}
;442:	if (cg_cameraOrbit.value != 0) {
ADDRGP4 cg_cameraOrbit+8
INDIRF4
CNSTF4 0
EQF4 $133
line 443
;443:		trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $136
ARGP4
ADDRGP4 $137
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 444
;444:		trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $138
ARGP4
ADDRGP4 $137
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 445
;445:	} else {
ADDRGP4 $134
JUMPV
LABELV $133
line 446
;446:		trap_Cvar_Set("cg_cameraOrbit", "5");
ADDRGP4 $136
ARGP4
ADDRGP4 $139
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 447
;447:		trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $138
ARGP4
ADDRGP4 $140
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 448
;448:		trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $141
ARGP4
ADDRGP4 $137
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 449
;449:		trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $142
ARGP4
ADDRGP4 $143
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 450
;450:	}
LABELV $134
line 451
;451:}
LABELV $129
endproc CG_StartOrbit_f 1028 12
data
align 4
LABELV commands
address $145
address CG_TestGun_f
address $146
address CG_TestModel_f
address $147
address CG_TestModelNextFrame_f
address $148
address CG_TestModelPrevFrame_f
address $149
address CG_TestModelNextSkin_f
address $150
address CG_TestModelPrevSkin_f
address $151
address CG_Viewpos_f
address $152
address CG_ScoresDown_f
address $153
address CG_ScoresUp_f
address $154
address CG_ZoomDown_f
address $155
address CG_ZoomUp_f
address $156
address CG_SizeUp_f
address $157
address CG_SizeDown_f
address $158
address CG_NextWeapon_f
address $159
address CG_PrevWeapon_f
address $160
address CG_Weapon_f
address $161
address CG_TargetCommand_f
address $162
address CG_TellTarget_f
address $163
address CG_TellAttacker_f
address $164
address CG_StartOrbit_f
address $165
address CG_LoadDeferredPlayers
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
line 534
;452:
;453:/*
;454:static void CG_Camera_f( void ) {
;455:	char name[1024];
;456:	trap_Argv( 1, name, sizeof(name));
;457:	if (trap_loadCamera(name)) {
;458:		cg.cameraMode = qtrue;
;459:		trap_startCamera(cg.time);
;460:	} else {
;461:		CG_Printf ("Unable to load camera %s\n",name);
;462:	}
;463:}
;464:*/
;465:
;466:
;467:typedef struct {
;468:	const char *cmd;
;469:	void	(*function)(void);
;470:} consoleCommand_t;
;471:
;472:static consoleCommand_t	commands[] = {
;473:	{ "testgun", CG_TestGun_f },
;474:	{ "testmodel", CG_TestModel_f },
;475:	{ "nextframe", CG_TestModelNextFrame_f },
;476:	{ "prevframe", CG_TestModelPrevFrame_f },
;477:	{ "nextskin", CG_TestModelNextSkin_f },
;478:	{ "prevskin", CG_TestModelPrevSkin_f },
;479:	{ "viewpos", CG_Viewpos_f },
;480:	{ "+scores", CG_ScoresDown_f },
;481:	{ "-scores", CG_ScoresUp_f },
;482:	{ "+zoom", CG_ZoomDown_f },
;483:	{ "-zoom", CG_ZoomUp_f },
;484:	{ "sizeup", CG_SizeUp_f },
;485:	{ "sizedown", CG_SizeDown_f },
;486:	{ "weapnext", CG_NextWeapon_f },
;487:	{ "weapprev", CG_PrevWeapon_f },
;488:	{ "weapon", CG_Weapon_f },
;489:	{ "tcmd", CG_TargetCommand_f },
;490:	{ "tell_target", CG_TellTarget_f },
;491:	{ "tell_attacker", CG_TellAttacker_f },
;492:#ifdef MISSIONPACK
;493:	{ "vtell_target", CG_VoiceTellTarget_f },
;494:	{ "vtell_attacker", CG_VoiceTellAttacker_f },
;495:	{ "loadhud", CG_LoadHud_f },
;496:	{ "nextTeamMember", CG_NextTeamMember_f },
;497:	{ "prevTeamMember", CG_PrevTeamMember_f },
;498:	{ "nextOrder", CG_NextOrder_f },
;499:	{ "confirmOrder", CG_ConfirmOrder_f },
;500:	{ "denyOrder", CG_DenyOrder_f },
;501:	{ "taskOffense", CG_TaskOffense_f },
;502:	{ "taskDefense", CG_TaskDefense_f },
;503:	{ "taskPatrol", CG_TaskPatrol_f },
;504:	{ "taskCamp", CG_TaskCamp_f },
;505:	{ "taskFollow", CG_TaskFollow_f },
;506:	{ "taskRetrieve", CG_TaskRetrieve_f },
;507:	{ "taskEscort", CG_TaskEscort_f },
;508:	{ "taskSuicide", CG_TaskSuicide_f },
;509:	{ "taskOwnFlag", CG_TaskOwnFlag_f },
;510:	{ "tauntKillInsult", CG_TauntKillInsult_f },
;511:	{ "tauntPraise", CG_TauntPraise_f },
;512:	{ "tauntTaunt", CG_TauntTaunt_f },
;513:	{ "tauntDeathInsult", CG_TauntDeathInsult_f },
;514:	{ "tauntGauntlet", CG_TauntGauntlet_f },
;515:	{ "spWin", CG_spWin_f },
;516:	{ "spLose", CG_spLose_f },
;517:	{ "scoresDown", CG_scrollScoresDown_f },
;518:	{ "scoresUp", CG_scrollScoresUp_f },
;519:#endif
;520:	{ "startOrbit", CG_StartOrbit_f },
;521:	//{ "camera", CG_Camera_f },
;522:	{ "loaddeferred", CG_LoadDeferredPlayers }	
;523:};
;524:
;525:
;526:/*
;527:=================
;528:CG_ConsoleCommand
;529:
;530:The string has been tokenized and can be retrieved with
;531:Cmd_Argc() / Cmd_Argv()
;532:=================
;533:*/
;534:qboolean CG_ConsoleCommand( void ) {
line 538
;535:	const char	*cmd;
;536:	int		i;
;537:
;538:	cmd = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 540
;539:
;540:	for ( i = 0 ; i < ARRAY_LEN( commands ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $167
line 541
;541:		if ( !Q_stricmp( cmd, commands[i].cmd ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $171
line 542
;542:			commands[i].function();
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 543
;543:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $166
JUMPV
LABELV $171
line 545
;544:		}
;545:	}
LABELV $168
line 540
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $170
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 21
LTU4 $167
line 547
;546:
;547:	return qfalse;
CNSTI4 0
RETI4
LABELV $166
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
line 559
;548:}
;549:
;550:
;551:/*
;552:=================
;553:CG_InitConsoleCommands
;554:
;555:Let the client system know about all of our commands
;556:so it can perform tab completion
;557:=================
;558:*/
;559:void CG_InitConsoleCommands( void ) {
line 562
;560:	int		i;
;561:
;562:	for ( i = 0 ; i < ARRAY_LEN( commands ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $175
line 563
;563:		trap_AddCommand( commands[i].cmd );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 564
;564:	}
LABELV $176
line 562
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $178
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 21
LTU4 $175
line 570
;565:
;566:	//
;567:	// the game server will interpret these commands, which will be automatically
;568:	// forwarded to the server after they are not recognized locally
;569:	//
;570:	trap_AddCommand ("kill");
ADDRGP4 $179
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 571
;571:	trap_AddCommand ("say");
ADDRGP4 $180
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 572
;572:	trap_AddCommand ("say_team");
ADDRGP4 $181
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 573
;573:	trap_AddCommand ("tell");
ADDRGP4 $182
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 583
;574:#ifdef MISSIONPACK
;575:	trap_AddCommand ("vsay");
;576:	trap_AddCommand ("vsay_team");
;577:	trap_AddCommand ("vtell");
;578:	trap_AddCommand ("vtaunt");
;579:	trap_AddCommand ("vosay");
;580:	trap_AddCommand ("vosay_team");
;581:	trap_AddCommand ("votell");
;582:#endif
;583:	trap_AddCommand ("give");
ADDRGP4 $183
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 584
;584:	trap_AddCommand ("god");
ADDRGP4 $184
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 585
;585:	trap_AddCommand ("notarget");
ADDRGP4 $185
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 586
;586:	trap_AddCommand ("noclip");
ADDRGP4 $186
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 587
;587:	trap_AddCommand ("team");
ADDRGP4 $187
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 588
;588:	trap_AddCommand ("follow");
ADDRGP4 $188
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 589
;589:	trap_AddCommand ("levelshot");
ADDRGP4 $189
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 590
;590:	trap_AddCommand ("addbot");
ADDRGP4 $190
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 591
;591:	trap_AddCommand ("setviewpos");
ADDRGP4 $191
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 592
;592:	trap_AddCommand ("callvote");
ADDRGP4 $192
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 593
;593:	trap_AddCommand ("vote");
ADDRGP4 $193
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 594
;594:	trap_AddCommand ("callteamvote");
ADDRGP4 $194
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 595
;595:	trap_AddCommand ("teamvote");
ADDRGP4 $195
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 596
;596:	trap_AddCommand ("stats");
ADDRGP4 $196
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 597
;597:	trap_AddCommand ("teamtask");
ADDRGP4 $197
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 598
;598:	trap_AddCommand ("loaddefered");	// spelled wrong, but not changing for demo
ADDRGP4 $198
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 599
;599:}
LABELV $174
endproc CG_InitConsoleCommands 4 4
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
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseSysteminfo
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
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
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
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
LABELV $198
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $197
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
LABELV $196
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $195
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
LABELV $194
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
LABELV $193
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $192
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
LABELV $191
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
LABELV $190
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $189
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
LABELV $188
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $187
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $186
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $185
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
LABELV $184
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $183
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $182
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $181
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
LABELV $180
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $179
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $165
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $164
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $163
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $162
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $161
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $160
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $159
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $158
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $157
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $156
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $155
byte 1 45
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $154
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $153
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $152
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $151
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $150
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $149
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $148
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $147
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $146
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $145
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $143
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $140
byte 1 49
byte 1 0
align 1
LABELV $139
byte 1 53
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $137
byte 1 48
byte 1 0
align 1
LABELV $136
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $130
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $125
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $102
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $83
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $78
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $77
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $75
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
