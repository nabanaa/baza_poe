CREATE TABLE base_types (
    base_id NUMBER(2) NOT NULL,
    name    VARCHAR2(20 CHAR) NOT NULL
);


ALTER TABLE base_types ADD CONSTRAINT base_types_pk PRIMARY KEY ( base_id );


CREATE TABLE base_variants (
    base_variant_id    NUMBER(2) NOT NULL,
    name               VARCHAR2(20 CHAR) NOT NULL,
    dmg                NUMBER(4),
    armour             NUMBER(4),
    evasion            NUMBER(4),
    es                 NUMBER(4),
    attack_speed       NUMBER(3, 2),
    crit_chance        NUMBER(3, 2),
    lv_req             NUMBER(3),
    str                NUMBER(3),
    dex                NUMBER(3),
    int                NUMBER(3),
    base_types_id NUMBER(2) NOT NULL
);


ALTER TABLE base_variants ADD CONSTRAINT base_variants_pk PRIMARY KEY ( base_variant_id );


CREATE TABLE implicits (
    implicit_id NUMBER(3) NOT NULL,
    name        VARCHAR2(50 CHAR),


);


ALTER TABLE implicits ADD CONSTRAINT implicits_pk PRIMARY KEY ( implicit_id );


CREATE TABLE influences (
    influence_id NUMBER(1) NOT NULL,
    name         VARCHAR2(15 CHAR) NOT NULL
);


ALTER TABLE influences ADD CONSTRAINT influences_pk PRIMARY KEY ( influence_id );


CREATE TABLE items (
    id                            NUMBER(5) NOT NULL,
    name                          VARCHAR2(50 CHAR) NOT NULL,
    quality                       NUMBER(2),
    corrupted                     CHAR(1),
    implicit_id         NUMBER(3) NOT NULL,
    base_variant_id NUMBER(2) NOT NULL,
    quality_type_id      NUMBER(1) NOT NULL,
    nfluence_id       NUMBER(1) NOT NULL,
    quality_id            NUMBER(2) NOT NULL
);


ALTER TABLE items ADD CONSTRAINT items_pk PRIMARY KEY ( id );


CREATE TABLE prefixes (
    prefix_id NUMBER(3) NOT NULL,
    name      VARCHAR2(100 CHAR) NOT NULL,
    origin    VARCHAR2(10 CHAR)
);


ALTER TABLE prefixes ADD CONSTRAINT prefixes_pk PRIMARY KEY ( prefix_id );


CREATE TABLE prefixy_przejsciowe (
    prefix_id NUMBER(3) NOT NULL,
    items_id           NUMBER(5) NOT NULL
);


ALTER TABLE prefixy_przejsciowe ADD CONSTRAINT relation_11_pk PRIMARY KEY ( prefix_id,
                                                                            items_id );


CREATE TABLE quality (
    value      NUMBER(2) NOT NULL,
    quality_id NUMBER(2) NOT NULL
);


ALTER TABLE quality ADD CONSTRAINT quality_pk PRIMARY KEY ( quality_id );


CREATE TABLE quality_types (
    quality_id NUMBER(1) NOT NULL,
    name       VARCHAR2(15 CHAR) NOT NULL
);


ALTER TABLE quality_types ADD CONSTRAINT quality_types_pk PRIMARY KEY ( quality_id );


CREATE TABLE suffixes (
    suffix_id NUMBER(3) NOT NULL,
    name      VARCHAR2(100 CHAR) NOT NULL,
    origin    VARCHAR2(10 CHAR)
);


ALTER TABLE suffixes ADD CONSTRAINT suffixes_pk PRIMARY KEY ( suffix_id );


CREATE TABLE suffixy_przejsciowe (
    suffix_id NUMBER(3) NOT NULL,
    items_id           NUMBER(5) NOT NULL
);


ALTER TABLE suffixy_przejsciowe ADD CONSTRAINT relation_6_pk PRIMARY KEY ( suffix_id,
                                                                           items_id );


ALTER TABLE base_variants
    ADD CONSTRAINT base_variants_base_types_fk FOREIGN KEY (base_type_id )
        REFERENCES base_types ( base_id );


ALTER TABLE items
    ADD CONSTRAINT items_base_variants_fk FOREIGN KEY (base_variant_id )
        REFERENCES base_variants ( base_variant_id );


ALTER TABLE items
    ADD CONSTRAINT items_implicits_fk FOREIGN KEY ( implicit_id )
        REFERENCES implicits ( implicit_id );


ALTER TABLE items
    ADD CONSTRAINT items_influences_fk FOREIGN KEY ( influence_id )
        REFERENCES influences ( influence_id );


ALTER TABLE items
    ADD CONSTRAINT items_quality_fk FOREIGN KEY ( quality_id )
        REFERENCES quality ( quality_id );


ALTER TABLE items
    ADD CONSTRAINT items_quality_types_fk FOREIGN KEY ( quality_type_id )
        REFERENCES quality_types ( quality_id );


ALTER TABLE prefixy_przejsciowe
    ADD CONSTRAINT relation_11_items_fk FOREIGN KEY ( items_id )
        REFERENCES items ( id );


ALTER TABLE prefixy_przejsciowe
    ADD CONSTRAINT relation_11_prefixes_fk FOREIGN KEY ( prefix_id )
        REFERENCES prefixes ( prefix_id );


ALTER TABLE suffixy_przejsciowe
    ADD CONSTRAINT relation_6_items_fk FOREIGN KEY ( items_id )
        REFERENCES items ( id );


ALTER TABLE suffixy_przejsciowe
    ADD CONSTRAINT relation_6_suffixes_fk FOREIGN KEY ( suffix_id )
        REFERENCES suffixes ( suffix_id );


CREATE OR REPLACE VIEW "view 1" ( base_variant_id, variant_name, type_name ) AS
SELECT base_variants.base_variant_id, base_variants.name as variant_name, base_types.name as type_name
FROM base_variants
JOIN base_types bt ON bv.base_types_base_id = bt.base_id
;


CREATE VIEW influence_quality AS
SELECT influences.name AS influence, AVG(items.quality_id) AS avg_quality
FROM items
JOIN influences ON items.influence_id = influences.influence_id
GROUP BY influences.name


CREATE SEQUENCE quality_quality_id_seq START WITH 1 NOCACHE ORDER;


CREATE OR REPLACE TRIGGER quality_quality_id_trg BEFORE
    INSERT ON quality
    FOR EACH ROW
    WHEN ( new.quality_id IS NULL )
BEGIN
    :new.quality_id := quality_quality_id_seq.nextval;
END;


CREATE OR REPLACE TRIGGER limit_suffixes_per_item
BEFORE INSERT OR UPDATE ON suffixy_przejsciowe
FOR EACH ROW
DECLARE
    suffix_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO suffix_count
    FROM suffixy_przejsciowe
    WHERE items_id = :new.items_id;


    IF suffix_count >= 3 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot have more than 3 suffixes per item');
    END IF;
END;
CREATE OR REPLACE TRIGGER limit_prefixes_per_item
BEFORE INSERT OR UPDATE ON prefixy_przejsciowe
FOR EACH ROW
DECLARE
    prefix_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO prefix_count
    FROM prefixy_przejsciowe
    WHERE items_id = :new.items_id;


    IF prefix_count >= 3 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot have more than 3 prefixes per item');
    END IF;
END;
CREATE OR REPLACE TRIGGER RANDOM_IMPLICIT_ON_CORRUPTED
BEFORE INSERT OR UPDATE OF corrupted ON items
FOR EACH ROW
BEGIN
  IF :NEW.corrupted = 'Y' THEN
    SELECT implicit_id
    INTO :NEW.implicit_id
    FROM (SELECT implicit_id FROM implicits ORDER BY dbms_random.value)
    WHERE rownum = 1;
  END IF;
END;
