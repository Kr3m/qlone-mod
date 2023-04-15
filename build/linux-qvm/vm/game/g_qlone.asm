export G_ItemReplaced
code
proc G_ItemReplaced 256 16
file "../../../../code/game/g_qlone.c"
line 3
;1:#include "g_local.h"
;2:
;3:void G_ItemReplaced ( gentity_t *ent ) {
line 7
;4:	char name[128];
;5:	char newname[128];
;6:
;7:	Com_sprintf(name, sizeof(name), "replace_%s", ent->classname);
ADDRLP4 128
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $55
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 8
;8:	trap_Cvar_VariableStringBuffer( name, newname, sizeof(newname) );
ADDRLP4 128
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 9
;9:	if ( newname[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $56
line 10
;10:		Q_strcpy ( ent->classname, newname );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Q_strcpy
CALLV
pop
line 11
;11:	}
LABELV $56
line 12
;12:}
LABELV $54
endproc G_ItemReplaced 256 16
export G_RegisterWeapon
proc G_RegisterWeapon 28 4
line 17
;13:
;14:// Custom weapons
;15:// Note that the gauntlet and the machinegun are always set up
;16:
;17:void G_RegisterWeapon ( void ) {
line 18
;18:	if ( g_wpflags.integer & 2 ) {
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $59
line 21
;19:		// the machinegun might already be registered
;20:		gitem_t *item;
;21:		item = BG_FindItemForWeapon( WP_SHOTGUN );
CNSTI4 3
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 22
;22:		if ( !Registered( item ) ) RegisterItem( item );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Registered
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $62
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
LABELV $62
line 23
;23:	}
LABELV $59
line 24
;24:	if ( g_wpflags.integer & 4 )
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $64
line 25
;25:		RegisterItem( BG_FindItemForWeapon( WP_GRENADE_LAUNCHER ) );
CNSTI4 4
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
LABELV $64
line 26
;26:	if ( g_wpflags.integer & 8 )
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $67
line 27
;27:		RegisterItem( BG_FindItemForWeapon( WP_ROCKET_LAUNCHER ) );
CNSTI4 5
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
LABELV $67
line 28
;28:	if ( g_wpflags.integer & 16 )
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $70
line 29
;29:		RegisterItem( BG_FindItemForWeapon( WP_LIGHTNING ) );
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
LABELV $70
line 30
;30:	if ( g_wpflags.integer & 32 )
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $73
line 31
;31:		RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
CNSTI4 7
ARGI4
ADDRLP4 12
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
LABELV $73
line 32
;32:	if ( g_wpflags.integer & 64 )
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $76
line 33
;33:		RegisterItem( BG_FindItemForWeapon( WP_PLASMAGUN ) );
CNSTI4 8
ARGI4
ADDRLP4 16
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
LABELV $76
line 34
;34:	if ( g_wpflags.integer & 128 )
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $79
line 35
;35:		RegisterItem( BG_FindItemForWeapon( WP_BFG ) );
CNSTI4 9
ARGI4
ADDRLP4 20
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
LABELV $79
line 44
;36:#ifdef MISSIONPACK
;37:	if ( g_wpflags.integer & 256 )
;38:		RegisterItem( BG_FindItemForWeapon( WP_NAILGUN ) );
;39:	if ( g_wpflags.integer & 512 )
;40:		RegisterItem( BG_FindItemForWeapon( WP_PROX_LAUNCHER ) );
;41:	if ( g_wpflags.integer & 1024 )
;42:		RegisterItem( BG_FindItemForWeapon( WP_CHAINGUN ) );
;43:#endif
;44:	if ( g_grapple.integer > 0 )
ADDRGP4 g_grapple+12
INDIRI4
CNSTI4 0
LEI4 $82
line 45
;45:		RegisterItem( BG_FindItemForWeapon( WP_GRAPPLING_HOOK ) );
CNSTI4 10
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
LABELV $82
line 46
;46:}
LABELV $58
endproc G_RegisterWeapon 28 4
proc getAmmoValue 8 4
line 50
;47:
;48:// Return the quantity of configured ammo for a weapon
;49:
;50:static int getAmmoValue( const char *ammocvar ) {
line 51
;51:	int ammo = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 52
;52:	ammo = trap_Cvar_VariableIntegerValue(ammocvar);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 53
;53:	if (ammo < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $86
line 54
;54:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $85
JUMPV
LABELV $86
line 55
;55:	if (ammo > 200)
ADDRLP4 0
INDIRI4
CNSTI4 200
LEI4 $88
line 56
;56:		return 200;
CNSTI4 200
RETI4
ADDRGP4 $85
JUMPV
LABELV $88
line 57
;57:	return ammo;
ADDRLP4 0
INDIRI4
RETI4
LABELV $85
endproc getAmmoValue 8 4
export G_SpawnWeapon
proc G_SpawnWeapon 12 4
line 60
;58:}
;59:
;60:void G_SpawnWeapon ( gclient_t *client ) {
line 61
;61:	client->ps.ammo[ WP_MACHINEGUN ] = getAmmoValue ( "g_startAmmoMG" );
ADDRGP4 $91
ARGP4
ADDRLP4 0
ADDRGP4 getAmmoValue
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 63
;62:
;63:	if ( g_removeweapon.integer & 1 && !( g_wpflags.integer & 1 ) ) {
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $92
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $92
line 64
;64:		client->ps.stats[ STAT_WEAPONS ] &= ~( 1 << WP_MACHINEGUN );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 65
;65:		client->ps.ammo[ WP_MACHINEGUN ] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 66
;66:	}
LABELV $92
line 67
;67:	if ( g_wpflags.integer & 2 ) {
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $96
line 68
;68:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_SHOTGUN;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 69
;69:		client->ps.ammo[ WP_SHOTGUN ] = getAmmoValue ( "g_startAmmoSG" );
ADDRGP4 $99
ARGP4
ADDRLP4 8
ADDRGP4 getAmmoValue
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 70
;70:	}
LABELV $96
line 71
;71:	if ( g_wpflags.integer & 4 ) {
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $100
line 72
;72:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_GRENADE_LAUNCHER;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 73
;73:		client->ps.ammo[ WP_GRENADE_LAUNCHER ] = getAmmoValue ( "g_startAmmoGL" );
ADDRGP4 $103
ARGP4
ADDRLP4 8
ADDRGP4 getAmmoValue
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 74
;74:	}
LABELV $100
line 75
;75:	if ( g_wpflags.integer & 8 ) {
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $104
line 76
;76:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_ROCKET_LAUNCHER;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 77
;77:		client->ps.ammo[ WP_ROCKET_LAUNCHER ] = getAmmoValue ( "g_startAmmoRL" );
ADDRGP4 $107
ARGP4
ADDRLP4 8
ADDRGP4 getAmmoValue
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 78
;78:	}
LABELV $104
line 79
;79:	if ( g_wpflags.integer & 16 ) {
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $108
line 80
;80:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_LIGHTNING;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 81
;81:		client->ps.ammo[ WP_LIGHTNING ] = getAmmoValue ( "g_startAmmoLG" );
ADDRGP4 $111
ARGP4
ADDRLP4 8
ADDRGP4 getAmmoValue
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 82
;82:	}
LABELV $108
line 83
;83:	if ( g_wpflags.integer & 32 ) {
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $112
line 84
;84:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_RAILGUN;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 85
;85:		client->ps.ammo[ WP_RAILGUN ] = getAmmoValue ( "g_startAmmoRG" );
ADDRGP4 $115
ARGP4
ADDRLP4 8
ADDRGP4 getAmmoValue
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 404
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 86
;86:	}
LABELV $112
line 87
;87:	if ( g_wpflags.integer & 64 ) {
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $116
line 88
;88:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_PLASMAGUN;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 89
;89:		client->ps.ammo[ WP_PLASMAGUN ] = getAmmoValue ( "g_startAmmoPG" );
ADDRGP4 $119
ARGP4
ADDRLP4 8
ADDRGP4 getAmmoValue
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 90
;90:	}
LABELV $116
line 91
;91:	if ( g_wpflags.integer & 128 ) {
ADDRGP4 g_wpflags+12
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $120
line 92
;92:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_BFG;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 93
;93:		client->ps.ammo[ WP_BFG ] = getAmmoValue ( "g_startAmmoBFG" );
ADDRGP4 $123
ARGP4
ADDRLP4 8
ADDRGP4 getAmmoValue
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 94
;94:	}
LABELV $120
line 109
;95:#ifdef MISSIONPACK
;96:	if ( g_wpflags.integer & 256 ) {
;97:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_NAILGUN;
;98:		client->ps.ammo[ WP_NAILGUN ] = getAmmoValue ( "g_startAmmoNG" );
;99:	}
;100:	if ( g_wpflags.integer & 512 ) {
;101:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_PROX_LAUNCHER;
;102:		client->ps.ammo[ WP_PROX_LAUNCHER ] = getAmmoValue ( "g_startAmmoPL" );
;103:	}
;104:	if ( g_wpflags.integer & 1024 ) {
;105:		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_CHAINGUN;
;106:		client->ps.ammo[ WP_CHAINGUN ] = getAmmoValue ( "g_startAmmoCG" );
;107:	}
;108:#endif
;109:}
LABELV $90
endproc G_SpawnWeapon 12 4
export G_RemoveWeapon
proc G_RemoveWeapon 32 8
line 111
;110:
;111:qboolean G_RemoveWeapon ( gitem_t *item ) {
line 112
;112:	if ( ( ( g_removeweapon.integer & 1 ) && ( !Q_stricmp( item->classname, "weapon_machinegun" ) ) )
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $144
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $155
LABELV $144
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $146
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $155
LABELV $146
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $148
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $155
LABELV $148
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $150
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $155
LABELV $150
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $152
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $155
LABELV $152
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $154
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $155
LABELV $154
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $156
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $140
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $155
LABELV $156
ADDRGP4 g_removeweapon+12
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $125
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $125
LABELV $155
line 120
;113:		|| ( ( g_removeweapon.integer & 2 ) && ( !Q_stricmp( item->classname, "weapon_shotgun" ) ) )
;114:		|| ( ( g_removeweapon.integer & 4 ) && ( !Q_stricmp( item->classname, "weapon_grenadelauncher" ) ) )
;115:		|| ( ( g_removeweapon.integer & 8 ) && ( !Q_stricmp( item->classname, "weapon_rocketlauncher" ) ) )
;116:		|| ( ( g_removeweapon.integer & 16 ) && ( !Q_stricmp( item->classname, "weapon_lightning" ) ) )
;117:		|| ( ( g_removeweapon.integer & 32 ) && ( !Q_stricmp( item->classname, "weapon_railgun" ) ) )
;118:		|| ( ( g_removeweapon.integer & 64 ) && ( !Q_stricmp( item->classname, "weapon_plasmagun" ) ) )
;119:		|| ( ( g_removeweapon.integer & 128 ) && ( !Q_stricmp( item->classname, "weapon_bfg" ) ) ) )
;120:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $124
JUMPV
LABELV $125
line 127
;121:#ifdef MISSIONPACK
;122:	if ( ( ( g_removeweapon.integer & 256 ) && ( !Q_stricmp( item->classname, "weapon_nailgun" ) ) )
;123:		|| ( ( g_removeweapon.integer & 512 ) && ( !Q_stricmp( item->classname, "weapon_prox_launcher" ) ) )
;124:		|| ( ( g_removeweapon.integer & 1024 ) && ( !Q_stricmp( item->classname, "weapon_chaingun" ) ) ) )
;125:			return qtrue;
;126:#endif
;127:	return qfalse;
CNSTI4 0
RETI4
LABELV $124
endproc G_RemoveWeapon 32 8
export G_RemoveAmmo
proc G_RemoveAmmo 32 8
line 130
;128:}
;129:
;130:qboolean G_RemoveAmmo ( gitem_t *item ) {
line 131
;131:	if ( ( ( g_removeammo.integer & 1 ) && ( !Q_stricmp( item->classname, "ammo_bullets" ) ) )
ADDRGP4 g_removeammo+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $177
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $188
LABELV $177
ADDRGP4 g_removeammo+12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $179
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $188
LABELV $179
ADDRGP4 g_removeammo+12
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $181
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $188
LABELV $181
ADDRGP4 g_removeammo+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $183
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $167
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $188
LABELV $183
ADDRGP4 g_removeammo+12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $185
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $169
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $188
LABELV $185
ADDRGP4 g_removeammo+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $187
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $188
LABELV $187
ADDRGP4 g_removeammo+12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $189
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $173
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $188
LABELV $189
ADDRGP4 g_removeammo+12
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $158
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $158
LABELV $188
line 139
;132:		|| ( ( g_removeammo.integer & 2 ) && ( !Q_stricmp( item->classname, "ammo_shells" ) ) )
;133:		|| ( ( g_removeammo.integer & 4 ) && ( !Q_stricmp( item->classname, "ammo_grenades" ) ) )
;134:		|| ( ( g_removeammo.integer & 8 ) && ( !Q_stricmp( item->classname, "ammo_rockets" ) ) )
;135:		|| ( ( g_removeammo.integer & 16 ) && ( !Q_stricmp( item->classname, "ammo_lightning" ) ) )
;136:		|| ( ( g_removeammo.integer & 32 ) && ( !Q_stricmp( item->classname, "ammo_slugs" ) ) )
;137:		|| ( ( g_removeammo.integer & 64 ) && ( !Q_stricmp( item->classname, "ammo_cells" ) ) )
;138:		|| ( ( g_removeammo.integer & 128 ) && ( !Q_stricmp( item->classname, "ammo_bfg" ) ) ) )
;139:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $157
JUMPV
LABELV $158
line 146
;140:#ifdef MISSIONPACK
;141:	if ( ( ( g_removeammo.integer & 256 ) && ( !Q_stricmp( item->classname, "ammo_nails" ) ) )
;142:		|| ( ( g_removeammo.integer & 512 ) && ( !Q_stricmp( item->classname, "ammo_mines" ) ) )
;143:		|| ( ( g_removeammo.integer & 1024 ) && ( !Q_stricmp( item->classname, "ammo_belt" ) ) ) )
;144:			return qtrue;
;145:#endif
;146:	return qfalse;
CNSTI4 0
RETI4
LABELV $157
endproc G_RemoveAmmo 32 8
export G_RemoveItem
proc G_RemoveItem 36 8
line 149
;147:}
;148:
;149:qboolean G_RemoveItem ( gitem_t *item ) {
line 150
;150:	if ( ( ( g_removeitem.integer & 1 ) && ( !Q_stricmp( item->classname, "item_armor_shard" ) ) )
ADDRGP4 g_removeitem+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $212
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $194
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $212
ADDRGP4 g_removeitem+12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $214
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $196
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $214
ADDRGP4 g_removeitem+12
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $216
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $216
ADDRGP4 g_removeitem+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $218
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $200
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $218
ADDRGP4 g_removeitem+12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $220
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $202
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $220
ADDRGP4 g_removeitem+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $222
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $204
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $222
ADDRGP4 g_removeitem+12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $224
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $224
ADDRGP4 g_removeitem+12
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $226
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $225
LABELV $226
ADDRGP4 g_removeitem+12
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $191
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $210
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $191
LABELV $225
line 159
;151:		|| ( ( g_removeitem.integer & 2 ) && ( !Q_stricmp( item->classname, "item_armor_combat" ) ) )
;152:		|| ( ( g_removeitem.integer & 4 ) && ( !Q_stricmp( item->classname, "item_armor_body" ) ) )
;153:		|| ( ( g_removeitem.integer & 8 ) && ( !Q_stricmp( item->classname, "item_health_small" ) ) )
;154:		|| ( ( g_removeitem.integer & 16 ) && ( !Q_stricmp( item->classname, "item_health" ) ) )
;155:		|| ( ( g_removeitem.integer & 32 ) && ( !Q_stricmp( item->classname, "item_health_large" ) ) )
;156:		|| ( ( g_removeitem.integer & 64 ) && ( !Q_stricmp( item->classname, "item_health_mega" ) ) )
;157:		|| ( ( g_removeitem.integer & 128 ) && ( !Q_stricmp( item->classname, "holdable_teleporter" ) ) )
;158:		|| ( ( g_removeitem.integer & 256 ) && ( !Q_stricmp( item->classname, "holdable_medkit" ) ) ) )
;159:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $190
JUMPV
LABELV $191
line 166
;160:#ifdef MISSIONPACK
;161:	if ( ( ( g_removeitem.integer & 512 ) && ( !Q_stricmp( item->classname, "holdable_kamikaze" ) ) )
;162:		|| ( ( g_removeitem.integer & 1024 ) && ( !Q_stricmp( item->classname, "holdable_portal" ) ) )
;163:		|| ( ( g_removeitem.integer & 2048 ) && ( !Q_stricmp( item->classname, "holdable_invulnerability" ) ) ) )
;164:			return qtrue;
;165:#endif
;166:	return qfalse;
CNSTI4 0
RETI4
LABELV $190
endproc G_RemoveItem 36 8
export G_RemovePowerup
proc G_RemovePowerup 24 8
line 169
;167:}
;168:
;169:qboolean G_RemovePowerup ( gitem_t *item ) {
line 170
;170:	if ( ( ( g_removepowerup.integer & 1 ) && ( !Q_stricmp( item->classname, "item_quad" ) ) )
ADDRGP4 g_removepowerup+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $243
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $231
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $250
LABELV $243
ADDRGP4 g_removepowerup+12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $245
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $250
LABELV $245
ADDRGP4 g_removepowerup+12
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $247
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $235
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $250
LABELV $247
ADDRGP4 g_removepowerup+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $249
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $237
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $250
LABELV $249
ADDRGP4 g_removepowerup+12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $251
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $239
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $250
LABELV $251
ADDRGP4 g_removepowerup+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $228
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $241
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $228
LABELV $250
line 176
;171:		|| ( ( g_removepowerup.integer & 2 ) && ( !Q_stricmp( item->classname, "item_enviro" ) ) )
;172:		|| ( ( g_removepowerup.integer & 4 ) && ( !Q_stricmp( item->classname, "item_haste" ) ) )
;173:		|| ( ( g_removepowerup.integer & 8 ) && ( !Q_stricmp( item->classname, "item_invis" ) ) )
;174:		|| ( ( g_removepowerup.integer & 16 ) && ( !Q_stricmp( item->classname, "item_regen" ) ) )
;175:		|| ( ( g_removepowerup.integer & 32 ) && ( !Q_stricmp( item->classname, "item_flight" ) ) ) )
;176:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $227
JUMPV
LABELV $228
line 184
;177:#ifdef MISSIONPACK
;178:	if ( ( ( g_removepowerup.integer & 64 ) && ( !Q_stricmp( item->classname, "item_scout" ) ) )
;179:		|| ( ( g_removepowerup.integer & 128 ) && ( !Q_stricmp( item->classname, "item_guard" ) ) )
;180:		|| ( ( g_removepowerup.integer & 256 ) && ( !Q_stricmp( item->classname, "item_doubler" ) ) )
;181:		|| ( ( g_removepowerup.integer & 512 ) && ( !Q_stricmp( item->classname, "item_ammoregen" ) ) ) )
;182:			return qtrue;
;183:#endif
;184:	return qfalse;
CNSTI4 0
RETI4
LABELV $227
endproc G_RemovePowerup 24 8
export G_SetInfiniteAmmo
proc G_SetInfiniteAmmo 4 0
line 187
;185:}
;186:
;187:void G_SetInfiniteAmmo ( gclient_t *client ) {
line 189
;188:	int     i;
;189:	for ( i = 0; i < MAX_WEAPONS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $253
line 190
;190:		client->ps.ammo[ i ] = INFINITE;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 1000000
ASGNI4
line 191
;191:	}
LABELV $254
line 189
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $253
line 192
;192:}
LABELV $252
endproc G_SetInfiniteAmmo 4 0
export Hook_Fire
proc Hook_Fire 8 4
line 198
;193:
;194:// grapple hook
;195:
;196:void Weapon_GrapplingHook_Fire( gentity_t *ent );
;197:
;198:void Hook_Fire( gentity_t *ent ) {
line 202
;199:	gclient_t       *client;
;200:	usercmd_t       *ucmd;
;201:
;202:	if ( !g_grapple.integer ) return;
ADDRGP4 g_grapple+12
INDIRI4
CNSTI4 0
NEI4 $258
ADDRGP4 $257
JUMPV
LABELV $258
line 204
;203:
;204:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 205
;205:	if ( client->ps.weapon == WP_GRAPPLING_HOOK ) return;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 10
NEI4 $261
ADDRGP4 $257
JUMPV
LABELV $261
line 206
;206:	if ( client->ps.pm_type != PM_NORMAL ) return;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $263
ADDRGP4 $257
JUMPV
LABELV $263
line 208
;207:
;208:	ucmd = &client->pers.cmd;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
line 209
;209:	if ( client->hook && !( ucmd->buttons & 32 ) )
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $265
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $265
line 210
;210:		Weapon_HookFree( client->hook );
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
LABELV $265
line 212
;211:
;212:	if ( !client->hook && ( ucmd->buttons & 32 ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $267
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $267
line 213
;213:		if ( ent->timestamp > level.time - 400 )
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 400
SUBI4
LEI4 $269
line 214
;214:			return;
ADDRGP4 $257
JUMPV
LABELV $269
line 215
;215:		client->fireHeld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 216
;216:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 217
;217:	}
LABELV $267
line 218
;218:}
LABELV $257
endproc Hook_Fire 8 4
import Weapon_GrapplingHook_Fire
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
LABELV $241
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $239
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $237
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $235
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $233
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $231
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $210
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $208
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $206
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $204
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $202
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $200
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $198
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $196
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 98
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $194
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $175
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $173
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $171
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 108
byte 1 117
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $169
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 108
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
LABELV $167
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $165
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $163
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $161
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $142
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $140
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $138
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $136
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 108
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
LABELV $134
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $132
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $130
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $128
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
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
byte 1 0
align 1
LABELV $123
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $119
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 80
byte 1 71
byte 1 0
align 1
LABELV $115
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 82
byte 1 71
byte 1 0
align 1
LABELV $111
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 76
byte 1 71
byte 1 0
align 1
LABELV $107
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 82
byte 1 76
byte 1 0
align 1
LABELV $103
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 71
byte 1 76
byte 1 0
align 1
LABELV $99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 83
byte 1 71
byte 1 0
align 1
LABELV $91
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 77
byte 1 71
byte 1 0
align 1
LABELV $55
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
