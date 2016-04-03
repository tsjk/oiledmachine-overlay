PREFIX="$1"
USER="$2"
PASSWORD="$3"

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR

TF=`tempfile`
cat sql/create_mysql.sql | sed -e "s|characters|${PREFIX}_characters|g" -e "s|realmd|${PREFIX}_realmd|g" -e "s|\`mangos\`|\`${PREFIX}_mangos\`|g" > $TF
mysql --user="$USER" --password="$PASSWORD" < $TF
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_characters < sql/characters.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_realmd < sql/realmd.sql

cat sql/sd2/scriptdev2_create_database.sql | sed -e "s|scriptdev2|${PREFIX}_scriptdev2|g" > $TF
mysql --user="$USER" --password="$PASSWORD" < $TF
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_scriptdev2 < sql/sd2/scriptdev2_create_structure_mysql.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_scriptdev2 < sql/sd2/scriptdev2_script_full.sql
#mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < sql/sd2/mangos_scriptname_full.sql

mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/achievement_criteria_requirement.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/achievement_reward.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/areatrigger_involvedrelation.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/areatrigger_tavern.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/areatrigger_teleport.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/battleground_events.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/battleground_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/battlemaster_entry.sql
#mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_characters < Development/database/characters.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/command.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/conditions.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_addon.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_ai_scripts.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_ai_summons.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_ai_texts.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_battleground.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_equip_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_involvedrelation.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_linking.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_linking_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_model_info.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_model_race.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_movement.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_movement_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_onkill_reputation.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_questrelation.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_template_addon.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_template_classlevelstats.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/creature_template_spells.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/db_script_string.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/db_version.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/dbscripts_on_creature_death.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/dbscripts_on_creature_movement.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/dbscripts_on_event.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/dbscripts_on_go_template_use.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/dbscripts_on_go_use.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/dbscripts_on_gossip.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/dbscripts_on_quest_end.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/dbscripts_on_quest_start.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/dbscripts_on_spell.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/disenchant_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/exploration_basexp.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/fishing_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/game_event.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/game_event_creature.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/game_event_creature_data.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/game_event_gameobject.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/game_event_mail.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/game_event_quest.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/game_graveyard_zone.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/game_tele.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/game_weather.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/gameobject.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/gameobject_addon.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/gameobject_battleground.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/gameobject_involvedrelation.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/gameobject_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/gameobject_questrelation.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/gameobject_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/gossip_menu.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/gossip_menu_option.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/instance_encounters.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/instance_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/item_convert.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/item_enchantment_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/item_expire_convert.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/item_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/item_required_target.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/item_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/locales_achievement_reward.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/locales_creature.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/locales_gameobject.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/locales_gossip_menu_option.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/locales_item.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/locales_npc_text.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/locales_page_text.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/locales_points_of_interest.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/locales_quest.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/mail_level_reward.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/mail_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/mangos_string.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/milling_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/npc_gossip.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/npc_spellclick_spells.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/npc_text.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/npc_trainer.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/npc_trainer_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/npc_vendor.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/npc_vendor_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/page_text.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/pet_levelstats.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/pet_name_generation.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/pickpocketing_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/player_classlevelstats.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/player_levelstats.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/player_xp_for_level.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/playercreateinfo.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/playercreateinfo_action.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/playercreateinfo_item.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/playercreateinfo_spell.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/points_of_interest.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/pool_creature.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/pool_creature_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/pool_gameobject.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/pool_gameobject_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/pool_pool.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/pool_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/prospecting_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/quest_poi.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/quest_poi_points.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/quest_template.sql
#mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_realmd < Development/database/realmd.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/reference_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/reputation_reward_rate.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/reputation_spillover_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/reserved_name.sql
#mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_scriptdev2 < Development/database/scriptdev2.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/scripted_areatrigger.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/scripted_event_id.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/skill_discovery_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/skill_extra_item_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/skill_fishing_base_level.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/skinning_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_area.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_bonus_data.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_chain.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_elixir.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_learn_spell.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_loot_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_pet_auras.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_proc_event.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_proc_item_enchant.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_script_target.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_target_position.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_template.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/spell_threat.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/transports.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/vehicle_accessory.sql
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < Development/database/world_template.sql

#sd2 version 3139
mysql --user="$USER" --password="$PASSWORD" ${PREFIX}_mangos < sql/sd2/updates/r3140_mangos.sql
unset PASSWORD
