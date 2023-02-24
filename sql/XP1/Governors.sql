--==============================================================
--******				G O V E R N O R S				  ******
--==============================================================
-- Victor combat bonus reduced to +3
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='GARRISON_COMMANDER_ADJUST_CITY_COMBAT_BONUS' AND Name='Amount';
-- Magnus' Surplus Logistics gives +2 production in addition to the food
INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType) VALUES
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PROD', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS');
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value) VALUES
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PROD', 'Amount', '2'),
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PROD', 'Domestic', '1'),
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PROD', 'YieldType', 'YIELD_PRODUCTION');
INSERT OR IGNORE INTO GovernorPromotionModifiers(GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS', 'SURPLUS_LOGISTICS_TRADE_ROUTE_PROD');
-- Magnus' Surplus Logistics gives only +1 food (reverted)
--UPDATE ModifierArguments SET Value='1' WHERE ModifierId='SURPLUS_LOGISTICS_TRADE_ROUTE_FOOD' AND Name='Amount';
-- Magnus provision give 1 PM to Settler.
INSERT INTO Types(Type, Kind) VALUES
    ('BBG_SETTLER_MOUVMENT_ABILITY', 'KIND_ABILITY');
INSERT INTO TypeTags(Type, Tag) VALUES
    ('BBG_SETTLER_MOUVMENT_ABILITY', 'CLASS_SETTLER');
INSERT INTO UnitAbilities(UnitAbilityType, Name, Description, Inactive) VALUES
    ('BBG_SETTLER_MOUVMENT_ABILITY', 'BBG_SETTLER_MOUVMENT_ABILITY_NAME', 'BBG_SETTLER_MOUVMENT_ABILITY_DESC', 1);
INSERT INTO UnitAbilityModifiers(UnitAbilityType, ModifierId) VALUES
    ('BBG_SETTLER_MOUVMENT_ABILITY', 'BBG_SETTLER_MOUVMENT_ABILITY_MODIFIER');
INSERT INTO Modifiers(ModifierId, ModifierType, Permanent) VALUES
    ('BBG_GIVE_SETTLER_MOUVMENT_ABILITY', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS', 0),
    ('BBG_SETTLER_MOUVMENT_ABILITY_MODIFIER', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 1);
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_GIVE_SETTLER_MOUVMENT_ABILITY', 'AbilityType', 'BBG_SETTLER_MOUVMENT_ABILITY'),
    ('BBG_SETTLER_MOUVMENT_ABILITY_MODIFIER', 'Amount', '1');
INSERT INTO GovernorPromotionModifiers(GovernorPromotionType, ModifierId) VALUES
    ('GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION', 'BBG_GIVE_SETTLER_MOUVMENT_ABILITY');
-- switch Magnus' level 2 promos
UPDATE GovernorPromotions SET 'Column'=2 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST';
UPDATE GovernorPromotions SET 'Column'=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';
UPDATE GovernorPromotionPrereqs SET PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';
UPDATE GovernorPromotionPrereqs SET PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST';