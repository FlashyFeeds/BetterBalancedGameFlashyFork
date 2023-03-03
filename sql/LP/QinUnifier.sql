

-- 5.2.5 Yongle nerf Pop require remain the same but reduce science/culture from 1 per pop to +0.5/+0.3 (double the inner science/culture per pop) and reduce gold from 2 to 1
UPDATE ModifierArguments SET Value='0.5' WHERE ModifierId='YONGLE_SCIENCE_POPULATION' AND Name='Amount';
UPDATE ModifierArguments SET Value='0.3' WHERE ModifierId='YONGLE_CULTURE_POPULATION' AND Name='Amount';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='YONGLE_GOLD_POPULATION' AND Name='Amount';

-- 5.2.5 Qin unifier general gains 1 charge
INSERT INTO Types(Type, Kind) VALUES
    ('MODIFIER_SINGLE_UNIT_ADJUST_GP_CHARGES', 'KIND_MODIFIER');
INSERT INTO DynamicModifiers(ModifierType, CollectionType, EffectType) VALUES
    ('MODIFIER_SINGLE_UNIT_ADJUST_GP_CHARGES', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_GREAT_PERSON_CHARGES');

INSERT INTO Requirements(RequirementId, RequirementType) VALUES
    ('PLAYER_IS_QIN_ALT', 'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES');
INSERT INTO RequirementArguments(RequirementId, Name, Value) VALUES
    ('PLAYER_IS_QIN_ALT', 'LeaderType', 'LEADER_QIN_ALT');
INSERT INTO RequirementSets(RequirementSetId, RequirementSetType) VALUES
    ('OWNER_IS_QIN_ALT_REQSET', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements(RequirementSetId, RequirementId) VALUES
    ('OWNER_IS_QIN_ALT_REQSET', 'PLAYER_IS_QIN_ALT');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES
    ('BBG_LEADER_QIN_ALT_GENERAL_CHARGES', 'MODIFIER_SINGLE_UNIT_ADJUST_GP_CHARGES', 1, 1, 'OWNER_IS_QIN_ALT_REQSET');
INSERT INTO ModifierArguments (ModifierId , Name , Value) VALUES
    ('BBG_LEADER_QIN_ALT_GENERAL_CHARGES', 'Amount', '1');
INSERT INTO GreatPersonIndividualBirthModifiers(GreatPersonIndividualType, ModifierId)
    SELECT GreatPersonIndividuals.GreatPersonIndividualType, 'BBG_LEADER_QIN_ALT_GENERAL_CHARGES'
    FROM GreatPersonIndividuals WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_GENERAL' AND GreatPersonIndividualType <> 'GREAT_PERSON_INDIVIDUAL_SUN_TZU';
/*
INSERT INTO Requirements(RequirementId, RequirementType) VALUES
    ('REQ_UNIT_IS_NOT_SUNTZU', 'REQUIREMENT_PLOT_PROPERTY_MATCHES');
INSERT INTO RequirementArguments(RequirementId, Name, Value) VALUES
    ('REQ_UNIT_IS_NOT_SUNTZU', 'PropertyName', 'NOT_SUNTZU'),
    ('REQ_UNIT_IS_NOT_SUNTZU', 'PropertyMinimum', 1);
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('UNIT_IS_GENERAL', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('UNIT_IS_GENERAL', 'REQUIREMENT_UNIT_IS_GENERAL');
    --('UNIT_IS_GENERAL', 'REQ_UNIT_IS_NOT_SUNTZU');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('REQUIREMENT_UNIT_IS_GENERAL', 'REQUIREMENT_GREAT_PERSON_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('REQUIREMENT_UNIT_IS_GENERAL', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_GENERAL');
*/
--Sun Tzu duplicate book
INSERT INTO Types(Type, Kind) VALUES
    ('GREATWORK_SUN_TZU_QIN_ALT', 'KIND_GREATWORK');
INSERT INTO GreatWorks(GreatWorkType, GreatWorkObjectType, GreatPersonIndividualType, Name, Audio, Quote, Tourism) VALUES
    ('GREATWORK_SUN_TZU_QIN_ALT', 'GREATWORKOBJECT_WRITING', 'GREAT_PERSON_INDIVIDUAL_SUN_TZU', 'LOC_GREATWORK_SUN_TZU_NAME', 'GREAT_WRITING_QUOTE_59', 'LOC_GREATWORK_SUN_TZU_QUOTE', 2);
INSERT INTO GreatWork_YieldChanges(GreatWorkType, YieldType, YieldChange) VALUES
    ('GREATWORK_SUN_TZU_QIN_ALT', 'YIELD_CULTURE', 4);

--Duplicate General Abilities
INSERT INTO Types(Type, Kind) VALUES
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'KIND_ABILITY'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'KIND_ABILITY'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'KIND_ABILITY'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'KIND_ABILITY');
INSERT INTO TypeTags(Type, Tag) VALUES
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'CLASS_RECON'),
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'CLASS_MELEE'),
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'CLASS_RANGED'),
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'CLASS_ANTI_CAVALRY'),
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'CLASS_LIGHT_CAVALRY'),
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'CLASS_HEAVY_CAVALRY'),
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'CLASS_SIEGE'),
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'CLASS_WARRIOR_MONK'),
    --('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'CLASS_GIANT_DEATH_ROBOT'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_RECON'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_MELEE'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_RANGED'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_ANTI_CAVALRY'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_LIGHT_CAVALRY'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_HEAVY_CAVALRY'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_SIEGE'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_WARRIOR_MONK'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_RECON'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_MELEE'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_RANGED'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_ANTI_CAVALRY'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_LIGHT_CAVALRY'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_HEAVY_CAVALRY'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_SIEGE'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_WARRIOR_MONK'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_RECON'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_MELEE'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_RANGED'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_ANTI_CAVALRY'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_LIGHT_CAVALRY'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_HEAVY_CAVALRY'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_SIEGE'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'CLASS_WARRIOR_MONK');
INSERT INTO UnitAbilities(UnitAbilityType, Name, Description, Inactive, Permanent) VALUES
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'LOC_ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_NAME', 'LOC_ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_DESCRIPTION', 1, 1),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'LOC_ABILITY_TIMUR_BONUS_EXPERIENCE_NAME', 'LOC_ABILITY_TIMUR_BONUS_EXPERIENCE_DESCRIPTION', 1, 1),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'LOC_ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_NAME', 'LOC_ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_DESCRIPTION', 1, 1),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'LOC_ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_NAME', 'LOC_ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_DESCRIPTION', 1, 1);
INSERT INTO UnitAbilityModifiers(UnitAbilityType, ModifierId) VALUES
    ('ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT', 'GEORGY_ZHUKOV_FLANKING_BONUS'),
    --('ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT', 'TIMUR_BONUS_EXPERIENCE'),
    ('ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT', 'JOHN_MONASH_BONUS_EXPERIENCE'),
    ('ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT', 'VIJAYA_WIMALARATNE_BONUS_EXPERIENCE');
--Duplicate General Modifiers
INSERT INTO Modifiers(ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES
    ('GREATPERSON_GEORGY_ZHUKOV_ACTIVE_QIN_ALT', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 0, 1, 'REQUIREMENTS_UNIT_IS_LAND_DOMAIN'),
    --('GREATPERSON_TIMUR_ACTIVE_UNIT_BONUS_QIN_ALT', 'MODIFIER_PLAYER_UNIT_GRANT_ABILITY', 1, 1, NULL),
    ('GREATPERSON_JOHN_MONASH_ACTIVE_UNIT_BONUS_QIN_ALT', 'MODIFIER_PLAYER_UNIT_GRANT_ABILITY', 1, 1, NULL),
    ('GREATPERSON_VIJAYA_WIMALARATNE_ACTIVE_UNIT_BONUS_QIN_ALT', 'MODIFIER_PLAYER_UNIT_GRANT_ABILITY', 1, 1, NULL);
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('GREATPERSON_GEORGY_ZHUKOV_ACTIVE_QIN_ALT', 'AbilityType', 'ABILITY_GEORGY_ZHUKOV_FLANKING_BONUS_QIN_ALT'),
    --('GREATPERSON_TIMUR_ACTIVE_UNIT_BONUS_QIN_ALT', 'AbilityType', 'ABILITY_TIMUR_BONUS_EXPERIENCE_QIN_ALT'),
    ('GREATPERSON_JOHN_MONASH_ACTIVE_UNIT_BONUS_QIN_ALT', 'AbilityType', 'ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_QIN_ALT'),
    ('GREATPERSON_VIJAYA_WIMALARATNE_ACTIVE_UNIT_BONUS_QIN_ALT', 'AbilityType', 'ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_QIN_ALT');
