data
export forceModelModificationCount
align 4
LABELV forceModelModificationCount
byte 4 -1
export enemyModelModificationCount
align 4
LABELV enemyModelModificationCount
byte 4 -1
export enemyColorsModificationCount
align 4
LABELV enemyColorsModificationCount
byte 4 -1
export teamModelModificationCount
align 4
LABELV teamModelModificationCount
byte 4 -1
export teamColorsModificationCount
align 4
LABELV teamColorsModificationCount
byte 4 -1
export intShaderTime
align 4
LABELV intShaderTime
byte 4 0
export linearLight
align 4
LABELV linearLight
byte 4 0
export vmMain
code
proc vmMain 16 12
file "../../../../code/cgame/cg_main.c"
line 43
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_main.c -- initialization and primary entry point for cgame
;4:#include "cg_local.h"
;5:
;6:#ifdef MISSIONPACK
;7:#include "../ui/ui_shared.h"
;8:// display context for new ui stuff
;9:displayContextDef_t cgDC;
;10:#endif
;11:
;12:int forceModelModificationCount = -1;
;13:int enemyModelModificationCount  = -1;
;14:int	enemyColorsModificationCount = -1;
;15:int teamModelModificationCount  = -1;
;16:int	teamColorsModificationCount = -1;
;17:
;18:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum );
;19:void CG_Shutdown( void );
;20:
;21:// extension interface
;22:qboolean intShaderTime = qfalse;
;23:qboolean linearLight = qfalse;
;24:
;25:#ifdef Q3_VM
;26:qboolean (*trap_GetValue)( char *value, int valueSize, const char *key );
;27:void (*trap_R_AddRefEntityToScene2)( const refEntity_t *re );
;28:void (*trap_R_AddLinearLightToScene)( const vec3_t start, const vec3_t end, float intensity, float r, float g, float b );
;29:#else
;30:int dll_com_trapGetValue;
;31:int dll_trap_R_AddRefEntityToScene2;
;32:int dll_trap_R_AddLinearLightToScene;
;33:#endif
;34:
;35:/*
;36:================
;37:vmMain
;38:
;39:This is the only way control passes into the module.
;40:This must be the very first function compiled into the .q3vm file
;41:================
;42:*/
;43:DLLEXPORT intptr_t vmMain( int command, int arg0, int arg1, int arg2 ) {
line 45
;44:
;45:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 8
GTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $85
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $85
address $75
address $76
address $77
address $78
address $79
address $80
address $81
address $82
address $83
code
LABELV $75
line 47
;46:	case CG_INIT:
;47:		CG_Init( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Init
CALLV
pop
line 48
;48:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $76
line 50
;49:	case CG_SHUTDOWN:
;50:		CG_Shutdown();
ADDRGP4 CG_Shutdown
CALLV
pop
line 51
;51:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $77
line 53
;52:	case CG_CONSOLE_COMMAND:
;53:		return CG_ConsoleCommand();
ADDRLP4 4
ADDRGP4 CG_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $72
JUMPV
LABELV $78
line 55
;54:	case CG_DRAW_ACTIVE_FRAME:
;55:		CG_DrawActiveFrame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawActiveFrame
CALLV
pop
line 56
;56:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $79
line 58
;57:	case CG_CROSSHAIR_PLAYER:
;58:		return CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $72
JUMPV
LABELV $80
line 60
;59:	case CG_LAST_ATTACKER:
;60:		return CG_LastAttacker();
ADDRLP4 12
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $72
JUMPV
LABELV $81
line 62
;61:	case CG_KEY_EVENT:
;62:		CG_KeyEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_KeyEvent
CALLV
pop
line 63
;63:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $82
line 69
;64:	case CG_MOUSE_EVENT:
;65:#ifdef MISSIONPACK
;66:		cgDC.cursorx = cgs.cursorX;
;67:		cgDC.cursory = cgs.cursorY;
;68:#endif
;69:		CG_MouseEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_MouseEvent
CALLV
pop
line 70
;70:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $83
line 72
;71:	case CG_EVENT_HANDLING:
;72:		CG_EventHandling(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 73
;73:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $73
line 75
;74:	default:
;75:		CG_Error( "vmMain: unknown command %i", command );
ADDRGP4 $84
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 76
;76:		break;
LABELV $74
line 78
;77:	}
;78:	return -1;
CNSTI4 -1
RETI4
LABELV $72
endproc vmMain 16 12
data
align 4
LABELV cvarTable
address cg_ignore
address $87
address $88
byte 4 0
address cg_autoswitch
address $89
address $90
byte 4 1
address cg_drawGun
address $91
address $90
byte 4 1
address cg_zoomFov
address $92
address $93
byte 4 1
address cg_fov
address $94
address $95
byte 4 1
address cg_viewsize
address $96
address $97
byte 4 1
address cg_shadows
address $98
address $90
byte 4 1
address cg_gibs
address $99
address $90
byte 4 1
address cg_draw2D
address $100
address $90
byte 4 1
address cg_drawStatus
address $101
address $90
byte 4 1
address cg_drawTimer
address $102
address $88
byte 4 1
address cg_drawFPS
address $103
address $88
byte 4 1
address cg_drawSnapshot
address $104
address $88
byte 4 1
address cg_draw3dIcons
address $105
address $90
byte 4 1
address cg_drawIcons
address $106
address $90
byte 4 1
address cg_drawAmmoWarning
address $107
address $90
byte 4 1
address cg_drawAttacker
address $108
address $90
byte 4 1
address cg_drawSpeed
address $109
address $88
byte 4 1
address cg_drawCrosshair
address $110
address $111
byte 4 1
address cg_drawCrosshairNames
address $112
address $90
byte 4 1
address cg_drawRewards
address $113
address $90
byte 4 1
address cg_drawWeaponSelect
address $114
address $90
byte 4 1
address cg_crosshairSize
address $115
address $116
byte 4 1
address cg_crosshairHealth
address $117
address $90
byte 4 1
address cg_crosshairX
address $118
address $88
byte 4 1
address cg_crosshairY
address $119
address $88
byte 4 1
address cg_brassTime
address $120
address $121
byte 4 1
address cg_simpleItems
address $122
address $88
byte 4 1
address cg_addMarks
address $123
address $90
byte 4 1
address cg_lagometer
address $124
address $90
byte 4 1
address cg_railTrailTime
address $125
address $126
byte 4 1
address cg_railTrailRadius
address $127
address $88
byte 4 1
address cg_gun_x
address $128
address $88
byte 4 1
address cg_gun_y
address $129
address $88
byte 4 1
address cg_gun_z
address $130
address $88
byte 4 1
address cg_centertime
address $131
address $132
byte 4 512
address cg_runpitch
address $133
address $134
byte 4 1
address cg_runroll
address $135
address $136
byte 4 1
address cg_bobup
address $137
address $136
byte 4 1
address cg_bobpitch
address $138
address $134
byte 4 1
address cg_bobroll
address $139
address $134
byte 4 1
address cg_swingSpeed
address $140
address $141
byte 4 512
address cg_animSpeed
address $142
address $90
byte 4 512
address cg_debugAnim
address $143
address $88
byte 4 512
address cg_debugPosition
address $144
address $88
byte 4 512
address cg_debugEvents
address $145
address $88
byte 4 512
address cg_errorDecay
address $146
address $97
byte 4 0
address cg_nopredict
address $147
address $88
byte 4 0
address cg_noPlayerAnims
address $148
address $88
byte 4 512
address cg_showmiss
address $149
address $88
byte 4 0
address cg_footsteps
address $150
address $90
byte 4 512
address cg_tracerChance
address $151
address $152
byte 4 512
address cg_tracerWidth
address $153
address $90
byte 4 512
address cg_tracerLength
address $154
address $97
byte 4 512
address cg_thirdPersonRange
address $155
address $156
byte 4 512
address cg_thirdPersonAngle
address $157
address $88
byte 4 512
address cg_thirdPerson
address $158
address $88
byte 4 0
address cg_teamChatTime
address $159
address $160
byte 4 1
address cg_teamChatHeight
address $161
address $88
byte 4 1
address cg_forceModel
address $162
address $88
byte 4 1
address cg_predictItems
address $163
address $90
byte 4 1
address cg_deferPlayers
address $164
address $90
byte 4 1
address cg_drawTeamOverlay
address $165
address $88
byte 4 1
address cg_teamOverlayUserinfo
address $166
address $88
byte 4 66
address cg_stats
address $167
address $88
byte 4 0
address cg_drawFriend
address $168
address $90
byte 4 1
address cg_teamChatsOnly
address $169
address $88
byte 4 1
address cg_buildScript
address $170
address $88
byte 4 0
address cg_paused
address $171
address $88
byte 4 64
address cg_blood
address $172
address $90
byte 4 1
address cg_cameraOrbit
address $173
address $88
byte 4 512
address cg_cameraOrbitDelay
address $174
address $175
byte 4 1
address cg_timescaleFadeEnd
address $176
address $90
byte 4 0
address cg_timescaleFadeSpeed
address $177
address $88
byte 4 0
address cg_timescale
address $178
address $90
byte 4 0
address cg_scorePlum
address $179
address $90
byte 4 3
address cg_smoothClients
address $180
address $88
byte 4 3
address cg_cameraMode
address $181
address $88
byte 4 512
address cg_noTaunt
address $182
address $88
byte 4 1
address cg_noProjectileTrail
address $183
address $88
byte 4 1
address cg_smallFont
address $184
address $185
byte 4 1
address cg_bigFont
address $186
address $152
byte 4 1
address cg_oldRail
address $187
address $90
byte 4 1
address cg_oldRocket
address $188
address $90
byte 4 1
address cg_oldPlasma
address $189
address $90
byte 4 1
address cg_trueLightning
address $190
address $191
byte 4 1
address cg_hitSounds
address $192
address $88
byte 4 1
address cg_enemyModel
address $193
address $194
byte 4 1
address cg_enemyColors
address $195
address $194
byte 4 1
address cg_teamModel
address $196
address $194
byte 4 1
address cg_teamColors
address $197
address $194
byte 4 1
address cg_deadBodyDarken
address $198
address $90
byte 4 1
address cg_fovAdjust
address $199
address $88
byte 4 1
address cg_followKiller
address $200
address $88
byte 4 1
export CG_RegisterCvars
code
proc CG_RegisterCvars 1036 16
line 341
;79:}
;80:
;81:
;82:cg_t				cg;
;83:cgs_t				cgs;
;84:centity_t			cg_entities[MAX_GENTITIES];
;85:weaponInfo_t		cg_weapons[MAX_WEAPONS];
;86:itemInfo_t			cg_items[MAX_ITEMS];
;87:
;88:
;89:vmCvar_t	cg_railTrailTime;
;90:vmCvar_t	cg_railTrailRadius;
;91:vmCvar_t	cg_centertime;
;92:vmCvar_t	cg_runpitch;
;93:vmCvar_t	cg_runroll;
;94:vmCvar_t	cg_bobup;
;95:vmCvar_t	cg_bobpitch;
;96:vmCvar_t	cg_bobroll;
;97:vmCvar_t	cg_swingSpeed;
;98:vmCvar_t	cg_shadows;
;99:vmCvar_t	cg_gibs;
;100:vmCvar_t	cg_drawTimer;
;101:vmCvar_t	cg_drawFPS;
;102:vmCvar_t	cg_drawSnapshot;
;103:vmCvar_t	cg_draw3dIcons;
;104:vmCvar_t	cg_drawIcons;
;105:vmCvar_t	cg_drawAmmoWarning;
;106:vmCvar_t	cg_drawCrosshair;
;107:vmCvar_t	cg_drawCrosshairNames;
;108:vmCvar_t	cg_drawRewards;
;109:vmCvar_t	cg_drawWeaponSelect;
;110:vmCvar_t	cg_crosshairSize;
;111:vmCvar_t	cg_crosshairX;
;112:vmCvar_t	cg_crosshairY;
;113:vmCvar_t	cg_crosshairHealth;
;114:vmCvar_t	cg_draw2D;
;115:vmCvar_t	cg_drawStatus;
;116:vmCvar_t	cg_animSpeed;
;117:vmCvar_t	cg_debugAnim;
;118:vmCvar_t	cg_debugPosition;
;119:vmCvar_t	cg_debugEvents;
;120:vmCvar_t	cg_errorDecay;
;121:vmCvar_t	cg_nopredict;
;122:vmCvar_t	cg_noPlayerAnims;
;123:vmCvar_t	cg_showmiss;
;124:vmCvar_t	cg_footsteps;
;125:vmCvar_t	cg_addMarks;
;126:vmCvar_t	cg_brassTime;
;127:vmCvar_t	cg_viewsize;
;128:vmCvar_t	cg_drawGun;
;129:vmCvar_t	cg_gun_frame;
;130:vmCvar_t	cg_gun_x;
;131:vmCvar_t	cg_gun_y;
;132:vmCvar_t	cg_gun_z;
;133:vmCvar_t	cg_tracerChance;
;134:vmCvar_t	cg_tracerWidth;
;135:vmCvar_t	cg_tracerLength;
;136:vmCvar_t	cg_autoswitch;
;137:vmCvar_t	cg_ignore;
;138:vmCvar_t	cg_simpleItems;
;139:vmCvar_t	cg_fov;
;140:vmCvar_t	cg_zoomFov;
;141:vmCvar_t	cg_thirdPerson;
;142:vmCvar_t	cg_thirdPersonRange;
;143:vmCvar_t	cg_thirdPersonAngle;
;144:vmCvar_t	cg_lagometer;
;145:vmCvar_t	cg_drawAttacker;
;146:vmCvar_t	cg_drawSpeed;
;147:vmCvar_t 	cg_teamChatTime;
;148:vmCvar_t 	cg_teamChatHeight;
;149:vmCvar_t 	cg_stats;
;150:vmCvar_t 	cg_buildScript;
;151:vmCvar_t 	cg_forceModel;
;152:vmCvar_t	cg_paused;
;153:vmCvar_t	cg_blood;
;154:vmCvar_t	cg_predictItems;
;155:vmCvar_t	cg_deferPlayers;
;156:vmCvar_t	cg_drawTeamOverlay;
;157:vmCvar_t	cg_teamOverlayUserinfo;
;158:vmCvar_t	cg_drawFriend;
;159:vmCvar_t	cg_teamChatsOnly;
;160:#ifdef MISSIONPACK
;161:vmCvar_t	cg_noVoiceChats;
;162:vmCvar_t	cg_noVoiceText;
;163:#endif
;164:vmCvar_t	cg_hudFiles;
;165:vmCvar_t 	cg_scorePlum;
;166:vmCvar_t 	cg_smoothClients;
;167:vmCvar_t	cg_cameraMode;
;168:vmCvar_t	cg_cameraOrbit;
;169:vmCvar_t	cg_cameraOrbitDelay;
;170:vmCvar_t	cg_timescaleFadeEnd;
;171:vmCvar_t	cg_timescaleFadeSpeed;
;172:vmCvar_t	cg_timescale;
;173:vmCvar_t	cg_smallFont;
;174:vmCvar_t	cg_bigFont;
;175:vmCvar_t	cg_noTaunt;
;176:vmCvar_t	cg_noProjectileTrail;
;177:vmCvar_t	cg_oldRail;
;178:vmCvar_t	cg_oldRocket;
;179:vmCvar_t	cg_oldPlasma;
;180:vmCvar_t	cg_trueLightning;
;181:
;182:#ifdef MISSIONPACK
;183:vmCvar_t 	cg_redTeamName;
;184:vmCvar_t 	cg_blueTeamName;
;185:vmCvar_t	cg_currentSelectedPlayer;
;186:vmCvar_t	cg_currentSelectedPlayerName;
;187:vmCvar_t	cg_singlePlayer;
;188:vmCvar_t	cg_enableDust;
;189:vmCvar_t	cg_enableBreath;
;190:vmCvar_t	cg_singlePlayerActive;
;191:vmCvar_t	cg_recordSPDemo;
;192:vmCvar_t	cg_recordSPDemoName;
;193:vmCvar_t	cg_obeliskRespawnDelay;
;194:#endif
;195:
;196:vmCvar_t	cg_hitSounds;
;197:
;198:vmCvar_t	cg_enemyModel;
;199:vmCvar_t	cg_enemyColors;
;200:vmCvar_t	cg_teamModel;
;201:vmCvar_t	cg_teamColors;
;202:
;203:vmCvar_t	cg_deadBodyDarken;
;204:vmCvar_t	cg_fovAdjust;
;205:vmCvar_t	cg_followKiller;
;206:
;207:typedef struct {
;208:	vmCvar_t	*vmCvar;
;209:	const char	*cvarName;
;210:	const char	*defaultString;
;211:	const int	cvarFlags;
;212:} cvarTable_t;
;213:
;214:static const cvarTable_t cvarTable[] = {
;215:	{ &cg_ignore, "cg_ignore", "0", 0 }, // used for debugging
;216:	{ &cg_autoswitch, "cg_autoswitch", "1", CVAR_ARCHIVE },
;217:	{ &cg_drawGun, "cg_drawGun", "1", CVAR_ARCHIVE },
;218:	{ &cg_zoomFov, "cg_zoomfov", "22.5", CVAR_ARCHIVE },
;219:	{ &cg_fov, "cg_fov", "90", CVAR_ARCHIVE },
;220:	{ &cg_viewsize, "cg_viewsize", "100", CVAR_ARCHIVE },
;221:	{ &cg_shadows, "cg_shadows", "1", CVAR_ARCHIVE },
;222:	{ &cg_gibs, "cg_gibs", "1", CVAR_ARCHIVE },
;223:	{ &cg_draw2D, "cg_draw2D", "1", CVAR_ARCHIVE },
;224:	{ &cg_drawStatus, "cg_drawStatus", "1", CVAR_ARCHIVE },
;225:	{ &cg_drawTimer, "cg_drawTimer", "0", CVAR_ARCHIVE },
;226:	{ &cg_drawFPS, "cg_drawFPS", "0", CVAR_ARCHIVE },
;227:	{ &cg_drawSnapshot, "cg_drawSnapshot", "0", CVAR_ARCHIVE  },
;228:	{ &cg_draw3dIcons, "cg_draw3dIcons", "1", CVAR_ARCHIVE },
;229:	{ &cg_drawIcons, "cg_drawIcons", "1", CVAR_ARCHIVE },
;230:	{ &cg_drawAmmoWarning, "cg_drawAmmoWarning", "1", CVAR_ARCHIVE },
;231:	{ &cg_drawAttacker, "cg_drawAttacker", "1", CVAR_ARCHIVE },
;232:	{ &cg_drawSpeed, "cg_drawSpeed", "0", CVAR_ARCHIVE },
;233:	{ &cg_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;234:	{ &cg_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;235:	{ &cg_drawRewards, "cg_drawRewards", "1", CVAR_ARCHIVE },
;236:	{ &cg_drawWeaponSelect, "cg_drawWeaponSelect", "1", CVAR_ARCHIVE },
;237:	{ &cg_crosshairSize, "cg_crosshairSize", "24", CVAR_ARCHIVE },
;238:	{ &cg_crosshairHealth, "cg_crosshairHealth", "1", CVAR_ARCHIVE },
;239:	{ &cg_crosshairX, "cg_crosshairX", "0", CVAR_ARCHIVE },
;240:	{ &cg_crosshairY, "cg_crosshairY", "0", CVAR_ARCHIVE },
;241:	{ &cg_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;242:	{ &cg_simpleItems, "cg_simpleItems", "0", CVAR_ARCHIVE },
;243:	{ &cg_addMarks, "cg_marks", "1", CVAR_ARCHIVE },
;244:	{ &cg_lagometer, "cg_lagometer", "1", CVAR_ARCHIVE },
;245:	{ &cg_railTrailTime, "cg_railTrailTime", "400", CVAR_ARCHIVE  },
;246:	{ &cg_railTrailRadius, "cg_railTrailRadius", "0", CVAR_ARCHIVE  },
;247:	{ &cg_gun_x, "cg_gunX", "0", CVAR_ARCHIVE },
;248:	{ &cg_gun_y, "cg_gunY", "0", CVAR_ARCHIVE },
;249:	{ &cg_gun_z, "cg_gunZ", "0", CVAR_ARCHIVE },
;250:	{ &cg_centertime, "cg_centertime", "3", CVAR_CHEAT },
;251:	{ &cg_runpitch, "cg_runpitch", "0.002", CVAR_ARCHIVE},
;252:	{ &cg_runroll, "cg_runroll", "0.005", CVAR_ARCHIVE },
;253:	{ &cg_bobup , "cg_bobup", "0.005", CVAR_ARCHIVE },
;254:	{ &cg_bobpitch, "cg_bobpitch", "0.002", CVAR_ARCHIVE },
;255:	{ &cg_bobroll, "cg_bobroll", "0.002", CVAR_ARCHIVE },
;256:	{ &cg_swingSpeed, "cg_swingSpeed", "0.3", CVAR_CHEAT },
;257:	{ &cg_animSpeed, "cg_animspeed", "1", CVAR_CHEAT },
;258:	{ &cg_debugAnim, "cg_debuganim", "0", CVAR_CHEAT },
;259:	{ &cg_debugPosition, "cg_debugposition", "0", CVAR_CHEAT },
;260:	{ &cg_debugEvents, "cg_debugevents", "0", CVAR_CHEAT },
;261:	{ &cg_errorDecay, "cg_errordecay", "100", 0 },
;262:	{ &cg_nopredict, "cg_nopredict", "0", 0 },
;263:	{ &cg_noPlayerAnims, "cg_noplayeranims", "0", CVAR_CHEAT },
;264:	{ &cg_showmiss, "cg_showmiss", "0", 0 },
;265:	{ &cg_footsteps, "cg_footsteps", "1", CVAR_CHEAT },
;266:	{ &cg_tracerChance, "cg_tracerchance", "0.4", CVAR_CHEAT },
;267:	{ &cg_tracerWidth, "cg_tracerwidth", "1", CVAR_CHEAT },
;268:	{ &cg_tracerLength, "cg_tracerlength", "100", CVAR_CHEAT },
;269:	{ &cg_thirdPersonRange, "cg_thirdPersonRange", "40", CVAR_CHEAT },
;270:	{ &cg_thirdPersonAngle, "cg_thirdPersonAngle", "0", CVAR_CHEAT },
;271:	{ &cg_thirdPerson, "cg_thirdPerson", "0", 0 },
;272:	{ &cg_teamChatTime, "cg_teamChatTime", "3000", CVAR_ARCHIVE  },
;273:	{ &cg_teamChatHeight, "cg_teamChatHeight", "0", CVAR_ARCHIVE  },
;274:	{ &cg_forceModel, "cg_forceModel", "0", CVAR_ARCHIVE  },
;275:	{ &cg_predictItems, "cg_predictItems", "1", CVAR_ARCHIVE },
;276:#ifdef MISSIONPACK
;277:	{ &cg_deferPlayers, "cg_deferPlayers", "0", CVAR_ARCHIVE },
;278:#else
;279:	{ &cg_deferPlayers, "cg_deferPlayers", "1", CVAR_ARCHIVE },
;280:#endif
;281:	{ &cg_drawTeamOverlay, "cg_drawTeamOverlay", "0", CVAR_ARCHIVE },
;282:	{ &cg_teamOverlayUserinfo, "teamoverlay", "0", CVAR_ROM | CVAR_USERINFO },
;283:	{ &cg_stats, "cg_stats", "0", 0 },
;284:	{ &cg_drawFriend, "cg_drawFriend", "1", CVAR_ARCHIVE },
;285:	{ &cg_teamChatsOnly, "cg_teamChatsOnly", "0", CVAR_ARCHIVE },
;286:#ifdef MISSIONPACK
;287:	{ &cg_noVoiceChats, "cg_noVoiceChats", "0", CVAR_ARCHIVE },
;288:	{ &cg_noVoiceText, "cg_noVoiceText", "0", CVAR_ARCHIVE },
;289:#endif
;290:	// the following variables are created in other parts of the system,
;291:	// but we also reference them here
;292:	{ &cg_buildScript, "com_buildScript", "0", 0 },	// force loading of all possible data amd error on failures
;293:	{ &cg_paused, "cl_paused", "0", CVAR_ROM },
;294:	{ &cg_blood, "com_blood", "1", CVAR_ARCHIVE },
;295:#ifdef MISSIONPACK
;296:	{ &cg_redTeamName, "g_redteam", DEFAULT_REDTEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;297:	{ &cg_blueTeamName, "g_blueteam", DEFAULT_BLUETEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;298:	{ &cg_currentSelectedPlayer, "cg_currentSelectedPlayer", "0", CVAR_ARCHIVE},
;299:	{ &cg_currentSelectedPlayerName, "cg_currentSelectedPlayerName", "", CVAR_ARCHIVE},
;300:	{ &cg_singlePlayer, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;301:	{ &cg_enableDust, "g_enableDust", "0", CVAR_SERVERINFO},
;302:	{ &cg_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO},
;303:	{ &cg_singlePlayerActive, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;304:	{ &cg_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;305:	{ &cg_recordSPDemoName, "ui_recordSPDemoName", "", CVAR_ARCHIVE},
;306:	{ &cg_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO},
;307:	{ &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;308:#endif
;309:	{ &cg_cameraOrbit, "cg_cameraOrbit", "0", CVAR_CHEAT},
;310:	{ &cg_cameraOrbitDelay, "cg_cameraOrbitDelay", "50", CVAR_ARCHIVE},
;311:	{ &cg_timescaleFadeEnd, "cg_timescaleFadeEnd", "1", 0},
;312:	{ &cg_timescaleFadeSpeed, "cg_timescaleFadeSpeed", "0", 0},
;313:	{ &cg_timescale, "timescale", "1", 0},
;314:	{ &cg_scorePlum, "cg_scorePlums", "1", CVAR_USERINFO | CVAR_ARCHIVE},
;315:	{ &cg_smoothClients, "cg_smoothClients", "0", CVAR_USERINFO | CVAR_ARCHIVE},
;316:	{ &cg_cameraMode, "com_cameraMode", "0", CVAR_CHEAT},
;317:	{ &cg_noTaunt, "cg_noTaunt", "0", CVAR_ARCHIVE},
;318:	{ &cg_noProjectileTrail, "cg_noProjectileTrail", "0", CVAR_ARCHIVE},
;319:	{ &cg_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;320:	{ &cg_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;321:	{ &cg_oldRail, "cg_oldRail", "1", CVAR_ARCHIVE},
;322:	{ &cg_oldRocket, "cg_oldRocket", "1", CVAR_ARCHIVE},
;323:	{ &cg_oldPlasma, "cg_oldPlasma", "1", CVAR_ARCHIVE},
;324:	{ &cg_trueLightning, "cg_trueLightning", "0.0", CVAR_ARCHIVE},
;325:	{ &cg_hitSounds, "cg_hitSounds", "0", CVAR_ARCHIVE},
;326:	{ &cg_enemyModel, "cg_enemyModel", "", CVAR_ARCHIVE},
;327:	{ &cg_enemyColors, "cg_enemyColors", "", CVAR_ARCHIVE},
;328:	{ &cg_teamModel, "cg_teamModel", "", CVAR_ARCHIVE},
;329:	{ &cg_teamColors, "cg_teamColors", "", CVAR_ARCHIVE},
;330:	{ &cg_deadBodyDarken, "cg_deadBodyDarken", "1", CVAR_ARCHIVE},
;331:	{ &cg_fovAdjust, "cg_fovAdjust", "0", CVAR_ARCHIVE},
;332:	{ &cg_followKiller, "cg_followKiller", "0", CVAR_ARCHIVE}
;333:};
;334:
;335:
;336:/*
;337:=================
;338:CG_RegisterCvars
;339:=================
;340:*/
;341:void CG_RegisterCvars( void ) {
line 346
;342:	int			i;
;343:	const cvarTable_t	*cv;
;344:	char		var[MAX_TOKEN_CHARS];
;345:
;346:	for ( i = 0, cv = cvarTable ; i < ARRAY_LEN( cvarTable ) ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $205
JUMPV
LABELV $202
line 347
;347:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 349
;348:			cv->defaultString, cv->cvarFlags );
;349:	}
LABELV $203
line 346
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $205
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 94
LTU4 $202
line 352
;350:
;351:	// see if we are also running the server on this machine
;352:	trap_Cvar_VariableStringBuffer( "sv_running", var, sizeof( var ) );
ADDRGP4 $206
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 353
;353:	cgs.localServer = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31476
ADDRLP4 1032
INDIRI4
ASGNI4
line 355
;354:
;355:	forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 356
;356:	enemyModelModificationCount = cg_enemyModel.modificationCount;
ADDRGP4 enemyModelModificationCount
ADDRGP4 cg_enemyModel+4
INDIRI4
ASGNI4
line 357
;357:	enemyColorsModificationCount = cg_enemyColors.modificationCount;
ADDRGP4 enemyColorsModificationCount
ADDRGP4 cg_enemyColors+4
INDIRI4
ASGNI4
line 358
;358:	teamModelModificationCount = cg_teamModel.modificationCount;
ADDRGP4 teamModelModificationCount
ADDRGP4 cg_teamModel+4
INDIRI4
ASGNI4
line 359
;359:	teamColorsModificationCount = cg_teamColors.modificationCount;
ADDRGP4 teamColorsModificationCount
ADDRGP4 cg_teamColors+4
INDIRI4
ASGNI4
line 362
;360:
;361:
;362:	trap_Cvar_Register(NULL, "model", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $213
ARGP4
ADDRGP4 $214
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 363
;363:	trap_Cvar_Register(NULL, "headmodel", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $215
ARGP4
ADDRGP4 $214
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 366
;364:	//trap_Cvar_Register(NULL, "team_model", DEFAULT_TEAM_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
;365:	//trap_Cvar_Register(NULL, "team_headmodel", DEFAULT_TEAM_HEAD, CVAR_USERINFO | CVAR_ARCHIVE );
;366:}
LABELV $201
endproc CG_RegisterCvars 1036 16
export CG_ForceModelChange
proc CG_ForceModelChange 12 4
line 374
;367:
;368:
;369:/*																																			
;370:===================
;371:CG_ForceModelChange
;372:===================
;373:*/
;374:void CG_ForceModelChange( void ) {
line 378
;375:	const char *clientInfo;
;376:	int	i;
;377:
;378:	for ( i = 0 ; i < MAX_CLIENTS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $217
line 379
;379:		clientInfo = CG_ConfigString( CS_PLAYERS + i );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 380
;380:		if ( !clientInfo[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $221
line 381
;381:			continue;
ADDRGP4 $218
JUMPV
LABELV $221
line 383
;382:		}
;383:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 384
;384:	}
LABELV $218
line 378
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $217
line 385
;385:}
LABELV $216
endproc CG_ForceModelChange 12 4
export CG_UpdateCvars
proc CG_UpdateCvars 8 8
line 393
;386:
;387:
;388:/*
;389:=================
;390:CG_UpdateCvars
;391:=================
;392:*/
;393:void CG_UpdateCvars( void ) {
line 397
;394:	int			i;
;395:	const cvarTable_t	*cv;
;396:
;397:	for ( i = 0, cv = cvarTable ; i < ARRAY_LEN( cvarTable ) ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $227
JUMPV
LABELV $224
line 398
;398:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 399
;399:	}
LABELV $225
line 397
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $227
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 94
LTU4 $224
line 405
;400:
;401:	// check for modications here
;402:
;403:	// If team overlay is on, ask for updates from the server.  If its off,
;404:	// let the server know so we don't receive it
;405:	if ( drawTeamOverlayModificationCount != cg_drawTeamOverlay.modificationCount ) {
ADDRGP4 drawTeamOverlayModificationCount
INDIRI4
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
EQI4 $228
line 406
;406:		drawTeamOverlayModificationCount = cg_drawTeamOverlay.modificationCount;
ADDRGP4 drawTeamOverlayModificationCount
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
ASGNI4
line 415
;407:#if 0
;408:		if ( cg_drawTeamOverlay.integer > 0 ) {
;409:			trap_Cvar_Set( "teamoverlay", "1" );
;410:		} else {
;411:			trap_Cvar_Set( "teamoverlay", "0" );
;412:		}
;413:#endif
;414:		// FIXME E3 HACK
;415:		trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $166
ARGP4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 416
;416:	}
LABELV $228
line 419
;417:
;418:	// if model changed
;419:	if ( forceModelModificationCount != cg_forceModel.modificationCount 
ADDRGP4 forceModelModificationCount
INDIRI4
ADDRGP4 cg_forceModel+4
INDIRI4
NEI4 $242
ADDRGP4 enemyModelModificationCount
INDIRI4
ADDRGP4 cg_enemyModel+4
INDIRI4
NEI4 $242
ADDRGP4 enemyColorsModificationCount
INDIRI4
ADDRGP4 cg_enemyColors+4
INDIRI4
NEI4 $242
ADDRGP4 teamModelModificationCount
INDIRI4
ADDRGP4 cg_teamModel+4
INDIRI4
NEI4 $242
ADDRGP4 teamColorsModificationCount
INDIRI4
ADDRGP4 cg_teamColors+4
INDIRI4
EQI4 $232
LABELV $242
line 423
;420:		|| enemyModelModificationCount != cg_enemyModel.modificationCount
;421:		|| enemyColorsModificationCount != cg_enemyColors.modificationCount
;422:		|| teamModelModificationCount != cg_teamModel.modificationCount
;423:		|| teamColorsModificationCount != cg_teamColors.modificationCount ) {
line 425
;424:
;425:		forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 426
;426:		enemyModelModificationCount = cg_enemyModel.modificationCount;
ADDRGP4 enemyModelModificationCount
ADDRGP4 cg_enemyModel+4
INDIRI4
ASGNI4
line 427
;427:		enemyColorsModificationCount = cg_enemyColors.modificationCount;
ADDRGP4 enemyColorsModificationCount
ADDRGP4 cg_enemyColors+4
INDIRI4
ASGNI4
line 428
;428:		teamModelModificationCount = cg_teamModel.modificationCount;
ADDRGP4 teamModelModificationCount
ADDRGP4 cg_teamModel+4
INDIRI4
ASGNI4
line 429
;429:		teamColorsModificationCount = cg_teamColors.modificationCount;
ADDRGP4 teamColorsModificationCount
ADDRGP4 cg_teamColors+4
INDIRI4
ASGNI4
line 431
;430:
;431:		CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 432
;432:	}
LABELV $232
line 433
;433:}
LABELV $223
endproc CG_UpdateCvars 8 8
export CG_CrosshairPlayer
proc CG_CrosshairPlayer 0 0
line 436
;434:
;435:
;436:int CG_CrosshairPlayer( void ) {
line 437
;437:	if ( cg.time > ( cg.crosshairClientTime + 1000 ) ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117540
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $249
line 438
;438:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $248
JUMPV
LABELV $249
line 440
;439:	}
;440:	return cg.crosshairClientNum;
ADDRGP4 cg+117536
INDIRI4
RETI4
LABELV $248
endproc CG_CrosshairPlayer 0 0
export CG_LastAttacker
proc CG_LastAttacker 0 0
line 443
;441:}
;442:
;443:int CG_LastAttacker( void ) {
line 444
;444:	if ( !cg.attackerTime ) {
ADDRGP4 cg+117588
INDIRI4
CNSTI4 0
NEI4 $255
line 445
;445:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $254
JUMPV
LABELV $255
line 447
;446:	}
;447:	return cg.snap->ps.persistant[PERS_ATTACKER];
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
RETI4
LABELV $254
endproc CG_LastAttacker 0 0
export CG_Printf
proc CG_Printf 1028 12
line 450
;448:}
;449:
;450:void QDECL CG_Printf( const char *msg, ... ) {
line 454
;451:	va_list		argptr;
;452:	char		text[1024];
;453:
;454:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 455
;455:	ED_vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 456
;456:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 458
;457:
;458:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 459
;459:}
LABELV $259
endproc CG_Printf 1028 12
export CG_Error
proc CG_Error 1028 12
line 461
;460:
;461:void QDECL CG_Error( const char *msg, ... ) {
line 465
;462:	va_list		argptr;
;463:	char		text[1024];
;464:
;465:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 466
;466:	ED_vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 467
;467:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 469
;468:
;469:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 470
;470:}
LABELV $261
endproc CG_Error 1028 12
export Com_Error
proc Com_Error 1028 12
line 475
;471:
;472:#ifndef CGAME_HARD_LINKED
;473:// this is only here so the functions in q_shared.c and bg_*.c can link (FIXME)
;474:
;475:void QDECL Com_Error( int level, const char *error, ... ) {
line 479
;476:	va_list		argptr;
;477:	char		text[1024];
;478:
;479:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 480
;480:	ED_vsprintf (text, error, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 481
;481:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 483
;482:
;483:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 484
;484:}
LABELV $263
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 486
;485:
;486:void QDECL Com_Printf( const char *msg, ... ) {
line 490
;487:	va_list		argptr;
;488:	char		text[1024];
;489:
;490:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 491
;491:	ED_vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 492
;492:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 494
;493:
;494:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 495
;495:}
LABELV $265
endproc Com_Printf 1028 12
bss
align 1
LABELV $268
skip 2048
data
align 4
LABELV $269
byte 4 0
export CG_Argv
code
proc CG_Argv 4 12
line 505
;496:
;497:#endif
;498:
;499:/*
;500:================
;501:CG_Argv
;502:================
;503:*/
;504:const char *CG_Argv( int arg ) 
;505:{
line 509
;506:	static char	buffer[ 2 ][ MAX_STRING_CHARS ];
;507:	static int index = 0;
;508:
;509:	index ^= 1;
ADDRLP4 0
ADDRGP4 $269
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 510
;510:	trap_Argv( arg, buffer[ index ], sizeof( buffer[ 0 ] ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $269
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 $268
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 512
;511:
;512:	return buffer[ index ];
ADDRGP4 $269
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 $268
ADDP4
RETP4
LABELV $267
endproc CG_Argv 4 12
proc CG_RegisterItemSounds 96 12
line 525
;513:}
;514:
;515:
;516://========================================================================
;517:
;518:/*
;519:=================
;520:CG_RegisterItemSounds
;521:
;522:The server says this item is used on this level
;523:=================
;524:*/
;525:static void CG_RegisterItemSounds( int itemNum ) {
line 531
;526:	gitem_t			*item;
;527:	char			data[MAX_QPATH];
;528:	const char		*s, *start;
;529:	int				len;
;530:
;531:	item = &bg_itemlist[ itemNum ];
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 533
;532:
;533:	if( item->pickup_sound ) {
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $271
line 534
;534:		trap_S_RegisterSound( item->pickup_sound, qfalse );
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 535
;535:	}
LABELV $271
line 538
;536:
;537:	// parse the space seperated precache string for other media
;538:	s = item->sounds;
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ASGNP4
line 539
;539:	if (!s || !s[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $275
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $277
LABELV $275
line 540
;540:		return;
ADDRGP4 $270
JUMPV
LABELV $276
line 542
;541:
;542:	while (*s) {
line 543
;543:		start = s;
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $280
JUMPV
LABELV $279
line 544
;544:		while (*s && *s != ' ') {
line 545
;545:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 546
;546:		}
LABELV $280
line 544
ADDRLP4 84
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $282
ADDRLP4 84
INDIRI4
CNSTI4 32
NEI4 $279
LABELV $282
line 548
;547:
;548:		len = s-start;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 549
;549:		if (len >= MAX_QPATH || len < 5) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $285
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $283
LABELV $285
line 550
;550:			CG_Error( "PrecacheItem: %s has bad precache string", 
ADDRGP4 $286
ARGP4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 552
;551:				item->classname);
;552:			return;
ADDRGP4 $270
JUMPV
LABELV $283
line 554
;553:		}
;554:		memcpy (data, start, len);
ADDRLP4 8
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 555
;555:		data[len] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 556
;556:		if ( *s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $287
line 557
;557:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 558
;558:		}
LABELV $287
line 560
;559:
;560:		if ( !strcmp(data+len-3, "wav" )) {
ADDRLP4 4
INDIRI4
ADDRLP4 8-3
ADDP4
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 92
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $289
line 561
;561:			trap_S_RegisterSound( data, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 562
;562:		}
LABELV $289
line 563
;563:	}
LABELV $277
line 542
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $276
line 564
;564:}
LABELV $270
endproc CG_RegisterItemSounds 96 12
proc CG_RegisterSounds 560 16
line 574
;565:
;566:
;567:/*
;568:=================
;569:CG_RegisterSounds
;570:
;571:called during a precache command
;572:=================
;573:*/
;574:static void CG_RegisterSounds( void ) {
line 585
;575:	int		i;
;576:	char	items[MAX_ITEMS+1];
;577:	char	name[MAX_QPATH];
;578:	const char	*soundName;
;579:
;580:	// voice commands
;581:#ifdef MISSIONPACK
;582:	CG_LoadVoiceChats();
;583:#endif
;584:
;585:	cgs.media.oneMinuteSound = trap_S_RegisterSound( "sound/feedback/1_minute.wav", qtrue );
ADDRGP4 $296
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+736
ADDRLP4 332
INDIRI4
ASGNI4
line 586
;586:	cgs.media.fiveMinuteSound = trap_S_RegisterSound( "sound/feedback/5_minute.wav", qtrue );
ADDRGP4 $299
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 336
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+740
ADDRLP4 336
INDIRI4
ASGNI4
line 587
;587:	cgs.media.suddenDeathSound = trap_S_RegisterSound( "sound/feedback/sudden_death.wav", qtrue );
ADDRGP4 $302
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+744
ADDRLP4 340
INDIRI4
ASGNI4
line 588
;588:	cgs.media.oneFragSound = trap_S_RegisterSound( "sound/feedback/1_frag.wav", qtrue );
ADDRGP4 $305
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 344
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+756
ADDRLP4 344
INDIRI4
ASGNI4
line 589
;589:	cgs.media.twoFragSound = trap_S_RegisterSound( "sound/feedback/2_frags.wav", qtrue );
ADDRGP4 $308
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 348
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+752
ADDRLP4 348
INDIRI4
ASGNI4
line 590
;590:	cgs.media.threeFragSound = trap_S_RegisterSound( "sound/feedback/3_frags.wav", qtrue );
ADDRGP4 $311
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 352
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+748
ADDRLP4 352
INDIRI4
ASGNI4
line 591
;591:	cgs.media.count3Sound = trap_S_RegisterSound( "sound/feedback/three.wav", qtrue );
ADDRGP4 $314
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+924
ADDRLP4 356
INDIRI4
ASGNI4
line 592
;592:	cgs.media.count2Sound = trap_S_RegisterSound( "sound/feedback/two.wav", qtrue );
ADDRGP4 $317
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 360
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+928
ADDRLP4 360
INDIRI4
ASGNI4
line 593
;593:	cgs.media.count1Sound = trap_S_RegisterSound( "sound/feedback/one.wav", qtrue );
ADDRGP4 $320
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 364
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+932
ADDRLP4 364
INDIRI4
ASGNI4
line 594
;594:	cgs.media.countFightSound = trap_S_RegisterSound( "sound/feedback/fight.wav", qtrue );
ADDRGP4 $323
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 368
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+936
ADDRLP4 368
INDIRI4
ASGNI4
line 595
;595:	cgs.media.countPrepareSound = trap_S_RegisterSound( "sound/feedback/prepare.wav", qtrue );
ADDRGP4 $326
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 372
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+940
ADDRLP4 372
INDIRI4
ASGNI4
line 600
;596:#ifdef MISSIONPACK
;597:	cgs.media.countPrepareTeamSound = trap_S_RegisterSound( "sound/feedback/prepare_team.wav", qtrue );
;598:#endif
;599:
;600:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $331
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $327
LABELV $331
line 602
;601:
;602:		cgs.media.captureAwardSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $334
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+840
ADDRLP4 376
INDIRI4
ASGNI4
line 603
;603:		cgs.media.redLeadsSound = trap_S_RegisterSound( "sound/feedback/redleads.wav", qtrue );
ADDRGP4 $337
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+852
ADDRLP4 380
INDIRI4
ASGNI4
line 604
;604:		cgs.media.blueLeadsSound = trap_S_RegisterSound( "sound/feedback/blueleads.wav", qtrue );
ADDRGP4 $340
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+856
ADDRLP4 384
INDIRI4
ASGNI4
line 605
;605:		cgs.media.teamsTiedSound = trap_S_RegisterSound( "sound/feedback/teamstied.wav", qtrue );
ADDRGP4 $343
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+860
ADDRLP4 388
INDIRI4
ASGNI4
line 606
;606:		cgs.media.hitTeamSound = trap_S_RegisterSound( "sound/feedback/hit_teammate.wav", qtrue );
ADDRGP4 $346
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+780
ADDRLP4 392
INDIRI4
ASGNI4
line 608
;607:
;608:		cgs.media.redScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_red_scores.wav", qtrue );
ADDRGP4 $349
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+844
ADDRLP4 396
INDIRI4
ASGNI4
line 609
;609:		cgs.media.blueScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_scores.wav", qtrue );
ADDRGP4 $352
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+848
ADDRLP4 400
INDIRI4
ASGNI4
line 611
;610:
;611:		cgs.media.captureYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $334
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+864
ADDRLP4 404
INDIRI4
ASGNI4
line 612
;612:		cgs.media.captureOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_opponent.wav", qtrue );
ADDRGP4 $357
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+868
ADDRLP4 408
INDIRI4
ASGNI4
line 614
;613:
;614:		cgs.media.returnYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_yourteam.wav", qtrue );
ADDRGP4 $360
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+872
ADDRLP4 412
INDIRI4
ASGNI4
line 615
;615:		cgs.media.returnOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $363
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+876
ADDRLP4 416
INDIRI4
ASGNI4
line 617
;616:
;617:		cgs.media.takenYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_yourteam.wav", qtrue );
ADDRGP4 $366
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+880
ADDRLP4 420
INDIRI4
ASGNI4
line 618
;618:		cgs.media.takenOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_opponent.wav", qtrue );
ADDRGP4 $369
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+884
ADDRLP4 424
INDIRI4
ASGNI4
line 620
;619:
;620:		if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $374
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $370
LABELV $374
line 621
;621:			cgs.media.redFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_red_returned.wav", qtrue );
ADDRGP4 $377
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+888
ADDRLP4 428
INDIRI4
ASGNI4
line 622
;622:			cgs.media.blueFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_returned.wav", qtrue );
ADDRGP4 $380
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+892
ADDRLP4 432
INDIRI4
ASGNI4
line 623
;623:			cgs.media.enemyTookYourFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_flag.wav", qtrue );
ADDRGP4 $383
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+896
ADDRLP4 436
INDIRI4
ASGNI4
line 624
;624:			cgs.media.yourTeamTookEnemyFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_flag.wav", qtrue );
ADDRGP4 $386
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+904
ADDRLP4 440
INDIRI4
ASGNI4
line 625
;625:		}
LABELV $370
line 645
;626:
;627:#ifdef MISSIONPACK
;628:		if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;629:			// FIXME: get a replacement for this sound ?
;630:			cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
;631:			cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.wav", qtrue );
;632:			cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
;633:		}
;634:
;635:		if ( cgs.gametype == GT_1FCTF || cgs.gametype == GT_CTF || cg_buildScript.integer ) {
;636:			cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.wav", qtrue );
;637:			cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
;638:		}
;639:
;640:		if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;641:			cgs.media.yourBaseIsUnderAttackSound = trap_S_RegisterSound( "sound/teamplay/voc_base_attack.wav", qtrue );
;642:		}
;643:		cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
;644:#else
;645:		cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.wav", qtrue );
ADDRGP4 $389
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+912
ADDRLP4 428
INDIRI4
ASGNI4
line 646
;646:		cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
ADDRGP4 $392
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+920
ADDRLP4 432
INDIRI4
ASGNI4
line 647
;647:		cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.wav", qtrue );
ADDRGP4 $395
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+908
ADDRLP4 436
INDIRI4
ASGNI4
line 648
;648:		cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
ADDRGP4 $398
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+900
ADDRLP4 440
INDIRI4
ASGNI4
line 650
;649:#endif
;650:	}
LABELV $327
line 652
;651:
;652:	cgs.media.tracerSound = trap_S_RegisterSound( "sound/weapons/machinegun/buletby1.wav", qfalse );
ADDRGP4 $401
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+528
ADDRLP4 376
INDIRI4
ASGNI4
line 653
;653:	cgs.media.selectSound = trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );
ADDRGP4 $404
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+532
ADDRLP4 380
INDIRI4
ASGNI4
line 654
;654:	cgs.media.wearOffSound = trap_S_RegisterSound( "sound/items/wearoff.wav", qfalse );
ADDRGP4 $407
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+540
ADDRLP4 384
INDIRI4
ASGNI4
line 655
;655:	cgs.media.useNothingSound = trap_S_RegisterSound( "sound/items/use_nothing.wav", qfalse );
ADDRGP4 $410
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+536
ADDRLP4 388
INDIRI4
ASGNI4
line 656
;656:	cgs.media.gibSound = trap_S_RegisterSound( "sound/player/gibsplt1.wav", qfalse );
ADDRGP4 $413
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+692
ADDRLP4 392
INDIRI4
ASGNI4
line 657
;657:	cgs.media.gibBounce1Sound = trap_S_RegisterSound( "sound/player/gibimp1.wav", qfalse );
ADDRGP4 $416
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+696
ADDRLP4 396
INDIRI4
ASGNI4
line 658
;658:	cgs.media.gibBounce2Sound = trap_S_RegisterSound( "sound/player/gibimp2.wav", qfalse );
ADDRGP4 $419
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+700
ADDRLP4 400
INDIRI4
ASGNI4
line 659
;659:	cgs.media.gibBounce3Sound = trap_S_RegisterSound( "sound/player/gibimp3.wav", qfalse );
ADDRGP4 $422
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+704
ADDRLP4 404
INDIRI4
ASGNI4
line 678
;660:
;661:#ifdef MISSIONPACK
;662:	cgs.media.useInvulnerabilitySound = trap_S_RegisterSound( "sound/items/invul_activate.wav", qfalse );
;663:	cgs.media.invulnerabilityImpactSound1 = trap_S_RegisterSound( "sound/items/invul_impact_01.wav", qfalse );
;664:	cgs.media.invulnerabilityImpactSound2 = trap_S_RegisterSound( "sound/items/invul_impact_02.wav", qfalse );
;665:	cgs.media.invulnerabilityImpactSound3 = trap_S_RegisterSound( "sound/items/invul_impact_03.wav", qfalse );
;666:	cgs.media.invulnerabilityJuicedSound = trap_S_RegisterSound( "sound/items/invul_juiced.wav", qfalse );
;667:	cgs.media.obeliskHitSound1 = trap_S_RegisterSound( "sound/items/obelisk_hit_01.wav", qfalse );
;668:	cgs.media.obeliskHitSound2 = trap_S_RegisterSound( "sound/items/obelisk_hit_02.wav", qfalse );
;669:	cgs.media.obeliskHitSound3 = trap_S_RegisterSound( "sound/items/obelisk_hit_03.wav", qfalse );
;670:	cgs.media.obeliskRespawnSound = trap_S_RegisterSound( "sound/items/obelisk_respawn.wav", qfalse );
;671:
;672:	cgs.media.ammoregenSound = trap_S_RegisterSound("sound/items/cl_ammoregen.wav", qfalse);
;673:	cgs.media.doublerSound = trap_S_RegisterSound("sound/items/cl_doubler.wav", qfalse);
;674:	cgs.media.guardSound = trap_S_RegisterSound("sound/items/cl_guard.wav", qfalse);
;675:	cgs.media.scoutSound = trap_S_RegisterSound("sound/items/cl_scout.wav", qfalse);
;676:#endif
;677:
;678:	cgs.media.teleInSound = trap_S_RegisterSound( "sound/world/telein.wav", qfalse );
ADDRGP4 $425
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+708
ADDRLP4 408
INDIRI4
ASGNI4
line 679
;679:	cgs.media.teleOutSound = trap_S_RegisterSound( "sound/world/teleout.wav", qfalse );
ADDRGP4 $428
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+712
ADDRLP4 412
INDIRI4
ASGNI4
line 680
;680:	cgs.media.respawnSound = trap_S_RegisterSound( "sound/items/respawn1.wav", qfalse );
ADDRGP4 $431
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+720
ADDRLP4 416
INDIRI4
ASGNI4
line 682
;681:
;682:	cgs.media.noAmmoSound = trap_S_RegisterSound( "sound/weapons/noammo.wav", qfalse );
ADDRGP4 $434
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+716
ADDRLP4 420
INDIRI4
ASGNI4
line 684
;683:
;684:	cgs.media.talkSound = trap_S_RegisterSound( "sound/player/talk.wav", qfalse );
ADDRGP4 $437
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+724
ADDRLP4 424
INDIRI4
ASGNI4
line 685
;685:	cgs.media.landSound = trap_S_RegisterSound( "sound/player/land1.wav", qfalse);
ADDRGP4 $440
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+728
ADDRLP4 428
INDIRI4
ASGNI4
line 687
;686:
;687:	cgs.media.hitSounds[0] = trap_S_RegisterSound( "sound/feedback/hit25.wav", qfalse );
ADDRGP4 $443
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+764
ADDRLP4 432
INDIRI4
ASGNI4
line 688
;688:	cgs.media.hitSounds[1] = trap_S_RegisterSound( "sound/feedback/hit50.wav", qfalse );
ADDRGP4 $447
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+764+4
ADDRLP4 436
INDIRI4
ASGNI4
line 689
;689:	cgs.media.hitSounds[2] = trap_S_RegisterSound( "sound/feedback/hit75.wav", qfalse );
ADDRGP4 $451
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+764+8
ADDRLP4 440
INDIRI4
ASGNI4
line 690
;690:	cgs.media.hitSounds[3] = trap_S_RegisterSound( "sound/feedback/hit100.wav", qfalse );
ADDRGP4 $455
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+764+12
ADDRLP4 444
INDIRI4
ASGNI4
line 692
;691:
;692:	cgs.media.hitSound = trap_S_RegisterSound( "sound/feedback/hit.wav", qfalse );
ADDRGP4 $458
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 448
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+760
ADDRLP4 448
INDIRI4
ASGNI4
line 699
;693:
;694:#ifdef MISSIONPACK
;695:	cgs.media.hitSoundHighArmor = trap_S_RegisterSound( "sound/feedback/hithi.wav", qfalse );
;696:	cgs.media.hitSoundLowArmor = trap_S_RegisterSound( "sound/feedback/hitlo.wav", qfalse );
;697:#endif
;698:
;699:	cgs.media.impressiveSound = trap_S_RegisterSound( "sound/feedback/impressive.wav", qtrue );
ADDRGP4 $461
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 452
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+784
ADDRLP4 452
INDIRI4
ASGNI4
line 700
;700:	cgs.media.excellentSound = trap_S_RegisterSound( "sound/feedback/excellent.wav", qtrue );
ADDRGP4 $464
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 456
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+788
ADDRLP4 456
INDIRI4
ASGNI4
line 701
;701:	cgs.media.deniedSound = trap_S_RegisterSound( "sound/feedback/denied.wav", qtrue );
ADDRGP4 $467
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 460
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+792
ADDRLP4 460
INDIRI4
ASGNI4
line 702
;702:	cgs.media.humiliationSound = trap_S_RegisterSound( "sound/feedback/humiliation.wav", qtrue );
ADDRGP4 $470
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 464
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+796
ADDRLP4 464
INDIRI4
ASGNI4
line 703
;703:	cgs.media.assistSound = trap_S_RegisterSound( "sound/feedback/assist.wav", qtrue );
ADDRGP4 $473
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 468
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+800
ADDRLP4 468
INDIRI4
ASGNI4
line 704
;704:	cgs.media.defendSound = trap_S_RegisterSound( "sound/feedback/defense.wav", qtrue );
ADDRGP4 $476
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 472
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+804
ADDRLP4 472
INDIRI4
ASGNI4
line 711
;705:#ifdef MISSIONPACK
;706:	cgs.media.firstImpressiveSound = trap_S_RegisterSound( "sound/feedback/first_impressive.wav", qtrue );
;707:	cgs.media.firstExcellentSound = trap_S_RegisterSound( "sound/feedback/first_excellent.wav", qtrue );
;708:	cgs.media.firstHumiliationSound = trap_S_RegisterSound( "sound/feedback/first_gauntlet.wav", qtrue );
;709:#endif
;710:
;711:	cgs.media.takenLeadSound = trap_S_RegisterSound( "sound/feedback/takenlead.wav", qtrue);
ADDRGP4 $479
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 476
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+808
ADDRLP4 476
INDIRI4
ASGNI4
line 712
;712:	cgs.media.tiedLeadSound = trap_S_RegisterSound( "sound/feedback/tiedlead.wav", qtrue);
ADDRGP4 $482
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 480
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+812
ADDRLP4 480
INDIRI4
ASGNI4
line 713
;713:	cgs.media.lostLeadSound = trap_S_RegisterSound( "sound/feedback/lostlead.wav", qtrue);
ADDRGP4 $485
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 484
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+816
ADDRLP4 484
INDIRI4
ASGNI4
line 721
;714:
;715:#ifdef MISSIONPACK
;716:	cgs.media.voteNow = trap_S_RegisterSound( "sound/feedback/vote_now.wav", qtrue);
;717:	cgs.media.votePassed = trap_S_RegisterSound( "sound/feedback/vote_passed.wav", qtrue);
;718:	cgs.media.voteFailed = trap_S_RegisterSound( "sound/feedback/vote_failed.wav", qtrue);
;719:#endif
;720:
;721:	cgs.media.watrInSound = trap_S_RegisterSound( "sound/player/watr_in.wav", qfalse);
ADDRGP4 $488
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 488
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+820
ADDRLP4 488
INDIRI4
ASGNI4
line 722
;722:	cgs.media.watrOutSound = trap_S_RegisterSound( "sound/player/watr_out.wav", qfalse);
ADDRGP4 $491
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 492
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+824
ADDRLP4 492
INDIRI4
ASGNI4
line 723
;723:	cgs.media.watrUnSound = trap_S_RegisterSound( "sound/player/watr_un.wav", qfalse);
ADDRGP4 $494
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 496
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+828
ADDRLP4 496
INDIRI4
ASGNI4
line 725
;724:
;725:	cgs.media.jumpPadSound = trap_S_RegisterSound ("sound/world/jumppad.wav", qfalse );
ADDRGP4 $497
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 500
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+732
ADDRLP4 500
INDIRI4
ASGNI4
line 727
;726:
;727:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $498
line 728
;728:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/step%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $502
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 729
;729:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 504
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+544
ADDP4
ADDRLP4 504
INDIRI4
ASGNI4
line 731
;730:
;731:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/boot%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $505
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 732
;732:		cgs.media.footsteps[FOOTSTEP_BOOT][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+544+16
ADDP4
ADDRLP4 508
INDIRI4
ASGNI4
line 734
;733:
;734:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/flesh%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $509
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 735
;735:		cgs.media.footsteps[FOOTSTEP_FLESH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+544+32
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 737
;736:
;737:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/mech%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $513
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 738
;738:		cgs.media.footsteps[FOOTSTEP_MECH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+544+48
ADDP4
ADDRLP4 516
INDIRI4
ASGNI4
line 740
;739:
;740:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/energy%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $517
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 741
;741:		cgs.media.footsteps[FOOTSTEP_ENERGY][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+544+64
ADDP4
ADDRLP4 520
INDIRI4
ASGNI4
line 743
;742:
;743:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/splash%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $521
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 744
;744:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+544+96
ADDP4
ADDRLP4 524
INDIRI4
ASGNI4
line 746
;745:
;746:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/clank%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $525
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 747
;747:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+544+80
ADDP4
ADDRLP4 528
INDIRI4
ASGNI4
line 748
;748:	}
LABELV $499
line 727
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $498
line 751
;749:
;750:	// only register the items that the server says we need
;751:	Q_strncpyz(items, CG_ConfigString(CS_ITEMS), sizeof(items));
CNSTI4 27
ARGI4
ADDRLP4 504
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 504
INDIRP4
ARGP4
CNSTI4 257
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 753
;752:
;753:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $532
JUMPV
LABELV $529
line 755
;754://		if ( items[ i ] == '1' || cg_buildScript.integer ) {
;755:			CG_RegisterItemSounds( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 757
;756://		}
;757:	}
LABELV $530
line 753
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $532
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $529
line 759
;758:
;759:	for ( i = 1 ; i < MAX_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $533
line 760
;760:		soundName = CG_ConfigString( CS_SOUNDS+i );
ADDRLP4 0
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 508
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 508
INDIRP4
ASGNP4
line 761
;761:		if ( !soundName[0] ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $537
line 762
;762:			break;
ADDRGP4 $535
JUMPV
LABELV $537
line 764
;763:		}
;764:		if ( soundName[0] == '*' ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $539
line 765
;765:			continue;	// custom sound
ADDRGP4 $534
JUMPV
LABELV $539
line 767
;766:		}
;767:		cgs.gameSounds[i] = trap_S_RegisterSound( soundName, qfalse );
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 768
;768:	}
LABELV $534
line 759
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $533
LABELV $535
line 771
;769:
;770:	// FIXME: only needed with item
;771:	cgs.media.flightSound = trap_S_RegisterSound( "sound/items/flight.wav", qfalse );
ADDRGP4 $544
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+832
ADDRLP4 508
INDIRI4
ASGNI4
line 772
;772:	cgs.media.medkitSound = trap_S_RegisterSound ("sound/items/use_medkit.wav", qfalse);
ADDRGP4 $547
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+836
ADDRLP4 512
INDIRI4
ASGNI4
line 773
;773:	cgs.media.quadSound = trap_S_RegisterSound("sound/items/damage3.wav", qfalse);
ADDRGP4 $550
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+524
ADDRLP4 516
INDIRI4
ASGNI4
line 774
;774:	cgs.media.sfx_ric1 = trap_S_RegisterSound ("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $553
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+668
ADDRLP4 520
INDIRI4
ASGNI4
line 775
;775:	cgs.media.sfx_ric2 = trap_S_RegisterSound ("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $556
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+672
ADDRLP4 524
INDIRI4
ASGNI4
line 776
;776:	cgs.media.sfx_ric3 = trap_S_RegisterSound ("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $559
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+676
ADDRLP4 528
INDIRI4
ASGNI4
line 778
;777:	//cgs.media.sfx_railg = trap_S_RegisterSound ("sound/weapons/railgun/railgf1a.wav", qfalse);
;778:	cgs.media.sfx_rockexp = trap_S_RegisterSound ("sound/weapons/rocket/rocklx1a.wav", qfalse);
ADDRGP4 $562
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 532
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+684
ADDRLP4 532
INDIRI4
ASGNI4
line 779
;779:	cgs.media.sfx_plasmaexp = trap_S_RegisterSound ("sound/weapons/plasma/plasmx1a.wav", qfalse);
ADDRGP4 $565
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 536
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+688
ADDRLP4 536
INDIRI4
ASGNI4
line 801
;780:#ifdef MISSIONPACK
;781:	cgs.media.sfx_proxexp = trap_S_RegisterSound( "sound/weapons/proxmine/wstbexpl.wav" , qfalse);
;782:	cgs.media.sfx_nghit = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpd.wav" , qfalse);
;783:	cgs.media.sfx_nghitflesh = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpl.wav" , qfalse);
;784:	cgs.media.sfx_nghitmetal = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpm.wav", qfalse );
;785:	cgs.media.sfx_chghit = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpd.wav", qfalse );
;786:	cgs.media.sfx_chghitflesh = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpl.wav", qfalse );
;787:	cgs.media.sfx_chghitmetal = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpm.wav", qfalse );
;788:	cgs.media.weaponHoverSound = trap_S_RegisterSound( "sound/weapons/weapon_hover.wav", qfalse );
;789:	cgs.media.kamikazeExplodeSound = trap_S_RegisterSound( "sound/items/kam_explode.wav", qfalse );
;790:	cgs.media.kamikazeImplodeSound = trap_S_RegisterSound( "sound/items/kam_implode.wav", qfalse );
;791:	cgs.media.kamikazeFarSound = trap_S_RegisterSound( "sound/items/kam_explode_far.wav", qfalse );
;792:	cgs.media.winnerSound = trap_S_RegisterSound( "sound/feedback/voc_youwin.wav", qfalse );
;793:	cgs.media.loserSound = trap_S_RegisterSound( "sound/feedback/voc_youlose.wav", qfalse );
;794:
;795:	cgs.media.wstbimplSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpl.wav", qfalse);
;796:	cgs.media.wstbimpmSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpm.wav", qfalse);
;797:	cgs.media.wstbimpdSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpd.wav", qfalse);
;798:	cgs.media.wstbactvSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbactv.wav", qfalse);
;799:#endif
;800:
;801:	cgs.media.regenSound = trap_S_RegisterSound("sound/items/regen.wav", qfalse);
ADDRGP4 $568
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 540
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+948
ADDRLP4 540
INDIRI4
ASGNI4
line 802
;802:	cgs.media.protectSound = trap_S_RegisterSound("sound/items/protect3.wav", qfalse);
ADDRGP4 $571
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 544
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+952
ADDRLP4 544
INDIRI4
ASGNI4
line 803
;803:	cgs.media.n_healthSound = trap_S_RegisterSound("sound/items/n_health.wav", qfalse );
ADDRGP4 $574
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 548
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+956
ADDRLP4 548
INDIRI4
ASGNI4
line 804
;804:	cgs.media.hgrenb1aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb1a.wav", qfalse);
ADDRGP4 $577
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 552
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+960
ADDRLP4 552
INDIRI4
ASGNI4
line 805
;805:	cgs.media.hgrenb2aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb2a.wav", qfalse);
ADDRGP4 $580
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 556
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+964
ADDRLP4 556
INDIRI4
ASGNI4
line 835
;806:
;807:#ifdef MISSIONPACK
;808:	trap_S_RegisterSound("sound/player/james/death1.wav", qfalse );
;809:	trap_S_RegisterSound("sound/player/james/death2.wav", qfalse );
;810:	trap_S_RegisterSound("sound/player/james/death3.wav", qfalse );
;811:	trap_S_RegisterSound("sound/player/james/jump1.wav", qfalse );
;812:	trap_S_RegisterSound("sound/player/james/pain25_1.wav", qfalse );
;813:	trap_S_RegisterSound("sound/player/james/pain75_1.wav", qfalse );
;814:	trap_S_RegisterSound("sound/player/james/pain100_1.wav", qfalse );
;815:	trap_S_RegisterSound("sound/player/james/falling1.wav", qfalse );
;816:	trap_S_RegisterSound("sound/player/james/gasp.wav", qfalse );
;817:	trap_S_RegisterSound("sound/player/james/drown.wav", qfalse );
;818:	trap_S_RegisterSound("sound/player/james/fall1.wav", qfalse );
;819:	trap_S_RegisterSound("sound/player/james/taunt.wav", qfalse );
;820:
;821:	trap_S_RegisterSound("sound/player/janet/death1.wav", qfalse );
;822:	trap_S_RegisterSound("sound/player/janet/death2.wav", qfalse );
;823:	trap_S_RegisterSound("sound/player/janet/death3.wav", qfalse );
;824:	trap_S_RegisterSound("sound/player/janet/jump1.wav", qfalse );
;825:	trap_S_RegisterSound("sound/player/janet/pain25_1.wav", qfalse );
;826:	trap_S_RegisterSound("sound/player/janet/pain75_1.wav", qfalse );
;827:	trap_S_RegisterSound("sound/player/janet/pain100_1.wav", qfalse );
;828:	trap_S_RegisterSound("sound/player/janet/falling1.wav", qfalse );
;829:	trap_S_RegisterSound("sound/player/janet/gasp.wav", qfalse );
;830:	trap_S_RegisterSound("sound/player/janet/drown.wav", qfalse );
;831:	trap_S_RegisterSound("sound/player/janet/fall1.wav", qfalse );
;832:	trap_S_RegisterSound("sound/player/janet/taunt.wav", qfalse );
;833:#endif
;834:
;835:}
LABELV $293
endproc CG_RegisterSounds 560 16
data
align 4
LABELV $582
address $583
address $584
address $585
address $586
address $587
address $588
address $589
address $590
address $591
address $592
address $593
code
proc CG_RegisterGraphics 588 16
line 848
;836:
;837:
;838://===================================================================================
;839:
;840:
;841:/*
;842:=================
;843:CG_RegisterGraphics
;844:
;845:This function may execute for a couple of minutes with a slow disk.
;846:=================
;847:*/
;848:static void CG_RegisterGraphics( void ) {
line 866
;849:	int			i;
;850:	char		items[MAX_ITEMS+1];
;851:	static char		*sb_nums[11] = {
;852:		"gfx/2d/numbers/zero_32b",
;853:		"gfx/2d/numbers/one_32b",
;854:		"gfx/2d/numbers/two_32b",
;855:		"gfx/2d/numbers/three_32b",
;856:		"gfx/2d/numbers/four_32b",
;857:		"gfx/2d/numbers/five_32b",
;858:		"gfx/2d/numbers/six_32b",
;859:		"gfx/2d/numbers/seven_32b",
;860:		"gfx/2d/numbers/eight_32b",
;861:		"gfx/2d/numbers/nine_32b",
;862:		"gfx/2d/numbers/minus_32b",
;863:	};
;864:
;865:	// clear any references to old media
;866:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+109056
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 867
;867:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 869
;868:
;869:	CG_LoadingString( cgs.mapname );
ADDRGP4 cgs+31508
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 871
;870:
;871:	trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+31508
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 874
;872:
;873:	// precache status bar pics
;874:	CG_LoadingString( "game media" );
ADDRGP4 $598
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 876
;875:
;876:	for ( i = 0 ; i < ARRAY_LEN( sb_nums ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $602
JUMPV
LABELV $599
line 877
;877:		cgs.media.numberShaders[i] = trap_R_RegisterShader( sb_nums[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $582
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+300
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 878
;878:	}
LABELV $600
line 876
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $602
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 11
LTU4 $599
line 880
;879:
;880:	cgs.media.botSkillShaders[0] = trap_R_RegisterShader( "menu/art/skill1.tga" );
ADDRGP4 $607
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348
ADDRLP4 264
INDIRI4
ASGNI4
line 881
;881:	cgs.media.botSkillShaders[1] = trap_R_RegisterShader( "menu/art/skill2.tga" );
ADDRGP4 $611
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348+4
ADDRLP4 268
INDIRI4
ASGNI4
line 882
;882:	cgs.media.botSkillShaders[2] = trap_R_RegisterShader( "menu/art/skill3.tga" );
ADDRGP4 $615
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348+8
ADDRLP4 272
INDIRI4
ASGNI4
line 883
;883:	cgs.media.botSkillShaders[3] = trap_R_RegisterShader( "menu/art/skill4.tga" );
ADDRGP4 $619
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348+12
ADDRLP4 276
INDIRI4
ASGNI4
line 884
;884:	cgs.media.botSkillShaders[4] = trap_R_RegisterShader( "menu/art/skill5.tga" );
ADDRGP4 $623
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348+16
ADDRLP4 280
INDIRI4
ASGNI4
line 886
;885:
;886:	cgs.media.viewBloodShader = trap_R_RegisterShader( "viewBloodBlend" );
ADDRGP4 $626
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+216
ADDRLP4 284
INDIRI4
ASGNI4
line 888
;887:
;888:	cgs.media.deferShader = trap_R_RegisterShaderNoMip( "gfx/2d/defer.tga" );
ADDRGP4 $629
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+132
ADDRLP4 288
INDIRI4
ASGNI4
line 890
;889:
;890:	cgs.media.scoreboardName = trap_R_RegisterShaderNoMip( "menu/tab/name.tga" );
ADDRGP4 $632
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+484
ADDRLP4 292
INDIRI4
ASGNI4
line 891
;891:	cgs.media.scoreboardPing = trap_R_RegisterShaderNoMip( "menu/tab/ping.tga" );
ADDRGP4 $635
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+488
ADDRLP4 296
INDIRI4
ASGNI4
line 892
;892:	cgs.media.scoreboardScore = trap_R_RegisterShaderNoMip( "menu/tab/score.tga" );
ADDRGP4 $638
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+492
ADDRLP4 300
INDIRI4
ASGNI4
line 893
;893:	cgs.media.scoreboardTime = trap_R_RegisterShaderNoMip( "menu/tab/time.tga" );
ADDRGP4 $641
ARGP4
ADDRLP4 304
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+496
ADDRLP4 304
INDIRI4
ASGNI4
line 895
;894:
;895:	cgs.media.smokePuffShader = trap_R_RegisterShader( "smokePuff" );
ADDRGP4 $644
ARGP4
ADDRLP4 308
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+276
ADDRLP4 308
INDIRI4
ASGNI4
line 896
;896:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader( "smokePuffRagePro" );
ADDRGP4 $647
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+280
ADDRLP4 312
INDIRI4
ASGNI4
line 897
;897:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader( "shotgunSmokePuff" );
ADDRGP4 $650
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+284
ADDRLP4 316
INDIRI4
ASGNI4
line 902
;898:#ifdef MISSIONPACK
;899:	cgs.media.nailPuffShader = trap_R_RegisterShader( "nailtrail" );
;900:	cgs.media.blueProxMine = trap_R_RegisterModel( "models/weaphits/proxmineb.md3" );
;901:#endif
;902:	cgs.media.plasmaBallShader = trap_R_RegisterShader( "sprites/plasma1" );
ADDRGP4 $653
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+288
ADDRLP4 320
INDIRI4
ASGNI4
line 903
;903:	cgs.media.bloodTrailShader = trap_R_RegisterShader( "bloodTrail" );
ADDRGP4 $656
ARGP4
ADDRLP4 324
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+296
ADDRLP4 324
INDIRI4
ASGNI4
line 904
;904:	cgs.media.lagometerShader = trap_R_RegisterShader("lagometer" );
ADDRGP4 $659
ARGP4
ADDRLP4 328
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+264
ADDRLP4 328
INDIRI4
ASGNI4
line 905
;905:	cgs.media.connectionShader = trap_R_RegisterShader( "disconnected" );
ADDRGP4 $662
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+208
ADDRLP4 332
INDIRI4
ASGNI4
line 907
;906:
;907:	cgs.media.waterBubbleShader = trap_R_RegisterShader( "waterBubble" );
ADDRGP4 $665
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+292
ADDRLP4 336
INDIRI4
ASGNI4
line 909
;908:
;909:	cgs.media.tracerShader = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $668
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+220
ADDRLP4 340
INDIRI4
ASGNI4
line 910
;910:	cgs.media.selectShader = trap_R_RegisterShader( "gfx/2d/select" );
ADDRGP4 $671
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+212
ADDRLP4 344
INDIRI4
ASGNI4
line 912
;911:
;912:	for ( i = 0 ; i < NUM_CROSSHAIRS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $672
line 913
;913:		cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%c", 'a'+i) );
ADDRGP4 $678
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+224
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 914
;914:	}
LABELV $673
line 912
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $672
line 916
;915:
;916:	cgs.media.backTileShader = trap_R_RegisterShader( "gfx/2d/backtile" );
ADDRGP4 $681
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+268
ADDRLP4 348
INDIRI4
ASGNI4
line 917
;917:	cgs.media.noammoShader = trap_R_RegisterShader( "icons/noammo" );
ADDRGP4 $684
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+272
ADDRLP4 352
INDIRI4
ASGNI4
line 920
;918:
;919:	// powerup shaders
;920:	cgs.media.quadShader = trap_R_RegisterShader("powerups/quad" );
ADDRGP4 $687
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+400
ADDRLP4 356
INDIRI4
ASGNI4
line 921
;921:	cgs.media.quadWeaponShader = trap_R_RegisterShader("powerups/quadWeapon" );
ADDRGP4 $690
ARGP4
ADDRLP4 360
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+408
ADDRLP4 360
INDIRI4
ASGNI4
line 922
;922:	cgs.media.battleSuitShader = trap_R_RegisterShader("powerups/battleSuit" );
ADDRGP4 $693
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+420
ADDRLP4 364
INDIRI4
ASGNI4
line 923
;923:	cgs.media.battleWeaponShader = trap_R_RegisterShader("powerups/battleWeapon" );
ADDRGP4 $696
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+424
ADDRLP4 368
INDIRI4
ASGNI4
line 924
;924:	cgs.media.invisShader = trap_R_RegisterShader("powerups/invisibility" );
ADDRGP4 $699
ARGP4
ADDRLP4 372
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+412
ADDRLP4 372
INDIRI4
ASGNI4
line 925
;925:	cgs.media.regenShader = trap_R_RegisterShader("powerups/regen" );
ADDRGP4 $702
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+416
ADDRLP4 376
INDIRI4
ASGNI4
line 926
;926:	cgs.media.hastePuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $705
ARGP4
ADDRLP4 380
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+428
ADDRLP4 380
INDIRI4
ASGNI4
line 928
;927://freeze
;928:	cgs.media.freezeShader = trap_R_RegisterShader( "freezeShader" );
ADDRGP4 $708
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+392
ADDRLP4 384
INDIRI4
ASGNI4
line 929
;929:	cgs.media.freezeMarkShader = trap_R_RegisterShader( "freezeMarkShader" );
ADDRGP4 $711
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+396
ADDRLP4 388
INDIRI4
ASGNI4
line 935
;930://freeze
;931:
;932:#ifdef MISSIONPACK
;933:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;934:#else
;935:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $716
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $712
LABELV $716
line 937
;936:#endif
;937:		cgs.media.redCubeModel = trap_R_RegisterModel( "models/powerups/orb/r_orb.md3" );
ADDRGP4 $719
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+20
ADDRLP4 392
INDIRI4
ASGNI4
line 938
;938:		cgs.media.blueCubeModel = trap_R_RegisterModel( "models/powerups/orb/b_orb.md3" );
ADDRGP4 $722
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+24
ADDRLP4 396
INDIRI4
ASGNI4
line 939
;939:		cgs.media.redCubeIcon = trap_R_RegisterShader( "icons/skull_red" );
ADDRGP4 $725
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+28
ADDRLP4 400
INDIRI4
ASGNI4
line 940
;940:		cgs.media.blueCubeIcon = trap_R_RegisterShader( "icons/skull_blue" );
ADDRGP4 $728
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+32
ADDRLP4 404
INDIRI4
ASGNI4
line 941
;941:	}
LABELV $712
line 946
;942:
;943:#ifdef MISSIONPACK
;944:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;945:#else
;946:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $733
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $729
LABELV $733
line 948
;947:#endif
;948:		cgs.media.redFlagModel = trap_R_RegisterModel( "models/flags/r_flag.md3" );
ADDRGP4 $736
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+36
ADDRLP4 392
INDIRI4
ASGNI4
line 949
;949:		cgs.media.blueFlagModel = trap_R_RegisterModel( "models/flags/b_flag.md3" );
ADDRGP4 $739
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+40
ADDRLP4 396
INDIRI4
ASGNI4
line 950
;950:		cgs.media.redFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_red1" );
ADDRGP4 $742
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+48
ADDRLP4 400
INDIRI4
ASGNI4
line 951
;951:		cgs.media.redFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $746
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+48+4
ADDRLP4 404
INDIRI4
ASGNI4
line 952
;952:		cgs.media.redFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_red3" );
ADDRGP4 $750
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+48+8
ADDRLP4 408
INDIRI4
ASGNI4
line 953
;953:		cgs.media.blueFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_blu1" );
ADDRGP4 $753
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+60
ADDRLP4 412
INDIRI4
ASGNI4
line 954
;954:		cgs.media.blueFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $757
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+60+4
ADDRLP4 416
INDIRI4
ASGNI4
line 955
;955:		cgs.media.blueFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu3" );
ADDRGP4 $761
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+60+8
ADDRLP4 420
INDIRI4
ASGNI4
line 957
;956:
;957:		cgs.media.flagPoleModel = trap_R_RegisterModel( "models/flag2/flagpole.md3" );
ADDRGP4 $764
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+88
ADDRLP4 424
INDIRI4
ASGNI4
line 958
;958:		cgs.media.flagFlapModel = trap_R_RegisterModel( "models/flag2/flagflap3.md3" );
ADDRGP4 $767
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+92
ADDRLP4 428
INDIRI4
ASGNI4
line 960
;959:
;960:		cgs.media.redFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/red.skin" );
ADDRGP4 $770
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+96
ADDRLP4 432
INDIRI4
ASGNI4
line 961
;961:		cgs.media.blueFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/blue.skin" );
ADDRGP4 $773
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+100
ADDRLP4 436
INDIRI4
ASGNI4
line 962
;962:		cgs.media.neutralFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/white.skin" );
ADDRGP4 $776
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+104
ADDRLP4 440
INDIRI4
ASGNI4
line 968
;963:#ifdef MISSIONPACK
;964:		cgs.media.redFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/red_base.md3" );
;965:		cgs.media.blueFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/blue_base.md3" );
;966:		cgs.media.neutralFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/ntrl_base.md3" );
;967:#endif
;968:	}
LABELV $729
line 997
;969:
;970:#ifdef MISSIONPACK
;971:	if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;972:		cgs.media.neutralFlagModel = trap_R_RegisterModel( "models/flags/n_flag.md3" );
;973:		cgs.media.flagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral1" );
;974:		cgs.media.flagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
;975:		cgs.media.flagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
;976:		cgs.media.flagShader[3] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral3" );
;977:	}
;978:
;979:	if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;980:		cgs.media.overloadBaseModel = trap_R_RegisterModel( "models/powerups/overload_base.md3" );
;981:		cgs.media.overloadTargetModel = trap_R_RegisterModel( "models/powerups/overload_target.md3" );
;982:		cgs.media.overloadLightsModel = trap_R_RegisterModel( "models/powerups/overload_lights.md3" );
;983:		cgs.media.overloadEnergyModel = trap_R_RegisterModel( "models/powerups/overload_energy.md3" );
;984:	}
;985:
;986:	if ( cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;987:		cgs.media.harvesterModel = trap_R_RegisterModel( "models/powerups/harvester/harvester.md3" );
;988:		cgs.media.harvesterRedSkin = trap_R_RegisterSkin( "models/powerups/harvester/red.skin" );
;989:		cgs.media.harvesterBlueSkin = trap_R_RegisterSkin( "models/powerups/harvester/blue.skin" );
;990:		cgs.media.harvesterNeutralModel = trap_R_RegisterModel( "models/powerups/obelisk/obelisk.md3" );
;991:	}
;992:
;993:	cgs.media.redKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikred" );
;994:	cgs.media.dustPuffShader = trap_R_RegisterShader("hasteSmokePuff" );
;995:#endif
;996:
;997:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $781
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $777
LABELV $781
line 998
;998:		cgs.media.friendShader = trap_R_RegisterShader( "sprites/foe" );
ADDRGP4 $784
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+200
ADDRLP4 392
INDIRI4
ASGNI4
line 999
;999:		cgs.media.redQuadShader = trap_R_RegisterShader("powerups/blueflag" );
ADDRGP4 $787
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+404
ADDRLP4 396
INDIRI4
ASGNI4
line 1000
;1000:		cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" );
ADDRGP4 $790
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+128
ADDRLP4 400
INDIRI4
ASGNI4
line 1004
;1001:#ifdef MISSIONPACK
;1002:		cgs.media.blueKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikblu" );
;1003:#endif
;1004:	}
LABELV $777
line 1006
;1005:
;1006:	cgs.media.armorModel = trap_R_RegisterModel( "models/powerups/armor/armor_yel.md3" );
ADDRGP4 $793
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+120
ADDRLP4 392
INDIRI4
ASGNI4
line 1007
;1007:	cgs.media.armorIcon  = trap_R_RegisterShaderNoMip( "icons/iconr_yellow" );
ADDRGP4 $796
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+124
ADDRLP4 396
INDIRI4
ASGNI4
line 1009
;1008:
;1009:	cgs.media.machinegunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/m_shell.md3" );
ADDRGP4 $799
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+180
ADDRLP4 400
INDIRI4
ASGNI4
line 1010
;1010:	cgs.media.shotgunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $802
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+184
ADDRLP4 404
INDIRI4
ASGNI4
line 1012
;1011:
;1012:	cgs.media.gibAbdomen = trap_R_RegisterModel( "models/gibs/abdomen.md3" );
ADDRGP4 $805
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+136
ADDRLP4 408
INDIRI4
ASGNI4
line 1013
;1013:	cgs.media.gibArm = trap_R_RegisterModel( "models/gibs/arm.md3" );
ADDRGP4 $808
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+140
ADDRLP4 412
INDIRI4
ASGNI4
line 1014
;1014:	cgs.media.gibChest = trap_R_RegisterModel( "models/gibs/chest.md3" );
ADDRGP4 $811
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+144
ADDRLP4 416
INDIRI4
ASGNI4
line 1015
;1015:	cgs.media.gibFist = trap_R_RegisterModel( "models/gibs/fist.md3" );
ADDRGP4 $814
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+148
ADDRLP4 420
INDIRI4
ASGNI4
line 1016
;1016:	cgs.media.gibFoot = trap_R_RegisterModel( "models/gibs/foot.md3" );
ADDRGP4 $817
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+152
ADDRLP4 424
INDIRI4
ASGNI4
line 1017
;1017:	cgs.media.gibForearm = trap_R_RegisterModel( "models/gibs/forearm.md3" );
ADDRGP4 $820
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+156
ADDRLP4 428
INDIRI4
ASGNI4
line 1018
;1018:	cgs.media.gibIntestine = trap_R_RegisterModel( "models/gibs/intestine.md3" );
ADDRGP4 $823
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+160
ADDRLP4 432
INDIRI4
ASGNI4
line 1019
;1019:	cgs.media.gibLeg = trap_R_RegisterModel( "models/gibs/leg.md3" );
ADDRGP4 $826
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+164
ADDRLP4 436
INDIRI4
ASGNI4
line 1020
;1020:	cgs.media.gibSkull = trap_R_RegisterModel( "models/gibs/skull.md3" );
ADDRGP4 $829
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+168
ADDRLP4 440
INDIRI4
ASGNI4
line 1021
;1021:	cgs.media.gibBrain = trap_R_RegisterModel( "models/gibs/brain.md3" );
ADDRGP4 $832
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+172
ADDRLP4 444
INDIRI4
ASGNI4
line 1023
;1022:
;1023:	cgs.media.smoke2 = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $802
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+176
ADDRLP4 448
INDIRI4
ASGNI4
line 1025
;1024:
;1025:	cgs.media.balloonShader = trap_R_RegisterShader( "sprites/balloon3" );
ADDRGP4 $837
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+204
ADDRLP4 452
INDIRI4
ASGNI4
line 1027
;1026:
;1027:	cgs.media.bloodExplosionShader = trap_R_RegisterShader( "bloodExplosion" );
ADDRGP4 $840
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+472
ADDRLP4 456
INDIRI4
ASGNI4
line 1029
;1028:
;1029:	cgs.media.bulletFlashModel = trap_R_RegisterModel("models/weaphits/bullet.md3");
ADDRGP4 $843
ARGP4
ADDRLP4 460
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+432
ADDRLP4 460
INDIRI4
ASGNI4
line 1030
;1030:	cgs.media.ringFlashModel = trap_R_RegisterModel("models/weaphits/ring02.md3");
ADDRGP4 $846
ARGP4
ADDRLP4 464
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+436
ADDRLP4 464
INDIRI4
ASGNI4
line 1031
;1031:	cgs.media.dishFlashModel = trap_R_RegisterModel("models/weaphits/boom01.md3");
ADDRGP4 $849
ARGP4
ADDRLP4 468
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+440
ADDRLP4 468
INDIRI4
ASGNI4
line 1035
;1032:#ifdef MISSIONPACK
;1033:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/powerups/pop.md3" );
;1034:#else
;1035:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/misc/telep.md3" );
ADDRGP4 $852
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+476
ADDRLP4 472
INDIRI4
ASGNI4
line 1036
;1036:	cgs.media.teleportEffectShader = trap_R_RegisterShader( "teleportEffect" );
ADDRGP4 $855
ARGP4
ADDRLP4 476
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+480
ADDRLP4 476
INDIRI4
ASGNI4
line 1054
;1037:#endif
;1038:#ifdef MISSIONPACK
;1039:	cgs.media.kamikazeEffectModel = trap_R_RegisterModel( "models/weaphits/kamboom2.md3" );
;1040:	cgs.media.kamikazeShockWave = trap_R_RegisterModel( "models/weaphits/kamwave.md3" );
;1041:	cgs.media.kamikazeHeadModel = trap_R_RegisterModel( "models/powerups/kamikazi.md3" );
;1042:	cgs.media.kamikazeHeadTrail = trap_R_RegisterModel( "models/powerups/trailtest.md3" );
;1043:	cgs.media.guardPowerupModel = trap_R_RegisterModel( "models/powerups/guard_player.md3" );
;1044:	cgs.media.scoutPowerupModel = trap_R_RegisterModel( "models/powerups/scout_player.md3" );
;1045:	cgs.media.doublerPowerupModel = trap_R_RegisterModel( "models/powerups/doubler_player.md3" );
;1046:	cgs.media.ammoRegenPowerupModel = trap_R_RegisterModel( "models/powerups/ammo_player.md3" );
;1047:	cgs.media.invulnerabilityImpactModel = trap_R_RegisterModel( "models/powerups/shield/impact.md3" );
;1048:	cgs.media.invulnerabilityJuicedModel = trap_R_RegisterModel( "models/powerups/shield/juicer.md3" );
;1049:	cgs.media.medkitUsageModel = trap_R_RegisterModel( "models/powerups/regen.md3" );
;1050:	cgs.media.heartShader = trap_R_RegisterShaderNoMip( "ui/assets/statusbar/selectedhealth.tga" );
;1051:	cgs.media.invulnerabilityPowerupModel = trap_R_RegisterModel( "models/powerups/shield/shield.md3" );
;1052:#endif
;1053:
;1054:	cgs.media.medalImpressive = trap_R_RegisterShaderNoMip( "medal_impressive" );
ADDRGP4 $858
ARGP4
ADDRLP4 480
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+500
ADDRLP4 480
INDIRI4
ASGNI4
line 1055
;1055:	cgs.media.medalExcellent = trap_R_RegisterShaderNoMip( "medal_excellent" );
ADDRGP4 $861
ARGP4
ADDRLP4 484
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+504
ADDRLP4 484
INDIRI4
ASGNI4
line 1056
;1056:	cgs.media.medalGauntlet = trap_R_RegisterShaderNoMip( "medal_gauntlet" );
ADDRGP4 $864
ARGP4
ADDRLP4 488
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+508
ADDRLP4 488
INDIRI4
ASGNI4
line 1057
;1057:	cgs.media.medalDefend = trap_R_RegisterShaderNoMip( "medal_defend" );
ADDRGP4 $867
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+512
ADDRLP4 492
INDIRI4
ASGNI4
line 1058
;1058:	cgs.media.medalAssist = trap_R_RegisterShaderNoMip( "medal_assist" );
ADDRGP4 $870
ARGP4
ADDRLP4 496
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+516
ADDRLP4 496
INDIRI4
ASGNI4
line 1059
;1059:	cgs.media.medalCapture = trap_R_RegisterShaderNoMip( "medal_capture" );
ADDRGP4 $873
ARGP4
ADDRLP4 500
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+520
ADDRLP4 500
INDIRI4
ASGNI4
line 1062
;1060:
;1061:
;1062:	memset( cg_items, 0, sizeof( cg_items ) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7168
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1063
;1063:	memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1066
;1064:
;1065:	// only register the items that the server says we need
;1066:	Q_strncpyz( items, CG_ConfigString(CS_ITEMS), sizeof( items ) );
CNSTI4 27
ARGI4
ADDRLP4 504
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 504
INDIRP4
ARGP4
CNSTI4 257
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1068
;1067:
;1068:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $877
JUMPV
LABELV $874
line 1069
;1069:		if ( items[ i ] == '1' || cg_buildScript.integer ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $881
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $878
LABELV $881
line 1070
;1070:			CG_LoadingItem( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingItem
CALLV
pop
line 1071
;1071:			CG_RegisterItemVisuals( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1072
;1072:		}
LABELV $878
line 1073
;1073:	}
LABELV $875
line 1068
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $877
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $874
line 1075
;1074:
;1075:	cg.skipDFshaders = qfalse;
ADDRGP4 cg+149088
CNSTI4 0
ASGNI4
line 1078
;1076:
;1077:	// wall marks
;1078:	cgs.media.bulletMarkShader = trap_R_RegisterShader( "gfx/damage/bullet_mrk" );
ADDRGP4 $885
ARGP4
ADDRLP4 508
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+376
ADDRLP4 508
INDIRI4
ASGNI4
line 1079
;1079:	cgs.media.burnMarkShader = trap_R_RegisterShader( "gfx/damage/burn_med_mrk" );
ADDRGP4 $888
ARGP4
ADDRLP4 512
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+380
ADDRLP4 512
INDIRI4
ASGNI4
line 1080
;1080:	cgs.media.holeMarkShader = trap_R_RegisterShader( "gfx/damage/hole_lg_mrk" );
ADDRGP4 $891
ARGP4
ADDRLP4 516
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+384
ADDRLP4 516
INDIRI4
ASGNI4
line 1081
;1081:	cgs.media.energyMarkShader = trap_R_RegisterShader( "gfx/damage/plasma_mrk" );
ADDRGP4 $894
ARGP4
ADDRLP4 520
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+388
ADDRLP4 520
INDIRI4
ASGNI4
line 1082
;1082:	cgs.media.shadowMarkShader = trap_R_RegisterShader( "markShadow" );
ADDRGP4 $897
ARGP4
ADDRLP4 524
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+344
ADDRLP4 524
INDIRI4
ASGNI4
line 1083
;1083:	cgs.media.wakeMarkShader = trap_R_RegisterShader( "wake" );
ADDRGP4 $900
ARGP4
ADDRLP4 528
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+368
ADDRLP4 528
INDIRI4
ASGNI4
line 1084
;1084:	cgs.media.bloodMarkShader = trap_R_RegisterShader( "bloodMark" );
ADDRGP4 $903
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+372
ADDRLP4 532
INDIRI4
ASGNI4
line 1087
;1085:
;1086:	// register the inline models
;1087:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 536
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+36896
ADDRLP4 536
INDIRI4
ASGNI4
line 1088
;1088:	for ( i = 1 ; i < cgs.numInlineModels ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $908
JUMPV
LABELV $905
line 1093
;1089:		char	name[10];
;1090:		vec3_t			mins, maxs;
;1091:		int				j;
;1092:
;1093:		Com_sprintf( name, sizeof(name), "*%i", i );
ADDRLP4 568
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $910
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1094
;1094:		cgs.inlineDrawModel[i] = trap_R_RegisterModel( name );
ADDRLP4 568
ARGP4
ADDRLP4 580
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36900
ADDP4
ADDRLP4 580
INDIRI4
ASGNI4
line 1095
;1095:		trap_R_ModelBounds( cgs.inlineDrawModel[i], mins, maxs );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36900
ADDP4
INDIRI4
ARGI4
ADDRLP4 544
ARGP4
ADDRLP4 556
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 1096
;1096:		for ( j = 0 ; j < 3 ; j++ ) {
ADDRLP4 540
CNSTI4 0
ASGNI4
LABELV $913
line 1097
;1097:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * ( maxs[j] - mins[j] );
ADDRLP4 540
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 cgs+37924
ADDP4
ADDP4
ADDRLP4 540
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 544
ADDP4
INDIRF4
ADDRLP4 540
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 556
ADDP4
INDIRF4
ADDRLP4 540
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 544
ADDP4
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 1098
;1098:		}
LABELV $914
line 1096
ADDRLP4 540
ADDRLP4 540
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 540
INDIRI4
CNSTI4 3
LTI4 $913
line 1099
;1099:	}
LABELV $906
line 1088
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $908
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+36896
INDIRI4
LTI4 $905
line 1102
;1100:
;1101:	// register all the server specified models
;1102:	for (i=1 ; i<MAX_MODELS ; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $918
line 1105
;1103:		const char		*modelName;
;1104:
;1105:		modelName = CG_ConfigString( CS_MODELS+i );
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 544
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 540
ADDRLP4 544
INDIRP4
ASGNP4
line 1106
;1106:		if ( !modelName[0] ) {
ADDRLP4 540
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $922
line 1107
;1107:			break;
ADDRGP4 $920
JUMPV
LABELV $922
line 1109
;1108:		}
;1109:		cgs.gameModels[i] = trap_R_RegisterModel( modelName );
ADDRLP4 540
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34848
ADDP4
ADDRLP4 548
INDIRI4
ASGNI4
line 1110
;1110:	}
LABELV $919
line 1102
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $918
LABELV $920
line 1112
;1111:	
;1112:	cgs.media.cursor = trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $927
ARGP4
ADDRLP4 540
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+944
ADDRLP4 540
INDIRI4
ASGNI4
line 1138
;1113:#ifdef MISSIONPACK
;1114:	// new stuff
;1115:	cgs.media.patrolShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/patrol.tga");
;1116:	cgs.media.assaultShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/assault.tga");
;1117:	cgs.media.campShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/camp.tga");
;1118:	cgs.media.followShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/follow.tga");
;1119:	cgs.media.defendShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/defend.tga");
;1120:	cgs.media.teamLeaderShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/team_leader.tga");
;1121:	cgs.media.retrieveShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/retrieve.tga");
;1122:	cgs.media.escortShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/escort.tga");
;1123:	cgs.media.sizeCursor = trap_R_RegisterShaderNoMip( "ui/assets/sizecursor.tga" );
;1124:	cgs.media.selectCursor = trap_R_RegisterShaderNoMip( "ui/assets/selectcursor.tga" );
;1125:	cgs.media.flagShaders[0] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_in_base.tga");
;1126:	cgs.media.flagShaders[1] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_capture.tga");
;1127:	cgs.media.flagShaders[2] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_missing.tga");
;1128:
;1129:	trap_R_RegisterModel( "models/players/james/lower.md3" );
;1130:	trap_R_RegisterModel( "models/players/james/upper.md3" );
;1131:	trap_R_RegisterModel( "models/players/heads/james/james.md3" );
;1132:
;1133:	trap_R_RegisterModel( "models/players/janet/lower.md3" );
;1134:	trap_R_RegisterModel( "models/players/janet/upper.md3" );
;1135:	trap_R_RegisterModel( "models/players/heads/janet/janet.md3" );
;1136:
;1137:#endif
;1138:	CG_ClearParticles ();
ADDRGP4 CG_ClearParticles
CALLV
pop
line 1151
;1139:/*
;1140:	for (i=1; i<MAX_PARTICLES_AREAS; i++)
;1141:	{
;1142:		{
;1143:			int rval;
;1144:
;1145:			rval = CG_NewParticleArea ( CS_PARTICLES + i);
;1146:			if (!rval)
;1147:				break;
;1148:		}
;1149:	}
;1150:*/
;1151:}
LABELV $581
endproc CG_RegisterGraphics 588 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 12 12
line 1161
;1152:
;1153:
;1154:
;1155:/*																																			
;1156:=======================
;1157:CG_BuildSpectatorString
;1158:
;1159:=======================
;1160:*/
;1161:void CG_BuildSpectatorString( void ) {
line 1163
;1162:	int i;
;1163:	cg.spectatorList[0] = 0;
ADDRGP4 cg+115436
CNSTI1 0
ASGNI1
line 1164
;1164:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $930
line 1165
;1165:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $934
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $934
line 1166
;1166:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s     ", cgs.clientinfo[i].name));
ADDRGP4 $941
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 cg+115436
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1167
;1167:		}
LABELV $934
line 1168
;1168:	}
LABELV $931
line 1164
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $930
line 1169
;1169:	i = strlen(cg.spectatorList);
ADDRGP4 cg+115436
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1170
;1170:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+116460
INDIRI4
EQI4 $945
line 1171
;1171:		cg.spectatorLen = i;
ADDRGP4 cg+116460
ADDRLP4 0
INDIRI4
ASGNI4
line 1172
;1172:		cg.spectatorWidth = -1;
ADDRGP4 cg+116464
CNSTF4 3212836864
ASGNF4
line 1173
;1173:	}
LABELV $945
line 1174
;1174:}
LABELV $928
endproc CG_BuildSpectatorString 12 12
proc CG_RegisterClients 12 4
line 1182
;1175:
;1176:
;1177:/*																																			
;1178:===================
;1179:CG_RegisterClients
;1180:===================
;1181:*/
;1182:static void CG_RegisterClients( void ) {
line 1185
;1183:	int		i;
;1184:
;1185:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1186
;1186:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1188
;1187:
;1188:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $953
line 1191
;1189:		const char		*clientInfo;
;1190:
;1191:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $957
line 1192
;1192:			continue;
ADDRGP4 $954
JUMPV
LABELV $957
line 1195
;1193:		}
;1194:
;1195:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1196
;1196:		if ( !clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $960
line 1197
;1197:			continue;
ADDRGP4 $954
JUMPV
LABELV $960
line 1199
;1198:		}
;1199:		CG_LoadingClient( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1200
;1200:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1201
;1201:	}
LABELV $954
line 1188
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $953
line 1202
;1202:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1203
;1203:}
LABELV $950
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1212
;1204:
;1205://===========================================================================
;1206:
;1207:/*
;1208:=================
;1209:CG_ConfigString
;1210:=================
;1211:*/
;1212:const char *CG_ConfigString( int index ) {
line 1213
;1213:	if ( index < 0 || index >= MAX_CONFIGSTRINGS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $965
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $963
LABELV $965
line 1214
;1214:		CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $966
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1215
;1215:		return "";
ADDRGP4 $194
RETP4
ADDRGP4 $962
JUMPV
LABELV $963
line 1217
;1216:	}
;1217:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs
ADDP4
INDIRI4
ADDRGP4 cgs+4096
ADDP4
RETP4
LABELV $962
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1228
;1218:}
;1219:
;1220://==================================================================
;1221:
;1222:/*
;1223:======================
;1224:CG_StartMusic
;1225:
;1226:======================
;1227:*/
;1228:void CG_StartMusic( void ) {
line 1233
;1229:	char	*s;
;1230:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;1231:
;1232:	// start the background music
;1233:	s = (char *)CG_ConfigString( CS_MUSIC );
CNSTI4 2
ARGI4
ADDRLP4 132
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 132
INDIRP4
ASGNP4
line 1234
;1234:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1235
;1235:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1237
;1236:
;1237:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1238
;1238:}
LABELV $968
endproc CG_StartMusic 144 12
export CG_Init
proc CG_Init 312 12
line 1916
;1239:#ifdef MISSIONPACK
;1240:char *CG_GetMenuBuffer(const char *filename) {
;1241:	int	len;
;1242:	fileHandle_t	f;
;1243:	static char buf[MAX_MENUFILE];
;1244:
;1245:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
;1246:	if ( !f ) {
;1247:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
;1248:		return NULL;
;1249:	}
;1250:	if ( len >= MAX_MENUFILE ) {
;1251:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i\n", filename, len, MAX_MENUFILE ) );
;1252:		trap_FS_FCloseFile( f );
;1253:		return NULL;
;1254:	}
;1255:
;1256:	trap_FS_Read( buf, len, f );
;1257:	buf[len] = 0;
;1258:	trap_FS_FCloseFile( f );
;1259:
;1260:	return buf;
;1261:}
;1262:
;1263://
;1264:// ==============================
;1265:// new hud stuff ( mission pack )
;1266:// ==============================
;1267://
;1268:qboolean CG_Asset_Parse(int handle) {
;1269:	pc_token_t token;
;1270:	const char *tempStr;
;1271:
;1272:	if (!trap_PC_ReadToken(handle, &token))
;1273:		return qfalse;
;1274:	if (Q_stricmp(token.string, "{") != 0) {
;1275:		return qfalse;
;1276:	}
;1277:    
;1278:	while ( 1 ) {
;1279:		if (!trap_PC_ReadToken(handle, &token))
;1280:			return qfalse;
;1281:
;1282:		if (Q_stricmp(token.string, "}") == 0) {
;1283:			return qtrue;
;1284:		}
;1285:
;1286:		// font
;1287:		if (Q_stricmp(token.string, "font") == 0) {
;1288:			int pointSize;
;1289:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1290:				return qfalse;
;1291:			}
;1292:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.textFont);
;1293:			continue;
;1294:		}
;1295:
;1296:		// smallFont
;1297:		if (Q_stricmp(token.string, "smallFont") == 0) {
;1298:			int pointSize;
;1299:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1300:				return qfalse;
;1301:			}
;1302:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.smallFont);
;1303:			continue;
;1304:		}
;1305:
;1306:		// font
;1307:		if (Q_stricmp(token.string, "bigfont") == 0) {
;1308:			int pointSize;
;1309:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1310:				return qfalse;
;1311:			}
;1312:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.bigFont);
;1313:			continue;
;1314:		}
;1315:
;1316:		// gradientbar
;1317:		if (Q_stricmp(token.string, "gradientbar") == 0) {
;1318:			if (!PC_String_Parse(handle, &tempStr)) {
;1319:				return qfalse;
;1320:			}
;1321:			cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
;1322:			continue;
;1323:		}
;1324:
;1325:		// enterMenuSound
;1326:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
;1327:			if (!PC_String_Parse(handle, &tempStr)) {
;1328:				return qfalse;
;1329:			}
;1330:			cgDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
;1331:			continue;
;1332:		}
;1333:
;1334:		// exitMenuSound
;1335:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
;1336:			if (!PC_String_Parse(handle, &tempStr)) {
;1337:				return qfalse;
;1338:			}
;1339:			cgDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
;1340:			continue;
;1341:		}
;1342:
;1343:		// itemFocusSound
;1344:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
;1345:			if (!PC_String_Parse(handle, &tempStr)) {
;1346:				return qfalse;
;1347:			}
;1348:			cgDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
;1349:			continue;
;1350:		}
;1351:
;1352:		// menuBuzzSound
;1353:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
;1354:			if (!PC_String_Parse(handle, &tempStr)) {
;1355:				return qfalse;
;1356:			}
;1357:			cgDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
;1358:			continue;
;1359:		}
;1360:
;1361:		if (Q_stricmp(token.string, "cursor") == 0) {
;1362:			if (!PC_String_Parse(handle, &cgDC.Assets.cursorStr)) {
;1363:				return qfalse;
;1364:			}
;1365:			cgDC.Assets.cursor = trap_R_RegisterShaderNoMip( cgDC.Assets.cursorStr);
;1366:			continue;
;1367:		}
;1368:
;1369:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
;1370:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeClamp)) {
;1371:				return qfalse;
;1372:			}
;1373:			continue;
;1374:		}
;1375:
;1376:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
;1377:			if (!PC_Int_Parse(handle, &cgDC.Assets.fadeCycle)) {
;1378:				return qfalse;
;1379:			}
;1380:			continue;
;1381:		}
;1382:
;1383:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
;1384:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeAmount)) {
;1385:				return qfalse;
;1386:			}
;1387:			continue;
;1388:		}
;1389:
;1390:		if (Q_stricmp(token.string, "shadowX") == 0) {
;1391:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowX)) {
;1392:				return qfalse;
;1393:			}
;1394:			continue;
;1395:		}
;1396:
;1397:		if (Q_stricmp(token.string, "shadowY") == 0) {
;1398:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowY)) {
;1399:				return qfalse;
;1400:			}
;1401:			continue;
;1402:		}
;1403:
;1404:		if (Q_stricmp(token.string, "shadowColor") == 0) {
;1405:			if (!PC_Color_Parse(handle, &cgDC.Assets.shadowColor)) {
;1406:				return qfalse;
;1407:			}
;1408:			cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[3];
;1409:			continue;
;1410:		}
;1411:	}
;1412:	return qfalse;
;1413:}
;1414:
;1415:void CG_ParseMenu(const char *menuFile) {
;1416:	pc_token_t token;
;1417:	int handle;
;1418:
;1419:	handle = trap_PC_LoadSource(menuFile);
;1420:	if (!handle)
;1421:		handle = trap_PC_LoadSource("ui/testhud.menu");
;1422:	if (!handle)
;1423:		return;
;1424:
;1425:	while ( 1 ) {
;1426:		if (!trap_PC_ReadToken( handle, &token )) {
;1427:			break;
;1428:		}
;1429:
;1430:		//if ( Q_stricmp( token, "{" ) ) {
;1431:		//	Com_Printf( "Missing { in menu file\n" );
;1432:		//	break;
;1433:		//}
;1434:
;1435:		//if ( menuCount == MAX_MENUS ) {
;1436:		//	Com_Printf( "Too many menus!\n" );
;1437:		//	break;
;1438:		//}
;1439:
;1440:		if ( token.string[0] == '}' ) {
;1441:			break;
;1442:		}
;1443:
;1444:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
;1445:			if (CG_Asset_Parse(handle)) {
;1446:				continue;
;1447:			} else {
;1448:				break;
;1449:			}
;1450:		}
;1451:
;1452:
;1453:		if (Q_stricmp(token.string, "menudef") == 0) {
;1454:			// start a new menu
;1455:			Menu_New(handle);
;1456:		}
;1457:	}
;1458:	trap_PC_FreeSource(handle);
;1459:}
;1460:
;1461:qboolean CG_Load_Menu(char **p) {
;1462:	char *token;
;1463:
;1464:	token = COM_ParseExt(p, qtrue);
;1465:
;1466:	if (token[0] != '{') {
;1467:		return qfalse;
;1468:	}
;1469:
;1470:	while ( 1 ) {
;1471:
;1472:		token = COM_ParseExt(p, qtrue);
;1473:    
;1474:		if (Q_stricmp(token, "}") == 0) {
;1475:			return qtrue;
;1476:		}
;1477:
;1478:		if ( !token || token[0] == 0 ) {
;1479:			return qfalse;
;1480:		}
;1481:
;1482:		CG_ParseMenu(token); 
;1483:	}
;1484:	return qfalse;
;1485:}
;1486:
;1487:
;1488:
;1489:void CG_LoadMenus(const char *menuFile) {
;1490:	char	*token;
;1491:	char *p;
;1492:	int	len, start;
;1493:	fileHandle_t	f;
;1494:	static char buf[MAX_MENUDEFFILE];
;1495:
;1496:	start = trap_Milliseconds();
;1497:
;1498:	len = trap_FS_FOpenFile( menuFile, &f, FS_READ );
;1499:	if ( !f ) {
;1500:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
;1501:		len = trap_FS_FOpenFile( "ui/hud.txt", &f, FS_READ );
;1502:		if (!f) {
;1503:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/hud.txt, unable to continue!\n", menuFile ) );
;1504:		}
;1505:	}
;1506:
;1507:	if ( len >= MAX_MENUDEFFILE ) {
;1508:		trap_FS_FCloseFile( f );
;1509:		trap_Error( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", menuFile, len, MAX_MENUDEFFILE ) );
;1510:		return;
;1511:	}
;1512:
;1513:	trap_FS_Read( buf, len, f );
;1514:	buf[len] = 0;
;1515:	trap_FS_FCloseFile( f );
;1516:	
;1517:	COM_Compress(buf);
;1518:
;1519:	Menu_Reset();
;1520:
;1521:	p = buf;
;1522:
;1523:	while ( 1 ) {
;1524:		token = COM_ParseExt( &p, qtrue );
;1525:		if( !token || token[0] == 0 || token[0] == '}') {
;1526:			break;
;1527:		}
;1528:
;1529:		//if ( Q_stricmp( token, "{" ) ) {
;1530:		//	Com_Printf( "Missing { in menu file\n" );
;1531:		//	break;
;1532:		//}
;1533:
;1534:		//if ( menuCount == MAX_MENUS ) {
;1535:		//	Com_Printf( "Too many menus!\n" );
;1536:		//	break;
;1537:		//}
;1538:
;1539:		if ( Q_stricmp( token, "}" ) == 0 ) {
;1540:			break;
;1541:		}
;1542:
;1543:		if (Q_stricmp(token, "loadmenu") == 0) {
;1544:			if (CG_Load_Menu(&p)) {
;1545:				continue;
;1546:			} else {
;1547:				break;
;1548:			}
;1549:		}
;1550:	}
;1551:
;1552:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
;1553:
;1554:}
;1555:
;1556:
;1557:
;1558:static qboolean CG_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
;1559:	return qfalse;
;1560:}
;1561:
;1562:
;1563:static int CG_FeederCount(float feederID) {
;1564:	int i, count;
;1565:	count = 0;
;1566:	if (feederID == FEEDER_REDTEAM_LIST) {
;1567:		for (i = 0; i < cg.numScores; i++) {
;1568:			if (cg.scores[i].team == TEAM_RED) {
;1569:				count++;
;1570:			}
;1571:		}
;1572:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1573:		for (i = 0; i < cg.numScores; i++) {
;1574:			if (cg.scores[i].team == TEAM_BLUE) {
;1575:				count++;
;1576:			}
;1577:		}
;1578:	} else if (feederID == FEEDER_SCOREBOARD) {
;1579:		return cg.numScores;
;1580:	}
;1581:	return count;
;1582:}
;1583:
;1584:
;1585:void CG_SetScoreSelection(void *p) {
;1586:	menuDef_t *menu = (menuDef_t*)p;
;1587:	playerState_t *ps = &cg.snap->ps;
;1588:	int i, red, blue;
;1589:	red = blue = 0;
;1590:	for (i = 0; i < cg.numScores; i++) {
;1591:		if (cg.scores[i].team == TEAM_RED) {
;1592:			red++;
;1593:		} else if (cg.scores[i].team == TEAM_BLUE) {
;1594:			blue++;
;1595:		}
;1596:		if (ps->clientNum == cg.scores[i].client) {
;1597:			cg.selectedScore = i;
;1598:		}
;1599:	}
;1600:
;1601:	if (menu == NULL) {
;1602:		// just interested in setting the selected score
;1603:		return;
;1604:	}
;1605:
;1606:	if ( cgs.gametype >= GT_TEAM ) {
;1607:		int feeder = FEEDER_REDTEAM_LIST;
;1608:		i = red;
;1609:		if (cg.scores[cg.selectedScore].team == TEAM_BLUE) {
;1610:			feeder = FEEDER_BLUETEAM_LIST;
;1611:			i = blue;
;1612:		}
;1613:		Menu_SetFeederSelection(menu, feeder, i, NULL);
;1614:	} else {
;1615:		Menu_SetFeederSelection(menu, FEEDER_SCOREBOARD, cg.selectedScore, NULL);
;1616:	}
;1617:}
;1618:
;1619:// FIXME: might need to cache this info
;1620:static clientInfo_t * CG_InfoFromScoreIndex(int index, int team, int *scoreIndex) {
;1621:	int i, count;
;1622:	if ( cgs.gametype >= GT_TEAM ) {
;1623:		count = 0;
;1624:		for (i = 0; i < cg.numScores; i++) {
;1625:			if (cg.scores[i].team == team) {
;1626:				if (count == index) {
;1627:					*scoreIndex = i;
;1628:					return &cgs.clientinfo[cg.scores[i].client];
;1629:				}
;1630:				count++;
;1631:			}
;1632:		}
;1633:	}
;1634:	*scoreIndex = index;
;1635:	return &cgs.clientinfo[ cg.scores[index].client ];
;1636:}
;1637:
;1638:static const char *CG_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
;1639:	gitem_t *item;
;1640:	int scoreIndex = 0;
;1641:	clientInfo_t *info = NULL;
;1642:	int team = -1;
;1643:	score_t *sp = NULL;
;1644:
;1645:	*handle = -1;
;1646:
;1647:	if (feederID == FEEDER_REDTEAM_LIST) {
;1648:		team = TEAM_RED;
;1649:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1650:		team = TEAM_BLUE;
;1651:	}
;1652:
;1653:	info = CG_InfoFromScoreIndex(index, team, &scoreIndex);
;1654:	sp = &cg.scores[scoreIndex];
;1655:
;1656:	if (info && info->infoValid) {
;1657:		switch (column) {
;1658:			case 0:
;1659:				if ( info->powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;1660:					item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1661:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1662:				} else if ( info->powerups & ( 1 << PW_REDFLAG ) ) {
;1663:					item = BG_FindItemForPowerup( PW_REDFLAG );
;1664:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1665:				} else if ( info->powerups & ( 1 << PW_BLUEFLAG ) ) {
;1666:					item = BG_FindItemForPowerup( PW_BLUEFLAG );
;1667:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1668:				} else {
;1669:					if ( info->botSkill > 0 && info->botSkill <= 5 ) {
;1670:						*handle = cgs.media.botSkillShaders[ info->botSkill - 1 ];
;1671:					} else if ( info->handicap < 100 ) {
;1672:					return va("%i", info->handicap );
;1673:					}
;1674:				}
;1675:			break;
;1676:			case 1:
;1677:				if (team == -1) {
;1678:					return "";
;1679:				} else {
;1680:					if ( Q_Isfreeze( sp->client ) )
;1681:						*handle = cgs.media.noammoShader;
;1682:					else
;1683://freeze
;1684:					*handle = CG_StatusHandle(info->teamTask);
;1685:				}
;1686:		  break;
;1687:			case 2:
;1688:				if ( cg.snap->ps.stats[ STAT_CLIENTS_READY ] & ( 1 << sp->client ) ) {
;1689://freeze
;1690:					if ( !Q_Isfreeze( sp->client ) )
;1691://freeze
;1692:					return "Ready";
;1693:				}
;1694:				if (team == -1) {
;1695:					if (cgs.gametype == GT_TOURNAMENT) {
;1696:						return va("%i/%i", info->wins, info->losses);
;1697:					} else if (info->infoValid && info->team == TEAM_SPECTATOR ) {
;1698:						return "Spectator";
;1699:					} else {
;1700:						return "";
;1701:					}
;1702:				} else {
;1703://freeze
;1704:					if ( cgs.gametype == GT_TEAM || cgs.gametype == GT_CTF ) {
;1705:						return va( "%i %s", sp->scoreFlags, info->teamLeader ? "L" : "" );
;1706:					}
;1707://freeze
;1708:					if (info->teamLeader) {
;1709:						return "Leader";
;1710:					}
;1711:				}
;1712:			break;
;1713:			case 3:
;1714:				return info->name;
;1715:			break;
;1716:			case 4:
;1717:				return va("%i", info->score);
;1718:			break;
;1719:			case 5:
;1720:				return va("%4i", sp->time);
;1721:			break;
;1722:			case 6:
;1723:				if ( sp->ping == -1 ) {
;1724:					return "connecting";
;1725:				} 
;1726:				return va("%4i", sp->ping);
;1727:			break;
;1728:		}
;1729:	}
;1730:
;1731:	return "";
;1732:}
;1733:
;1734:static qhandle_t CG_FeederItemImage(float feederID, int index) {
;1735:	return 0;
;1736:}
;1737:
;1738:static void CG_FeederSelection(float feederID, int index) {
;1739:	if ( cgs.gametype >= GT_TEAM ) {
;1740:		int i, count;
;1741:		int team = (feederID == FEEDER_REDTEAM_LIST) ? TEAM_RED : TEAM_BLUE;
;1742:		count = 0;
;1743:		for (i = 0; i < cg.numScores; i++) {
;1744:			if (cg.scores[i].team == team) {
;1745:				if (index == count) {
;1746:					cg.selectedScore = i;
;1747:				}
;1748:				count++;
;1749:			}
;1750:		}
;1751:	} else {
;1752:		cg.selectedScore = index;
;1753:	}
;1754:}
;1755:#endif
;1756:
;1757:#ifdef MISSIONPACK
;1758:static float CG_Cvar_Get(const char *cvar) {
;1759:	char buff[128];
;1760:	memset(buff, 0, sizeof(buff));
;1761:	trap_Cvar_VariableStringBuffer(cvar, buff, sizeof(buff));
;1762:	return atof(buff);
;1763:}
;1764:#endif
;1765:
;1766:#ifdef MISSIONPACK
;1767:void CG_Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
;1768:	CG_Text_Paint(x, y, scale, color, text, 0, limit, style);
;1769:}
;1770:
;1771:static int CG_OwnerDrawWidth(int ownerDraw, float scale) {
;1772:	switch (ownerDraw) {
;1773:	  case CG_GAME_TYPE:
;1774:			return CG_Text_Width(CG_GameTypeString(), scale, 0);
;1775:	  case CG_GAME_STATUS:
;1776:			return CG_Text_Width(CG_GetGameStatusText(), scale, 0);
;1777:			break;
;1778:	  case CG_KILLER:
;1779:			return CG_Text_Width(CG_GetKillerText(), scale, 0);
;1780:			break;
;1781:	  case CG_RED_NAME:
;1782:			return CG_Text_Width(cg_redTeamName.string, scale, 0);
;1783:			break;
;1784:	  case CG_BLUE_NAME:
;1785:			return CG_Text_Width(cg_blueTeamName.string, scale, 0);
;1786:			break;
;1787:
;1788:
;1789:	}
;1790:	return 0;
;1791:}
;1792:
;1793:static int CG_PlayCinematic(const char *name, float x, float y, float w, float h) {
;1794:  return trap_CIN_PlayCinematic(name, x, y, w, h, CIN_loop);
;1795:}
;1796:
;1797:static void CG_StopCinematic(int handle) {
;1798:  trap_CIN_StopCinematic(handle);
;1799:}
;1800:
;1801:static void CG_DrawCinematic(int handle, float x, float y, float w, float h) {
;1802:  trap_CIN_SetExtents(handle, x, y, w, h);
;1803:  trap_CIN_DrawCinematic(handle);
;1804:}
;1805:
;1806:static void CG_RunCinematicFrame(int handle) {
;1807:  trap_CIN_RunCinematic(handle);
;1808:}
;1809:
;1810:/*
;1811:=================
;1812:CG_LoadHudMenu();
;1813:
;1814:=================
;1815:*/
;1816:void CG_LoadHudMenu( void ) {
;1817:	char buff[1024];
;1818:	const char *hudSet;
;1819:
;1820:	cgDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
;1821:	cgDC.setColor = &trap_R_SetColor;
;1822:	cgDC.drawHandlePic = &CG_DrawPic;
;1823:	cgDC.drawStretchPic = &trap_R_DrawStretchPic;
;1824:	cgDC.drawText = &CG_Text_Paint;
;1825:	cgDC.textWidth = &CG_Text_Width;
;1826:	cgDC.textHeight = &CG_Text_Height;
;1827:	cgDC.registerModel = &trap_R_RegisterModel;
;1828:	cgDC.modelBounds = &trap_R_ModelBounds;
;1829:	cgDC.fillRect = &CG_FillRect;
;1830:	cgDC.drawRect = &CG_DrawRect;   
;1831:	cgDC.drawSides = &CG_DrawSides;
;1832:	cgDC.drawTopBottom = &CG_DrawTopBottom;
;1833:	cgDC.clearScene = &trap_R_ClearScene;
;1834:	cgDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
;1835:	cgDC.renderScene = &trap_R_RenderScene;
;1836:	cgDC.registerFont = &trap_R_RegisterFont;
;1837:	cgDC.ownerDrawItem = &CG_OwnerDraw;
;1838:	cgDC.getValue = &CG_GetValue;
;1839:	cgDC.ownerDrawVisible = &CG_OwnerDrawVisible;
;1840:	cgDC.runScript = &CG_RunMenuScript;
;1841:	cgDC.getTeamColor = &CG_GetTeamColor;
;1842:	cgDC.setCVar = trap_Cvar_Set;
;1843:	cgDC.getCVarString = trap_Cvar_VariableStringBuffer;
;1844:	cgDC.getCVarValue = CG_Cvar_Get;
;1845:	cgDC.drawTextWithCursor = &CG_Text_PaintWithCursor;
;1846:	//cgDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
;1847:	//cgDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
;1848:	cgDC.startLocalSound = &trap_S_StartLocalSound;
;1849:	cgDC.ownerDrawHandleKey = &CG_OwnerDrawHandleKey;
;1850:	cgDC.feederCount = &CG_FeederCount;
;1851:	cgDC.feederItemImage = &CG_FeederItemImage;
;1852:	cgDC.feederItemText = &CG_FeederItemText;
;1853:	cgDC.feederSelection = &CG_FeederSelection;
;1854:	//cgDC.setBinding = &trap_Key_SetBinding;
;1855:	//cgDC.getBindingBuf = &trap_Key_GetBindingBuf;
;1856:	//cgDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
;1857:	//cgDC.executeText = &trap_Cmd_ExecuteText;
;1858:	cgDC.Error = &Com_Error; 
;1859:	cgDC.Print = &Com_Printf; 
;1860:	cgDC.ownerDrawWidth = &CG_OwnerDrawWidth;
;1861:	//cgDC.Pause = &CG_Pause;
;1862:	cgDC.registerSound = &trap_S_RegisterSound;
;1863:	cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
;1864:	cgDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
;1865:	cgDC.playCinematic = &CG_PlayCinematic;
;1866:	cgDC.stopCinematic = &CG_StopCinematic;
;1867:	cgDC.drawCinematic = &CG_DrawCinematic;
;1868:	cgDC.runCinematicFrame = &CG_RunCinematicFrame;
;1869:	
;1870:	Init_Display(&cgDC);
;1871:
;1872:	Menu_Reset();
;1873:	
;1874:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;1875:	hudSet = buff;
;1876:	if (hudSet[0] == '\0') {
;1877:		hudSet = "ui/hud.txt";
;1878:	}
;1879:
;1880:	CG_LoadMenus(hudSet);
;1881:}
;1882:
;1883:void CG_AssetCache( void ) {
;1884:	//if (Assets.textFont == NULL) {
;1885:	//  trap_R_RegisterFont("fonts/arial.ttf", 72, &Assets.textFont);
;1886:	//}
;1887:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;1888:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;1889:	cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
;1890:	cgDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
;1891:	cgDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
;1892:	cgDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
;1893:	cgDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
;1894:	cgDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
;1895:	cgDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
;1896:	cgDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
;1897:	cgDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
;1898:	cgDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
;1899:	cgDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
;1900:	cgDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
;1901:	cgDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
;1902:	cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
;1903:	cgDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
;1904:	cgDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
;1905:	cgDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
;1906:}
;1907:#endif
;1908:/*
;1909:=================
;1910:CG_Init
;1911:
;1912:Called after every level change or subsystem restart
;1913:Will perform callbacks to make the loading info screen update.
;1914:=================
;1915:*/
;1916:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum ) {
line 1921
;1917:	char  value[MAX_CVAR_VALUE_STRING];
;1918:	const char	*s;
;1919:
;1920:	// clear everything
;1921:	memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 149724
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1922
;1922:	memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 149092
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1923
;1923:	memset( cg_entities, 0, sizeof(cg_entities) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 757760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1924
;1924:	memset( cg_weapons, 0, sizeof(cg_weapons) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1925
;1925:	memset( cg_items, 0, sizeof(cg_items) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7168
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1927
;1926:
;1927:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1929
;1928:
;1929:	cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+31472
ADDRFP4 0
INDIRI4
ASGNI4
line 1930
;1930:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31468
ADDRFP4 4
INDIRI4
ASGNI4
line 1932
;1931:
;1932:	trap_Cvar_VariableStringBuffer( "//trap_GetValue", value, sizeof( value ) );
ADDRGP4 $973
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1933
;1933:	if ( value[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $974
line 1935
;1934:#ifdef Q3_VM
;1935:		trap_GetValue = (void*)~atoi( value );
ADDRLP4 0
ARGP4
ADDRLP4 260
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_GetValue
ADDRLP4 260
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 1936
;1936:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddRefEntityToScene2" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $978
ARGP4
ADDRLP4 264
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $976
line 1937
;1937:			trap_R_AddRefEntityToScene2 = (void*)~atoi( value );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_R_AddRefEntityToScene2
ADDRLP4 268
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 1938
;1938:			intShaderTime = qtrue;
ADDRGP4 intShaderTime
CNSTI4 1
ASGNI4
line 1939
;1939:		}
LABELV $976
line 1940
;1940:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddLinearLightToScene_Q3E" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $981
ARGP4
ADDRLP4 268
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $979
line 1941
;1941:			trap_R_AddLinearLightToScene = (void*)~atoi( value );
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_R_AddLinearLightToScene
ADDRLP4 272
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 1942
;1942:			linearLight = qtrue;
ADDRGP4 linearLight
CNSTI4 1
ASGNI4
line 1943
;1943:		}
LABELV $979
line 1955
;1944:#else
;1945:		dll_com_trapGetValue = atoi( value );
;1946:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddRefEntityToScene2" ) ) {
;1947:			dll_trap_R_AddRefEntityToScene2 = atoi( value );
;1948:			intShaderTime = qtrue;
;1949:		}
;1950:		if ( trap_GetValue( value, sizeof( value ), "trap_R_AddLinearLightToScene_Q3E" ) ) {
;1951:			dll_trap_R_AddLinearLightToScene = atoi( value );
;1952:			linearLight = qtrue;
;1953:		}
;1954:#endif
;1955:	}
LABELV $974
line 1958
;1956:
;1957:	// load a few needed things before we do any screen updates
;1958:	cgs.media.charsetShader		= trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $983
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692
ADDRLP4 260
INDIRI4
ASGNI4
line 1959
;1959:	cgs.media.whiteShader		= trap_R_RegisterShader( "white" );
ADDRGP4 $986
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+16
ADDRLP4 264
INDIRI4
ASGNI4
line 1960
;1960:	cgs.media.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $989
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+4
ADDRLP4 268
INDIRI4
ASGNI4
line 1961
;1961:	cgs.media.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $992
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+8
ADDRLP4 272
INDIRI4
ASGNI4
line 1962
;1962:	cgs.media.charsetPropB		= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $995
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+12
ADDRLP4 276
INDIRI4
ASGNI4
line 1964
;1963:
;1964:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 1966
;1965:
;1966:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 1968
;1967:
;1968:	cg.weaponSelect = WP_MACHINEGUN;
ADDRGP4 cg+108956
CNSTI4 2
ASGNI4
line 1970
;1969:
;1970:	cgs.redflag = cgs.blueflag = -1; // For compatibily, default to unset for
ADDRLP4 280
CNSTI4 -1
ASGNI4
ADDRGP4 cgs+34836
ADDRLP4 280
INDIRI4
ASGNI4
ADDRGP4 cgs+34832
ADDRLP4 280
INDIRI4
ASGNI4
line 1971
;1971:	cgs.flagStatus = -1;
ADDRGP4 cgs+34840
CNSTI4 -1
ASGNI4
line 1975
;1972:	// old servers
;1973:
;1974:	// get the rendering configuration from the client system
;1975:	trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1977
;1976:
;1977:	cgs.screenXBias = 0.0;
ADDRGP4 cgs+31444
CNSTF4 0
ASGNF4
line 1978
;1978:	cgs.screenYBias = 0.0;
ADDRGP4 cgs+31448
CNSTF4 0
ASGNF4
line 1980
;1979:	
;1980:	if ( cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640 ) {
ADDRGP4 cgs+20100+11304
INDIRI4
CNSTI4 480
MULI4
ADDRGP4 cgs+20100+11308
INDIRI4
CNSTI4 640
MULI4
LEI4 $1003
line 1982
;1981:		// wide screen, scale by height
;1982:		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidHeight * (1.0/480.0);
ADDRLP4 284
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 990414985
MULF4
ASGNF4
ADDRGP4 cgs+31436
ADDRLP4 284
INDIRF4
ASGNF4
ADDRGP4 cgs+31432
ADDRLP4 284
INDIRF4
ASGNF4
line 1983
;1983:		cgs.screenXBias = 0.5 * ( cgs.glconfig.vidWidth - ( cgs.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 cgs+31444
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1068149419
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1984
;1984:	}
ADDRGP4 $1004
JUMPV
LABELV $1003
line 1985
;1985:	else {
line 1987
;1986:		// no wide screen, scale by width
;1987:		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidWidth * (1.0/640.0);
ADDRLP4 284
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 986500301
MULF4
ASGNF4
ADDRGP4 cgs+31436
ADDRLP4 284
INDIRF4
ASGNF4
ADDRGP4 cgs+31432
ADDRLP4 284
INDIRF4
ASGNF4
line 1988
;1988:		cgs.screenYBias = 0.5 * ( cgs.glconfig.vidHeight - ( cgs.glconfig.vidWidth * (480.0/640.0) ) );
ADDRGP4 cgs+31448
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1061158912
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1989
;1989:	}
LABELV $1004
line 1991
;1990:
;1991:	cgs.screenXmin = 0.0 - (cgs.screenXBias / cgs.screenXScale);
ADDRGP4 cgs+31452
CNSTF4 0
ADDRGP4 cgs+31444
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
DIVF4
SUBF4
ASGNF4
line 1992
;1992:	cgs.screenXmax = 640.0 + (cgs.screenXBias / cgs.screenXScale);
ADDRGP4 cgs+31456
ADDRGP4 cgs+31444
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
DIVF4
CNSTF4 1142947840
ADDF4
ASGNF4
line 1994
;1993:
;1994:	cgs.screenYmin = 0.0 - (cgs.screenYBias / cgs.screenYScale);
ADDRGP4 cgs+31460
CNSTF4 0
ADDRGP4 cgs+31448
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
DIVF4
SUBF4
ASGNF4
line 1995
;1995:	cgs.screenYmax = 480.0 + (cgs.screenYBias / cgs.screenYScale);
ADDRGP4 cgs+31464
ADDRGP4 cgs+31448
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
DIVF4
CNSTF4 1139802112
ADDF4
ASGNF4
line 1997
;1996:
;1997:	cgs.cursorScaleR = 1.0 / cgs.screenXScale;
ADDRGP4 cgs+31440
CNSTF4 1065353216
ADDRGP4 cgs+31432
INDIRF4
DIVF4
ASGNF4
line 1998
;1998:	if ( cgs.cursorScaleR < 0.5 ) {
ADDRGP4 cgs+31440
INDIRF4
CNSTF4 1056964608
GEF4 $1041
line 1999
;1999:		cgs.cursorScaleR = 0.5;
ADDRGP4 cgs+31440
CNSTF4 1056964608
ASGNF4
line 2000
;2000:	}
LABELV $1041
line 2003
;2001:
;2002:#ifdef USE_NEW_FONT_RENDERER
;2003:	CG_LoadFonts();
ADDRGP4 CG_LoadFonts
CALLV
pop
line 2007
;2004:#endif
;2005:
;2006:	// get the gamestate from the client system
;2007:	trap_GetGameState( &cgs.gameState );
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 2010
;2008:
;2009:	// check version
;2010:	s = CG_ConfigString( CS_GAME_VERSION );
CNSTI4 20
ARGI4
ADDRLP4 284
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 284
INDIRP4
ASGNP4
line 2011
;2011:	if ( strstr( s, "defrag-" ) ) {
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $1047
ARGP4
ADDRLP4 288
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1045
line 2012
;2012:		cgs.defrag = qtrue;
ADDRGP4 cgs+149700
CNSTI4 1
ASGNI4
line 2013
;2013:	} else if ( strcmp( s, GAME_VERSION ) ) {
ADDRGP4 $1046
JUMPV
LABELV $1045
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $1051
ARGP4
ADDRLP4 292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1049
line 2014
;2014:		CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
ADDRGP4 $1052
ARGP4
ADDRGP4 $1051
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2015
;2015:	}
LABELV $1049
LABELV $1046
line 2017
;2016:
;2017:	cgs.ospEnc = atoi( CG_ConfigString( 872 ) ) & 1;
CNSTI4 872
ARGI4
ADDRLP4 296
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+149696
ADDRLP4 300
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 2019
;2018:
;2019:	s = CG_ConfigString( CS_LEVEL_START_TIME );
CNSTI4 21
ARGI4
ADDRLP4 304
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 304
INDIRP4
ASGNP4
line 2020
;2020:	cgs.levelStartTime = atoi( s );
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+34820
ADDRLP4 308
INDIRI4
ASGNI4
line 2022
;2021:
;2022:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 2023
;2023:	CG_ParseSysteminfo();
ADDRGP4 CG_ParseSysteminfo
CALLV
pop
line 2026
;2024:
;2025:	// load the new map
;2026:	CG_LoadingString( "collision map" );
ADDRGP4 $1055
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2028
;2027:
;2028:	trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+31508
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 2034
;2029:
;2030:#ifdef MISSIONPACK
;2031:	String_Init();
;2032:#endif
;2033:
;2034:	cg.loading = qtrue;		// force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 2036
;2035:
;2036:	CG_LoadingString( "sounds" );
ADDRGP4 $1058
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2038
;2037:
;2038:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 2040
;2039:
;2040:	CG_LoadingString( "graphics" );
ADDRGP4 $1059
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2042
;2041:
;2042:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 2044
;2043:
;2044:	CG_LoadingString( "clients" );
ADDRGP4 $1060
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2046
;2045:
;2046:	CG_RegisterClients();		// if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 2053
;2047:
;2048:#ifdef MISSIONPACK
;2049:	CG_AssetCache();
;2050:	CG_LoadHudMenu();      // load new hud stuff
;2051:#endif
;2052:
;2053:	cg.loading = qfalse;	// future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 2055
;2054:
;2055:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 2057
;2056:
;2057:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 2060
;2058:
;2059:	// remove the last loading update
;2060:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+109448
CNSTI1 0
ASGNI1
line 2065
;2061:
;2062:	// Make sure we have update values (scores)
;2063:	// CG_SetConfigValues();
;2064:
;2065:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2067
;2066:
;2067:	CG_LoadingString( "" );
ADDRGP4 $194
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2073
;2068:
;2069:#ifdef MISSIONPACK
;2070:	CG_InitTeamChat();
;2071:#endif
;2072:
;2073:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 2075
;2074:
;2075:	trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 2076
;2076:}
LABELV $969
endproc CG_Init 312 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 2086
;2077:
;2078:
;2079:/*
;2080:=================
;2081:CG_Shutdown
;2082:
;2083:Called before every level change or subsystem restart
;2084:=================
;2085:*/
;2086:void CG_Shutdown( void ) {
line 2089
;2087:	// some mods may need to do cleanup work here,
;2088:	// like closing files or archiving session data
;2089:}
LABELV $1063
endproc CG_Shutdown 0 0
export CG_EventHandling
proc CG_EventHandling 0 0
line 2103
;2090:
;2091:
;2092:/*
;2093:==================
;2094:CG_EventHandling
;2095:==================
;2096: type 0 - no event handling
;2097:      1 - team menu
;2098:      2 - scoreboard
;2099:      3 - hud editor
;2100:*/
;2101:#ifndef MISSIONPACK
;2102:void CG_EventHandling( cgame_event_t type ) 
;2103:{
line 2105
;2104:
;2105:}
LABELV $1064
endproc CG_EventHandling 0 0
export CG_SetScoreCatcher
proc CG_SetScoreCatcher 36 4
line 2109
;2106:
;2107:
;2108:void CG_SetScoreCatcher( qboolean enable )
;2109:{
line 2113
;2110:	int	currentCatcher, newCatcher, old_state, new_state;
;2111:	qboolean spectator;
;2112:
;2113:	currentCatcher = trap_Key_GetCatcher();
ADDRLP4 20
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 2115
;2114:
;2115:	if ( currentCatcher & KEYCATCH_CONSOLE || !cg.snap )
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1069
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1066
LABELV $1069
line 2116
;2116:		return;
ADDRGP4 $1065
JUMPV
LABELV $1066
line 2118
;2117:	
;2118:	spectator = cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.demoPlayback || ( cg.snap->ps.pm_flags & PMF_FOLLOW );
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1077
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $1077
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1074
LABELV $1077
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $1075
JUMPV
LABELV $1074
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $1075
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 2120
;2119:
;2120:	if ( enable && spectator ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1078
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1078
line 2121
;2121:		cgs.score_key = trap_Key_GetKey( "+scores" );
ADDRGP4 $1081
ARGP4
ADDRLP4 28
ADDRGP4 trap_Key_GetKey
CALLI4
ASGNI4
ADDRGP4 cgs+149712
ADDRLP4 28
INDIRI4
ASGNI4
line 2122
;2122:		cgs.score_catched = qtrue;
ADDRGP4 cgs+149708
CNSTI4 1
ASGNI4
line 2123
;2123:		newCatcher = currentCatcher | KEYCATCH_CGAME;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2124
;2124:	} else {
ADDRGP4 $1079
JUMPV
LABELV $1078
line 2125
;2125:		cgs.score_catched = qfalse;
ADDRGP4 cgs+149708
CNSTI4 0
ASGNI4
line 2126
;2126:		newCatcher = currentCatcher & ~KEYCATCH_CGAME;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2127
;2127:	}
LABELV $1079
line 2129
;2128:
;2129:	if ( newCatcher != currentCatcher ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1084
line 2130
;2130:		if ( cgs.score_key ) {
ADDRGP4 cgs+149712
INDIRI4
CNSTI4 0
EQI4 $1086
line 2133
;2131:			// keycatcher change may cause reset of all pressed buttons on new engines
;2132:			// so track state of scoreboard key and ignore first upcoming keyup event for it
;2133:			old_state = trap_Key_IsDown( cgs.score_key );
ADDRGP4 cgs+149712
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 2134
;2134:			trap_Key_SetCatcher( newCatcher );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 2135
;2135:			new_state = trap_Key_IsDown( cgs.score_key );
ADDRGP4 cgs+149712
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 2136
;2136:			if ( new_state != old_state ) {
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1087
line 2137
;2137:				cgs.filterKeyUpEvent = qtrue;
ADDRGP4 cgs+149704
CNSTI4 1
ASGNI4
line 2138
;2138:			}
line 2139
;2139:		} else {
ADDRGP4 $1087
JUMPV
LABELV $1086
line 2140
;2140:			trap_Key_SetCatcher( newCatcher );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 2141
;2141:		}
LABELV $1087
line 2142
;2142:	}
LABELV $1084
line 2143
;2143:}
LABELV $1065
endproc CG_SetScoreCatcher 36 4
export CG_KeyEvent
proc CG_KeyEvent 0 4
line 2147
;2144:
;2145:
;2146:void CG_KeyEvent( int key, qboolean down ) 
;2147:{
line 2149
;2148:	// process scoreboard clicks etc.
;2149:	if ( cgs.score_catched && down ) 
ADDRGP4 cgs+149708
INDIRI4
CNSTI4 0
EQI4 $1095
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1095
line 2150
;2150:	{
line 2151
;2151:		if ( key == /*K_TAB*/ cgs.score_key )
ADDRFP4 0
INDIRI4
ADDRGP4 cgs+149712
INDIRI4
NEI4 $1098
line 2152
;2152:			return;
ADDRGP4 $1094
JUMPV
LABELV $1098
line 2153
;2153:		if ( key == /*K_MOUSE1*/178 )
ADDRFP4 0
INDIRI4
CNSTI4 178
NEI4 $1101
line 2154
;2154:			CG_ScoreboardClick();
ADDRGP4 CG_ScoreboardClick
CALLV
pop
ADDRGP4 $1102
JUMPV
LABELV $1101
line 2156
;2155:		else
;2156:			CG_SetScoreCatcher( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
LABELV $1102
line 2157
;2157:	}
LABELV $1095
line 2158
;2158:}
LABELV $1094
endproc CG_KeyEvent 0 4
export CG_MouseEvent
proc CG_MouseEvent 8 0
line 2162
;2159:
;2160:
;2161:void CG_MouseEvent( int x, int y )
;2162:{
line 2163
;2163:	cgs.cursorX += x * cgs.cursorScaleR;
ADDRLP4 0
ADDRGP4 cgs+149716
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31440
INDIRF4
MULF4
ADDF4
ASGNF4
line 2164
;2164:	cgs.cursorY += y * cgs.cursorScaleR;
ADDRLP4 4
ADDRGP4 cgs+149720
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31440
INDIRF4
MULF4
ADDF4
ASGNF4
line 2166
;2165:
;2166:	if ( cgs.cursorX < cgs.screenXmin ) {
ADDRGP4 cgs+149716
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
GEF4 $1108
line 2167
;2167:		cgs.cursorX = cgs.screenXmin;
ADDRGP4 cgs+149716
ADDRGP4 cgs+31452
INDIRF4
ASGNF4
line 2168
;2168:	}
ADDRGP4 $1109
JUMPV
LABELV $1108
line 2169
;2169:	else if ( cgs.cursorX > cgs.screenXmax ) {
ADDRGP4 cgs+149716
INDIRF4
ADDRGP4 cgs+31456
INDIRF4
LEF4 $1114
line 2170
;2170:		cgs.cursorX = cgs.screenXmax;
ADDRGP4 cgs+149716
ADDRGP4 cgs+31456
INDIRF4
ASGNF4
line 2171
;2171:	}
LABELV $1114
LABELV $1109
line 2173
;2172:
;2173:	if ( cgs.cursorY < cgs.screenYmin ) {
ADDRGP4 cgs+149720
INDIRF4
ADDRGP4 cgs+31460
INDIRF4
GEF4 $1120
line 2174
;2174:		cgs.cursorY = cgs.screenYmin;
ADDRGP4 cgs+149720
ADDRGP4 cgs+31460
INDIRF4
ASGNF4
line 2175
;2175:	}
ADDRGP4 $1121
JUMPV
LABELV $1120
line 2176
;2176:	else if ( cgs.cursorY > cgs.screenYmax ) {
ADDRGP4 cgs+149720
INDIRF4
ADDRGP4 cgs+31464
INDIRF4
LEF4 $1126
line 2177
;2177:		cgs.cursorY = cgs.screenYmax;
ADDRGP4 cgs+149720
ADDRGP4 cgs+31464
INDIRF4
ASGNF4
line 2178
;2178:	}
LABELV $1126
LABELV $1121
line 2179
;2179:}
LABELV $1103
endproc CG_MouseEvent 8 0
bss
export cg_hudFiles
align 4
LABELV cg_hudFiles
skip 272
export trap_GetValue
align 4
LABELV trap_GetValue
skip 4
export trap_R_AddLinearLightToScene
align 4
LABELV trap_R_AddLinearLightToScene
skip 4
export trap_R_AddRefEntityToScene2
align 4
LABELV trap_R_AddRefEntityToScene2
skip 4
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
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_LoadMenus
import eventnames
export cg_followKiller
align 4
LABELV cg_followKiller
skip 272
export cg_fovAdjust
align 4
LABELV cg_fovAdjust
skip 272
export cg_deadBodyDarken
align 4
LABELV cg_deadBodyDarken
skip 272
export cg_teamColors
align 4
LABELV cg_teamColors
skip 272
export cg_teamModel
align 4
LABELV cg_teamModel
skip 272
export cg_enemyColors
align 4
LABELV cg_enemyColors
skip 272
export cg_enemyModel
align 4
LABELV cg_enemyModel
skip 272
export cg_hitSounds
align 4
LABELV cg_hitSounds
skip 272
export cg_trueLightning
align 4
LABELV cg_trueLightning
skip 272
export cg_oldPlasma
align 4
LABELV cg_oldPlasma
skip 272
export cg_oldRocket
align 4
LABELV cg_oldRocket
skip 272
export cg_oldRail
align 4
LABELV cg_oldRail
skip 272
export cg_noProjectileTrail
align 4
LABELV cg_noProjectileTrail
skip 272
export cg_noTaunt
align 4
LABELV cg_noTaunt
skip 272
export cg_bigFont
align 4
LABELV cg_bigFont
skip 272
export cg_smallFont
align 4
LABELV cg_smallFont
skip 272
export cg_cameraMode
align 4
LABELV cg_cameraMode
skip 272
export cg_timescale
align 4
LABELV cg_timescale
skip 272
export cg_timescaleFadeSpeed
align 4
LABELV cg_timescaleFadeSpeed
skip 272
export cg_timescaleFadeEnd
align 4
LABELV cg_timescaleFadeEnd
skip 272
export cg_cameraOrbitDelay
align 4
LABELV cg_cameraOrbitDelay
skip 272
export cg_cameraOrbit
align 4
LABELV cg_cameraOrbit
skip 272
export cg_smoothClients
align 4
LABELV cg_smoothClients
skip 272
export cg_scorePlum
align 4
LABELV cg_scorePlum
skip 272
export cg_teamChatsOnly
align 4
LABELV cg_teamChatsOnly
skip 272
export cg_drawFriend
align 4
LABELV cg_drawFriend
skip 272
export cg_deferPlayers
align 4
LABELV cg_deferPlayers
skip 272
export cg_predictItems
align 4
LABELV cg_predictItems
skip 272
export cg_blood
align 4
LABELV cg_blood
skip 272
export cg_paused
align 4
LABELV cg_paused
skip 272
export cg_buildScript
align 4
LABELV cg_buildScript
skip 272
export cg_forceModel
align 4
LABELV cg_forceModel
skip 272
export cg_stats
align 4
LABELV cg_stats
skip 272
export cg_teamChatHeight
align 4
LABELV cg_teamChatHeight
skip 272
export cg_teamChatTime
align 4
LABELV cg_teamChatTime
skip 272
export cg_drawSpeed
align 4
LABELV cg_drawSpeed
skip 272
export cg_drawAttacker
align 4
LABELV cg_drawAttacker
skip 272
export cg_lagometer
align 4
LABELV cg_lagometer
skip 272
export cg_thirdPerson
align 4
LABELV cg_thirdPerson
skip 272
export cg_thirdPersonAngle
align 4
LABELV cg_thirdPersonAngle
skip 272
export cg_thirdPersonRange
align 4
LABELV cg_thirdPersonRange
skip 272
export cg_zoomFov
align 4
LABELV cg_zoomFov
skip 272
export cg_fov
align 4
LABELV cg_fov
skip 272
export cg_simpleItems
align 4
LABELV cg_simpleItems
skip 272
export cg_ignore
align 4
LABELV cg_ignore
skip 272
export cg_autoswitch
align 4
LABELV cg_autoswitch
skip 272
export cg_tracerLength
align 4
LABELV cg_tracerLength
skip 272
export cg_tracerWidth
align 4
LABELV cg_tracerWidth
skip 272
export cg_tracerChance
align 4
LABELV cg_tracerChance
skip 272
export cg_viewsize
align 4
LABELV cg_viewsize
skip 272
export cg_drawGun
align 4
LABELV cg_drawGun
skip 272
export cg_gun_z
align 4
LABELV cg_gun_z
skip 272
export cg_gun_y
align 4
LABELV cg_gun_y
skip 272
export cg_gun_x
align 4
LABELV cg_gun_x
skip 272
export cg_gun_frame
align 4
LABELV cg_gun_frame
skip 272
export cg_brassTime
align 4
LABELV cg_brassTime
skip 272
export cg_addMarks
align 4
LABELV cg_addMarks
skip 272
export cg_footsteps
align 4
LABELV cg_footsteps
skip 272
export cg_showmiss
align 4
LABELV cg_showmiss
skip 272
export cg_noPlayerAnims
align 4
LABELV cg_noPlayerAnims
skip 272
export cg_nopredict
align 4
LABELV cg_nopredict
skip 272
export cg_errorDecay
align 4
LABELV cg_errorDecay
skip 272
export cg_railTrailRadius
align 4
LABELV cg_railTrailRadius
skip 272
export cg_railTrailTime
align 4
LABELV cg_railTrailTime
skip 272
export cg_debugEvents
align 4
LABELV cg_debugEvents
skip 272
export cg_debugPosition
align 4
LABELV cg_debugPosition
skip 272
export cg_debugAnim
align 4
LABELV cg_debugAnim
skip 272
export cg_animSpeed
align 4
LABELV cg_animSpeed
skip 272
export cg_draw2D
align 4
LABELV cg_draw2D
skip 272
export cg_drawStatus
align 4
LABELV cg_drawStatus
skip 272
export cg_crosshairHealth
align 4
LABELV cg_crosshairHealth
skip 272
export cg_crosshairSize
align 4
LABELV cg_crosshairSize
skip 272
export cg_crosshairY
align 4
LABELV cg_crosshairY
skip 272
export cg_crosshairX
align 4
LABELV cg_crosshairX
skip 272
export cg_drawWeaponSelect
align 4
LABELV cg_drawWeaponSelect
skip 272
export cg_teamOverlayUserinfo
align 4
LABELV cg_teamOverlayUserinfo
skip 272
export cg_drawTeamOverlay
align 4
LABELV cg_drawTeamOverlay
skip 272
export cg_drawRewards
align 4
LABELV cg_drawRewards
skip 272
export cg_drawCrosshairNames
align 4
LABELV cg_drawCrosshairNames
skip 272
export cg_drawCrosshair
align 4
LABELV cg_drawCrosshair
skip 272
export cg_drawAmmoWarning
align 4
LABELV cg_drawAmmoWarning
skip 272
export cg_drawIcons
align 4
LABELV cg_drawIcons
skip 272
export cg_draw3dIcons
align 4
LABELV cg_draw3dIcons
skip 272
export cg_drawSnapshot
align 4
LABELV cg_drawSnapshot
skip 272
export cg_drawFPS
align 4
LABELV cg_drawFPS
skip 272
export cg_drawTimer
align 4
LABELV cg_drawTimer
skip 272
export cg_gibs
align 4
LABELV cg_gibs
skip 272
export cg_shadows
align 4
LABELV cg_shadows
skip 272
export cg_swingSpeed
align 4
LABELV cg_swingSpeed
skip 272
export cg_bobroll
align 4
LABELV cg_bobroll
skip 272
export cg_bobpitch
align 4
LABELV cg_bobpitch
skip 272
export cg_bobup
align 4
LABELV cg_bobup
skip 272
export cg_runroll
align 4
LABELV cg_runroll
skip 272
export cg_runpitch
align 4
LABELV cg_runpitch
skip 272
export cg_centertime
align 4
LABELV cg_centertime
skip 272
import cg_markPolys
export cg_items
align 4
LABELV cg_items
skip 7168
export cg_weapons
align 4
LABELV cg_weapons
skip 2176
export cg_entities
align 4
LABELV cg_entities
skip 757760
export cg
align 4
LABELV cg
skip 149092
export cgs
align 4
LABELV cgs
skip 149724
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
LABELV $1081
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1060
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1059
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $1058
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $1055
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1052
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 47
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1051
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 113
byte 1 51
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $1047
byte 1 100
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 45
byte 1 0
align 1
LABELV $995
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 50
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $992
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 95
byte 1 103
byte 1 108
byte 1 111
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $989
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $986
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $983
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $981
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 82
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 84
byte 1 111
byte 1 83
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 95
byte 1 81
byte 1 51
byte 1 69
byte 1 0
align 1
LABELV $978
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 82
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 82
byte 1 101
byte 1 102
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 84
byte 1 111
byte 1 83
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $973
byte 1 47
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $966
byte 1 67
byte 1 71
byte 1 95
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $941
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $927
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $910
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $903
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $900
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $897
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $894
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $891
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $888
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $885
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $873
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $870
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $867
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $864
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $861
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
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
LABELV $858
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
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
LABELV $855
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $852
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $849
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 109
byte 1 48
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $846
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 48
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $843
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $840
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $837
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $832
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $829
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $826
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 108
byte 1 101
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $823
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $820
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $817
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $814
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $811
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $808
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $805
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 98
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $802
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $799
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $796
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $793
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $790
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $787
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $784
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 101
byte 1 0
align 1
LABELV $776
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $773
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $770
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $767
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 112
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $764
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 112
byte 1 111
byte 1 108
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $761
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 51
byte 1 0
align 1
LABELV $757
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $753
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 49
byte 1 0
align 1
LABELV $750
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $746
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $742
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $739
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 98
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $736
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $728
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $725
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $722
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 98
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $719
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 114
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $711
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 122
byte 1 101
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $708
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 122
byte 1 101
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $705
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $702
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $699
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
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
LABELV $696
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $693
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $690
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $687
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $684
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $681
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $678
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $671
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $668
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $665
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 117
byte 1 98
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $662
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
LABELV $659
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $656
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $653
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 49
byte 1 0
align 1
LABELV $650
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $647
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 82
byte 1 97
byte 1 103
byte 1 101
byte 1 80
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $644
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $641
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $638
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $635
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $632
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $629
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $626
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $623
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 53
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $619
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 52
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $615
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 51
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $611
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $607
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $598
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 97
byte 1 0
align 1
LABELV $593
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 115
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $592
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 110
byte 1 105
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $591
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $590
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $589
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 120
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $588
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $587
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 117
byte 1 114
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $586
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $585
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $584
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $583
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $580
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 50
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $577
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $574
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
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $571
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
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $568
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
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $565
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $562
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 108
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $559
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $556
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $553
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $550
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
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $547
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
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $544
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
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $525
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 97
byte 1 110
byte 1 107
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $521
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $517
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $513
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $509
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $505
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $502
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
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $497
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $494
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $491
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $488
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $485
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $482
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $479
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $476
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $473
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $470
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 105
byte 1 108
byte 1 105
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $467
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 110
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $464
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $461
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
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
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $458
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $455
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 49
byte 1 48
byte 1 48
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $451
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 55
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $447
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 53
byte 1 48
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $443
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 50
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $440
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
byte 1 108
byte 1 97
byte 1 110
byte 1 100
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $437
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
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $434
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $431
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
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $428
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $425
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $422
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
byte 1 103
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $419
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
byte 1 103
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $416
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
byte 1 103
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $413
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
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 112
byte 1 108
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $410
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
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $407
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
byte 1 119
byte 1 101
byte 1 97
byte 1 114
byte 1 111
byte 1 102
byte 1 102
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $404
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $401
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 101
byte 1 116
byte 1 98
byte 1 121
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $398
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $395
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $392
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 121
byte 1 115
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $389
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $386
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $383
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $380
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $377
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $369
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $366
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $363
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $360
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $357
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $352
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $349
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $346
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $343
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $340
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $337
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $334
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $326
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $323
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $320
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $317
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $314
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $311
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 51
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $308
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 50
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $305
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $302
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $299
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 53
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $296
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $292
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $286
byte 1 80
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $215
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
LABELV $214
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $213
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $206
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $200
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $199
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 65
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 66
byte 1 111
byte 1 100
byte 1 121
byte 1 68
byte 1 97
byte 1 114
byte 1 107
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $197
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $196
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $195
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $194
byte 1 0
align 1
LABELV $193
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $192
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $191
byte 1 48
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $190
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 117
byte 1 101
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $189
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $188
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $187
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $186
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $185
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $184
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $183
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $182
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $181
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $180
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $179
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 108
byte 1 117
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $178
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $177
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $176
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $175
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $174
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
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $173
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
LABELV $172
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $171
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $170
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $169
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $168
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $167
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $166
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
LABELV $165
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $164
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $163
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
LABELV $162
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $161
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $160
byte 1 51
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $159
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $158
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
LABELV $157
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
LABELV $156
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $155
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
LABELV $154
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $153
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $152
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $151
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $150
byte 1 99
byte 1 103
byte 1 95
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
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $147
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $144
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
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
LABELV $143
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $141
byte 1 48
byte 1 46
byte 1 51
byte 1 0
align 1
LABELV $140
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $139
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $136
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $135
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $134
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 50
byte 1 0
align 1
LABELV $133
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $132
byte 1 51
byte 1 0
align 1
LABELV $131
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 90
byte 1 0
align 1
LABELV $129
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 89
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 88
byte 1 0
align 1
LABELV $127
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 82
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $126
byte 1 52
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $125
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $122
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $117
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $116
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $115
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $114
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $113
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 82
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $112
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $111
byte 1 52
byte 1 0
align 1
LABELV $110
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $109
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $108
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $107
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $106
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 51
byte 1 100
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $103
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $102
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $101
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 50
byte 1 68
byte 1 0
align 1
LABELV $99
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 0
align 1
LABELV $98
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $97
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $96
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
LABELV $95
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $94
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $93
byte 1 50
byte 1 50
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $92
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $91
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $90
byte 1 49
byte 1 0
align 1
LABELV $89
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $88
byte 1 48
byte 1 0
align 1
LABELV $87
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 118
byte 1 109
byte 1 77
byte 1 97
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 0
