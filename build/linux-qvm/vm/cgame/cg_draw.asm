data
export drawTeamOverlayModificationCount
align 4
LABELV drawTeamOverlayModificationCount
byte 4 -1
code
proc CG_DrawField 64 20
file "../../../../code/cgame/cg_draw.c"
line 192
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_draw.c -- draw all of the graphical elements during
;4:// active (after loading) gameplay
;5:
;6:#include "cg_local.h"
;7:
;8:#ifdef MISSIONPACK
;9:#include "../ui/ui_shared.h"
;10:
;11:// used for scoreboard
;12:extern displayContextDef_t cgDC;
;13:menuDef_t *menuScoreboard = NULL;
;14:#else
;15:int drawTeamOverlayModificationCount = -1;
;16:#endif
;17:
;18:int sortedTeamPlayers[TEAM_MAXOVERLAY];
;19:int	numSortedTeamPlayers;
;20:
;21:char systemChat[256];
;22:char teamChat1[256];
;23:char teamChat2[256];
;24:
;25:#ifdef MISSIONPACK
;26:
;27:int CG_Text_Width(const char *text, float scale, int limit) {
;28:  int count,len;
;29:	float out;
;30:	glyphInfo_t *glyph;
;31:	float useScale;
;32:// FIXME: see ui_main.c, same problem
;33://	const unsigned char *s = text;
;34:	const char *s = text;
;35:	fontInfo_t *font = &cgDC.Assets.textFont;
;36:	if (scale <= cg_smallFont.value) {
;37:		font = &cgDC.Assets.smallFont;
;38:	} else if (scale > cg_bigFont.value) {
;39:		font = &cgDC.Assets.bigFont;
;40:	}
;41:	useScale = scale * font->glyphScale;
;42:  out = 0;
;43:  if (text) {
;44:    len = strlen(text);
;45:		if (limit > 0 && len > limit) {
;46:			len = limit;
;47:		}
;48:		count = 0;
;49:		while (s && *s && count < len) {
;50:			if ( Q_IsColorString(s) ) {
;51:				s += 2;
;52:				continue;
;53:			} else {
;54:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;55:				out += glyph->xSkip;
;56:				s++;
;57:				count++;
;58:			}
;59:    }
;60:  }
;61:  return out * useScale;
;62:}
;63:
;64:int CG_Text_Height(const char *text, float scale, int limit) {
;65:  int len, count;
;66:	float max;
;67:	glyphInfo_t *glyph;
;68:	float useScale;
;69:// TTimo: FIXME
;70://	const unsigned char *s = text;
;71:	const char *s = text;
;72:	fontInfo_t *font = &cgDC.Assets.textFont;
;73:	if (scale <= cg_smallFont.value) {
;74:		font = &cgDC.Assets.smallFont;
;75:	} else if (scale > cg_bigFont.value) {
;76:		font = &cgDC.Assets.bigFont;
;77:	}
;78:	useScale = scale * font->glyphScale;
;79:  max = 0;
;80:  if (text) {
;81:    len = strlen(text);
;82:		if (limit > 0 && len > limit) {
;83:			len = limit;
;84:		}
;85:		count = 0;
;86:		while (s && *s && count < len) {
;87:			if ( Q_IsColorString(s) ) {
;88:				s += 2;
;89:				continue;
;90:			} else {
;91:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;92:	      if (max < glyph->height) {
;93:		      max = glyph->height;
;94:			  }
;95:				s++;
;96:				count++;
;97:			}
;98:    }
;99:  }
;100:  return max * useScale;
;101:}
;102:
;103:void CG_Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
;104:  float w, h;
;105:  w = width * scale;
;106:  h = height * scale;
;107:  CG_AdjustFrom640( &x, &y, &w, &h );
;108:  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
;109:}
;110:
;111:void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) {
;112:  int len, count;
;113:	vec4_t newColor;
;114:	glyphInfo_t *glyph;
;115:	float useScale;
;116:	fontInfo_t *font = &cgDC.Assets.textFont;
;117:	if (scale <= cg_smallFont.value) {
;118:		font = &cgDC.Assets.smallFont;
;119:	} else if (scale > cg_bigFont.value) {
;120:		font = &cgDC.Assets.bigFont;
;121:	}
;122:	useScale = scale * font->glyphScale;
;123:  if (text) {
;124:// TTimo: FIXME
;125://		const unsigned char *s = text;
;126:		const char *s = text;
;127:		trap_R_SetColor( color );
;128:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
;129:    len = strlen(text);
;130:		if (limit > 0 && len > limit) {
;131:			len = limit;
;132:		}
;133:		count = 0;
;134:		while (s && *s && count < len) {
;135:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;136:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;137:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;138:			if ( Q_IsColorString( s ) ) {
;139:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
;140:				newColor[3] = color[3];
;141:				trap_R_SetColor( newColor );
;142:				s += 2;
;143:				continue;
;144:			} else {
;145:				float yadj = useScale * glyph->top;
;146:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
;147:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
;148:					colorBlack[3] = newColor[3];
;149:					trap_R_SetColor( colorBlack );
;150:					CG_Text_PaintChar(x + ofs, y - yadj + ofs, 
;151:														glyph->imageWidth,
;152:														glyph->imageHeight,
;153:														useScale, 
;154:														glyph->s,
;155:														glyph->t,
;156:														glyph->s2,
;157:														glyph->t2,
;158:														glyph->glyph);
;159:					colorBlack[3] = 1.0;
;160:					trap_R_SetColor( newColor );
;161:				}
;162:				CG_Text_PaintChar(x, y - yadj, 
;163:													glyph->imageWidth,
;164:													glyph->imageHeight,
;165:													useScale, 
;166:													glyph->s,
;167:													glyph->t,
;168:													glyph->s2,
;169:													glyph->t2,
;170:													glyph->glyph);
;171:				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight, cgDC.Assets.textFont.glyphs[text[i]].glyph);
;172:				x += (glyph->xSkip * useScale) + adjust;
;173:				s++;
;174:				count++;
;175:			}
;176:    }
;177:	  trap_R_SetColor( NULL );
;178:  }
;179:}
;180:
;181:
;182:#endif
;183:
;184:/*
;185:==============
;186:CG_DrawField
;187:
;188:Draws large numbers for status bar and powerups
;189:==============
;190:*/
;191:#ifndef MISSIONPACK
;192:static void CG_DrawField (int x, int y, int width, int value) {
line 197
;193:	char	num[16], *ptr;
;194:	int		l;
;195:	int		frame;
;196:
;197:	if ( width < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $73
line 198
;198:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 202
;199:	}
;200:
;201:	// draw number string
;202:	if ( width > 5 ) {
ADDRFP4 8
INDIRI4
CNSTI4 5
LEI4 $75
line 203
;203:		width = 5;
ADDRFP4 8
CNSTI4 5
ASGNI4
line 204
;204:	}
LABELV $75
line 206
;205:
;206:	switch ( width ) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $77
ADDRLP4 28
INDIRI4
CNSTI4 4
GTI4 $77
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $107-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $107
address $79
address $86
address $93
address $100
code
LABELV $79
line 208
;207:	case 1:
;208:		value = value > 9 ? 9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9
LEI4 $81
ADDRLP4 32
CNSTI4 9
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
ADDRLP4 32
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $82
ADDRFP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 209
;209:		value = value < 0 ? 0 : value;
ADDRFP4 12
INDIRI4
CNSTI4 0
GEI4 $84
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $84
ADDRLP4 36
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $85
ADDRFP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 210
;210:		break;
ADDRGP4 $78
JUMPV
LABELV $86
line 212
;211:	case 2:
;212:		value = value > 99 ? 99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 99
LEI4 $88
ADDRLP4 40
CNSTI4 99
ASGNI4
ADDRGP4 $89
JUMPV
LABELV $88
ADDRLP4 40
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $89
ADDRFP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 213
;213:		value = value < -9 ? -9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -9
GEI4 $91
ADDRLP4 44
CNSTI4 -9
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 44
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $92
ADDRFP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 214
;214:		break;
ADDRGP4 $78
JUMPV
LABELV $93
line 216
;215:	case 3:
;216:		value = value > 999 ? 999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 999
LEI4 $95
ADDRLP4 48
CNSTI4 999
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $95
ADDRLP4 48
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $96
ADDRFP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 217
;217:		value = value < -99 ? -99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -99
GEI4 $98
ADDRLP4 52
CNSTI4 -99
ASGNI4
ADDRGP4 $99
JUMPV
LABELV $98
ADDRLP4 52
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $99
ADDRFP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 218
;218:		break;
ADDRGP4 $78
JUMPV
LABELV $100
line 220
;219:	case 4:
;220:		value = value > 9999 ? 9999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9999
LEI4 $102
ADDRLP4 56
CNSTI4 9999
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $102
ADDRLP4 56
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $103
ADDRFP4 12
ADDRLP4 56
INDIRI4
ASGNI4
line 221
;221:		value = value < -999 ? -999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -999
GEI4 $105
ADDRLP4 60
CNSTI4 -999
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $105
ADDRLP4 60
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $106
ADDRFP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 222
;222:		break;
LABELV $77
LABELV $78
line 225
;223:	}
;224:
;225:	Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $109
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 226
;226:	l = strlen(num);
ADDRLP4 12
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 227
;227:	if (l > width)
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $110
line 228
;228:		l = width;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $110
line 229
;229:	x += 2 + CHAR_WIDTH*(width - l);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 5
LSHI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 231
;230:
;231:	ptr = num;
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $113
JUMPV
LABELV $112
line 233
;232:	while (*ptr && l)
;233:	{
line 234
;234:		if (*ptr == '-')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $115
line 235
;235:			frame = STAT_MINUS;
ADDRLP4 8
CNSTI4 10
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $115
line 237
;236:		else
;237:			frame = *ptr -'0';
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
LABELV $116
line 239
;238:
;239:		CG_DrawPic( x,y, CHAR_WIDTH, CHAR_HEIGHT, cgs.media.numberShaders[frame] );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+300
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 240
;240:		x += CHAR_WIDTH;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 241
;241:		ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 242
;242:		l--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 243
;243:	}
LABELV $113
line 232
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $119
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $112
LABELV $119
line 244
;244:}
LABELV $72
endproc CG_DrawField 64 20
export CG_Draw3DModel
proc CG_Draw3DModel 508 16
line 253
;245:#endif // MISSIONPACK
;246:
;247:
;248:/*
;249:================
;250:CG_Draw3DModel
;251:================
;252:*/
;253:void CG_Draw3DModel( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles ) {
line 257
;254:	refdef_t		refdef;
;255:	refEntity_t		ent;
;256:
;257:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $125
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
NEI4 $121
LABELV $125
line 258
;258:		return;
ADDRGP4 $120
JUMPV
LABELV $121
line 261
;259:	}
;260:
;261:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 263
;262:
;263:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 265
;264:
;265:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 266
;266:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 267
;267:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 268
;268:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 269
;269:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 270
;270:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 272
;271:
;272:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 274
;273:
;274:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 276
;275:
;276:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 277
;277:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 279
;278:
;279:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 280
;280:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 281
;281:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 282
;282:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 284
;283:
;284:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 286
;285:
;286:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 287
;287:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 288
;288:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 289
;289:}
LABELV $120
endproc CG_Draw3DModel 508 16
export CG_Draw3DModelColor
proc CG_Draw3DModelColor 544 16
line 298
;290:
;291:
;292:
;293:/*
;294:================
;295:CG_Draw3DModel
;296:================
;297:*/
;298:void CG_Draw3DModelColor( float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles, vec3_t color ) {
line 302
;299:	refdef_t		refdef;
;300:	refEntity_t		ent;
;301:
;302:	if ( !cg_draw3dIcons.integer || !cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $145
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
NEI4 $141
LABELV $145
line 303
;303:		return;
ADDRGP4 $140
JUMPV
LABELV $141
line 306
;304:	}
;305:
;306:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 308
;307:
;308:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 310
;309:
;310:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 311
;311:	AnglesToAxis( angles, ent.axis );
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 312
;312:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 313
;313:	ent.hModel = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 314
;314:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 315
;315:	ent.renderfx = RF_NOSHADOW;		// no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 317
;316:
;317:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 319
;318:
;319:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 321
;320:
;321:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 322
;322:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 324
;323:
;324:	refdef.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 325
;325:	refdef.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 326
;326:	refdef.width = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 327
;327:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 329
;328:
;329:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 331
;330:
;331:	ent.shaderRGBA[0] = color[0] * 255;
ADDRLP4 512
ADDRFP4 32
INDIRP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 516
CNSTF4 1325400064
ASGNF4
ADDRLP4 512
INDIRF4
ADDRLP4 516
INDIRF4
LTF4 $162
ADDRLP4 508
ADDRLP4 512
INDIRF4
ADDRLP4 516
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $163
JUMPV
LABELV $162
ADDRLP4 508
ADDRLP4 512
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $163
ADDRLP4 368+116
ADDRLP4 508
INDIRU4
CVUU1 4
ASGNU1
line 332
;332:	ent.shaderRGBA[1] = color[1] * 255;
ADDRLP4 524
ADDRFP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 528
CNSTF4 1325400064
ASGNF4
ADDRLP4 524
INDIRF4
ADDRLP4 528
INDIRF4
LTF4 $167
ADDRLP4 520
ADDRLP4 524
INDIRF4
ADDRLP4 528
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $168
JUMPV
LABELV $167
ADDRLP4 520
ADDRLP4 524
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $168
ADDRLP4 368+116+1
ADDRLP4 520
INDIRU4
CVUU1 4
ASGNU1
line 333
;333:	ent.shaderRGBA[2] = color[2] * 255;
ADDRLP4 536
ADDRFP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 540
CNSTF4 1325400064
ASGNF4
ADDRLP4 536
INDIRF4
ADDRLP4 540
INDIRF4
LTF4 $172
ADDRLP4 532
ADDRLP4 536
INDIRF4
ADDRLP4 540
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $173
JUMPV
LABELV $172
ADDRLP4 532
ADDRLP4 536
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $173
ADDRLP4 368+116+2
ADDRLP4 532
INDIRU4
CVUU1 4
ASGNU1
line 334
;334:	ent.shaderRGBA[3] = 255;
ADDRLP4 368+116+3
CNSTU1 255
ASGNU1
line 336
;335:
;336:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 337
;337:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 338
;338:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 339
;339:}
LABELV $140
endproc CG_Draw3DModelColor 544 16
export CG_DrawHead
proc CG_DrawHead 56 36
line 349
;340:
;341:
;342:/*
;343:================
;344:CG_DrawHead
;345:
;346:Used for both the status bar and the scoreboard
;347:================
;348:*/
;349:void CG_DrawHead( float x, float y, float w, float h, int clientNum, vec3_t headAngles ) {
line 356
;350:	clipHandle_t	cm;
;351:	clientInfo_t	*ci;
;352:	float			len;
;353:	vec3_t			origin;
;354:	vec3_t			mins, maxs;
;355:
;356:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
ADDRFP4 16
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 358
;357:
;358:	if ( cg_draw3dIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $178
line 359
;359:		cm = ci->headModel;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 360
;360:		if ( !cm ) {
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $181
line 361
;361:			return;
ADDRGP4 $176
JUMPV
LABELV $181
line 365
;362:		}
;363:
;364:		// offset the origin y and z to center the head
;365:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 367
;366:
;367:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 4+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
CNSTF4 3204448256
MULF4
ASGNF4
line 368
;368:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 4+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 372
;369:
;370:		// calculate distance so the head nearly fills the box
;371:		// assume heads are taller than wide
;372:		len = 0.7 * ( maxs[2] - mins[2] );		
ADDRLP4 44
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
CNSTF4 1060320051
MULF4
ASGNF4
line 373
;373:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 4
ADDRLP4 44
INDIRF4
CNSTF4 1081003604
MULF4
ASGNF4
line 376
;374:
;375:		// allow per-model tweaking
;376:		VectorAdd( origin, ci->headOffset, origin );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 400
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRF4
ADDF4
ASGNF4
line 378
;377:
;378:		CG_Draw3DModelColor( x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles, ci->headColor );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRGP4 CG_Draw3DModelColor
CALLV
pop
line 379
;379:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $179
JUMPV
LABELV $178
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $195
line 380
;380:		trap_R_SetColor ( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 381
;381:		CG_DrawPic( x, y, w, h, ci->modelIcon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 382
;382:	}
LABELV $195
LABELV $179
line 385
;383:
;384:	// if they are deferred, draw a cross out
;385:	if ( ci->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $198
line 386
;386:		trap_R_SetColor ( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 387
;387:		CG_DrawPic( x, y, w, h, cgs.media.deferShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 cgs+148692+132
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 388
;388:	}
LABELV $198
line 389
;389:}
LABELV $176
endproc CG_DrawHead 56 36
export CG_DrawFlagModel
proc CG_DrawFlagModel 68 32
line 398
;390:
;391:/*
;392:================
;393:CG_DrawFlagModel
;394:
;395:Used for both the status bar and the scoreboard
;396:================
;397:*/
;398:void CG_DrawFlagModel( float x, float y, float w, float h, int team, qboolean force2D ) {
line 405
;399:	qhandle_t		cm;
;400:	float			len;
;401:	vec3_t			origin, angles;
;402:	vec3_t			mins, maxs;
;403:	qhandle_t		handle;
;404:
;405:	if ( !force2D && cg_draw3dIcons.integer ) {
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $203
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $203
line 407
;406:
;407:		VectorClear( angles );
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 409
;408:
;409:		cm = cgs.media.redFlagModel;
ADDRLP4 48
ADDRGP4 cgs+148692+36
INDIRI4
ASGNI4
line 412
;410:
;411:		// offset the origin y and z to center the flag
;412:		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 414
;413:
;414:		origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 12+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
CNSTF4 3204448256
MULF4
ASGNF4
line 415
;415:		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 419
;416:
;417:		// calculate distance so the flag nearly fills the box
;418:		// assume heads are taller than wide
;419:		len = 0.5 * ( maxs[2] - mins[2] );		
ADDRLP4 52
ADDRLP4 36+8
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 420
;420:		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 12
ADDRLP4 52
INDIRF4
CNSTF4 1081003604
MULF4
ASGNF4
line 422
;421:
;422:		angles[YAW] = 60 * sin( ( cg.time % TMOD_2000 ) / 2000.0 );;
ADDRGP4 cg+107604
INDIRI4
CNSTI4 5730265
MODI4
CVIF4 4
CNSTF4 973279855
MULF4
ARGF4
ADDRLP4 60
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
CNSTF4 1114636288
MULF4
ASGNF4
line 424
;423:
;424:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $220
line 425
;425:			handle = cgs.media.redFlagModel;
ADDRLP4 56
ADDRGP4 cgs+148692+36
INDIRI4
ASGNI4
line 426
;426:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $221
JUMPV
LABELV $220
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $224
line 427
;427:			handle = cgs.media.blueFlagModel;
ADDRLP4 56
ADDRGP4 cgs+148692+40
INDIRI4
ASGNI4
line 428
;428:		} else if( team == TEAM_FREE ) {
ADDRGP4 $225
JUMPV
LABELV $224
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $202
line 429
;429:			handle = cgs.media.neutralFlagModel;
ADDRLP4 56
ADDRGP4 cgs+148692+44
INDIRI4
ASGNI4
line 430
;430:		} else {
line 431
;431:			return;
LABELV $229
LABELV $225
LABELV $221
line 433
;432:		}
;433:		CG_Draw3DModel( x, y, w, h, handle, 0, origin, angles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 434
;434:	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $204
JUMPV
LABELV $203
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $232
line 437
;435:		gitem_t *item;
;436:
;437:		if( team == TEAM_RED ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $235
line 438
;438:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 439
;439:		} else if( team == TEAM_BLUE ) {
ADDRGP4 $236
JUMPV
LABELV $235
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $237
line 440
;440:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 441
;441:		} else if( team == TEAM_FREE ) {
ADDRGP4 $238
JUMPV
LABELV $237
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $202
line 442
;442:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 443
;443:		} else {
line 444
;444:			return;
LABELV $240
LABELV $238
LABELV $236
line 446
;445:		}
;446:		if (item) {
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $241
line 447
;447:		  CG_DrawPic( x, y, w, h, cg_items[ ITEM_INDEX(item) ].icon );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 448
;448:		}
LABELV $241
line 449
;449:	}
LABELV $232
LABELV $204
line 450
;450:}
LABELV $202
endproc CG_DrawFlagModel 68 32
proc CG_DrawStatusBarHead 48 24
line 460
;451:
;452:/*
;453:================
;454:CG_DrawStatusBarHead
;455:
;456:================
;457:*/
;458:#ifndef MISSIONPACK
;459:
;460:static void CG_DrawStatusBarHead( float x ) {
line 465
;461:	vec3_t		angles;
;462:	float		size, stretch;
;463:	float		frac;
;464:
;465:	VectorClear( angles );
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4+4
CNSTF4 0
ASGNF4
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 467
;466:
;467:	if ( cg.damageTime && cg.time - cg.damageTime < DAMAGE_TIME ) {
ADDRGP4 cg+117860
INDIRI4
CNSTI4 0
EQI4 $247
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117860
INDIRI4
SUBI4
CNSTI4 500
GEI4 $247
line 468
;468:		frac = (float)(cg.time - cg.damageTime ) / DAMAGE_TIME;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117860
INDIRI4
SUBI4
CVIF4 4
CNSTF4 990057071
MULF4
ASGNF4
line 469
;469:		size = ICON_SIZE * 1.25 * ( 1.5 - frac * 0.5 );
ADDRLP4 16
CNSTF4 1069547520
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
SUBF4
CNSTF4 1114636288
MULF4
ASGNF4
line 471
;470:
;471:		stretch = size - ICON_SIZE * 1.25;
ADDRLP4 20
ADDRLP4 16
INDIRF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 473
;472:		// kick in the direction of damage
;473:		x -= stretch * 0.5 + cg.damageX * stretch * 0.5;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ASGNF4
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1056964608
MULF4
ADDRGP4 cg+117864
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CNSTF4 1056964608
MULF4
ADDF4
SUBF4
ASGNF4
line 475
;474:
;475:		cg.headStartYaw = 180 + cg.damageX * 45;
ADDRGP4 cg+117896
ADDRGP4 cg+117864
INDIRF4
CNSTF4 1110704128
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 477
;476:
;477:		cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+117884
ADDRLP4 32
INDIRF4
CNSTF4 1101004800
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 478
;478:		cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 40
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+117880
ADDRLP4 40
INDIRF4
CNSTF4 1084227584
MULF4
ASGNF4
line 480
;479:
;480:		cg.headStartTime = cg.time;
ADDRGP4 cg+117900
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 481
;481:		cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+117888
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1031406068
MULF4
ADDF4
CVFI4 4
ASGNI4
line 482
;482:	} else {
ADDRGP4 $248
JUMPV
LABELV $247
line 483
;483:		if ( cg.time >= cg.headEndTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117888
INDIRI4
LTI4 $263
line 485
;484:			// select a new head angle
;485:			cg.headStartYaw = cg.headEndYaw;
ADDRGP4 cg+117896
ADDRGP4 cg+117884
INDIRF4
ASGNF4
line 486
;486:			cg.headStartPitch = cg.headEndPitch;
ADDRGP4 cg+117892
ADDRGP4 cg+117880
INDIRF4
ASGNF4
line 487
;487:			cg.headStartTime = cg.headEndTime;
ADDRGP4 cg+117900
ADDRGP4 cg+117888
INDIRI4
ASGNI4
line 488
;488:			cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+117888
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1031406068
MULF4
ADDF4
CVFI4 4
ASGNI4
line 490
;489:
;490:			cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+117884
ADDRLP4 32
INDIRF4
CNSTF4 1101004800
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 491
;491:			cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 40
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+117880
ADDRLP4 40
INDIRF4
CNSTF4 1084227584
MULF4
ASGNF4
line 492
;492:		}
LABELV $263
line 494
;493:
;494:		size = ICON_SIZE * 1.25;
ADDRLP4 16
CNSTF4 1114636288
ASGNF4
line 495
;495:	}
LABELV $248
line 498
;496:
;497:	// if the server was frozen for a while we may have a bad head start time
;498:	if ( cg.headStartTime > cg.time ) {
ADDRGP4 cg+117900
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $277
line 499
;499:		cg.headStartTime = cg.time;
ADDRGP4 cg+117900
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 500
;500:	}
LABELV $277
line 502
;501:
;502:	frac = ( cg.time - cg.headStartTime ) / (float)( cg.headEndTime - cg.headStartTime );
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117900
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg+117888
INDIRI4
ADDRGP4 cg+117900
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 503
;503:	frac = frac * frac * ( 3 - 2 * frac );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
MULF4
SUBF4
MULF4
ASGNF4
line 504
;504:	angles[YAW] = cg.headStartYaw + ( cg.headEndYaw - cg.headStartYaw ) * frac;
ADDRLP4 4+4
ADDRGP4 cg+117896
INDIRF4
ADDRGP4 cg+117884
INDIRF4
ADDRGP4 cg+117896
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 505
;505:	angles[PITCH] = cg.headStartPitch + ( cg.headEndPitch - cg.headStartPitch ) * frac;
ADDRLP4 4
ADDRGP4 cg+117892
INDIRF4
ADDRGP4 cg+117880
INDIRF4
ADDRGP4 cg+117892
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 507
;506:
;507:	CG_DrawHead( x, cgs.screenYmax + 1 - size, size, size, cg.snap->ps.clientNum, angles );
ADDRFP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 508
;508:}
LABELV $244
endproc CG_DrawStatusBarHead 48 24
proc CG_DrawStatusBarFlag 0 24
line 519
;509:#endif // MISSIONPACK
;510:
;511:
;512:/*
;513:================
;514:CG_DrawStatusBarFlag
;515:
;516:================
;517:*/
;518:#ifndef MISSIONPACK
;519:static void CG_DrawStatusBarFlag( float x, int team ) {
line 520
;520:	CG_DrawFlagModel( x, cgs.screenYmax + 1 - ICON_SIZE, ICON_SIZE, ICON_SIZE, team, qfalse );
ADDRFP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 521
;521:}
LABELV $296
endproc CG_DrawStatusBarFlag 0 24
export CG_DrawTeamBackground
proc CG_DrawTeamBackground 16 20
line 532
;522:#endif // MISSIONPACK
;523:
;524:
;525:/*
;526:================
;527:CG_DrawTeamBackground
;528:
;529:================
;530:*/
;531:void CG_DrawTeamBackground( int x, int y, int w, int h, float alpha, int team )
;532:{
line 535
;533:	vec4_t		hcolor;
;534:
;535:	hcolor[3] = alpha;
ADDRLP4 0+12
ADDRFP4 16
INDIRF4
ASGNF4
line 536
;536:	if ( team == TEAM_RED ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
NEI4 $300
line 537
;537:		hcolor[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 538
;538:		hcolor[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 539
;539:		hcolor[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 540
;540:	} else if ( team == TEAM_BLUE ) {
ADDRGP4 $301
JUMPV
LABELV $300
ADDRFP4 20
INDIRI4
CNSTI4 2
NEI4 $298
line 541
;541:		hcolor[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 542
;542:		hcolor[1] = 0.1f;
ADDRLP4 0+4
CNSTF4 1036831949
ASGNF4
line 543
;543:		hcolor[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 544
;544:	} else {
line 545
;545:		return;
LABELV $305
LABELV $301
line 547
;546:	}
;547:	trap_R_SetColor( hcolor );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 548
;548:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+148692+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 549
;549:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 550
;550:}
LABELV $298
endproc CG_DrawTeamBackground 16 20
data
align 4
LABELV $311
byte 4 1065353216
byte 4 1060152279
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1056964608
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
code
proc CG_DrawStatusBar 72 32
line 560
;551:
;552:
;553:/*
;554:================
;555:CG_DrawStatusBar
;556:================
;557:*/
;558:#ifndef MISSIONPACK
;559:#define STATUSBAR_HEIGHT 60
;560:static void CG_DrawStatusBar( void ) {
line 579
;561:	int			color;
;562:	centity_t	*cent;
;563:	playerState_t	*ps;
;564:	int			value;
;565:	vec4_t		hcolor;
;566:	vec3_t		angles;
;567:	vec3_t		origin;
;568:	float		y;
;569:#ifdef MISSIONPACK
;570:	qhandle_t	handle;
;571:#endif
;572:	static float colors[4][4] = { 
;573://		{ 0.2, 1.0, 0.2, 1.0 } , { 1.0, 0.2, 0.2, 1.0 }, {0.5, 0.5, 0.5, 1} };
;574:		{ 1.0f, 0.69f, 0.0f, 1.0f },    // normal
;575:		{ 1.0f, 0.2f, 0.2f, 1.0f },     // low health
;576:		{ 0.5f, 0.5f, 0.5f, 1.0f },     // weapon firing
;577:		{ 1.0f, 1.0f, 1.0f, 1.0f } };   // health > 100
;578:
;579:	if ( cg_drawStatus.integer == 0 ) {
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
NEI4 $312
line 580
;580:		return;
ADDRGP4 $310
JUMPV
LABELV $312
line 584
;581:	}
;582:
;583:	// draw the team background
;584:	CG_DrawTeamBackground( cgs.screenXmin, cgs.screenYmax - STATUSBAR_HEIGHT + 1,
ADDRGP4 cgs+31452
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1114636288
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ARGI4
ADDRGP4 cgs+31456
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ARGI4
CNSTI4 60
ARGI4
CNSTF4 1051260355
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 588
;585:		cgs.screenXmax - cgs.screenXmin + 1, STATUSBAR_HEIGHT, 
;586:		0.33f, cg.snap->ps.persistant[ PERS_TEAM ] );
;587:
;588:	y = cgs.screenYmax + 1 - ICON_SIZE;
ADDRLP4 24
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 590
;589:
;590:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 591
;591:	ps = &cg.snap->ps;
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 593
;592:
;593:	VectorClear( angles );
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8+4
CNSTF4 0
ASGNF4
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 596
;594:
;595:	// draw any 3D icons first, so the changes back to 2D are minimized
;596:	if ( cent->currentState.weapon && cg_weapons[ cent->currentState.weapon ].ammoModel ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $325
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
CNSTI4 0
EQI4 $325
line 597
;597:		origin[0] = 70;
ADDRLP4 28
CNSTF4 1116471296
ASGNF4
line 598
;598:		origin[1] = 0;
ADDRLP4 28+4
CNSTF4 0
ASGNF4
line 599
;599:		origin[2] = 0;
ADDRLP4 28+8
CNSTF4 0
ASGNF4
line 600
;600:		angles[YAW] = 90 + 20 * sin( ( cg.time % TMOD_1000 ) / 1000.0 );
ADDRGP4 cg+107604
INDIRI4
CNSTI4 5730265
MODI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRLP4 64
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 64
INDIRF4
CNSTF4 1101004800
MULF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 601
;601:		CG_Draw3DModel( CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE,
CNSTF4 1120403456
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 603
;602:					   cg_weapons[ cent->currentState.weapon ].ammoModel, 0, origin, angles );
;603:	}
LABELV $325
line 605
;604:
;605:	CG_DrawStatusBarHead( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE );
CNSTF4 1133412352
ARGF4
ADDRGP4 CG_DrawStatusBarHead
CALLV
pop
line 607
;606:
;607:	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
ADDRGP4 cg+107636+312+28
INDIRI4
CNSTI4 0
EQI4 $333
line 608
;608:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_RED );
CNSTF4 1134985216
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 609
;609:	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $334
JUMPV
LABELV $333
ADDRGP4 cg+107636+312+32
INDIRI4
CNSTI4 0
EQI4 $338
line 610
;610:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_BLUE );
CNSTF4 1134985216
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 611
;611:	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $339
JUMPV
LABELV $338
ADDRGP4 cg+107636+312+36
INDIRI4
CNSTI4 0
EQI4 $343
line 612
;612:		CG_DrawStatusBarFlag( 185 + CHAR_WIDTH*3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_FREE );
CNSTF4 1134985216
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 613
;613:	}
LABELV $343
LABELV $339
LABELV $334
line 615
;614:
;615:	if ( ps->stats[ STAT_ARMOR ] ) {
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
EQI4 $348
line 616
;616:		origin[0] = 90;
ADDRLP4 28
CNSTF4 1119092736
ASGNF4
line 617
;617:		origin[1] = 0;
ADDRLP4 28+4
CNSTF4 0
ASGNF4
line 618
;618:		origin[2] = -10;
ADDRLP4 28+8
CNSTF4 3240099840
ASGNF4
line 619
;619:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 8+4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
CNSTI4 360
MULI4
CVIF4 4
CNSTF4 973078528
MULF4
ASGNF4
line 620
;620:		CG_Draw3DModel( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE,
CNSTF4 1139474432
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRGP4 cgs+148692+120
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 622
;621:					   cgs.media.armorModel, 0, origin, angles );
;622:	}
LABELV $348
line 640
;623:#ifdef MISSIONPACK
;624:	if( cgs.gametype == GT_HARVESTER ) {
;625:		origin[0] = 90;
;626:		origin[1] = 0;
;627:		origin[2] = -10;
;628:		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
;629:		if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;630:			handle = cgs.media.redCubeModel;
;631:		} else {
;632:			handle = cgs.media.blueCubeModel;
;633:		}
;634:		CG_Draw3DModel( 640 - (TEXT_ICON_SPACE + ICON_SIZE), 416, ICON_SIZE, ICON_SIZE, handle, 0, origin, angles );
;635:	}
;636:#endif
;637:	//
;638:	// ammo
;639:	//
;640:	if ( cent->currentState.weapon ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $356
line 641
;641:		value = ps->ammo[cent->currentState.weapon];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ASGNI4
line 642
;642:		if ( value > -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
LEI4 $358
line 643
;643:			if ( cg.predictedPlayerState.weaponstate == WEAPON_FIRING
ADDRGP4 cg+107636+148
INDIRI4
CNSTI4 3
NEI4 $360
ADDRGP4 cg+107636+44
INDIRI4
CNSTI4 100
LEI4 $360
line 644
;644:				&& cg.predictedPlayerState.weaponTime > 100 ) {
line 646
;645:				// draw as dark grey when reloading
;646:				color = 2;	// dark grey
ADDRLP4 40
CNSTI4 2
ASGNI4
line 647
;647:			} else {
ADDRGP4 $361
JUMPV
LABELV $360
line 648
;648:				if ( value >= 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $366
line 649
;649:					color = 0;	// yellow
ADDRLP4 40
CNSTI4 0
ASGNI4
line 650
;650:				} else {
ADDRGP4 $367
JUMPV
LABELV $366
line 651
;651:					color = 1;	// red
ADDRLP4 40
CNSTI4 1
ASGNI4
line 652
;652:				}
LABELV $367
line 653
;653:			}
LABELV $361
line 655
;654:#ifdef USE_NEW_FONT_RENDERER
;655:			CG_SelectFont( 1 );
CNSTI4 1
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 656
;656:			CG_DrawString( CHAR_WIDTH*3, y, va( "%i", value ), colors[ color ], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 $109
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1119879168
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $311
ADDP4
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 657
;657:			CG_SelectFont( 0 );
CNSTI4 0
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 662
;658:#else
;659:			trap_R_SetColor( colors[color] );
;660:			CG_DrawField( 0, y, 3, value );
;661:#endif
;662:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 665
;663:
;664:			// if we didn't draw a 3D icon, draw a 2D icon for ammo
;665:			if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
NEI4 $368
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $368
line 668
;666:				qhandle_t	icon;
;667:
;668:				icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
ADDRLP4 68
ADDRGP4 cg+107636+144
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+72
ADDP4
INDIRI4
ASGNI4
line 669
;669:				if ( icon ) {
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $375
line 670
;670:					CG_DrawPic( CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, icon );
CNSTF4 1120403456
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 671
;671:				}
LABELV $375
line 672
;672:			}
LABELV $368
line 673
;673:		}
LABELV $358
line 674
;674:	}
LABELV $356
line 679
;675:
;676:	//
;677:	// health
;678:	//
;679:	value = ps->stats[STAT_HEALTH];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 680
;680:	if ( value > 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
LEI4 $377
line 681
;681:		color = 3; // white
ADDRLP4 40
CNSTI4 3
ASGNI4
line 682
;682:	} else if ( value > 25 ) {
ADDRGP4 $378
JUMPV
LABELV $377
ADDRLP4 0
INDIRI4
CNSTI4 25
LEI4 $379
line 683
;683:		color = 0; 	// yellow
ADDRLP4 40
CNSTI4 0
ASGNI4
line 684
;684:	} else if (value > 0) {
ADDRGP4 $380
JUMPV
LABELV $379
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $381
line 685
;685:		color = (cg.time >> 8) & 1;	// red/yellow flashing
ADDRLP4 40
ADDRGP4 cg+107604
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 686
;686:	} else {
ADDRGP4 $382
JUMPV
LABELV $381
line 687
;687:		color = 1; // red
ADDRLP4 40
CNSTI4 1
ASGNI4
line 688
;688:	}
LABELV $382
LABELV $380
LABELV $378
line 691
;689:
;690:#ifdef USE_NEW_FONT_RENDERER
;691:	CG_SelectFont( 1 );
CNSTI4 1
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 692
;692:	CG_DrawString( 185 + CHAR_WIDTH*3, y, va( "%i", value ), colors[ color ], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 $109
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1133281280
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $311
ADDP4
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 693
;693:	CG_SelectFont( 0 );
CNSTI4 0
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 700
;694:#else
;695:	trap_R_SetColor( colors[ color ] );
;696:	// stretch the health up when taking damage
;697:	CG_DrawField( 185, y, 3, value );
;698:#endif
;699:	
;700:	CG_ColorForHealth( hcolor );
ADDRLP4 44
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 701
;701:	trap_R_SetColor( hcolor );
ADDRLP4 44
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 706
;702:
;703:	//
;704:	// armor
;705:	//
;706:	value = ps->stats[STAT_ARMOR];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 707
;707:	if ( value > 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $384
line 709
;708:#ifdef USE_NEW_FONT_RENDERER
;709:		CG_SelectFont( 1 );
CNSTI4 1
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 710
;710:		CG_DrawString( 370 + CHAR_WIDTH*3, y, va( "%i", value ), colors[ color ], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 $109
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1139343360
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $311
ADDP4
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 711
;711:		CG_SelectFont( 0 );
CNSTI4 0
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 716
;712:#else
;713:		trap_R_SetColor( colors[0] );
;714:		CG_DrawField( 370, y, 3, value );
;715:#endif
;716:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 718
;717:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;718:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
NEI4 $386
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $386
line 719
;719:			CG_DrawPic( 370 + CHAR_WIDTH*3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, cgs.media.armorIcon );
CNSTF4 1139474432
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRGP4 cgs+148692+124
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 720
;720:		}
LABELV $386
line 721
;721:	}
LABELV $384
line 746
;722:
;723:#ifdef MISSIONPACK
;724:	//
;725:	// cubes
;726:	//
;727:	if( cgs.gametype == GT_HARVESTER ) {
;728:		value = ps->generic1;
;729:		if( value > 99 ) {
;730:			value = 99;
;731:		}
;732:		trap_R_SetColor( colors[0] );
;733:		CG_DrawField (640 - (CHAR_WIDTH*2 + TEXT_ICON_SPACE + ICON_SIZE), y, 2, value);
;734:		trap_R_SetColor( NULL );
;735:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;736:		if ( !cg_draw3dIcons.integer && cg_drawIcons.integer ) {
;737:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
;738:				handle = cgs.media.redCubeIcon;
;739:			} else {
;740:				handle = cgs.media.blueCubeIcon;
;741:			}
;742:			CG_DrawPic( 640 - (TEXT_ICON_SPACE + ICON_SIZE), y, ICON_SIZE, ICON_SIZE, handle );
;743:		}
;744:	}
;745:#endif
;746:}
LABELV $310
endproc CG_DrawStatusBar 72 32
proc CG_DrawAttacker 64 32
line 763
;747:#endif
;748:
;749:/*
;750:===========================================================================================
;751:
;752:  UPPER RIGHT CORNER
;753:
;754:===========================================================================================
;755:*/
;756:
;757:/*
;758:================
;759:CG_DrawAttacker
;760:
;761:================
;762:*/
;763:static float CG_DrawAttacker( float y ) {
line 772
;764:	int			t;
;765:	float		size;
;766:	vec3_t		angles;
;767:	const char	*info;
;768:	const char	*name;
;769:	int			clientNum;
;770:	vec4_t		color;
;771:
;772:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $393
line 773
;773:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $392
JUMPV
LABELV $393
line 776
;774:	}
;775:
;776:	if ( !cg.attackerTime ) {
ADDRGP4 cg+117588
INDIRI4
CNSTI4 0
NEI4 $397
line 777
;777:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $392
JUMPV
LABELV $397
line 780
;778:	}
;779:
;780:	clientNum = cg.predictedPlayerState.persistant[PERS_ATTACKER];
ADDRLP4 0
ADDRGP4 cg+107636+248+24
INDIRI4
ASGNI4
line 781
;781:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS || clientNum == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $407
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $407
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $403
LABELV $407
line 782
;782:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $392
JUMPV
LABELV $403
line 785
;783:	}
;784:
;785:	t = cg.time - cg.attackerTime;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117588
INDIRI4
SUBI4
ASGNI4
line 786
;786:	if ( t > ATTACKER_HEAD_TIME ) {
ADDRLP4 36
INDIRI4
CNSTI4 10000
LEI4 $410
line 787
;787:		cg.attackerTime = 0;
ADDRGP4 cg+117588
CNSTI4 0
ASGNI4
line 788
;788:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $392
JUMPV
LABELV $410
line 791
;789:	}
;790:
;791:	size = ICON_SIZE * 1.25;
ADDRLP4 4
CNSTF4 1114636288
ASGNF4
line 793
;792:
;793:	angles[PITCH] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 794
;794:	angles[YAW] = 180;
ADDRLP4 24+4
CNSTF4 1127481344
ASGNF4
line 795
;795:	angles[ROLL] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 796
;796:	CG_DrawHead( cgs.screenXmax + 1 - size, y, size, size, clientNum, angles );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 798
;797:
;798:	info = CG_ConfigString( CS_PLAYERS + clientNum );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 56
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 56
INDIRP4
ASGNP4
line 799
;799:	name = Info_ValueForKey(  info, "n" );
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 60
INDIRP4
ASGNP4
line 800
;800:	y += size;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 802
;801:
;802:	VectorSet( color, 1, 1, 1 );
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
ADDRLP4 8+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 8+8
CNSTF4 1065353216
ASGNF4
line 803
;803:	color[3] = 0.5f;
ADDRLP4 8+12
CNSTF4 1056964608
ASGNF4
line 805
;804:
;805:	CG_DrawString( cgs.screenXmax - 4, y, name, color, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_PROPORTIONAL | DS_RIGHT );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 807
;806:
;807:	return y + BIGCHAR_HEIGHT + 2;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1073741824
ADDF4
RETF4
LABELV $392
endproc CG_DrawAttacker 64 32
proc CG_DrawSpeedMeter 8 32
line 816
;808:}
;809:
;810:
;811:/*
;812:================
;813:CG_DrawSpeedMeter
;814:================
;815:*/
;816:static float CG_DrawSpeedMeter( float y ) {
line 820
;817:	const char *s;
;818:
;819:	/* speed meter can get in the way of the scoreboard */
;820:	if ( cg.scoreBoardShowing ) {
ADDRGP4 cg+115360
INDIRI4
CNSTI4 0
EQI4 $422
line 821
;821:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $421
JUMPV
LABELV $422
line 824
;822:	}
;823:
;824:	s = va( "%1.0fups", cg.xyspeed );
ADDRGP4 $425
ARGP4
ADDRGP4 cg+117948
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 826
;825:
;826:	if ( cg_drawSpeed.integer == 1 ) {
ADDRGP4 cg_drawSpeed+12
INDIRI4
CNSTI4 1
NEI4 $427
line 828
;827:		/* top left-hand corner of screen */
;828:		CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 829
;829:		return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
ADDRGP4 $421
JUMPV
LABELV $427
line 830
;830:	} else {
line 832
;831:		/* center of screen */
;832:		CG_DrawString( 320, 300, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
CNSTF4 1133903872
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 833
;833:		return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $421
endproc CG_DrawSpeedMeter 8 32
proc CG_DrawSnapshot 8 32
line 843
;834:	}
;835:}
;836:
;837:
;838:/*
;839:==================
;840:CG_DrawSnapshot
;841:==================
;842:*/
;843:static float CG_DrawSnapshot( float y ) {
line 846
;844:	const char *s;
;845:
;846:	s = va( "time:%i snap:%i cmd:%i", cg.snap->serverTime, 
ADDRGP4 $432
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31468
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 849
;847:		cg.latestSnapshotNum, cgs.serverCommandSequence );
;848:
;849:	CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 851
;850:
;851:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $431
endproc CG_DrawSnapshot 8 32
bss
align 4
LABELV $438
skip 16
align 4
LABELV $439
skip 4
align 4
LABELV $440
skip 4
code
proc CG_DrawFPS 36 32
line 861
;852:}
;853:
;854:
;855:/*
;856:==================
;857:CG_DrawFPS
;858:==================
;859:*/
;860:#define	FPS_FRAMES	4
;861:static float CG_DrawFPS( float y ) {
line 872
;862:	const char	*s;
;863:	static int	previousTimes[FPS_FRAMES];
;864:	static int	index;
;865:	int		i, total;
;866:	int		fps;
;867:	static	int	previous;
;868:	int		t, frameTime;
;869:
;870:	// don't use serverTime, because that will be drifting to
;871:	// correct for internet lag changes, timescales, timedemos, etc
;872:	t = trap_Milliseconds();
ADDRLP4 24
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 873
;873:	frameTime = t - previous;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 $440
INDIRI4
SUBI4
ASGNI4
line 874
;874:	previous = t;
ADDRGP4 $440
ADDRLP4 8
INDIRI4
ASGNI4
line 876
;875:
;876:	previousTimes[index % FPS_FRAMES] = frameTime;
ADDRGP4 $439
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $438
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 877
;877:	index++;
ADDRLP4 28
ADDRGP4 $439
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 878
;878:	if ( index > FPS_FRAMES ) {
ADDRGP4 $439
INDIRI4
CNSTI4 4
LEI4 $441
line 880
;879:		// average multiple frames together to smooth changes out a bit
;880:		total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 881
;881:		for ( i = 0 ; i < FPS_FRAMES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $443
line 882
;882:			total += previousTimes[i];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $438
ADDP4
INDIRI4
ADDI4
ASGNI4
line 883
;883:		}
LABELV $444
line 881
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $443
line 884
;884:		if ( !total ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $447
line 885
;885:			total = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 886
;886:		}
LABELV $447
line 887
;887:		fps = 1000 * FPS_FRAMES / total;
ADDRLP4 20
CNSTI4 4000
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 889
;888:
;889:		s = va( "%ifps", fps );
ADDRGP4 $449
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 890
;890:		CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 891
;891:	}
LABELV $441
line 893
;892:
;893:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $437
endproc CG_DrawFPS 36 32
proc CG_DrawTimer 20 32
line 902
;894:}
;895:
;896:
;897:/*
;898:=================
;899:CG_DrawTimer
;900:=================
;901:*/
;902:static float CG_DrawTimer( float y ) {
line 907
;903:	const char	*s;
;904:	int			mins, seconds;
;905:	int			msec;
;906:
;907:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 12
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+34820
INDIRI4
SUBI4
ASGNI4
line 909
;908:
;909:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 910
;910:	mins = seconds / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 911
;911:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 60
MULI4
SUBI4
ASGNI4
line 913
;912:
;913:	s = va( "%i:%02i", mins, seconds );
ADDRGP4 $454
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 914
;914:	CG_DrawString( cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 916
;915:
;916:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $451
endproc CG_DrawTimer 20 32
proc CG_DrawTeamOverlay 120 32
line 925
;917:}
;918:
;919:
;920:/*
;921:=================
;922:CG_DrawTeamOverlay
;923:=================
;924:*/
;925:static float CG_DrawTeamOverlay( float y, qboolean right, qboolean upper ) {
line 937
;926:	int x, w, h, xx;
;927:	int i, j, len;
;928:	const char *p;
;929:	vec4_t		hcolor;
;930:	int pwidth, lwidth;
;931:	int plyrs;
;932:	char st[16];
;933:	clientInfo_t *ci;
;934:	gitem_t	*item;
;935:	int ret_y, count;
;936:
;937:	if ( !cg_drawTeamOverlay.integer ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
NEI4 $457
line 938
;938:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $456
JUMPV
LABELV $457
line 941
;939:	}
;940:
;941:	if ( cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
EQI4 $460
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
EQI4 $460
line 942
;942:		return y; // Not on any team
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $456
JUMPV
LABELV $460
line 945
;943:	}
;944:
;945:	plyrs = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 948
;946:
;947:	// max player name width
;948:	pwidth = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 949
;949:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 8
LEI4 $465
ADDRLP4 92
CNSTI4 8
ASGNI4
ADDRGP4 $466
JUMPV
LABELV $465
ADDRLP4 92
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $466
ADDRLP4 48
ADDRLP4 92
INDIRI4
ASGNI4
line 950
;950:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $470
JUMPV
LABELV $467
line 951
;951:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 952
;952:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $472
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $472
line 953
;953:			plyrs++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 954
;954:			len = CG_DrawStrlen(ci->name);
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 100
INDIRI4
ASGNI4
line 955
;955:			if (len > pwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $475
line 956
;956:				pwidth = len;
ADDRLP4 56
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $475
line 957
;957:		}
LABELV $472
line 958
;958:	}
LABELV $468
line 950
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $470
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $467
line 960
;959:
;960:	if (!plyrs)
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $477
line 961
;961:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $456
JUMPV
LABELV $477
line 963
;962:
;963:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
ADDRLP4 56
INDIRI4
CNSTI4 12
LEI4 $479
line 964
;964:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
ADDRLP4 56
CNSTI4 12
ASGNI4
LABELV $479
line 967
;965:
;966:	// max location name width
;967:	lwidth = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 968
;968:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $481
line 969
;969:		p = CG_ConfigString(CS_LOCATIONS + i);
ADDRLP4 8
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 96
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 96
INDIRP4
ASGNP4
line 970
;970:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $485
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $485
line 971
;971:			len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 104
INDIRI4
ASGNI4
line 972
;972:			if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $487
line 973
;973:				lwidth = len;
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $487
line 974
;974:		}
LABELV $485
line 975
;975:	}
LABELV $482
line 968
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $481
line 977
;976:
;977:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
ADDRLP4 44
INDIRI4
CNSTI4 16
LEI4 $489
line 978
;978:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
ADDRLP4 44
CNSTI4 16
ASGNI4
LABELV $489
line 980
;979:
;980:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
ADDRLP4 80
ADDRLP4 56
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CNSTI4 3
LSHI4
CNSTI4 32
ADDI4
CNSTI4 56
ADDI4
ASGNI4
line 982
;981:
;982:	if ( right )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $491
line 983
;983:		x = cgs.screenXmax + 1 - w;
ADDRLP4 52
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 80
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
ADDRGP4 $492
JUMPV
LABELV $491
line 985
;984:	else
;985:		x = cgs.screenXmin;
ADDRLP4 52
ADDRGP4 cgs+31452
INDIRF4
CVFI4 4
ASGNI4
LABELV $492
line 987
;986:
;987:	h = plyrs * TINYCHAR_HEIGHT;
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 989
;988:
;989:	if ( upper ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $495
line 990
;990:		ret_y = y + h;
ADDRLP4 88
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 991
;991:	} else {
ADDRGP4 $496
JUMPV
LABELV $495
line 992
;992:		y -= h;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 993
;993:		ret_y = y;
ADDRLP4 88
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 994
;994:	}
LABELV $496
line 996
;995:
;996:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $497
line 997
;997:		hcolor[0] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 998
;998:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 999
;999:		hcolor[2] = 0.0f;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 1000
;1000:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 1001
;1001:	} else { // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 $498
JUMPV
LABELV $497
line 1002
;1002:		hcolor[0] = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 1003
;1003:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 1004
;1004:		hcolor[2] = 1.0f;
ADDRLP4 24+8
CNSTF4 1065353216
ASGNF4
line 1005
;1005:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 1006
;1006:	}
LABELV $498
line 1007
;1007:	trap_R_SetColor( hcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1008
;1008:	CG_DrawPic( x, y, w, h, cgs.media.teamStatusBar );
ADDRLP4 52
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+148692+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1009
;1009:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1011
;1010:
;1011:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $511
JUMPV
LABELV $508
line 1012
;1012:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1013
;1013:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $513
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $513
line 1015
;1014:
;1015:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
ADDRLP4 100
CNSTF4 1065353216
ASGNF4
ADDRLP4 24+12
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 100
INDIRF4
ASGNF4
line 1017
;1016:
;1017:			xx = x + TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 1019
;1018:
;1019:			CG_DrawString( xx, y, ci->name, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH, DS_PROPORTIONAL );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 12
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1021
;1020:
;1021:			if (lwidth) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $519
line 1022
;1022:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 104
INDIRP4
ASGNP4
line 1023
;1023:				if (!p || !*p)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $521
LABELV $523
line 1024
;1024:					p = "unknown";
ADDRLP4 20
ADDRGP4 $524
ASGNP4
LABELV $521
line 1025
;1025:				len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 112
INDIRI4
ASGNI4
line 1026
;1026:				if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $525
line 1027
;1027:					len = lwidth;
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $525
line 1031
;1028:
;1029://				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth + 
;1030://					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
;1031:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 16
ADDI4
ADDRLP4 56
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 1032
;1032:				CG_DrawString( xx, y, p, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXLOCATION_WIDTH, DS_PROPORTIONAL );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 16
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1033
;1033:			}
LABELV $519
line 1035
;1034:
;1035:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 1037
;1036:
;1037:			Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
ADDRLP4 60
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $527
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1039
;1038:
;1039:			xx = x + TINYCHAR_WIDTH * 3 + 
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 24
ADDI4
ADDRLP4 56
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ADDRLP4 44
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 1042
;1040:				TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
;1041:
;1042:			CG_DrawString( xx, y, st, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0, 0 );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 60
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1045
;1043:
;1044:			// draw weapon icon
;1045:			xx += TINYCHAR_WIDTH * 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 1047
;1046:
;1047:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $528
line 1048
;1048:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1050
;1049:					cg_weapons[ci->curWeapon].weaponIcon );
;1050:			} else {
ADDRGP4 $529
JUMPV
LABELV $528
line 1051
;1051:				CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 cgs+148692+132
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1053
;1052:					cgs.media.deferShader );
;1053:			}
LABELV $529
line 1056
;1054:
;1055:			// Draw powerup icons
;1056:			if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $534
line 1057
;1057:				xx = x;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 1058
;1058:			} else {
ADDRGP4 $535
JUMPV
LABELV $534
line 1059
;1059:				xx = x + w - TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 8
SUBI4
ASGNI4
line 1060
;1060:			}
LABELV $535
line 1061
;1061:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $536
line 1062
;1062:				if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $540
line 1064
;1063:
;1064:					item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 112
INDIRP4
ASGNP4
line 1066
;1065:
;1066:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $542
line 1067
;1067:						CG_DrawPic( xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1069
;1068:						trap_R_RegisterShader( item->icon ) );
;1069:						if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $544
line 1070
;1070:							xx -= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1071
;1071:						} else {
ADDRGP4 $545
JUMPV
LABELV $544
line 1072
;1072:							xx += TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 1073
;1073:						}
LABELV $545
line 1074
;1074:					}
LABELV $542
line 1075
;1075:				}
LABELV $540
line 1076
;1076:			}
LABELV $537
line 1061
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $536
line 1078
;1077:
;1078:			y += TINYCHAR_HEIGHT;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1079
;1079:		}
LABELV $513
line 1080
;1080:	}
LABELV $509
line 1011
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $511
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $508
line 1082
;1081:
;1082:	return ret_y;
ADDRLP4 88
INDIRI4
CVIF4 4
RETF4
LABELV $456
endproc CG_DrawTeamOverlay 120 32
proc CG_DrawUpperRight 12 12
line 1093
;1083:}
;1084:
;1085:
;1086:/*
;1087:=====================
;1088:CG_DrawUpperRight
;1089:
;1090:=====================
;1091:*/
;1092:static void CG_DrawUpperRight(stereoFrame_t stereoFrame)
;1093:{
line 1096
;1094:	float	y;
;1095:
;1096:	y = cgs.screenYmin;
ADDRLP4 0
ADDRGP4 cgs+31460
INDIRF4
ASGNF4
line 1098
;1097:
;1098:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 1 ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $548
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 1
NEI4 $548
line 1099
;1099:		y = CG_DrawTeamOverlay( y, qtrue, qtrue );
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1100
;1100:	} 
LABELV $548
line 1101
;1101:	if ( cg_drawSnapshot.integer ) {
ADDRGP4 cg_drawSnapshot+12
INDIRI4
CNSTI4 0
EQI4 $552
line 1102
;1102:		y = CG_DrawSnapshot( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawSnapshot
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1103
;1103:	}
LABELV $552
line 1104
;1104:	if (cg_drawFPS.integer && (stereoFrame == STEREO_CENTER || stereoFrame == STEREO_RIGHT)) {
ADDRGP4 cg_drawFPS+12
INDIRI4
CNSTI4 0
EQI4 $555
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $558
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $555
LABELV $558
line 1105
;1105:		y = CG_DrawFPS( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawFPS
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1106
;1106:	}
LABELV $555
line 1107
;1107:	if ( cg_drawSpeed.integer ) {
ADDRGP4 cg_drawSpeed+12
INDIRI4
CNSTI4 0
EQI4 $559
line 1108
;1108:		y = CG_DrawSpeedMeter( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawSpeedMeter
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1109
;1109:	}	
LABELV $559
line 1110
;1110:	if ( cg_drawTimer.integer ) {
ADDRGP4 cg_drawTimer+12
INDIRI4
CNSTI4 0
EQI4 $562
line 1111
;1111:		y = CG_DrawTimer( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawTimer
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1112
;1112:	}
LABELV $562
line 1113
;1113:	if ( cg_drawAttacker.integer ) {
ADDRGP4 cg_drawAttacker+12
INDIRI4
CNSTI4 0
EQI4 $565
line 1114
;1114:		y = CG_DrawAttacker( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawAttacker
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1115
;1115:	}
LABELV $565
line 1116
;1116:}
LABELV $546
endproc CG_DrawUpperRight 12 12
proc CG_DrawScores 76 32
line 1135
;1117:
;1118:
;1119:/*
;1120:===========================================================================================
;1121:
;1122:  LOWER RIGHT CORNER
;1123:
;1124:===========================================================================================
;1125:*/
;1126:
;1127:/*
;1128:=================
;1129:CG_DrawScores
;1130:
;1131:Draw the small two score display
;1132:=================
;1133:*/
;1134:#ifndef MISSIONPACK
;1135:static float CG_DrawScores( float y ) {
line 1144
;1136:	const char	*s;
;1137:	int			s1, s2, score;
;1138:	int			x, x0, w;
;1139:	int			v;
;1140:	vec4_t		color;
;1141:	float		y1;
;1142:	gitem_t		*item;
;1143:
;1144:	s1 = cgs.scores1;
ADDRLP4 32
ADDRGP4 cgs+34824
INDIRI4
ASGNI4
line 1145
;1145:	s2 = cgs.scores2;
ADDRLP4 36
ADDRGP4 cgs+34828
INDIRI4
ASGNI4
line 1147
;1146:
;1147:	y -=  BIGCHAR_HEIGHT + 8 - 4;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1149
;1148:
;1149:	y1 = y;
ADDRLP4 40
ADDRFP4 0
INDIRF4
ASGNF4
line 1152
;1150:
;1151:	// draw from the right side to left
;1152:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $571
line 1153
;1153:		x0 = cgs.screenXmax + 1;
ADDRLP4 28
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1154
;1154:		color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1155
;1155:		color[1] = 0.1f;
ADDRLP4 0+4
CNSTF4 1036831949
ASGNF4
line 1156
;1156:		color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1157
;1157:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1159
;1158:		// second score
;1159:		s = va( "%2i", s2 );
ADDRGP4 $578
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 56
INDIRP4
ASGNP4
line 1160
;1160:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1161
;1161:		x = x0 - w;
ADDRLP4 16
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1162
;1162:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1163
;1163:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $579
line 1164
;1164:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+212
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1165
;1165:		}
LABELV $579
line 1166
;1166:		CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1168
;1167:
;1168:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $584
line 1170
;1169:			// Display flag status
;1170:			item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 64
INDIRP4
ASGNP4
line 1172
;1171:
;1172:			if (item) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $587
line 1173
;1173:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 40
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1174
;1174:				if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
ADDRGP4 cgs+34836
INDIRI4
CNSTI4 0
LTI4 $589
ADDRGP4 cgs+34836
INDIRI4
CNSTI4 2
GTI4 $589
line 1175
;1175:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.blueFlagShader[cgs.blueflag] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+34836
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+60
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1176
;1176:				}
LABELV $589
line 1177
;1177:			}
LABELV $587
line 1178
;1178:		}
LABELV $584
line 1179
;1179:		color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1180
;1180:		color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1181
;1181:		color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1182
;1182:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1184
;1183:		// first score
;1184:		x0 = x;
ADDRLP4 28
ADDRLP4 16
INDIRI4
ASGNI4
line 1185
;1185:		s = va( "%2i", s1 );
ADDRGP4 $578
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1186
;1186:		w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 68
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1187
;1187:		x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1188
;1188:		CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1189
;1189:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $599
line 1190
;1190:			CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+212
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1191
;1191:		}
LABELV $599
line 1193
;1192:
;1193:		CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1195
;1194:
;1195:		if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $604
line 1197
;1196:			// Display flag status
;1197:			item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 72
INDIRP4
ASGNP4
line 1199
;1198:
;1199:			if (item) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $607
line 1200
;1200:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 40
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1201
;1201:				if( cgs.redflag >= 0 && cgs.redflag <= 2 ) {
ADDRGP4 cgs+34832
INDIRI4
CNSTI4 0
LTI4 $609
ADDRGP4 cgs+34832
INDIRI4
CNSTI4 2
GTI4 $609
line 1202
;1202:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.redFlagShader[cgs.redflag] );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+34832
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1203
;1203:				}
LABELV $609
line 1204
;1204:			}
LABELV $607
line 1205
;1205:		}
LABELV $604
line 1220
;1206:
;1207:#ifdef MISSIONPACK
;1208:		if ( cgs.gametype == GT_1FCTF ) {
;1209:			// Display flag status
;1210:			item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1211:
;1212:			if (item) {
;1213:				y1 = y - BIGCHAR_HEIGHT - 8;
;1214:				if( cgs.flagStatus >= 0 && cgs.flagStatus <= 3 ) {
;1215:					CG_DrawPic( x, y1-4, w, BIGCHAR_HEIGHT+8, cgs.media.flagShader[cgs.flagStatus] );
;1216:				}
;1217:			}
;1218:		}
;1219:#endif
;1220:		if ( cgs.gametype >= GT_CTF ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
LTI4 $616
line 1221
;1221:			v = cgs.capturelimit;
ADDRLP4 48
ADDRGP4 cgs+31496
INDIRI4
ASGNI4
line 1222
;1222:		} else {
ADDRGP4 $617
JUMPV
LABELV $616
line 1223
;1223:			v = cgs.fraglimit;
ADDRLP4 48
ADDRGP4 cgs+31492
INDIRI4
ASGNI4
line 1224
;1224:		}
LABELV $617
line 1225
;1225:		if ( v ) {
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $572
line 1226
;1226:			s = va( "%2i", v );
ADDRGP4 $578
ARGP4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 72
INDIRP4
ASGNP4
line 1227
;1227:			CG_DrawString( x-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 16
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1228
;1228:		}
line 1230
;1229:
;1230:	} else {
ADDRGP4 $572
JUMPV
LABELV $571
line 1233
;1231:		qboolean	spectator;
;1232:
;1233:		x = cgs.screenXmax + 1;
ADDRLP4 16
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1235
;1234:
;1235:		score = cg.snap->ps.persistant[PERS_SCORE];
ADDRLP4 44
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
line 1236
;1236:		spectator = ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR );
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $627
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $628
JUMPV
LABELV $627
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $628
ADDRLP4 56
ADDRLP4 60
INDIRI4
ASGNI4
line 1239
;1237:
;1238:		// always show your score in the second box if not in first place
;1239:		if ( s1 != score ) {
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $629
line 1240
;1240:			s2 = score;
ADDRLP4 36
ADDRLP4 44
INDIRI4
ASGNI4
line 1241
;1241:		}
LABELV $629
line 1242
;1242:		if ( s2 != SCORE_NOT_PRESENT ) {
ADDRLP4 36
INDIRI4
CNSTI4 -9999
EQI4 $631
line 1243
;1243:			x0 = x;
ADDRLP4 28
ADDRLP4 16
INDIRI4
ASGNI4
line 1244
;1244:			s = va( "%2i", s2 );
ADDRGP4 $578
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1245
;1245:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 68
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1246
;1246:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1247
;1247:			if ( !spectator && score == s2 && score != s1 ) {
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $633
ADDRLP4 72
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $633
ADDRLP4 72
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $633
line 1248
;1248:				color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1249
;1249:				color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1250
;1250:				color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1251
;1251:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1252
;1252:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1253
;1253:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+212
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1254
;1254:			} else {
ADDRGP4 $634
JUMPV
LABELV $633
line 1255
;1255:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1256
;1256:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1257
;1257:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1258
;1258:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1259
;1259:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1260
;1260:			}	
LABELV $634
line 1261
;1261:			CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1262
;1262:		}
LABELV $631
line 1265
;1263:
;1264:		// first place
;1265:		if ( s1 != SCORE_NOT_PRESENT ) {
ADDRLP4 32
INDIRI4
CNSTI4 -9999
EQI4 $643
line 1266
;1266:			x0 = x;
ADDRLP4 28
ADDRLP4 16
INDIRI4
ASGNI4
line 1267
;1267:			s = va( "%2i", s1 );
ADDRGP4 $578
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1268
;1268:			w = CG_DrawStrlen( s ) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 68
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1269
;1269:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1270
;1270:			if ( !spectator && score == s1 ) {
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $645
ADDRLP4 44
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $645
line 1271
;1271:				color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1272
;1272:				color[1] = 0.1f;
ADDRLP4 0+4
CNSTF4 1036831949
ASGNF4
line 1273
;1273:				color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1274
;1274:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1275
;1275:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1276
;1276:				CG_DrawPic( x, y-4, w, BIGCHAR_HEIGHT+8, cgs.media.selectShader );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+212
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1277
;1277:			} else {
ADDRGP4 $646
JUMPV
LABELV $645
line 1278
;1278:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1279
;1279:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1280
;1280:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1281
;1281:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1282
;1282:				CG_FillRect( x, y-4,  w, BIGCHAR_HEIGHT+8, color );
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1283
;1283:			}
LABELV $646
line 1284
;1284:			CG_DrawString( x0-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1285
;1285:		}
LABELV $643
line 1287
;1286:
;1287:		if ( cgs.fraglimit ) {
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 0
EQI4 $655
line 1288
;1288:			s = va( "%2i", cgs.fraglimit );
ADDRGP4 $578
ARGP4
ADDRGP4 cgs+31492
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1289
;1289:			CG_DrawString( x-4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT );
ADDRLP4 16
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1290
;1290:		}
LABELV $655
line 1291
;1291:	}
LABELV $572
line 1293
;1292:
;1293:	return y1 - 8;
ADDRLP4 40
INDIRF4
CNSTF4 1090519040
SUBF4
RETF4
LABELV $568
endproc CG_DrawScores 76 32
data
align 4
LABELV $660
byte 4 1045220557
byte 4 1065353216
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
code
proc CG_DrawPowerups 200 20
line 1304
;1294:}
;1295:#endif // MISSIONPACK
;1296:
;1297:
;1298:/*
;1299:================
;1300:CG_DrawPowerups
;1301:================
;1302:*/
;1303:#ifndef MISSIONPACK
;1304:static float CG_DrawPowerups( float y ) {
line 1321
;1305:	int		sorted[MAX_POWERUPS];
;1306:	int		sortedTime[MAX_POWERUPS];
;1307:	int		i, j, k;
;1308:	int		active;
;1309:	playerState_t	*ps;
;1310:	int		t;
;1311:	gitem_t	*item;
;1312:	int		x;
;1313:	int		color;
;1314:	float	size;
;1315:	float	f;
;1316:	static const float colors[2][4] = { 
;1317:		{ 0.2f, 1.0f, 0.2f, 1.0f },
;1318:		{ 1.0f, 0.2f, 0.2f, 1.0f } 
;1319:	};
;1320:
;1321:	ps = &cg.snap->ps;
ADDRLP4 148
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 1323
;1322:
;1323:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 148
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $662
line 1324
;1324:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $659
JUMPV
LABELV $662
line 1328
;1325:	}
;1326:
;1327:	// sort the list by time remaining
;1328:	active = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 1329
;1329:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $664
line 1330
;1330:		if ( !ps->powerups[ i ] ) {
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $668
line 1331
;1331:			continue;
ADDRGP4 $665
JUMPV
LABELV $668
line 1333
;1332:		}
;1333:		t = ps->powerups[ i ] - cg.time;
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ASGNI4
line 1336
;1334:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;1335:		// This is true of the CTF flags
;1336:		if ( t < 0 || t > 999000) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $673
ADDRLP4 140
INDIRI4
CNSTI4 999000
LEI4 $671
LABELV $673
line 1337
;1337:			continue;
ADDRGP4 $665
JUMPV
LABELV $671
line 1341
;1338:		}
;1339:
;1340:		// insert into the list
;1341:		for ( j = 0 ; j < active ; j++ ) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $677
JUMPV
LABELV $674
line 1342
;1342:			if ( sortedTime[j] >= t ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $678
line 1343
;1343:				for ( k = active - 1 ; k >= j ; k-- ) {
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $683
JUMPV
LABELV $680
line 1344
;1344:					sorted[k+1] = sorted[k];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ASGNI4
line 1345
;1345:					sortedTime[k+1] = sortedTime[k];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 1346
;1346:				}
LABELV $681
line 1343
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $683
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $680
line 1347
;1347:				break;
ADDRGP4 $676
JUMPV
LABELV $678
line 1349
;1348:			}
;1349:		}
LABELV $675
line 1341
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $677
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $674
LABELV $676
line 1350
;1350:		sorted[j] = i;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 1351
;1351:		sortedTime[j] = t;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 1352
;1352:		active++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1353
;1353:	}
LABELV $665
line 1329
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 16
LTI4 $664
line 1356
;1354:
;1355:	// draw the icons and timers
;1356:	x = cgs.screenXmax + 1 - ICON_SIZE - CHAR_WIDTH * 2;
ADDRLP4 168
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
CNSTF4 1115684864
SUBF4
CVFI4 4
ASGNI4
line 1357
;1357:	for ( i = 0 ; i < active ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRGP4 $690
JUMPV
LABELV $687
line 1358
;1358:		item = BG_FindItemForPowerup( sorted[i] );
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 172
INDIRP4
ASGNP4
line 1360
;1359:
;1360:		if ( item ) {
ADDRLP4 152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $691
line 1362
;1361:
;1362:			color = 1;
ADDRLP4 164
CNSTI4 1
ASGNI4
line 1364
;1363:
;1364:			y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1366
;1365:
;1366:			trap_R_SetColor( colors[color] );
ADDRLP4 164
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $660
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1367
;1367:			CG_DrawField( x, y, 2, sortedTime[ i ] / 1000 );
ADDRLP4 168
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 CG_DrawField
CALLV
pop
line 1369
;1368:
;1369:			t = ps->powerups[ sorted[i] ];
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1370
;1370:			if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 140
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $693
line 1371
;1371:				trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1372
;1372:			} else {
ADDRGP4 $694
JUMPV
LABELV $693
line 1375
;1373:				vec4_t	modulate;
;1374:
;1375:				f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
ADDRLP4 160
ADDRLP4 140
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 1376
;1376:				f -= (int)f;
ADDRLP4 160
ADDRLP4 160
INDIRF4
ADDRLP4 160
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
ASGNF4
line 1377
;1377:				modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
ADDRLP4 176+12
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176+8
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176
ADDRLP4 160
INDIRF4
ASGNF4
line 1378
;1378:				trap_R_SetColor( modulate );
ADDRLP4 176
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1379
;1379:			}
LABELV $694
line 1381
;1380:
;1381:			if ( cg.powerupActive == sorted[i] && 
ADDRGP4 cg+117544
INDIRI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
NEI4 $700
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117548
INDIRI4
SUBI4
CNSTI4 200
GEI4 $700
line 1382
;1382:				cg.time - cg.powerupTime < PULSE_TIME ) {
line 1383
;1383:				f = 1.0 - ( (float)( cg.time - cg.powerupTime ) / PULSE_TIME );
ADDRLP4 160
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117548
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1000593162
MULF4
SUBF4
ASGNF4
line 1384
;1384:				size = ICON_SIZE * ( 1.0 + ( PULSE_SCALE - 1.0 ) * f );
ADDRLP4 156
ADDRLP4 160
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
MULF4
ASGNF4
line 1385
;1385:			} else {
ADDRGP4 $701
JUMPV
LABELV $700
line 1386
;1386:				size = ICON_SIZE;
ADDRLP4 156
CNSTF4 1111490560
ASGNF4
line 1387
;1387:			}
LABELV $701
line 1389
;1388:
;1389:			CG_DrawPic( cgs.screenXmax + 1 - size, y + ICON_SIZE / 2 - size / 2, 
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 156
INDIRF4
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1103101952
ADDF4
ADDRLP4 156
INDIRF4
CNSTF4 1056964608
MULF4
SUBF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 176
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1391
;1390:				size, size, trap_R_RegisterShader( item->icon ) );
;1391:		} // if ( item )
LABELV $691
line 1392
;1392:	}
LABELV $688
line 1357
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $690
ADDRLP4 144
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $687
line 1393
;1393:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1395
;1394:
;1395:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $659
endproc CG_DrawPowerups 200 20
proc CG_DrawLowerRight 12 12
line 1407
;1396:}
;1397:#endif // MISSIONPACK
;1398:
;1399:
;1400:/*
;1401:=====================
;1402:CG_DrawLowerRight
;1403:
;1404:=====================
;1405:*/
;1406:#ifndef MISSIONPACK
;1407:static void CG_DrawLowerRight( void ) {
line 1410
;1408:	float	y;
;1409:
;1410:	y = cgs.screenYmax + 1 - STATUSBAR_HEIGHT;
ADDRLP4 0
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 1412
;1411:
;1412:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 2 ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $710
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 2
NEI4 $710
line 1413
;1413:		y = CG_DrawTeamOverlay( y, qtrue, qfalse );
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1414
;1414:	} 
LABELV $710
line 1416
;1415:
;1416:	y = CG_DrawScores( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawScores
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1417
;1417:	y = CG_DrawPowerups( y );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawPowerups
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1418
;1418:}
LABELV $708
endproc CG_DrawLowerRight 12 12
proc CG_DrawPickupItem 20 32
line 1428
;1419:#endif // MISSIONPACK
;1420:
;1421:
;1422:/*
;1423:===================
;1424:CG_DrawPickupItem
;1425:===================
;1426:*/
;1427:#ifndef MISSIONPACK
;1428:static int CG_DrawPickupItem( int y ) {
line 1433
;1429:	int		value;
;1430:	float	*fadeColor;
;1431:	const char *text;
;1432:
;1433:	if ( cg.snap->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $715
line 1434
;1434:		return y;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $714
JUMPV
LABELV $715
line 1437
;1435:	}
;1436:
;1437:	y -= PICKUP_ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 1439
;1438:
;1439:	value = cg.itemPickup;
ADDRLP4 0
ADDRGP4 cg+117832
INDIRI4
ASGNI4
line 1440
;1440:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $719
line 1441
;1441:		fadeColor = CG_FadeColorTime( cg.itemPickupTime, 3000, 250 );
ADDRGP4 cg+117840
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
CNSTI4 250
ARGI4
ADDRLP4 12
ADDRGP4 CG_FadeColorTime
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 1442
;1442:		if ( fadeColor ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $722
line 1443
;1443:			CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1444
;1444:			trap_R_SetColor( fadeColor );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1445
;1445:			CG_DrawPic( cgs.screenXmin + 8, y, PICKUP_ICON_SIZE, PICKUP_ICON_SIZE, cg_items[ value ].icon );
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1107296256
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1446
;1446:			if ( cg.itemPickupCount > 1 ) {
ADDRGP4 cg+117836
INDIRI4
CNSTI4 1
LEI4 $726
line 1447
;1447:				text = va( "%s x%i", bg_itemlist[ value ].pickup_name, cg.itemPickupCount );
ADDRGP4 $729
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+28
ADDP4
INDIRP4
ARGP4
ADDRGP4 cg+117836
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1448
;1448:			} else {
ADDRGP4 $727
JUMPV
LABELV $726
line 1449
;1449:				text = bg_itemlist[ value ].pickup_name;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+28
ADDP4
INDIRP4
ASGNP4
line 1450
;1450:			}
LABELV $727
line 1452
;1451:
;1452:			CG_DrawString( cgs.screenXmin + PICKUP_ICON_SIZE + 16, y + (PICKUP_ICON_SIZE/2 - PICKUP_TEXT_SIZE/2), 
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 1107296256
ADDF4
CNSTF4 1098907648
ADDF4
ARGF4
ADDRFP4 0
INDIRI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1094713344
ARGF4
CNSTF4 1094713344
ARGF4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1455
;1453:				text, fadeColor, PICKUP_TEXT_SIZE, PICKUP_TEXT_SIZE, 0, DS_SHADOW | DS_PROPORTIONAL );
;1454:			
;1455:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1456
;1456:		} else {
ADDRGP4 $723
JUMPV
LABELV $722
line 1457
;1457:			cg.itemPickupCount = 0;
ADDRGP4 cg+117836
CNSTI4 0
ASGNI4
line 1458
;1458:		}
LABELV $723
line 1459
;1459:	}
LABELV $719
line 1461
;1460:	
;1461:	return y;
ADDRFP4 0
INDIRI4
RETI4
LABELV $714
endproc CG_DrawPickupItem 20 32
proc CG_DrawLowerLeft 8 12
line 1472
;1462:}
;1463:#endif // MISSIONPACK
;1464:
;1465:
;1466:/*
;1467:=====================
;1468:CG_DrawLowerLeft
;1469:=====================
;1470:*/
;1471:#ifndef MISSIONPACK
;1472:static void CG_DrawLowerLeft( void ) {
line 1475
;1473:	float	y;
;1474:
;1475:	y = cgs.screenYmax + 1 - STATUSBAR_HEIGHT;
ADDRLP4 0
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 1477
;1476:
;1477:	if ( cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 3 ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $737
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 3
NEI4 $737
line 1478
;1478:		y = CG_DrawTeamOverlay( y, qfalse, qfalse );
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1479
;1479:	} 
LABELV $737
line 1481
;1480:
;1481:	y = CG_DrawPickupItem( y );
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawPickupItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
line 1482
;1482:}
LABELV $735
endproc CG_DrawLowerLeft 8 12
proc CG_DrawTeamInfo 48 32
line 1494
;1483:#endif // MISSIONPACK
;1484:
;1485:
;1486://===========================================================================================
;1487:
;1488:/*
;1489:=================
;1490:CG_DrawTeamInfo
;1491:=================
;1492:*/
;1493:#ifndef MISSIONPACK
;1494:static void CG_DrawTeamInfo( void ) {
line 1503
;1495:	int w, h;
;1496:	int i, len;
;1497:	vec4_t		hcolor;
;1498:	int		chatHeight;
;1499:
;1500:	#define CHATLOC_Y (cgs.screenYmax + 1 - STATUSBAR_HEIGHT ) // bottom end
;1501:	#define CHATLOC_X (cgs.screenXmin)
;1502:
;1503:	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
ADDRGP4 cg_teamChatHeight+12
INDIRI4
CNSTI4 8
GEI4 $742
line 1504
;1504:		chatHeight = cg_teamChatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_teamChatHeight+12
INDIRI4
ASGNI4
ADDRGP4 $743
JUMPV
LABELV $742
line 1506
;1505:	else
;1506:		chatHeight = TEAMCHAT_HEIGHT;
ADDRLP4 8
CNSTI4 8
ASGNI4
LABELV $743
line 1507
;1507:	if (chatHeight <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $746
line 1508
;1508:		return; // disabled
ADDRGP4 $741
JUMPV
LABELV $746
line 1510
;1509:
;1510:	if (cgs.teamLastChatPos != cgs.teamChatPos) {
ADDRGP4 cgs+148688
INDIRI4
ADDRGP4 cgs+148684
INDIRI4
EQI4 $748
line 1511
;1511:		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+148688
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148652
ADDP4
INDIRI4
SUBI4
ADDRGP4 cg_teamChatTime+12
INDIRI4
LEI4 $752
line 1512
;1512:			cgs.teamLastChatPos++;
ADDRLP4 36
ADDRGP4 cgs+148688
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1513
;1513:		}
LABELV $752
line 1515
;1514:
;1515:		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;
ADDRLP4 32
ADDRGP4 cgs+148684
INDIRI4
ADDRGP4 cgs+148688
INDIRI4
SUBI4
CNSTI4 3
LSHI4
ASGNI4
line 1517
;1516:
;1517:		w = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1519
;1518:
;1519:		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
ADDRLP4 0
ADDRGP4 cgs+148688
INDIRI4
ASGNI4
ADDRGP4 $764
JUMPV
LABELV $761
line 1520
;1520:			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 241
MULI4
ADDRGP4 cgs+146724
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 1521
;1521:			if (len > w)
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $768
line 1522
;1522:				w = len;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $768
line 1523
;1523:		}
LABELV $762
line 1519
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $764
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+148684
INDIRI4
LTI4 $761
line 1524
;1524:		w *= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1525
;1525:		w += TINYCHAR_WIDTH * 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1527
;1526:
;1527:		if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $770
line 1528
;1528:			hcolor[0] = 1.0f;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1529
;1529:			hcolor[1] = 0.0f;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1530
;1530:			hcolor[2] = 0.0f;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1531
;1531:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1532
;1532:		} else if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 $771
JUMPV
LABELV $770
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $776
line 1533
;1533:			hcolor[0] = 0.0f;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1534
;1534:			hcolor[1] = 0.0f;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1535
;1535:			hcolor[2] = 1.0f;
ADDRLP4 16+8
CNSTF4 1065353216
ASGNF4
line 1536
;1536:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1537
;1537:		} else {
ADDRGP4 $777
JUMPV
LABELV $776
line 1538
;1538:			hcolor[0] = 0.0f;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1539
;1539:			hcolor[1] = 1.0f;
ADDRLP4 16+4
CNSTF4 1065353216
ASGNF4
line 1540
;1540:			hcolor[2] = 0.0f;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1541
;1541:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1542
;1542:		}
LABELV $777
LABELV $771
line 1544
;1543:
;1544:		trap_R_SetColor( hcolor );
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1545
;1545:		CG_DrawPic( CHATLOC_X, CHATLOC_Y - h, w, h, cgs.media.teamStatusBar );
ADDRGP4 cgs+31452
INDIRF4
ARGF4
ADDRLP4 36
ADDRLP4 32
INDIRI4
CVIF4 4
ASGNF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ADDRLP4 36
INDIRF4
SUBF4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 cgs+148692+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1546
;1546:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1548
;1547:
;1548:		hcolor[0] = hcolor[1] = hcolor[2] = 1.0f;
ADDRLP4 40
CNSTF4 1065353216
ASGNF4
ADDRLP4 16+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
ASGNF4
line 1549
;1549:		hcolor[3] = 1.0f;
ADDRLP4 16+12
CNSTF4 1065353216
ASGNF4
line 1551
;1550:
;1551:		for ( i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i-- ) {
ADDRLP4 0
ADDRGP4 cgs+148684
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $795
JUMPV
LABELV $792
line 1552
;1552:			CG_DrawString( CHATLOC_X + TINYCHAR_WIDTH, CHATLOC_Y - (cgs.teamChatPos - i)*TINYCHAR_HEIGHT, 
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ADDRGP4 cgs+148684
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 3
LSHI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 241
MULI4
ADDRGP4 cgs+146724
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1554
;1553:				cgs.teamChatMsgs[i % chatHeight], hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0, DS_PROPORTIONAL );
;1554:		}
LABELV $793
line 1551
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $795
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+148688
INDIRI4
GEI4 $792
line 1555
;1555:	}
LABELV $748
line 1556
;1556:}
LABELV $741
endproc CG_DrawTeamInfo 48 32
proc CG_DrawHoldableItem 4 20
line 1566
;1557:#endif // MISSIONPACK
;1558:
;1559:
;1560:/*
;1561:===================
;1562:CG_DrawHoldableItem
;1563:===================
;1564:*/
;1565:#ifndef MISSIONPACK
;1566:static void CG_DrawHoldableItem( void ) { 
line 1569
;1567:	int		value;
;1568:
;1569:	value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 1570
;1570:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $804
line 1571
;1571:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1572
;1572:		CG_DrawPic( cgs.screenXmax + 1 - ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ARGF4
CNSTF4 1129840640
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1573
;1573:	}
LABELV $804
line 1574
;1574:}
LABELV $802
endproc CG_DrawHoldableItem 4 20
proc CG_DrawReward 68 32
line 1602
;1575:#endif // MISSIONPACK
;1576:
;1577:#ifdef MISSIONPACK
;1578:/*
;1579:===================
;1580:CG_DrawPersistantPowerup
;1581:===================
;1582:*/
;1583:#if 0 // sos001208 - DEAD
;1584:static void CG_DrawPersistantPowerup( void ) { 
;1585:	int		value;
;1586:
;1587:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
;1588:	if ( value ) {
;1589:		CG_RegisterItemVisuals( value );
;1590:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2 - ICON_SIZE, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
;1591:	}
;1592:}
;1593:#endif
;1594:#endif // MISSIONPACK
;1595:
;1596:
;1597:/*
;1598:===================
;1599:CG_DrawReward
;1600:===================
;1601:*/
;1602:static void CG_DrawReward( void ) { 
line 1608
;1603:	float	*color;
;1604:	int		i, count;
;1605:	float	x, y;
;1606:	char	buf[32];
;1607:
;1608:	if ( !cg_drawRewards.integer ) {
ADDRGP4 cg_drawRewards+12
INDIRI4
CNSTI4 0
NEI4 $809
line 1609
;1609:		return;
ADDRGP4 $808
JUMPV
LABELV $809
line 1612
;1610:	}
;1611:
;1612:	color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
ADDRGP4 cg+117600
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 52
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 52
INDIRP4
ASGNP4
line 1613
;1613:	if ( !color ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $813
line 1614
;1614:		if (cg.rewardStack > 0) {
ADDRGP4 cg+117596
INDIRI4
CNSTI4 0
LEI4 $808
line 1615
;1615:			for(i = 0; i < cg.rewardStack; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $821
JUMPV
LABELV $818
line 1616
;1616:				cg.rewardSound[i] = cg.rewardSound[i+1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117684
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117684+4
ADDP4
INDIRI4
ASGNI4
line 1617
;1617:				cg.rewardShader[i] = cg.rewardShader[i+1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117644
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117644+4
ADDP4
INDIRI4
ASGNI4
line 1618
;1618:				cg.rewardCount[i] = cg.rewardCount[i+1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117604
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117604+4
ADDP4
INDIRI4
ASGNI4
line 1619
;1619:			}
LABELV $819
line 1615
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $821
ADDRLP4 0
INDIRI4
ADDRGP4 cg+117596
INDIRI4
LTI4 $818
line 1620
;1620:			cg.rewardTime = cg.time;
ADDRGP4 cg+117600
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1621
;1621:			cg.rewardStack--;
ADDRLP4 56
ADDRGP4 cg+117596
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1622
;1622:			color = CG_FadeColor( cg.rewardTime, REWARD_TIME );
ADDRGP4 cg+117600
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 60
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 60
INDIRP4
ASGNP4
line 1623
;1623:			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
ADDRGP4 cg+117684
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1624
;1624:		} else {
line 1625
;1625:			return;
LABELV $816
line 1627
;1626:		}
;1627:	}
LABELV $813
line 1629
;1628:
;1629:	trap_R_SetColor( color );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1646
;1630:
;1631:	/*
;1632:	count = cg.rewardCount[0]/10;				// number of big rewards to draw
;1633:
;1634:	if (count) {
;1635:		y = 4;
;1636:		x = 320 - count * ICON_SIZE;
;1637:		for ( i = 0 ; i < count ; i++ ) {
;1638:			CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
;1639:			x += (ICON_SIZE*2);
;1640:		}
;1641:	}
;1642:
;1643:	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
;1644:	*/
;1645:
;1646:	if ( cg.rewardCount[0] >= 10 ) {
ADDRGP4 cg+117604
INDIRI4
CNSTI4 10
LTI4 $837
line 1647
;1647:		y = 56; // FIXME: cgs.screenYmin + 56?
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1648
;1648:		x = 320 - ICON_SIZE/2;
ADDRLP4 4
CNSTF4 1133772800
ASGNF4
line 1649
;1649:		CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
CNSTF4 1110441984
ARGF4
CNSTF4 1110441984
ARGF4
ADDRGP4 cg+117644
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1650
;1650:		Com_sprintf( buf, sizeof( buf ), "%d", cg.rewardCount[0] );
ADDRLP4 20
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $841
ARGP4
ADDRGP4 cg+117604
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1651
;1651:		CG_DrawString( 320, y + ICON_SIZE, buf, color, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER );
CNSTF4 1134559232
ARGF4
ADDRLP4 8
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1652
;1652:	}
ADDRGP4 $838
JUMPV
LABELV $837
line 1653
;1653:	else {
line 1655
;1654:
;1655:		count = cg.rewardCount[0];
ADDRLP4 12
ADDRGP4 cg+117604
INDIRI4
ASGNI4
line 1657
;1656:
;1657:		y = 56; // FIXME: cgs.screenYmin + 56?
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1658
;1658:		x = 320 - count * ICON_SIZE/2;
ADDRLP4 4
CNSTI4 320
ADDRLP4 12
INDIRI4
CNSTI4 48
MULI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ASGNF4
line 1659
;1659:		for ( i = 0 ; i < count ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $847
JUMPV
LABELV $844
line 1660
;1660:			CG_DrawPic( x, y, ICON_SIZE-4, ICON_SIZE-4, cg.rewardShader[0] );
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
CNSTF4 1110441984
ARGF4
CNSTF4 1110441984
ARGF4
ADDRGP4 cg+117644
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1661
;1661:			x += ICON_SIZE;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1662
;1662:		}
LABELV $845
line 1659
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $847
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $844
line 1663
;1663:	}
LABELV $838
line 1664
;1664:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1665
;1665:}
LABELV $808
endproc CG_DrawReward 68 32
export CG_AddLagometerFrameInfo
proc CG_AddLagometerFrameInfo 8 0
line 1696
;1666:
;1667:
;1668:/*
;1669:===============================================================================
;1670:
;1671:LAGOMETER
;1672:
;1673:===============================================================================
;1674:*/
;1675:
;1676:#define	LAG_SAMPLES		128
;1677:
;1678:
;1679:typedef struct {
;1680:	int		frameSamples[LAG_SAMPLES];
;1681:	int		frameCount;
;1682:	int		snapshotFlags[LAG_SAMPLES];
;1683:	int		snapshotSamples[LAG_SAMPLES];
;1684:	int		snapshotCount;
;1685:} lagometer_t;
;1686:
;1687:lagometer_t		lagometer;
;1688:
;1689:/*
;1690:==============
;1691:CG_AddLagometerFrameInfo
;1692:
;1693:Adds the current interpolate / extrapolate bar for this frame
;1694:==============
;1695:*/
;1696:void CG_AddLagometerFrameInfo( void ) {
line 1699
;1697:	int			offset;
;1698:
;1699:	offset = cg.time - cg.latestSnapshotTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+32
INDIRI4
SUBI4
ASGNI4
line 1700
;1700:	lagometer.frameSamples[ lagometer.frameCount & ( LAG_SAMPLES - 1) ] = offset;
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1701
;1701:	lagometer.frameCount++;
ADDRLP4 4
ADDRGP4 lagometer+512
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1702
;1702:}
LABELV $850
endproc CG_AddLagometerFrameInfo 8 0
export CG_AddLagometerSnapshotInfo
proc CG_AddLagometerSnapshotInfo 4 0
line 1715
;1703:
;1704:
;1705:/*
;1706:==============
;1707:CG_AddLagometerSnapshotInfo
;1708:
;1709:Each time a snapshot is received, log its ping time and
;1710:the number of snapshots that were dropped before it.
;1711:
;1712:Pass NULL for a dropped packet.
;1713:==============
;1714:*/
;1715:void CG_AddLagometerSnapshotInfo( snapshot_t *snap ) {
line 1717
;1716:	// dropped packet
;1717:	if ( !snap ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $856
line 1718
;1718:		lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = -1;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
CNSTI4 -1
ASGNI4
line 1719
;1719:		lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1720
;1720:		return;
ADDRGP4 $855
JUMPV
LABELV $856
line 1724
;1721:	}
;1722:
;1723:	// add this snapshot's info
;1724:	lagometer.snapshotSamples[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->ping;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1725
;1725:	lagometer.snapshotFlags[ lagometer.snapshotCount & ( LAG_SAMPLES - 1) ] = snap->snapFlags;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1726
;1726:	lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1727
;1727:}
LABELV $855
endproc CG_AddLagometerSnapshotInfo 4 0
proc CG_DrawDisconnect 52 32
line 1737
;1728:
;1729:
;1730:/*
;1731:==============
;1732:CG_DrawDisconnect
;1733:
;1734:Should we draw something differnet for long lag vs no packets?
;1735:==============
;1736:*/
;1737:static void CG_DrawDisconnect( void ) {
line 1744
;1738:	float		x, y;
;1739:	int			cmdNum;
;1740:	usercmd_t	cmd;
;1741:	const char	*s;
;1742:
;1743:	// draw the phone jack if we are completely past our buffers
;1744:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
ADDRLP4 40
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1745
;1745:	trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1746
;1746:	if ( cmd.serverTime <= cg.snap->ps.commandTime
ADDRLP4 44
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $871
ADDRLP4 44
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $867
LABELV $871
line 1747
;1747:		|| cmd.serverTime > cg.time ) {	// special check for map_restart // bk 0102165 - FIXME
line 1748
;1748:		return;
ADDRGP4 $866
JUMPV
LABELV $867
line 1752
;1749:	}
;1750:
;1751:	// also add text in center of screen
;1752:	s = "Connection Interrupted";
ADDRLP4 36
ADDRGP4 $872
ASGNP4
line 1753
;1753:	CG_DrawString( 320, cgs.screenYmin + 100, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_PROPORTIONAL | DS_CENTER );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31460
INDIRF4
CNSTF4 1120403456
ADDF4
ARGF4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1756
;1754:
;1755:	// blink the icon
;1756:	if ( ( cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+107604
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $874
line 1757
;1757:		return;
ADDRGP4 $866
JUMPV
LABELV $874
line 1760
;1758:	}
;1759:
;1760:	x = cgs.screenXmax + 1 - 48;
ADDRLP4 24
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1761
;1761:	y = cgs.screenYmax + 1 - 48;
ADDRLP4 28
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1763
;1762:
;1763:	CG_DrawPic( x, y, 48, 48, trap_R_RegisterShader( "gfx/2d/net.tga" ) );
ADDRGP4 $879
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1764
;1764:}
LABELV $866
endproc CG_DrawDisconnect 52 32
proc CG_DrawLagometer 56 36
line 1775
;1765:
;1766:
;1767:#define	MAX_LAGOMETER_PING	900
;1768:#define	MAX_LAGOMETER_RANGE	300
;1769:
;1770:/*
;1771:==============
;1772:CG_DrawLagometer
;1773:==============
;1774:*/
;1775:static void CG_DrawLagometer( void ) {
line 1782
;1776:	int		a, x, y, i;
;1777:	float	v;
;1778:	float	ax, ay, aw, ah, mid, range;
;1779:	int		color;
;1780:	float	vscale;
;1781:
;1782:	if ( !cg_lagometer.integer || cgs.localServer ) {
ADDRGP4 cg_lagometer+12
INDIRI4
CNSTI4 0
EQI4 $885
ADDRGP4 cgs+31476
INDIRI4
CNSTI4 0
EQI4 $881
LABELV $885
line 1783
;1783:		CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1784
;1784:		return;
ADDRGP4 $880
JUMPV
LABELV $881
line 1794
;1785:	}
;1786:
;1787:	//
;1788:	// draw the graph
;1789:	//
;1790:#ifdef MISSIONPACK
;1791:	x = cgs.screenXmax + 1 - 48;
;1792:	y = cgs.screenYmax + 1 - 144;
;1793:#else
;1794:	x = cgs.screenXmax + 1 - 48;
ADDRLP4 48
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
CVFI4 4
ASGNI4
line 1795
;1795:	y = cgs.screenYmax + 1 - 48;
ADDRLP4 44
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
CVFI4 4
ASGNI4
line 1798
;1796:#endif
;1797:
;1798:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1799
;1799:	CG_DrawPic( x, y, 48, 48, cgs.media.lagometerShader );
ADDRLP4 48
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRGP4 cgs+148692+264
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1801
;1800:
;1801:	ax = x;
ADDRLP4 24
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 1802
;1802:	ay = y;
ADDRLP4 36
ADDRLP4 44
INDIRI4
CVIF4 4
ASGNF4
line 1803
;1803:	aw = 48;
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
line 1804
;1804:	ah = 48;
ADDRLP4 32
CNSTF4 1111490560
ASGNF4
line 1805
;1805:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 1807
;1806:
;1807:	color = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 1808
;1808:	range = ah / 3;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1051372203
MULF4
ASGNF4
line 1809
;1809:	mid = ay + range;
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 1811
;1810:
;1811:	vscale = range / MAX_LAGOMETER_RANGE;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 995783694
MULF4
ASGNF4
line 1814
;1812:
;1813:	// draw the frame interpoalte / extrapolate graph
;1814:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $893
JUMPV
LABELV $890
line 1815
;1815:		i = ( lagometer.frameCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 1816
;1816:		v = lagometer.frameSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1817
;1817:		v *= vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1818
;1818:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $895
line 1819
;1819:			if ( color != 1 ) {
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $897
line 1820
;1820:				color = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1821
;1821:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1822
;1822:			}
LABELV $897
line 1823
;1823:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $900
line 1824
;1824:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1825
;1825:			}
LABELV $900
line 1826
;1826:			trap_R_DrawStretchPic ( ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1827
;1827:		} else if ( v < 0 ) {
ADDRGP4 $896
JUMPV
LABELV $895
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $904
line 1828
;1828:			if ( color != 2 ) {
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $906
line 1829
;1829:				color = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 1830
;1830:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_BLUE)] );
ADDRGP4 g_color_table+64
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1831
;1831:			}
LABELV $906
line 1832
;1832:			v = -v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
line 1833
;1833:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $909
line 1834
;1834:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1835
;1835:			}
LABELV $909
line 1836
;1836:			trap_R_DrawStretchPic( ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1837
;1837:		}
LABELV $904
LABELV $896
line 1838
;1838:	}
LABELV $891
line 1814
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $893
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $890
line 1841
;1839:
;1840:	// draw the snapshot latency / drop graph
;1841:	range = ah / 2;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1842
;1842:	vscale = range / MAX_LAGOMETER_PING;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 982622900
MULF4
ASGNF4
line 1844
;1843:
;1844:	for ( a = 0 ; a < aw ; a++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $916
JUMPV
LABELV $913
line 1845
;1845:		i = ( lagometer.snapshotCount - 1 - a ) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 1846
;1846:		v = lagometer.snapshotSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1847
;1847:		if ( v > 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $919
line 1848
;1848:			if ( lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED ) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $921
line 1849
;1849:				if ( color != 5 ) {
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $922
line 1850
;1850:					color = 5;	// YELLOW for rate delay
ADDRLP4 20
CNSTI4 5
ASGNI4
line 1851
;1851:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_YELLOW)] );
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1852
;1852:				}
line 1853
;1853:			} else {
ADDRGP4 $922
JUMPV
LABELV $921
line 1854
;1854:				if ( color != 3 ) {
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $927
line 1855
;1855:					color = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 1856
;1856:					trap_R_SetColor( g_color_table[ColorIndex(COLOR_GREEN)] );
ADDRGP4 g_color_table+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1857
;1857:				}
LABELV $927
line 1858
;1858:			}
LABELV $922
line 1859
;1859:			v = v * vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1860
;1860:			if ( v > range ) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $930
line 1861
;1861:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1862
;1862:			}
LABELV $930
line 1863
;1863:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1864
;1864:		} else if ( v < 0 ) {
ADDRGP4 $920
JUMPV
LABELV $919
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $934
line 1865
;1865:			if ( color != 4 ) {
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $936
line 1866
;1866:				color = 4;		// RED for dropped snapshots
ADDRLP4 20
CNSTI4 4
ASGNI4
line 1867
;1867:				trap_R_SetColor( g_color_table[ColorIndex(COLOR_RED)] );
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1868
;1868:			}
LABELV $936
line 1869
;1869:			trap_R_DrawStretchPic( ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1870
;1870:		}
LABELV $934
LABELV $920
line 1871
;1871:	}
LABELV $914
line 1844
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $916
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $913
line 1873
;1872:
;1873:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1875
;1874:
;1875:	if ( cg_nopredict.integer || cgs.synchronousClients ) {
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $945
ADDRGP4 cgs+149692
INDIRI4
CNSTI4 0
EQI4 $941
LABELV $945
line 1876
;1876:		CG_DrawString( cgs.screenXmax-1, y, "snc", colorWhite, 5, 10, 0, DS_PROPORTIONAL | DS_RIGHT );
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
SUBF4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 $947
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1084227584
ARGF4
CNSTF4 1092616192
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1877
;1877:	}
LABELV $941
line 1879
;1878:
;1879:	if ( !cg.demoPlayback ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $948
line 1880
;1880:		CG_DrawString( x+1, y, va( "%ims", cg.meanPing ), colorWhite, 5, 10, 0, DS_PROPORTIONAL );
ADDRGP4 $951
ARGP4
ADDRGP4 cg+149068
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1084227584
ARGF4
CNSTF4 1092616192
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1881
;1881:	}
LABELV $948
line 1883
;1882:
;1883:	CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1884
;1884:}
LABELV $880
endproc CG_DrawLagometer 56 36
export CG_CenterPrint
proc CG_CenterPrint 8 12
line 1905
;1885:
;1886:
;1887:
;1888:/*
;1889:===============================================================================
;1890:
;1891:CENTER PRINTING
;1892:
;1893:===============================================================================
;1894:*/
;1895:
;1896:
;1897:/*
;1898:==============
;1899:CG_CenterPrint
;1900:
;1901:Called for important messages that should stay in the center of the screen
;1902:for a few moments
;1903:==============
;1904:*/
;1905:void CG_CenterPrint( const char *str, int y, int charWidth ) {
line 1908
;1906:	char	*s;
;1907:
;1908:	Q_strncpyz( cg.centerPrint, str, sizeof(cg.centerPrint) );
ADDRGP4 cg+116500
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1910
;1909:
;1910:	cg.centerPrintTime = cg.time;
ADDRGP4 cg+116488
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1911
;1911:	cg.centerPrintY = y;
ADDRGP4 cg+116496
ADDRFP4 4
INDIRI4
ASGNI4
line 1912
;1912:	cg.centerPrintCharWidth = charWidth;
ADDRGP4 cg+116492
ADDRFP4 8
INDIRI4
ASGNI4
line 1915
;1913:
;1914:	// count the number of lines for centering
;1915:	cg.centerPrintLines = 1;
ADDRGP4 cg+117524
CNSTI4 1
ASGNI4
line 1916
;1916:	s = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+116500
ASGNP4
ADDRGP4 $963
JUMPV
LABELV $962
line 1917
;1917:	while( *s ) {
line 1918
;1918:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $965
line 1919
;1919:			cg.centerPrintLines++;
ADDRLP4 4
ADDRGP4 cg+117524
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $965
line 1920
;1920:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1921
;1921:	}
LABELV $963
line 1917
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $962
line 1922
;1922:}
LABELV $953
endproc CG_CenterPrint 8 12
proc CG_DrawCenterString 1052 32
line 1930
;1923:
;1924:
;1925:/*
;1926:===================
;1927:CG_DrawCenterString
;1928:===================
;1929:*/
;1930:static void CG_DrawCenterString( void ) {
line 1939
;1931:	char	*start;
;1932:	int		l;
;1933:	int		y;
;1934:#ifdef MISSIONPACK // bk010221 - unused else
;1935:  int h;
;1936:#endif
;1937:	float	*color;
;1938:
;1939:	if ( !cg.centerPrintTime ) {
ADDRGP4 cg+116488
INDIRI4
CNSTI4 0
NEI4 $969
line 1940
;1940:		return;
ADDRGP4 $968
JUMPV
LABELV $969
line 1943
;1941:	}
;1942:
;1943:	color = CG_FadeColor( cg.centerPrintTime, 1000 * cg_centertime.value );
ADDRGP4 cg+116488
INDIRI4
ARGI4
ADDRGP4 cg_centertime+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
ARGI4
ADDRLP4 16
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 1944
;1944:	if ( !color ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $974
line 1945
;1945:		return;
ADDRGP4 $968
JUMPV
LABELV $974
line 1948
;1946:	}
;1947:
;1948:	trap_R_SetColor( color );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1950
;1949:
;1950:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+116500
ASGNP4
line 1952
;1951:
;1952:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
ADDRLP4 8
ADDRGP4 cg+116496
INDIRI4
ADDRGP4 cg+117524
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
ADDRGP4 $980
JUMPV
LABELV $979
line 1954
;1953:
;1954:	while ( 1 ) {
line 1957
;1955:		char linebuffer[1024];
;1956:
;1957:		for ( l = 0; l < 50; l++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $982
line 1958
;1958:			if ( !start[l] || start[l] == '\n' ) {
ADDRLP4 1044
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $988
ADDRLP4 1044
INDIRI4
CNSTI4 10
NEI4 $986
LABELV $988
line 1959
;1959:				break;
ADDRGP4 $984
JUMPV
LABELV $986
line 1961
;1960:			}
;1961:			linebuffer[l] = start[l];
ADDRLP4 4
INDIRI4
ADDRLP4 20
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 1962
;1962:		}
LABELV $983
line 1957
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $982
LABELV $984
line 1963
;1963:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 20
ADDP4
CNSTI1 0
ASGNI1
line 1972
;1964:
;1965:#ifdef MISSIONPACK
;1966:		w = CG_Text_Width(linebuffer, 0.5, 0);
;1967:		h = CG_Text_Height(linebuffer, 0.5, 0);
;1968:		x = (SCREEN_WIDTH - w) / 2;
;1969:		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;1970:		y += h + 6;
;1971:#else
;1972:		CG_DrawString( 320, y, linebuffer, color, cg.centerPrintCharWidth, cg.centerPrintCharWidth * 1.5, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 cg+116492
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cg+116492
INDIRI4
CVIF4 4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1974
;1973:
;1974:		y += cg.centerPrintCharWidth * 1.5;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cg+116492
INDIRI4
CVIF4 4
CNSTF4 1069547520
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $993
JUMPV
LABELV $992
line 1976
;1975:#endif
;1976:		while ( *start && ( *start != '\n' ) ) {
line 1977
;1977:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1978
;1978:		}
LABELV $993
line 1976
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $995
ADDRLP4 1044
INDIRI4
CNSTI4 10
NEI4 $992
LABELV $995
line 1979
;1979:		if ( !*start ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $996
line 1980
;1980:			break;
ADDRGP4 $981
JUMPV
LABELV $996
line 1982
;1981:		}
;1982:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1983
;1983:	}
LABELV $980
line 1954
ADDRGP4 $979
JUMPV
LABELV $981
line 1985
;1984:
;1985:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1986
;1986:}
LABELV $968
endproc CG_DrawCenterString 1052 32
proc CG_DrawCrosshair 44 36
line 2004
;1987:
;1988:
;1989:
;1990:/*
;1991:================================================================================
;1992:
;1993:CROSSHAIR
;1994:
;1995:================================================================================
;1996:*/
;1997:
;1998:
;1999:/*
;2000:=================
;2001:CG_DrawCrosshair
;2002:=================
;2003:*/
;2004:static void CG_DrawCrosshair( void ) {
line 2011
;2005:	float		w, h;
;2006:	qhandle_t	hShader;
;2007:	float		f;
;2008:	float		x, y;
;2009:	int			ca;
;2010:
;2011:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $999
line 2012
;2012:		return;
ADDRGP4 $998
JUMPV
LABELV $999
line 2015
;2013:	}
;2014:
;2015:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1002
line 2016
;2016:		return;
ADDRGP4 $998
JUMPV
LABELV $1002
line 2019
;2017:	}
;2018:
;2019:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $1005
line 2020
;2020:		return;
ADDRGP4 $998
JUMPV
LABELV $1005
line 2024
;2021:	}
;2022:
;2023:	// set color based on health
;2024:	if ( cg_crosshairHealth.integer ) {
ADDRGP4 cg_crosshairHealth+12
INDIRI4
CNSTI4 0
EQI4 $1008
line 2027
;2025:		vec4_t		hcolor;
;2026:
;2027:		CG_ColorForHealth( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 2028
;2028:		trap_R_SetColor( hcolor );
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2029
;2029:	} else {
ADDRGP4 $1009
JUMPV
LABELV $1008
line 2030
;2030:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2031
;2031:	}
LABELV $1009
line 2033
;2032:
;2033:	w = h = cg_crosshairSize.value;
ADDRLP4 28
ADDRGP4 cg_crosshairSize+8
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 2036
;2034:
;2035:	// pulse the size of the crosshair when picking up items
;2036:	f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 8
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117844
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 2037
;2037:	if ( f > 0 && f < ITEM_BLOB_TIME ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $1014
ADDRLP4 8
INDIRF4
CNSTF4 1128792064
GEF4 $1014
line 2038
;2038:		f /= ITEM_BLOB_TIME;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1000593162
MULF4
ASGNF4
line 2039
;2039:		w *= ( 1 + f );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 2040
;2040:		h *= ( 1 + f );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 2041
;2041:	}
LABELV $1014
line 2043
;2042:
;2043:	x = cg_crosshairX.integer;
ADDRLP4 16
ADDRGP4 cg_crosshairX+12
INDIRI4
CVIF4 4
ASGNF4
line 2044
;2044:	y = cg_crosshairY.integer;
ADDRLP4 20
ADDRGP4 cg_crosshairY+12
INDIRI4
CVIF4 4
ASGNF4
line 2046
;2045:
;2046:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 2048
;2047:
;2048:	ca = cg_drawCrosshair.integer;
ADDRLP4 12
ADDRGP4 cg_drawCrosshair+12
INDIRI4
ASGNI4
line 2049
;2049:	if ( ca < 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $1019
line 2050
;2050:		ca = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2051
;2051:	}
LABELV $1019
line 2053
;2052:
;2053:	hShader = cgs.media.crosshairShader[ ca % NUM_CROSSHAIRS ];
ADDRLP4 24
ADDRLP4 12
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+224
ADDP4
INDIRI4
ASGNI4
line 2055
;2054:
;2055:	trap_R_DrawStretchPic( x + cg.refdef.x + 0.5 * (cg.refdef.width - w) - cgs.screenXBias,
ADDRLP4 36
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRGP4 cg+109056
INDIRI4
CVIF4 4
ADDF4
ADDRGP4 cg+109056+8
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ADDRGP4 cgs+31444
INDIRF4
SUBF4
ARGF4
ADDRLP4 40
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRGP4 cg+109056+4
INDIRI4
CVIF4 4
ADDF4
ADDRGP4 cg+109056+12
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ADDRGP4 cgs+31448
INDIRF4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2058
;2056:		y + cg.refdef.y + 0.5 * (cg.refdef.height - h) - cgs.screenYBias,
;2057:		w, h, 0, 0, 1, 1, hShader );
;2058:}
LABELV $998
endproc CG_DrawCrosshair 44 36
proc CG_ScanForCrosshairEntity 92 28
line 2067
;2059:
;2060:
;2061:
;2062:/*
;2063:=================
;2064:CG_ScanForCrosshairEntity
;2065:=================
;2066:*/
;2067:static void CG_ScanForCrosshairEntity( void ) {
line 2072
;2068:	trace_t		trace;
;2069:	vec3_t		start, end;
;2070:	int			content;
;2071:
;2072:	VectorCopy( cg.refdef.vieworg, start );
ADDRLP4 56
ADDRGP4 cg+109056+24
INDIRB
ASGNB 12
line 2073
;2073:	VectorMA( start, 131072, cg.refdef.viewaxis[0], end );
ADDRLP4 68
ADDRLP4 56
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 56+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 56+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 2075
;2074:
;2075:	CG_Trace( &trace, start, vec3_origin, vec3_origin, end, 
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 84
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2077
;2076:		cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY );
;2077:	if ( trace.entityNum >= MAX_CLIENTS ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 64
LTI4 $1048
line 2078
;2078:		return;
ADDRGP4 $1032
JUMPV
LABELV $1048
line 2082
;2079:	}
;2080:
;2081:	// if the player is in fog, don't show it
;2082:	content = CG_PointContents( trace.endpos, 0 );
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 88
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 88
INDIRI4
ASGNI4
line 2083
;2083:	if ( content & CONTENTS_FOG ) {
ADDRLP4 80
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1052
line 2084
;2084:		return;
ADDRGP4 $1032
JUMPV
LABELV $1052
line 2088
;2085:	}
;2086:
;2087:	// if the player is invisible, don't show it
;2088:	if ( cg_entities[ trace.entityNum ].currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1054
line 2089
;2089:		return;
ADDRGP4 $1032
JUMPV
LABELV $1054
line 2093
;2090:	}
;2091:
;2092:	// update the fade timer
;2093:	cg.crosshairClientNum = trace.entityNum;
ADDRGP4 cg+117536
ADDRLP4 0+52
INDIRI4
ASGNI4
line 2094
;2094:	cg.crosshairClientTime = cg.time;
ADDRGP4 cg+117540
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2095
;2095:}
LABELV $1032
endproc CG_ScanForCrosshairEntity 92 28
proc CG_DrawCrosshairNames 16 32
line 2103
;2096:
;2097:
;2098:/*
;2099:=====================
;2100:CG_DrawCrosshairNames
;2101:=====================
;2102:*/
;2103:static void CG_DrawCrosshairNames( void ) {
line 2107
;2104:	float		*color;
;2105:	const char	*name;
;2106:
;2107:	if ( !cg_drawCrosshair.integer ) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1063
line 2108
;2108:		return;
ADDRGP4 $1062
JUMPV
LABELV $1063
line 2110
;2109:	}
;2110:	if ( !cg_drawCrosshairNames.integer ) {
ADDRGP4 cg_drawCrosshairNames+12
INDIRI4
CNSTI4 0
NEI4 $1066
line 2111
;2111:		return;
ADDRGP4 $1062
JUMPV
LABELV $1066
line 2113
;2112:	}
;2113:	if ( cg.renderingThirdPerson ) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $1069
line 2114
;2114:		return;
ADDRGP4 $1062
JUMPV
LABELV $1069
line 2118
;2115:	}
;2116:
;2117:	// scan the known entities to see if the crosshair is sighted on one
;2118:	CG_ScanForCrosshairEntity();
ADDRGP4 CG_ScanForCrosshairEntity
CALLV
pop
line 2121
;2119:
;2120:	// draw the name of the player being looked at
;2121:	color = CG_FadeColor( cg.crosshairClientTime, 1000 );
ADDRGP4 cg+117540
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 8
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2122
;2122:	if ( !color ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1073
line 2123
;2123:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2124
;2124:		return;
ADDRGP4 $1062
JUMPV
LABELV $1073
line 2127
;2125:	}
;2126:
;2127:	name = cgs.clientinfo[ cg.crosshairClientNum ].name;
ADDRLP4 4
ADDRGP4 cg+117536
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+4
ADDP4
ASGNP4
line 2133
;2128:#ifdef MISSIONPACK
;2129:	color[3] *= 0.5f;
;2130:	w = CG_Text_Width(name, 0.3f, 0);
;2131:	CG_Text_Paint( 320 - w / 2, 190, 0.3f, color, name, 0, 0, ITEM_TEXTSTYLE_SHADOWED);
;2132:#else
;2133:	color[3] *= 0.5f;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 2134
;2134:	CG_DrawString( 320, 174, name, color, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
CNSTF4 1127088128
ARGF4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2136
;2135:#endif
;2136:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2137
;2137:}
LABELV $1062
endproc CG_DrawCrosshairNames 16 32
proc CG_DrawSpectator 0 32
line 2147
;2138:
;2139:
;2140://==============================================================================
;2141:
;2142:/*
;2143:=================
;2144:CG_DrawSpectator
;2145:=================
;2146:*/
;2147:static void CG_DrawSpectator( void ) {
line 2148
;2148:	CG_DrawString( 320, cgs.screenYmax - 40 + 1, "SPECTATOR", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1109393408
SUBF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRGP4 $1080
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2149
;2149:	if ( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 1
NEI4 $1081
line 2150
;2150:		CG_DrawString( 320, cgs.screenYmax - 20 + 1, "waiting to play", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1101004800
SUBF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRGP4 $1085
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2151
;2151:	} else if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 $1082
JUMPV
LABELV $1081
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1086
line 2152
;2152:		CG_DrawString( 320, cgs.screenYmax - 20 + 1, "press ESC and use the JOIN menu to play", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1101004800
SUBF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRGP4 $1090
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2153
;2153:	}
LABELV $1086
LABELV $1082
line 2154
;2154:}
LABELV $1078
endproc CG_DrawSpectator 0 32
proc CG_DrawVote 12 32
line 2162
;2155:
;2156:
;2157:/*
;2158:=================
;2159:CG_DrawVote
;2160:=================
;2161:*/
;2162:static void CG_DrawVote( void ) {
line 2166
;2163:	char	*s;
;2164:	int		sec;
;2165:
;2166:	if ( !cgs.voteTime ) {
ADDRGP4 cgs+31700
INDIRI4
CNSTI4 0
NEI4 $1092
line 2167
;2167:		return;
ADDRGP4 $1091
JUMPV
LABELV $1092
line 2171
;2168:	}
;2169:
;2170:	// play a talk beep whenever it is modified
;2171:	if ( cgs.voteModified ) {
ADDRGP4 cgs+31712
INDIRI4
CNSTI4 0
EQI4 $1095
line 2172
;2172:		cgs.voteModified = qfalse;
ADDRGP4 cgs+31712
CNSTI4 0
ASGNI4
line 2173
;2173:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+148692+724
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2174
;2174:	}
LABELV $1095
line 2176
;2175:
;2176:	sec = ( VOTE_TIME - ( cg.time - cgs.voteTime ) ) / 1000;
ADDRLP4 0
CNSTI4 30000
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+31700
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2177
;2177:	if ( sec < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1103
line 2178
;2178:		sec = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2179
;2179:	}
LABELV $1103
line 2186
;2180:#ifdef MISSIONPACK
;2181:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
;2182:	CG_DrawString( cgs.screenXmin - 0, 58, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DF_PROPORTIONAL );
;2183:	s = "or press ESC then click Vote";
;2184:	CG_DrawString( cgs.screenXmin - 0, 58 + SMALLCHAR_HEIGHT + 2, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DF_PROPORTIONAL );
;2185:#else
;2186:	s = va( "VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo );
ADDRGP4 $1105
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+31716
ARGP4
ADDRGP4 cgs+31704
INDIRI4
ARGI4
ADDRGP4 cgs+31708
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 2187
;2187:	CG_DrawString( cgs.screenXmin - 0, 58, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_PROPORTIONAL ); // DS_SHADOW?
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 0
SUBF4
ARGF4
CNSTF4 1114112000
ARGF4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2189
;2188:#endif
;2189:}
LABELV $1091
endproc CG_DrawVote 12 32
proc CG_DrawTeamVote 20 32
line 2197
;2190:
;2191:
;2192:/*
;2193:=================
;2194:CG_DrawTeamVote
;2195:=================
;2196:*/
;2197:static void CG_DrawTeamVote(void) {
line 2201
;2198:	char	*s;
;2199:	int		sec, cs_offset;
;2200:
;2201:	if ( cgs.clientinfo[ cg.clientNum ].team == TEAM_RED )
ADDRGP4 cg+4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1111
line 2202
;2202:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1112
JUMPV
LABELV $1111
line 2203
;2203:	else if ( cgs.clientinfo[ cg.clientNum ].team == TEAM_BLUE )
ADDRGP4 cg+4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1110
line 2204
;2204:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2206
;2205:	else
;2206:		return;
LABELV $1117
LABELV $1112
line 2208
;2207:
;2208:	if ( !cgs.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1121
line 2209
;2209:		return;
ADDRGP4 $1110
JUMPV
LABELV $1121
line 2213
;2210:	}
;2211:
;2212:	// play a talk beep whenever it is modified
;2213:	if ( cgs.teamVoteModified[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1124
line 2214
;2214:		cgs.teamVoteModified[cs_offset] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32764
ADDP4
CNSTI4 0
ASGNI4
line 2215
;2215:		trap_S_StartLocalSound( cgs.media.talkSound, CHAN_LOCAL_SOUND );
ADDRGP4 cgs+148692+724
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2216
;2216:	}
LABELV $1124
line 2218
;2217:
;2218:	sec = ( VOTE_TIME - ( cg.time - cgs.teamVoteTime[cs_offset] ) ) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2219
;2219:	if ( sec < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1132
line 2220
;2220:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2221
;2221:	}
LABELV $1132
line 2222
;2222:	s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset],
ADDRGP4 $1134
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+32772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32748
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32756
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2225
;2223:							cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset] );
;2224:
;2225:	CG_DrawString( cgs.screenXmin - 0, 90, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_PROPORTIONAL ); // DF_SHADOW?
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 0
SUBF4
ARGF4
CNSTF4 1119092736
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2226
;2226:}
LABELV $1110
endproc CG_DrawTeamVote 20 32
proc CG_DrawScoreboard 4 0
line 2229
;2227:
;2228:
;2229:static qboolean CG_DrawScoreboard( void ) {
line 2294
;2230:#ifdef MISSIONPACK
;2231:	static qboolean firstTime = qtrue;
;2232:	float fade, *fadeColor;
;2233:
;2234:	if (menuScoreboard) {
;2235:		menuScoreboard->window.flags &= ~WINDOW_FORCED;
;2236:	}
;2237:	if (cg_paused.integer) {
;2238:		cg.deferredPlayerLoading = 0;
;2239:		firstTime = qtrue;
;2240:		return qfalse;
;2241:	}
;2242:
;2243:	// should never happen in Team Arena
;2244:	if (cgs.gametype == GT_SINGLE_PLAYER && cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2245:		cg.deferredPlayerLoading = 0;
;2246:		firstTime = qtrue;
;2247:		return qfalse;
;2248:	}
;2249:
;2250:	// don't draw scoreboard during death while warmup up
;2251:	if ( cg.warmup && !cg.showScores ) {
;2252:		return qfalse;
;2253:	}
;2254:
;2255:	if ( cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION ) {
;2256:		fade = 1.0;
;2257:		fadeColor = colorWhite;
;2258:	} else {
;2259:		fadeColor = CG_FadeColor( cg.scoreFadeTime, FADE_TIME );
;2260:		if ( !fadeColor ) {
;2261:			// next time scoreboard comes up, don't print killer
;2262:			cg.deferredPlayerLoading = 0;
;2263:			cg.killerName[0] = 0;
;2264:			firstTime = qtrue;
;2265:			return qfalse;
;2266:		}
;2267:		fade = *fadeColor;
;2268:	}																					  
;2269:
;2270:
;2271:	if (menuScoreboard == NULL) {
;2272:		if ( cgs.gametype >= GT_TEAM ) {
;2273:			menuScoreboard = Menus_FindByName("teamscore_menu");
;2274:		} else {
;2275:			menuScoreboard = Menus_FindByName("score_menu");
;2276:		}
;2277:	}
;2278:
;2279:	if (menuScoreboard) {
;2280:		if (firstTime) {
;2281:			CG_SetScoreSelection(menuScoreboard);
;2282:			firstTime = qfalse;
;2283:		}
;2284:		Menu_Paint(menuScoreboard, qtrue);
;2285:	}
;2286:
;2287:	// load any models that have been deferred
;2288:	if ( ++cg.deferredPlayerLoading > 10 ) {
;2289:		CG_LoadDeferredPlayers();
;2290:	}
;2291:
;2292:	return qtrue;
;2293:#else
;2294:	return CG_DrawOldScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1139
endproc CG_DrawScoreboard 4 0
proc CG_DrawIntermission 4 0
line 2304
;2295:#endif
;2296:}
;2297:
;2298:
;2299:/*
;2300:=================
;2301:CG_DrawIntermission
;2302:=================
;2303:*/
;2304:static void CG_DrawIntermission( void ) {
line 2312
;2305://	int key;
;2306:#ifdef MISSIONPACK
;2307:	//if (cg_singlePlayer.integer) {
;2308:	//	CG_DrawCenterString();
;2309:	//	return;
;2310:	//}
;2311:#else
;2312:	if ( cgs.gametype == GT_SINGLE_PLAYER ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 2
NEI4 $1141
line 2313
;2313:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2314
;2314:		return;
ADDRGP4 $1140
JUMPV
LABELV $1141
line 2317
;2315:	}
;2316:#endif
;2317:	cg.scoreFadeTime = cg.time;
ADDRGP4 cg+115364
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2318
;2318:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+115360
ADDRLP4 0
INDIRI4
ASGNI4
line 2319
;2319:}
LABELV $1140
endproc CG_DrawIntermission 4 0
proc CG_DrawFollow 4 32
line 2327
;2320:
;2321:
;2322:/*
;2323:=================
;2324:CG_DrawFollow
;2325:=================
;2326:*/
;2327:static qboolean CG_DrawFollow( void ) {
line 2331
;2328:
;2329:	const char	*name;
;2330:
;2331:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1148
line 2332
;2332:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1147
JUMPV
LABELV $1148
line 2335
;2333:	}
;2334:
;2335:	CG_DrawString( 320, cgs.screenYmin + 24, "following", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_CENTER | DS_SHADOW );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31460
INDIRF4
CNSTF4 1103101952
ADDF4
ARGF4
ADDRGP4 $1152
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2337
;2336:
;2337:	name = cgs.clientinfo[ cg.snap->ps.clientNum ].name;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+4
ADDP4
ASGNP4
line 2339
;2338:
;2339:	CG_DrawString( 320, cgs.screenYmin + 40, name, colorWhite, GIANT_WIDTH, GIANT_HEIGHT, 0, DS_FORCE_COLOR | DS_SHADOW | DS_CENTER );
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31460
INDIRF4
CNSTF4 1109393408
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2341
;2340:
;2341:	return qtrue;
CNSTI4 1
RETI4
LABELV $1147
endproc CG_DrawFollow 4 32
proc CG_DrawAmmoWarning 4 32
line 2351
;2342:}
;2343:
;2344:
;2345:
;2346:/*
;2347:=================
;2348:CG_DrawAmmoWarning
;2349:=================
;2350:*/
;2351:static void CG_DrawAmmoWarning( void ) {
line 2354
;2352:	const char	*s;
;2353:
;2354:	if ( cg_drawAmmoWarning.integer == 0 ) {
ADDRGP4 cg_drawAmmoWarning+12
INDIRI4
CNSTI4 0
NEI4 $1158
line 2355
;2355:		return;
ADDRGP4 $1157
JUMPV
LABELV $1158
line 2358
;2356:	}
;2357:
;2358:	if ( !cg.lowAmmoWarning ) {
ADDRGP4 cg+117528
INDIRI4
CNSTI4 0
NEI4 $1161
line 2359
;2359:		return;
ADDRGP4 $1157
JUMPV
LABELV $1161
line 2362
;2360:	}
;2361:
;2362:	if ( cg.lowAmmoWarning == 2 ) {
ADDRGP4 cg+117528
INDIRI4
CNSTI4 2
NEI4 $1164
line 2363
;2363:		s = "OUT OF AMMO";
ADDRLP4 0
ADDRGP4 $1167
ASGNP4
line 2364
;2364:	} else {
ADDRGP4 $1165
JUMPV
LABELV $1164
line 2365
;2365:		s = "LOW AMMO WARNING";
ADDRLP4 0
ADDRGP4 $1168
ASGNP4
line 2366
;2366:	}
LABELV $1165
line 2368
;2367:
;2368:	CG_DrawString( 320, 64, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_PROPORTIONAL | DS_CENTER | DS_SHADOW );
CNSTF4 1134559232
ARGF4
CNSTF4 1115684864
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2369
;2369:}
LABELV $1157
endproc CG_DrawAmmoWarning 4 32
proc CG_DrawWarmup 36 32
line 2415
;2370:
;2371:
;2372:#ifdef MISSIONPACK
;2373:/*
;2374:=================
;2375:CG_DrawProxWarning
;2376:=================
;2377:*/
;2378:static void CG_DrawProxWarning( void ) {
;2379:	char s [32];
;2380:	static int proxTime;
;2381:	static int proxCounter;
;2382:	static int proxTick;
;2383:
;2384:	if( !(cg.snap->ps.eFlags & EF_TICKING ) ) {
;2385:		proxTime = 0;
;2386:		return;
;2387:	}
;2388:
;2389:	if ( proxTime == 0 ) {
;2390:		proxTime = cg.time + 5000;
;2391:		proxCounter = 5;
;2392:		proxTick = 0;
;2393:	}
;2394:
;2395:	if (cg.time > proxTime) {
;2396:		proxTick = proxCounter--;
;2397:		proxTime = cg.time + 1000;
;2398:	}
;2399:
;2400:	if (proxTick != 0) {
;2401:		Com_sprintf( s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick );
;2402:	} else {
;2403:		Com_sprintf( s, sizeof(s), "YOU HAVE BEEN MINED" );
;2404:	}
;2405:
;2406:	CG_DrawString( 320, 64 + 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)], BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DF_SHADOW | DF_FORCE_COLOR | DF_CENTER );
;2407:#endif
;2408:
;2409:
;2410:/*
;2411:=================
;2412:CG_DrawWarmup
;2413:=================
;2414:*/
;2415:static void CG_DrawWarmup( void ) {
line 2425
;2416:	int			w;
;2417:	int			i;
;2418:#ifdef MISSIONPACK
;2419:	float scale;
;2420:#endif
;2421:	clientInfo_t *ci1, *ci2;
;2422:	int			cw;
;2423:	const char	*s;
;2424:
;2425:	if ( !cg.warmup ) {
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
NEI4 $1170
line 2426
;2426:		return;
ADDRGP4 $1169
JUMPV
LABELV $1170
line 2429
;2427:	}
;2428:
;2429:	if ( cg.warmup < 0 ) {
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
GEI4 $1173
line 2430
;2430:		CG_DrawString( 320,24, "Waiting for players", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0,
CNSTF4 1134559232
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 $1176
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2432
;2431:			DS_PROPORTIONAL | DS_CENTER | DS_SHADOW );
;2432:		return;
ADDRGP4 $1169
JUMPV
LABELV $1173
line 2435
;2433:	}
;2434:
;2435:	if ( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 1
NEI4 $1177
line 2437
;2436:		// find the two active players
;2437:		ci1 = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2438
;2438:		ci2 = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 2439
;2439:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1183
JUMPV
LABELV $1180
line 2440
;2440:			if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE ) {
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1185
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1185
line 2441
;2441:				if ( !ci1 ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1190
line 2442
;2442:					ci1 = &cgs.clientinfo[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2443
;2443:				} else {
ADDRGP4 $1191
JUMPV
LABELV $1190
line 2444
;2444:					ci2 = &cgs.clientinfo[i];
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2445
;2445:				}
LABELV $1191
line 2446
;2446:			}
LABELV $1185
line 2447
;2447:		}
LABELV $1181
line 2439
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1183
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $1180
line 2449
;2448:
;2449:		if ( ci1 && ci2 ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1178
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1178
line 2450
;2450:			s = va( "%s vs %s", ci1->name, ci2->name );
ADDRGP4 $1196
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 2455
;2451:#ifdef MISSIONPACK
;2452:			w = CG_Text_Width(s, 0.6f, 0);
;2453:			CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2454:#else
;2455:			w = CG_DrawStrlen( s );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 2456
;2456:			if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 20
INDIRI4
CNSTI4 20
LEI4 $1197
line 2457
;2457:				cw = 640 / w;
ADDRLP4 8
CNSTI4 640
ADDRLP4 20
INDIRI4
DIVI4
ASGNI4
line 2458
;2458:			} else {
ADDRGP4 $1198
JUMPV
LABELV $1197
line 2459
;2459:				cw = GIANT_WIDTH;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 2460
;2460:			}
LABELV $1198
line 2461
;2461:			CG_DrawString( 320, 20, s, colorWhite, cw, cw*1.5, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 32
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2463
;2462:#endif
;2463:		}
line 2464
;2464:	} else {
ADDRGP4 $1178
JUMPV
LABELV $1177
line 2465
;2465:		if ( cgs.gametype == GT_FFA ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 0
NEI4 $1199
line 2466
;2466:			s = "Free For All";
ADDRLP4 12
ADDRGP4 $1202
ASGNP4
line 2467
;2467:		} else if ( cgs.gametype == GT_TEAM ) {
ADDRGP4 $1200
JUMPV
LABELV $1199
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
NEI4 $1203
line 2468
;2468:			s = "Team Deathmatch";
ADDRLP4 12
ADDRGP4 $1206
ASGNP4
line 2469
;2469:		} else if ( cgs.gametype == GT_CTF ) {
ADDRGP4 $1204
JUMPV
LABELV $1203
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $1207
line 2470
;2470:			s = "Capture the Flag";
ADDRLP4 12
ADDRGP4 $1210
ASGNP4
line 2479
;2471:#ifdef MISSIONPACK
;2472:		} else if ( cgs.gametype == GT_1FCTF ) {
;2473:			s = "One Flag CTF";
;2474:		} else if ( cgs.gametype == GT_OBELISK ) {
;2475:			s = "Overload";
;2476:		} else if ( cgs.gametype == GT_HARVESTER ) {
;2477:			s = "Harvester";
;2478:#endif
;2479:		} else {
ADDRGP4 $1208
JUMPV
LABELV $1207
line 2480
;2480:			s = "";
ADDRLP4 12
ADDRGP4 $1211
ASGNP4
line 2481
;2481:		}
LABELV $1208
LABELV $1204
LABELV $1200
line 2486
;2482:#ifdef MISSIONPACK
;2483:		w = CG_Text_Width(s, 0.6f, 0);
;2484:		CG_Text_Paint(320 - w / 2, 90, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2485:#else
;2486:		w = CG_DrawStrlen( s );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 2487
;2487:		if ( w > 640 / GIANT_WIDTH ) {
ADDRLP4 20
INDIRI4
CNSTI4 20
LEI4 $1212
line 2488
;2488:			cw = 640 / w;
ADDRLP4 8
CNSTI4 640
ADDRLP4 20
INDIRI4
DIVI4
ASGNI4
line 2489
;2489:		} else {
ADDRGP4 $1213
JUMPV
LABELV $1212
line 2490
;2490:			cw = GIANT_WIDTH;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 2491
;2491:		}
LABELV $1213
line 2492
;2492:		CG_DrawString( 320, 25, s, colorWhite, cw, cw*1.1f, 0, DS_PROPORTIONAL | DS_SHADOW | DS_CENTER );
CNSTF4 1134559232
ARGF4
CNSTF4 1103626240
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 28
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
CNSTF4 1066192077
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2494
;2493:#endif
;2494:	}
LABELV $1178
line 2496
;2495:
;2496:	if ( cg.warmupCount <= 0 )
ADDRGP4 cg+117824
INDIRI4
CNSTI4 0
GTI4 $1214
line 2497
;2497:		return;
ADDRGP4 $1169
JUMPV
LABELV $1214
line 2499
;2498:
;2499:	s = va( "Starts in: %i", cg.warmupCount );
ADDRGP4 $1217
ARGP4
ADDRGP4 cg+117824
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 2501
;2500:
;2501:	switch ( cg.warmupCount ) {
ADDRLP4 28
ADDRGP4 cg+117824
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $1222
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $1223
ADDRLP4 28
INDIRI4
CNSTI4 3
EQI4 $1224
ADDRGP4 $1219
JUMPV
LABELV $1222
line 2503
;2502:	case 1:
;2503:		cw = 28;
ADDRLP4 8
CNSTI4 28
ASGNI4
line 2507
;2504:#ifdef MISSIONPACK
;2505:		scale = 0.54f;
;2506:#endif
;2507:		break;
ADDRGP4 $1220
JUMPV
LABELV $1223
line 2509
;2508:	case 2:
;2509:		cw = 24;
ADDRLP4 8
CNSTI4 24
ASGNI4
line 2513
;2510:#ifdef MISSIONPACK
;2511:		scale = 0.51f;
;2512:#endif
;2513:		break;
ADDRGP4 $1220
JUMPV
LABELV $1224
line 2515
;2514:	case 3:
;2515:		cw = 20;
ADDRLP4 8
CNSTI4 20
ASGNI4
line 2519
;2516:#ifdef MISSIONPACK
;2517:		scale = 0.48f;
;2518:#endif
;2519:		break;
ADDRGP4 $1220
JUMPV
LABELV $1219
line 2521
;2520:	default:
;2521:		cw = 16;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 2525
;2522:#ifdef MISSIONPACK
;2523:		scale = 0.45f;
;2524:#endif
;2525:		break;
LABELV $1220
line 2532
;2526:	}
;2527:
;2528:#ifdef MISSIONPACK
;2529:	w = CG_Text_Width(s, scale, 0);
;2530:	CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2531:#else
;2532:	CG_DrawString( 320, 70, s, colorWhite, cw, cw * 1.5, 0, DS_CENTER | DS_SHADOW | DS_PROPORTIONAL );
CNSTF4 1134559232
ARGF4
CNSTF4 1116471296
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 32
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2534
;2533:#endif
;2534:}
LABELV $1169
endproc CG_DrawWarmup 36 32
proc CG_Draw2D 24 36
line 2563
;2535:
;2536:
;2537://==================================================================================
;2538:#ifdef MISSIONPACK
;2539:/* 
;2540:=================
;2541:CG_DrawTimedMenus
;2542:=================
;2543:*/
;2544:void CG_DrawTimedMenus( void ) {
;2545:	if (cg.voiceTime) {
;2546:		int t = cg.time - cg.voiceTime;
;2547:		if ( t > 2500 ) {
;2548:			Menus_CloseByName("voiceMenu");
;2549:			trap_Cvar_Set("cl_conXOffset", "0");
;2550:			cg.voiceTime = 0;
;2551:		}
;2552:	}
;2553:}
;2554:#endif
;2555:
;2556:
;2557:/*
;2558:=================
;2559:CG_Draw2D
;2560:=================
;2561:*/
;2562:static void CG_Draw2D( stereoFrame_t stereoFrame )
;2563:{
line 2570
;2564:#ifdef MISSIONPACK
;2565:	if (cgs.orderPending && cg.time > cgs.orderTime) {
;2566:		CG_CheckOrderPending();
;2567:	}
;2568:#endif
;2569:	// if we are taking a levelshot for the menu, don't draw anything
;2570:	if ( cg.levelShot ) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $1226
line 2571
;2571:		return;
ADDRGP4 $1225
JUMPV
LABELV $1226
line 2574
;2572:	}
;2573:
;2574:	if ( cg_draw2D.integer == 0 ) {
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $1229
line 2575
;2575:		return;
ADDRGP4 $1225
JUMPV
LABELV $1229
line 2578
;2576:	}
;2577:
;2578:	if ( cg.snap->ps.pm_type == PM_INTERMISSION ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1232
line 2579
;2579:		CG_DrawIntermission();
ADDRGP4 CG_DrawIntermission
CALLV
pop
line 2580
;2580:		return;
ADDRGP4 $1225
JUMPV
LABELV $1232
line 2588
;2581:	}
;2582:
;2583:/*
;2584:	if (cg.cameraMode) {
;2585:		return;
;2586:	}
;2587:*/
;2588:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1235
line 2589
;2589:		CG_DrawSpectator();
ADDRGP4 CG_DrawSpectator
CALLV
pop
line 2590
;2590:		CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2591
;2591:		CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2592
;2592:	} else {
ADDRGP4 $1236
JUMPV
LABELV $1235
line 2594
;2593:		// don't draw any status if dead or the scoreboard is being explicitly shown
;2594:		if ( !cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0 ) {
ADDRGP4 cg+115356
INDIRI4
CNSTI4 0
NEI4 $1238
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1238
line 2602
;2595:
;2596:#ifdef MISSIONPACK
;2597:			if ( cg_drawStatus.integer ) {
;2598:				Menu_PaintAll();
;2599:				CG_DrawTimedMenus();
;2600:			}
;2601:#else
;2602:			CG_DrawStatusBar();
ADDRGP4 CG_DrawStatusBar
CALLV
pop
line 2605
;2603:#endif
;2604:      
;2605:			CG_DrawAmmoWarning();
ADDRGP4 CG_DrawAmmoWarning
CALLV
pop
line 2610
;2606:
;2607:#ifdef MISSIONPACK
;2608:			CG_DrawProxWarning();
;2609:#endif      
;2610:			CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2611
;2611:			CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2612
;2612:			CG_DrawWeaponSelect();
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 2615
;2613:
;2614:#ifndef MISSIONPACK
;2615:			CG_DrawHoldableItem();
ADDRGP4 CG_DrawHoldableItem
CALLV
pop
line 2619
;2616:#else
;2617:			//CG_DrawPersistantPowerup();
;2618:#endif
;2619:			CG_DrawReward();
ADDRGP4 CG_DrawReward
CALLV
pop
line 2620
;2620:		}
LABELV $1238
line 2622
;2621:    
;2622:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1242
line 2624
;2623:#ifndef MISSIONPACK
;2624:			CG_DrawTeamInfo();
ADDRGP4 CG_DrawTeamInfo
CALLV
pop
line 2626
;2625:#endif
;2626:		}
LABELV $1242
line 2627
;2627:	}
LABELV $1236
line 2629
;2628:
;2629:	CG_DrawVote();
ADDRGP4 CG_DrawVote
CALLV
pop
line 2630
;2630:	CG_DrawTeamVote();
ADDRGP4 CG_DrawTeamVote
CALLV
pop
line 2632
;2631:
;2632:	CG_DrawLagometer();
ADDRGP4 CG_DrawLagometer
CALLV
pop
line 2639
;2633:
;2634:#ifdef MISSIONPACK
;2635:	if (!cg_paused.integer) {
;2636:		CG_DrawUpperRight(stereoFrame);
;2637:	}
;2638:#else
;2639:	CG_DrawUpperRight(stereoFrame);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawUpperRight
CALLV
pop
line 2643
;2640:#endif
;2641:
;2642:#ifndef MISSIONPACK
;2643:	CG_DrawLowerRight();
ADDRGP4 CG_DrawLowerRight
CALLV
pop
line 2644
;2644:	CG_DrawLowerLeft();
ADDRGP4 CG_DrawLowerLeft
CALLV
pop
line 2647
;2645:#endif
;2646:
;2647:	if ( !CG_DrawFollow() ) {
ADDRLP4 0
ADDRGP4 CG_DrawFollow
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1245
line 2648
;2648:		CG_DrawWarmup();
ADDRGP4 CG_DrawWarmup
CALLV
pop
line 2649
;2649:	}
LABELV $1245
line 2652
;2650:
;2651:	// don't draw center string if scoreboard is up
;2652:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 4
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+115360
ADDRLP4 4
INDIRI4
ASGNI4
line 2653
;2653:	if ( !cg.scoreBoardShowing ) {
ADDRGP4 cg+115360
INDIRI4
CNSTI4 0
NEI4 $1248
line 2654
;2654:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2655
;2655:	}
LABELV $1248
line 2657
;2656:
;2657:	if ( cgs.score_catched ) {
ADDRGP4 cgs+149708
INDIRI4
CNSTI4 0
EQI4 $1251
line 2659
;2658:		float x, y, w, h;
;2659:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2660
;2660:		x = cgs.cursorX - 12;
ADDRLP4 8
ADDRGP4 cgs+149716
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 2661
;2661:		y = cgs.cursorY - 12;
ADDRLP4 12
ADDRGP4 cgs+149720
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 2662
;2662:		w = 24;
ADDRLP4 16
CNSTF4 1103101952
ASGNF4
line 2663
;2663:		h = 24;
ADDRLP4 20
CNSTF4 1103101952
ASGNF4
line 2664
;2664:		CG_AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 2665
;2665:		trap_R_DrawStretchPic( x, y, w, h, 0, 0, 1, 1, cgs.media.cursor );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 cgs+148692+944
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2666
;2666:	}
LABELV $1251
line 2667
;2667:}
LABELV $1225
endproc CG_Draw2D 24 36
proc CG_DrawTourneyScoreboard 0 0
line 2670
;2668:
;2669:
;2670:static void CG_DrawTourneyScoreboard( void ) {
line 2673
;2671:#ifdef MISSIONPACK
;2672:#else
;2673:	CG_DrawOldTourneyScoreboard();
ADDRGP4 CG_DrawOldTourneyScoreboard
CALLV
pop
line 2675
;2674:#endif
;2675:}
LABELV $1258
endproc CG_DrawTourneyScoreboard 0 0
proc CG_CalculatePing 16 0
line 2678
;2676:
;2677:
;2678:static void CG_CalculatePing( void ) {
line 2681
;2679:	int count, i, v;
;2680:
;2681:	cg.meanPing = 0;
ADDRGP4 cg+149068
CNSTI4 0
ASGNI4
line 2683
;2682:
;2683:	for ( i = 0, count = 0; i < LAG_SAMPLES; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1264
JUMPV
LABELV $1261
line 2685
;2684:
;2685:		v = lagometer.snapshotSamples[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
ASGNI4
line 2686
;2686:		if ( v >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1266
line 2687
;2687:			cg.meanPing += v;
ADDRLP4 12
ADDRGP4 cg+149068
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
line 2688
;2688:			count++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2689
;2689:		}
LABELV $1266
line 2691
;2690:
;2691:	}
LABELV $1262
line 2683
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1264
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $1261
line 2693
;2692:
;2693:	if ( count ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1269
line 2694
;2694:		cg.meanPing /= count;
ADDRLP4 12
ADDRGP4 cg+149068
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
DIVI4
ASGNI4
line 2695
;2695:	}
LABELV $1269
line 2696
;2696:}
LABELV $1259
endproc CG_CalculatePing 16 0
proc CG_WarmupEvents 8 12
line 2699
;2697:
;2698:
;2699:static void CG_WarmupEvents( void ) {
line 2703
;2700:
;2701:	int	count;
;2702:
;2703:	if ( !cg.warmup )
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
NEI4 $1273
line 2704
;2704:		return;
ADDRGP4 $1272
JUMPV
LABELV $1273
line 2706
;2705:
;2706:	if ( cg.warmup < 0 ) {
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
GEI4 $1276
line 2707
;2707:		cg.warmupCount = -1;
ADDRGP4 cg+117824
CNSTI4 -1
ASGNI4
line 2708
;2708:		return;
ADDRGP4 $1272
JUMPV
LABELV $1276
line 2711
;2709:	}
;2710:
;2711:	if ( cg.warmup < cg.time ) {
ADDRGP4 cg+117820
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $1280
line 2712
;2712:		cg.warmup = 0;
ADDRGP4 cg+117820
CNSTI4 0
ASGNI4
line 2713
;2713:		count = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2714
;2714:	} else {
ADDRGP4 $1281
JUMPV
LABELV $1280
line 2715
;2715:		count = ( cg.warmup - cg.time + 999 ) / 1000;
ADDRLP4 0
ADDRGP4 cg+117820
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 999
ADDI4
CNSTI4 1000
DIVI4
ASGNI4
line 2716
;2716:	}
LABELV $1281
line 2718
;2717:
;2718:	if ( cg.warmupCount == -2 && cg.demoPlayback ) {
ADDRGP4 cg+117824
INDIRI4
CNSTI4 -2
NEI4 $1287
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $1287
line 2719
;2719:		cg.warmupCount = 0;
ADDRGP4 cg+117824
CNSTI4 0
ASGNI4
line 2720
;2720:	}
LABELV $1287
line 2722
;2721:
;2722:	if ( cg.warmupCount == count ) {
ADDRGP4 cg+117824
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1292
line 2723
;2723:		return;
ADDRGP4 $1272
JUMPV
LABELV $1292
line 2726
;2724:	}
;2725:
;2726:	cg.warmupCount = count;
ADDRGP4 cg+117824
ADDRLP4 0
INDIRI4
ASGNI4
line 2727
;2727:	cg.timelimitWarnings = 0;
ADDRGP4 cg+107616
CNSTI4 0
ASGNI4
line 2729
;2728:
;2729:	switch ( count ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1298
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $1298
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1318
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $1318
address $1299
address $1309
address $1312
address $1315
code
LABELV $1299
line 2731
;2730:		case 0:
;2731:			if ( cg.warmupFightSound <= cg.time ) {
ADDRGP4 cg+117828
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $1300
line 2732
;2732:				trap_S_StartLocalSound( cgs.media.countFightSound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+936
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2733
;2733:				cg.warmupFightSound = cg.time + 750;
ADDRGP4 cg+117828
ADDRGP4 cg+107604
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 2734
;2734:			}
LABELV $1300
line 2735
;2735:			CG_CenterPrint( "FIGHT!", 120, GIANTCHAR_WIDTH*2 );
ADDRGP4 $1308
ARGP4
CNSTI4 120
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 2736
;2736:			break;
ADDRGP4 $1298
JUMPV
LABELV $1309
line 2739
;2737:
;2738:		case 1:
;2739:			trap_S_StartLocalSound( cgs.media.count1Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+932
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2740
;2740:			break;
ADDRGP4 $1298
JUMPV
LABELV $1312
line 2743
;2741:
;2742:		case 2:
;2743:			trap_S_StartLocalSound( cgs.media.count2Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+928
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2744
;2744:			break;
ADDRGP4 $1298
JUMPV
LABELV $1315
line 2747
;2745:
;2746:		case 3:
;2747:			trap_S_StartLocalSound( cgs.media.count3Sound, CHAN_ANNOUNCER );
ADDRGP4 cgs+148692+924
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2748
;2748:			break;
line 2751
;2749:
;2750:		default:
;2751:			break;
LABELV $1298
line 2753
;2752:	}
;2753:}
LABELV $1272
endproc CG_WarmupEvents 8 12
export CG_WarmupEvent
proc CG_WarmupEvent 0 0
line 2758
;2754:
;2755:
;2756:
;2757:// will be called on warmup end and when client changed
;2758:void CG_WarmupEvent( void ) {
line 2760
;2759:
;2760:	cg.attackerTime = 0;
ADDRGP4 cg+117588
CNSTI4 0
ASGNI4
line 2761
;2761:	cg.attackerName[0] = '\0';
ADDRGP4 cg+117552
CNSTI1 0
ASGNI1
line 2763
;2762:
;2763:	cg.itemPickupTime = 0;
ADDRGP4 cg+117840
CNSTI4 0
ASGNI4
line 2764
;2764:	cg.itemPickupBlendTime = 0;
ADDRGP4 cg+117844
CNSTI4 0
ASGNI4
line 2765
;2765:	cg.itemPickupCount = 0;
ADDRGP4 cg+117836
CNSTI4 0
ASGNI4
line 2767
;2766:
;2767:	cg.killerTime = 0;
ADDRGP4 cg+115432
CNSTI4 0
ASGNI4
line 2768
;2768:	cg.killerName[0] = '\0';
ADDRGP4 cg+115368
CNSTI1 0
ASGNI1
line 2770
;2769:	
;2770:	cg.damageTime = 0;
ADDRGP4 cg+117860
CNSTI4 0
ASGNI4
line 2772
;2771:
;2772:	cg.rewardStack = 0;
ADDRGP4 cg+117596
CNSTI4 0
ASGNI4
line 2773
;2773:	cg.rewardTime = 0;
ADDRGP4 cg+117600
CNSTI4 0
ASGNI4
line 2775
;2774:	
;2775:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+117848
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2777
;2776:
;2777:	cg.lowAmmoWarning = 0;
ADDRGP4 cg+117528
CNSTI4 0
ASGNI4
line 2779
;2778:
;2779:	cg.followTime = 0;
ADDRGP4 cg+149080
CNSTI4 0
ASGNI4
line 2780
;2780:}
LABELV $1319
endproc CG_WarmupEvent 0 0
proc CG_ApplyClientChange 0 0
line 2785
;2781:
;2782:
;2783:// called each time client team changed
;2784:static void CG_ApplyClientChange( void )
;2785:{
line 2786
;2786:	CG_WarmupEvent();
ADDRGP4 CG_WarmupEvent
CALLV
pop
line 2787
;2787:	CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 2788
;2788:}
LABELV $1334
endproc CG_ApplyClientChange 0 0
data
align 4
LABELV $1336
byte 4 -1
align 4
LABELV $1337
byte 4 -1
align 4
LABELV $1338
byte 4 -1
export CG_TrackClientTeamChange
code
proc CG_TrackClientTeamChange 8 4
line 2797
;2789:
;2790:
;2791:/*
;2792:=====================
;2793:CG_TrackClientTeamChange
;2794:=====================
;2795:*/
;2796:void CG_TrackClientTeamChange( void ) 
;2797:{
line 2805
;2798:	static int spec_client = -1;
;2799:	static int spec_team = -1;
;2800:	static int curr_team = -1;
;2801:
;2802:	int		ti; // team from clientinfo 
;2803:	int		tp; // persistant team from snapshot
;2804:
;2805:	if ( !cg.snap )
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1339
line 2806
;2806:		return;
ADDRGP4 $1335
JUMPV
LABELV $1339
line 2808
;2807:
;2808:	tp = cg.snap->ps.persistant[ PERS_TEAM ];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 2809
;2809:	ti = cgs.clientinfo[ cg.snap->ps.clientNum ].team;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
line 2811
;2810:
;2811:	if ( !(cg.snap->ps.pm_flags & PMF_FOLLOW) && tp != TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1346
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $1346
line 2812
;2812:		ti = tp; // use team from persistant info
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 2813
;2813:	}
LABELV $1346
line 2816
;2814:
;2815:	// team changed
;2816:	if ( curr_team != ti )
ADDRGP4 $1338
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1349
line 2817
;2817:	{
line 2818
;2818:		curr_team = ti;
ADDRGP4 $1338
ADDRLP4 4
INDIRI4
ASGNI4
line 2819
;2819:		spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1336
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2820
;2820:		spec_team = tp;
ADDRGP4 $1337
ADDRLP4 0
INDIRI4
ASGNI4
line 2822
;2821:
;2822:		if ( spec_team == TEAM_SPECTATOR )
ADDRGP4 $1337
INDIRI4
CNSTI4 3
NEI4 $1352
line 2823
;2823:			spec_team = curr_team;
ADDRGP4 $1337
ADDRGP4 $1338
INDIRI4
ASGNI4
LABELV $1352
line 2825
;2824:
;2825:		CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 2826
;2826:		CG_ResetPlayerEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 2827
;2827:		return;
ADDRGP4 $1335
JUMPV
LABELV $1349
line 2830
;2828:	}
;2829:
;2830:	if ( curr_team == TEAM_SPECTATOR )
ADDRGP4 $1338
INDIRI4
CNSTI4 3
NEI4 $1355
line 2831
;2831:	{
line 2832
;2832:		if ( spec_team != tp )
ADDRGP4 $1337
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1357
line 2833
;2833:		{
line 2834
;2834:			spec_team  = tp;
ADDRGP4 $1337
ADDRLP4 0
INDIRI4
ASGNI4
line 2835
;2835:			spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1336
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2837
;2836:
;2837:			CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 2838
;2838:			CG_ResetPlayerEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 2839
;2839:			return;
ADDRGP4 $1335
JUMPV
LABELV $1357
line 2842
;2840:		}
;2841:
;2842:		if ( cgs.gametype >= GT_TEAM ) 
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1361
line 2843
;2843:		{
line 2844
;2844:			spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1336
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2845
;2845:			return;
ADDRGP4 $1335
JUMPV
LABELV $1361
line 2848
;2846:		}
;2847:		// pass through to spec client checks
;2848:	}
LABELV $1355
line 2850
;2849:	
;2850:	if ( spec_client != cg.snap->ps.clientNum ) 
ADDRGP4 $1336
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $1365
line 2851
;2851:	{
line 2852
;2852:		spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1336
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2853
;2853:		spec_team = tp;
ADDRGP4 $1337
ADDRLP4 0
INDIRI4
ASGNI4
line 2855
;2854:
;2855:		if ( spec_team == TEAM_SPECTATOR )
ADDRGP4 $1337
INDIRI4
CNSTI4 3
NEI4 $1369
line 2856
;2856:			spec_team = cgs.clientinfo[ cg.snap->ps.clientNum ].team;
ADDRGP4 $1337
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
LABELV $1369
line 2858
;2857:
;2858:		CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 2859
;2859:		CG_ResetPlayerEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 2860
;2860:	}
LABELV $1365
line 2861
;2861:}
LABELV $1335
endproc CG_TrackClientTeamChange 8 4
export CG_DrawActive
proc CG_DrawActive 0 4
line 2871
;2862:
;2863:
;2864:/*
;2865:=====================
;2866:CG_DrawActive
;2867:
;2868:Perform all drawing needed to completely fill the screen
;2869:=====================
;2870:*/
;2871:void CG_DrawActive( stereoFrame_t stereoView ) {
line 2873
;2872:	// optionally draw the info screen instead
;2873:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1376
line 2874
;2874:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 2875
;2875:		return;
ADDRGP4 $1375
JUMPV
LABELV $1376
line 2878
;2876:	}
;2877:
;2878:	if ( !cg.demoPlayback ) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $1379
line 2879
;2879:		CG_CalculatePing();
ADDRGP4 CG_CalculatePing
CALLV
pop
line 2880
;2880:	}
LABELV $1379
line 2883
;2881:
;2882:	// optionally draw the tournement scoreboard instead
;2883:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR &&
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1382
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1382
line 2884
;2884:		( cg.snap->ps.pm_flags & PMF_SCOREBOARD ) ) {
line 2885
;2885:		CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 2886
;2886:		return;
ADDRGP4 $1375
JUMPV
LABELV $1382
line 2890
;2887:	}
;2888:
;2889:	// clear around the rendered view if sized down
;2890:	CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 2893
;2891:
;2892:	// draw 3D view
;2893:	trap_R_RenderScene( &cg.refdef );
ADDRGP4 cg+109056
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 2896
;2894:
;2895:	// play warmup sounds and display text
;2896:	CG_WarmupEvents();
ADDRGP4 CG_WarmupEvents
CALLV
pop
line 2899
;2897:
;2898:	// draw status bar and other floating elements
;2899: 	CG_Draw2D( stereoView );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Draw2D
CALLV
pop
line 2900
;2900:}
LABELV $1375
endproc CG_DrawActive 0 4
bss
export lagometer
align 4
LABELV lagometer
skip 1544
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
import CG_ForceModelChange
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
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
export teamChat2
align 1
LABELV teamChat2
skip 256
export teamChat1
align 1
LABELV teamChat1
skip 256
export systemChat
align 1
LABELV systemChat
skip 256
export numSortedTeamPlayers
align 4
LABELV numSortedTeamPlayers
skip 4
export sortedTeamPlayers
align 4
LABELV sortedTeamPlayers
skip 128
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
LABELV $1308
byte 1 70
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 33
byte 1 0
align 1
LABELV $1217
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1211
byte 1 0
align 1
LABELV $1210
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $1206
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
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
byte 1 0
align 1
LABELV $1202
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $1196
byte 1 37
byte 1 115
byte 1 32
byte 1 118
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1176
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $1168
byte 1 76
byte 1 79
byte 1 87
byte 1 32
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 32
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $1167
byte 1 79
byte 1 85
byte 1 84
byte 1 32
byte 1 79
byte 1 70
byte 1 32
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 0
align 1
LABELV $1152
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1134
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1105
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1090
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1085
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1080
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $951
byte 1 37
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $947
byte 1 115
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $879
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 101
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $872
byte 1 67
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
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $841
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $729
byte 1 37
byte 1 115
byte 1 32
byte 1 120
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $578
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $527
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 0
align 1
LABELV $524
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $454
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $449
byte 1 37
byte 1 105
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $432
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $425
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $416
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 37
byte 1 105
byte 1 0
