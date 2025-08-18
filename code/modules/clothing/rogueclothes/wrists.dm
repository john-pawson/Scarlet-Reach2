/obj/item/clothing/wrists/roguetown
	slot_flags = ITEM_SLOT_WRISTS
	sleeved = 'icons/roguetown/clothing/onmob/wrists.dmi'
	icon = 'icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/wrists.dmi'
	sleevetype = "shirt"
	resistance_flags = FLAMMABLE
	sewrepair = TRUE
	anvilrepair = null
	experimental_inhand = FALSE
	grid_width = 32
	grid_height = 64
	var/overarmor

/obj/item/clothing/wrists/roguetown/MiddleClick(mob/user, params)
	. = ..()
	overarmor = !overarmor
	to_chat(user, span_info("I [overarmor ? "wear \the [src] over my armor" : "wear \the [src] under my armor"]."))
	if(overarmor)
		alternate_worn_layer = WRISTS_LAYER
	else
		alternate_worn_layer = UNDER_ARMOR_LAYER
	user.update_inv_wrists()
	user.update_inv_gloves()
	user.update_inv_armor()
	user.update_inv_shirt()

/obj/item/clothing/wrists/roguetown/bracers
	name = "steel bracers"
	desc = "Steel bracers that protect the arms."
	body_parts_covered = 384 //For some reason the arms define was throwing a hissy fit.
	body_parts_covered_dynamic = 384 //Ditto
	icon_state = "bracers"
	item_state = "bracers"
	max_integrity = 300
	armor = ARMOR_BOOTS_PLATED
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	resistance_flags = FIRE_PROOF

	anvilrepair = /datum/skill/craft/armorsmithing
	sewrepair = FALSE
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/wrists/roguetown/bracers/iron
	name = "iron bracers"
	desc = "Iron bracers that protect the arms."
	icon_state = "bracers" // Lacks their own iron bracers sprite
	item_state = "bracers" // Lacks their own iron bracers sprite
	max_integrity = 260
	armor = ARMOR_BOOTS_PLATED_IRON
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/wrists/roguetown/bracers/aalloy
	name = "decrepit bracers"
	desc = "Decrepit old bracers. Aeon's grasp is upon them."
	max_integrity = 150
	icon_state = "ancientbracers"
	smeltresult = /obj/item/ingot/aalloy

/obj/item/clothing/wrists/roguetown/bracers/paalloy
	name = "ancient bracers"
	desc = "Bracers formed of ancient alloys. Aeon's grasp is lifted from their form."
	icon_state = "ancientbracers"
	smeltresult = /obj/item/ingot/aaslag

/obj/item/clothing/wrists/roguetown/bracers/leather
	name = "leather bracers"
	desc = "Standard leather bracers that offer some meager protection for the arms."
	icon_state = "lbracers"
	item_state = "lbracers"
	max_integrity = 250
	armor = ARMOR_LEATHER
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	smeltresult = null
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	name = "hardened leather bracers"
	desc = "Hardened leather braces that will keep your wrists safe from bludgeoning."
	icon_state = "albracers"
	armor = ARMOR_LEATHER_GOOD
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP, BCLASS_SMASH)
	max_integrity = 265
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/wrists/roguetown/bracers/copper
	name = "copper bracers"
	desc = "Copper forearm guards that offer some protection while looking rather stylish"
	icon_state = "copperarm"
	item_state = "copperarm"
	max_integrity = 225
	smeltresult = /obj/item/ingot/copper
	armor = ARMOR_MASK_METAL_BAD

/obj/item/clothing/wrists/roguetown/wrappings
	name = "solar wrappings"
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "wrappings"
	item_state = "wrappings"
	sewrepair = TRUE

/obj/item/clothing/wrists/roguetown/nocwrappings
	name = "moon wrappings"
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "nocwrappings"
	item_state = "nocwrappings"
	sewrepair = TRUE

//Queensleeves
/obj/item/clothing/wrists/roguetown/royalsleeves
	name = "royal sleeves"
	desc = "Sleeves befitting an elaborate gown."
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "royalsleeves"
	item_state = "royalsleeves"
	detail_tag = "_detail"
	detail_color = CLOTHING_BLACK

/obj/item/clothing/wrists/roguetown/royalsleeves/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/wrists/roguetown/royalsleeves/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/wrists/roguetown/royalsleeves/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/wrists/roguetown/royalsleeves/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/wrists/roguetown/splintarms
	name = "brigandine rerebraces"
	desc = "Brigandine bracers, pauldrons and a set of metal couters, designed to protect the arms while still providing almost complete free range of movement."
	body_parts_covered = ARMS
	icon_state = "splintarms"
	item_state = "splintarms"
	armor = ARMOR_LEATHER_STUDDED
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = SOFTHIT
	max_integrity = 285
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/iron
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FIRE_PROOF
	sewrepair = FALSE

/obj/item/clothing/wrists/roguetown/bracers/carapace
	name = "carapace bracers"
	desc = "Fiber bracers lined with carapace to protect your wrists"
	body_parts_covered = ARMS
	icon_state = "carapace_bracers"
	item_state = "carapace_bracers"
	armor = list("blunt" = 70, "slash" = 70, "stab" = 60, "piercing" = 50, "fire" = 30, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	max_integrity = 200
	anvilrepair = null
	smeltresult = /obj/item/ash
	sewrepair = TRUE
