INSERT INTO base_types (base_id, name) VALUES (1, 'Sword');
INSERT INTO base_types (base_id, name) VALUES (2, 'Axe');
INSERT INTO base_types (base_id, name) VALUES (3, 'Mace');
INSERT INTO base_types (base_id, name) VALUES (4, 'Dagger');
INSERT INTO base_types (base_id, name) VALUES (5, 'Bow');
INSERT INTO base_types (base_id, name) VALUES (6, 'Wand');
INSERT INTO base_types (base_id, name) VALUES (7, 'Shield');
INSERT INTO base_types (base_id, name) VALUES (8, 'Helmet');
INSERT INTO base_types (base_id, name) VALUES (9, 'Boots');
INSERT INTO base_types (base_id, name) VALUES (10, 'Gloves');


INSERT INTO base_variants (base_variant_id, name, armour, lv_req, str, base_id)
VALUES (1, 'Iron Shield', 300, 10, 200, 7);
INSERT INTO base_variants (base_variant_id, name, armour, lv_req, str, base_id)
VALUES (2, 'Steel Shield', 500, 20, 210, 7);
INSERT INTO base_variants (base_variant_id, name, es, lv_req, int, base_id)
VALUES (3, 'Magic Boots', 37, 90, 312, 9);
INSERT INTO base_variants (base_variant_id, name, dmg, attack_speed, crit_chance, lv_req, str, dex, base_id)
VALUES (4, 'Flaming Sword', 100, 1.23, 0.5, 3, 100, 100, 1);


INSERT INTO implicits (implicit_id, name)
VALUES (1, 'Additional Physical Damage');
INSERT INTO implicits (implicit_id, name)
VALUES (2, 'Increased Maximum Energy Shield');
INSERT INTO implicits (implicit_id, name)
VALUES (3, 'Additional Elemental Damage');
INSERT INTO implicits (implicit_id, name)
VALUES (4, 'Increased Critical Strike Chance');
INSERT INTO implicits (implicit_id, name)
VALUES (5, 'Increased Attack Speed');
INSERT INTO implicits (implicit_id, name)
VALUES (6, 'Increased Evasion Rating');


INSERT INTO influences (influence_id, name)
VALUES (1, 'Shaper');
INSERT INTO influences (influence_id, name)
VALUES (2, 'Elder');
INSERT INTO influences (influence_id, name)
VALUES (3, 'Crusader');
INSERT INTO influences (influence_id, name)
VALUES (4, 'Warlord');
INSERT INTO influences (influence_id, name)
VALUES (5, 'Hunter');
INSERT INTO influences (influence_id, name)
VALUES (6, 'Redeemer');


INSERT INTO prefixes (prefix_id, name, origin)
VALUES (1, 'Increased maximum life', 'Base');
INSERT INTO prefixes (prefix_id, name, origin)
VALUES (2, 'Increased damage', 'Base');
INSERT INTO prefixes (prefix_id, name, origin)
VALUES (3, 'Gain 2 life on hit', 'Base');
INSERT INTO prefixes (prefix_id, name, origin)
VALUES (4, 'Increased energy shield', 'Crafting');
INSERT INTO prefixes (prefix_id, name, origin)
VALUES (5, 'Increased mana regeneration rate', 'Crafting');
INSERT INTO prefixes (prefix_id, name, origin)
VALUES (6, 'Chance to block hit', 'Crafting');
INSERT INTO prefixes (prefix_id, name, origin)
VALUES (7, 'Chance to block spell damage', 'Base');


INSERT INTO quality (value, quality_id)
VALUES (0, 1);
INSERT INTO quality (value, quality_id)
VALUES (1, 2);
INSERT INTO quality (value, quality_id)
VALUES (2, 3);
INSERT INTO quality (value, quality_id)
VALUES (3, 4);
INSERT INTO quality (value, quality_id)
VALUES (4, 5);
INSERT INTO quality (value, quality_id)
VALUES (5, 6);
INSERT INTO quality (value, quality_id)
VALUES (6, 7);
INSERT INTO quality (value, quality_id)
VALUES (7, 8);
INSERT INTO quality (value, quality_id)
VALUES (8, 9);
INSERT INTO quality (value, quality_id)
VALUES (9, 10);
INSERT INTO quality (value, quality_id)
VALUES (10, 11);


INSERT INTO quality_types(quality_id, name)
VALUES (1, 'Abrasive');
INSERT INTO quality_types(quality_id, name)
VALUES (2, 'Accelerating');
INSERT INTO quality_types(quality_id, name)
VALUES (3, 'Fertile');
INSERT INTO quality_types(quality_id, name)
VALUES (4, 'Imbued');
INSERT INTO quality_types(quality_id, name)
VALUES (5, 'Intrinsic');


INSERT INTO suffixes (suffix_id, name, origin)
VALUES (1, 'Increased cold resistance', 'Base');
INSERT INTO suffixes (suffix_id, name, origin)
VALUES (2, 'Increased lightning resistance', 'Base');
INSERT INTO suffixes (suffix_id, name, origin)
VALUES (3, 'Increased fire resistance', 'Base');
INSERT INTO suffixes (suffix_id, name, origin)
VALUES (4, 'Increased chaos resistance', 'Crafting');
INSERT INTO suffixes (suffix_id, name, origin)
VALUES (5, 'Increased maximum armour', 'Crafting');
INSERT INTO suffixes (suffix_id, name, origin)
VALUES (6, 'Increased maximum evasion rating', 'Crafting');
INSERT INTO suffixes (suffix_id, name, origin)
VALUES (7, 'Increased all elemental resistance', 'Base');


INSERT INTO items (id, name, corrupted, base_variant_id, quality_type_id, influence_id, quality_id)
VALUES (1, 'Divine Irone Shield', 'Y', 1, 1, 1, 1);
INSERT INTO items (id, name, corrupted, base_variant_id, quality_type_id, influence_id, quality_id)
VALUES (2, 'Evil Steel Shield', 'N', 2, 4, 5, 4);
INSERT INTO items (id, name, corrupted, base_variant_id, quality_type_id, influence_id, quality_id)
VALUES (3, 'Hare Magic Boots', 'Y', 3, 5, 2, 6);
INSERT INTO items (id, name, corrupted, base_variant_id, quality_type_id, influence_id, quality_id)
VALUES (4, 'Firey Flaming Sword', 'N', 4, 3, 3, 2);
INSERT INTO items (id, name, corrupted, base_variant_id, quality_type_id, influence_id, quality_id)
VALUES (5, 'Rusty Iron Shield', 'Y', 1, 1, 4, 10);
INSERT INTO items (id, name, corrupted, base_variant_id, quality_type_id, influence_id, quality_id)
VALUES (6, 'Polished Steel Shield', 'N', 2, 1, 5, 7);
INSERT INTO items (id, name, corrupted, base_variant_id, quality_type_id, influence_id, quality_id)
VALUES (7, 'Silk Magic Boots', 'Y', 3, 2, 6, 9);




INSERT INTO prefixy_przejsciowe(prefix_id, items_id)
VALUES(1,1);
INSERT INTO prefixy_przejsciowe(prefix_id, items_id)
VALUES(2,1);
INSERT INTO prefixy_przejsciowe(prefix_id, items_id)
VALUES(3,1);
/*ostatni insert zostanie zablokowany triggerem limit_prefixes_per_item*/
INSERT INTO prefixy_przejsciowe(prefix_id, items_id)
VALUES(4,1);


INSERT INTO suffixy_przejsciowe(suffix_id, items_id)
VALUES(1,3);
INSERT INTO suffixy_przejsciowe(suffix_id, items_id)
VALUES(1,1);
INSERT INTO suffixy_przejsciowe(suffix_id, items_id)
VALUES(2,1);
INSERT INTO suffixy_przejsciowe(suffix_id, items_id)
VALUES(3,1);
/*ostatni insert zostanie zablokowany triggerem limit_suffixes_per_item*/
INSERT INTO suffixy_przejsciowe(suffix_id, items_id)
VALUES(4,1);
