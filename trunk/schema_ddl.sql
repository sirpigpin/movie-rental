-- Generated by Oracle SQL Developer Data Modeler 3.0.0.665
--   at:        2011-06-28 22:49:19 PDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE ACTORS 
    ( 
     ID_ACTOR NUMBER (10)  NOT NULL , 
     FIRSTNAME VARCHAR2 (20) , 
     LASTNAME VARCHAR2 (30)  NOT NULL 
    ) 
;



ALTER TABLE ACTORS 
    ADD CONSTRAINT "Actors PK" PRIMARY KEY ( ID_ACTOR ) ;


CREATE TABLE ACTORS_TO_MOVIES 
    ( 
     ACTORS_ID_ACTOR NUMBER (10)  NOT NULL , 
     MOVIES_ID_MOVIE NUMBER (10)  NOT NULL 
    ) 
;



ALTER TABLE ACTORS_TO_MOVIES 
    ADD CONSTRAINT ACTORS_TO_MOVIES__IDX PRIMARY KEY ( ACTORS_ID_ACTOR, MOVIES_ID_MOVIE ) ;


CREATE TABLE DATA_MEDIUM 
    ( 
     ID_DATA_MEDIUM NUMBER (10)  NOT NULL , 
     NAME_DATA_MEDIUM NVARCHAR2 (30)  NOT NULL 
    ) 
;



ALTER TABLE DATA_MEDIUM 
    ADD CONSTRAINT "DataMedium PK" PRIMARY KEY ( ID_DATA_MEDIUM ) ;


CREATE TABLE DISCOUNTS 
    ( 
     ID_DISCOUNT NUMBER (10)  NOT NULL , 
     NAME_DISCOUNT NVARCHAR2 (30)  NOT NULL , 
     VALUE_DISCOUNT NUMBER (10,2) DEFAULT 0  NOT NULL 
    ) 
;



ALTER TABLE DISCOUNTS 
    ADD CONSTRAINT "Discounts PK" PRIMARY KEY ( ID_DISCOUNT ) ;


CREATE TABLE DISCOUNTS_TO_USERS 
    ( 
     DISCOUNTS_ID_DISCOUNT NUMBER (10)  NOT NULL , 
     USERS_ID_USER NUMBER (10)  NOT NULL 
    ) 
;



ALTER TABLE DISCOUNTS_TO_USERS 
    ADD CONSTRAINT DISCOUNTS_TO_USERS__IDX PRIMARY KEY ( DISCOUNTS_ID_DISCOUNT, USERS_ID_USER ) ;


CREATE TABLE GENRES 
    ( 
     ID_GENRE NUMBER (10)  NOT NULL , 
     NAME_GENRE VARCHAR2 (30)  NOT NULL 
    ) 
;



ALTER TABLE GENRES 
    ADD CONSTRAINT "Genres PK" PRIMARY KEY ( ID_GENRE ) ;


CREATE TABLE GENRES_TO_MOVIES 
    ( 
     GENRES_ID_GENRE NUMBER (10)  NOT NULL , 
     MOVIES_ID_MOVIE NUMBER (10)  NOT NULL 
    ) 
;



ALTER TABLE GENRES_TO_MOVIES 
    ADD CONSTRAINT GENRES_TO_MOVIES__IDX PRIMARY KEY ( GENRES_ID_GENRE, MOVIES_ID_MOVIE ) ;


CREATE TABLE MOVIES 
    ( 
     ID_MOVIE NUMBER (10)  NOT NULL , 
     TITLE NVARCHAR2 (50)  NOT NULL , 
     YEAR NUMBER (4)  NOT NULL , 
     THREE_DIMENSIONAL CHAR (1) DEFAULT '0'  NOT NULL , 
     CINEMA CHAR (1) DEFAULT '0'  NOT NULL , 
     ID_DATA_MEDIUM NUMBER (10) 
    ) 
;



ALTER TABLE MOVIES 
    ADD CONSTRAINT "Movies PK" PRIMARY KEY ( ID_MOVIE ) ;


CREATE TABLE ORDERS 
    ( 
     ID_ORDER NUMBER (10)  NOT NULL , 
     ORDER_DATE_TIME DATE  NOT NULL , 
     ID_DISCOUNT NUMBER (10) , 
     ID_USER NUMBER (10) 
    ) 
;



ALTER TABLE ORDERS 
    ADD CONSTRAINT "Orders PK" PRIMARY KEY ( ID_ORDER ) ;


CREATE TABLE ORDERS_TO_MOVIES 
    ( 
     ORDERS_ID_ORDER NUMBER (10)  NOT NULL , 
     MOVIES_ID_MOVIE NUMBER (10)  NOT NULL 
    ) 
;



ALTER TABLE ORDERS_TO_MOVIES 
    ADD CONSTRAINT ORDERS_TO_MOVIES__IDX PRIMARY KEY ( ORDERS_ID_ORDER, MOVIES_ID_MOVIE ) ;


CREATE TABLE RESERVATIONS 
    ( 
     ID_RESERVATION NUMBER (10)  NOT NULL , 
     RES_START_DATE_TIME DATE  NOT NULL , 
     RES_END_DATE_TIME DATE  NOT NULL , 
     ID_USER NUMBER (10) 
    ) 
;



ALTER TABLE RESERVATIONS 
    ADD CONSTRAINT "Reservations PK" PRIMARY KEY ( ID_RESERVATION ) ;


CREATE TABLE RESERVATIONS_TO_MOVIES 
    ( 
     RESERVATIONS_ID_RESERVATION NUMBER (10)  NOT NULL , 
     MOVIES_ID_MOVIE NUMBER (10)  NOT NULL 
    ) 
;



ALTER TABLE RESERVATIONS_TO_MOVIES 
    ADD CONSTRAINT RESERVATIONS_TO_MOVIES__IDX PRIMARY KEY ( RESERVATIONS_ID_RESERVATION, MOVIES_ID_MOVIE ) ;


CREATE TABLE ROLES 
    ( 
     ID_ROLE NUMBER (10)  NOT NULL , 
     NAME_ROLE NVARCHAR2 (30)  NOT NULL 
    ) 
;



ALTER TABLE ROLES 
    ADD CONSTRAINT "Roles PK" PRIMARY KEY ( ID_ROLE ) ;


CREATE TABLE USERS 
    ( 
     ID_USER NUMBER (10)  NOT NULL , 
     USERNAME NVARCHAR2 (30)  NOT NULL , 
     PASSWORD NVARCHAR2 (50)  NOT NULL , 
     FIRSTNAME NVARCHAR2 (20) , 
     LASTNAME NVARCHAR2 (30)  NOT NULL , 
     CITY NVARCHAR2 (30) , 
     STREET_ADDRESS NVARCHAR2 (50) , 
     EMAIL NVARCHAR2 (50) , 
     TELEPHONE NUMBER (30) , 
     CREDIT NUMBER (10,2) DEFAULT 0  NOT NULL , 
     REGISTER_DATE_TIME DATE  NOT NULL , 
     ID_ROLE NUMBER (10) 
    ) 
;



ALTER TABLE USERS 
    ADD CONSTRAINT "Users PK" PRIMARY KEY ( ID_USER ) ;



ALTER TABLE MOVIES 
    ADD CONSTRAINT DATA_MEDIUM_TO_MOVIES FOREIGN KEY 
    ( 
     ID_DATA_MEDIUM
    ) 
    REFERENCES DATA_MEDIUM 
    ( 
     ID_DATA_MEDIUM
    ) 
    ON DELETE SET NULL 
;


ALTER TABLE ORDERS 
    ADD CONSTRAINT DISCOUNT_TO_ORDERS FOREIGN KEY 
    ( 
     ID_DISCOUNT
    ) 
    REFERENCES DISCOUNTS 
    ( 
     ID_DISCOUNT
    ) 
    ON DELETE SET NULL 
;


ALTER TABLE ACTORS_TO_MOVIES 
    ADD CONSTRAINT FK_ASS_1 FOREIGN KEY 
    ( 
     ACTORS_ID_ACTOR
    ) 
    REFERENCES ACTORS 
    ( 
     ID_ACTOR
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE RESERVATIONS_TO_MOVIES 
    ADD CONSTRAINT FK_ASS_10 FOREIGN KEY 
    ( 
     RESERVATIONS_ID_RESERVATION
    ) 
    REFERENCES RESERVATIONS 
    ( 
     ID_RESERVATION
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE RESERVATIONS_TO_MOVIES 
    ADD CONSTRAINT FK_ASS_11 FOREIGN KEY 
    ( 
     MOVIES_ID_MOVIE
    ) 
    REFERENCES MOVIES 
    ( 
     ID_MOVIE
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE GENRES_TO_MOVIES 
    ADD CONSTRAINT FK_ASS_15 FOREIGN KEY 
    ( 
     GENRES_ID_GENRE
    ) 
    REFERENCES GENRES 
    ( 
     ID_GENRE
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE GENRES_TO_MOVIES 
    ADD CONSTRAINT FK_ASS_16 FOREIGN KEY 
    ( 
     MOVIES_ID_MOVIE
    ) 
    REFERENCES MOVIES 
    ( 
     ID_MOVIE
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ACTORS_TO_MOVIES 
    ADD CONSTRAINT FK_ASS_2 FOREIGN KEY 
    ( 
     MOVIES_ID_MOVIE
    ) 
    REFERENCES MOVIES 
    ( 
     ID_MOVIE
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE DISCOUNTS_TO_USERS 
    ADD CONSTRAINT FK_ASS_4 FOREIGN KEY 
    ( 
     DISCOUNTS_ID_DISCOUNT
    ) 
    REFERENCES DISCOUNTS 
    ( 
     ID_DISCOUNT
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE DISCOUNTS_TO_USERS 
    ADD CONSTRAINT FK_ASS_5 FOREIGN KEY 
    ( 
     USERS_ID_USER
    ) 
    REFERENCES USERS 
    ( 
     ID_USER
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ORDERS_TO_MOVIES 
    ADD CONSTRAINT FK_ASS_8 FOREIGN KEY 
    ( 
     ORDERS_ID_ORDER
    ) 
    REFERENCES ORDERS 
    ( 
     ID_ORDER
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ORDERS_TO_MOVIES 
    ADD CONSTRAINT FK_ASS_9 FOREIGN KEY 
    ( 
     MOVIES_ID_MOVIE
    ) 
    REFERENCES MOVIES 
    ( 
     ID_MOVIE
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE USERS 
    ADD CONSTRAINT ROLE_TO_USERS FOREIGN KEY 
    ( 
     ID_ROLE
    ) 
    REFERENCES ROLES 
    ( 
     ID_ROLE
    ) 
    ON DELETE SET NULL 
;


ALTER TABLE ORDERS 
    ADD CONSTRAINT USER_TO_ORDERS FOREIGN KEY 
    ( 
     ID_USER
    ) 
    REFERENCES USERS 
    ( 
     ID_USER
    ) 
    ON DELETE SET NULL 
;


ALTER TABLE RESERVATIONS 
    ADD CONSTRAINT USER_TO_RESERVATIONS FOREIGN KEY 
    ( 
     ID_USER
    ) 
    REFERENCES USERS 
    ( 
     ID_USER
    ) 
    ON DELETE SET NULL 
;

CREATE OR REPLACE VIEW VIEW_DISCOUNTS_ADMIN ( NAME,
    POPULARITY,
    SUM_VALUE )
AS SELECT
    D.NAME_DISCOUNT NAME,
    COUNT(D.NAME_DISCOUNT) POPULARITY,
    SUM(D.VALUE_DISCOUNT) SUM_VALUE
 FROM 
    DISCOUNTS D,
    ORDERS O
 WHERE d.id_discount = o.id_discount
 GROUP BY 
    D.NAME_DISCOUNT
 ORDER BY 
    SUM_VALUE DESC,
    POPULARITY DESC ;



CREATE OR REPLACE VIEW VIEW_DISCOUNTS_USER ( USERNAME,
    PERSONNAME,
    NAME,
    VALUE )
 AS SELECT
    U.USERNAME,
    U.FIRSTNAME || ' ' || U.LASTNAME PERSONNAME,
    D.NAME_DISCOUNT NAME,
    D.VALUE_DISCOUNT VALUE
 FROM 
    DISCOUNTS D,
    USERS U,
    DISCOUNTS_TO_USERS DU
 WHERE 
    U.ID_USER = DU.USERS_ID_USER
AND D.ID_DISCOUNT = DU.DISCOUNTS_ID_DISCOUNT
AND D.ID_DISCOUNT <> '1'
 ORDER BY 
    VALUE DESC ;



CREATE OR REPLACE VIEW VIEW_MOVIES ( TITLE,
    ACTOR,
    YEAR,
    GENRE,
    DATA_MEDIUM,
    THREE_DIMENSIONAL,
    CINEMA )
 AS SELECT
    M.TITLE,
    A.FIRSTNAME || ' ' || A.LASTNAME ACTOR,
    M.YEAR,
    LISTAGG(g.name_genre, ', ') WITHIN GROUP (ORDER BY g.name_genre) "Genres",
    D.NAME_DATA_MEDIUM DATA_MEDIUM,
    M.THREE_DIMENSIONAL,
    M.CINEMA
 FROM 
    MOVIES M,
    GENRES G,
    GENRES_TO_MOVIES GM,
    DATA_MEDIUM D,
    ACTORS A,
    ACTORS_TO_MOVIES AM
 WHERE 
    A.ID_ACTOR = AM.ACTORS_ID_ACTOR
AND M.ID_MOVIE = AM.MOVIES_ID_MOVIE
AND G.ID_GENRE = GM.GENRES_ID_GENRE
AND M.ID_MOVIE = GM.MOVIES_ID_MOVIE
AND M.ID_DATA_MEDIUM = D.ID_DATA_MEDIUM(+)
 GROUP BY
    M.TITLE,
    M.YEAR,
    A.FIRSTNAME || ' ' || A.LASTNAME,
    D.NAME_DATA_MEDIUM,
    M.THREE_DIMENSIONAL,
    M.CINEMA
 ORDER BY 
    YEAR DESC,
    TITLE ASC ;



CREATE OR REPLACE VIEW VIEW_ORDERS ( ID,
    USERNAME,
    PERSONNAME,
    TITLE,
    YEAR,
    THREE_DIMENSIONAL,
    DISCOUNT,
    ORDERED )
 AS SELECT
    O.ID_ORDER ID,
    U.USERNAME,
    U.FIRSTNAME || ' ' || U.LASTNAME PERSONNAME,
    M.TITLE,
    M.YEAR,
    M.THREE_DIMENSIONAL,
    D.NAME_DISCOUNT || ' - ' || D.VALUE_DISCOUNT DISCOUNT,
    O.ORDER_DATE_TIME ORDERED
 FROM 
    ORDERS O,
    ORDERS_TO_MOVIES OM,
    MOVIES M,
    DISCOUNTS D,
    USERS U
 WHERE 
    M.ID_MOVIE = OM.MOVIES_ID_MOVIE
AND O.ID_ORDER = OM.ORDERS_ID_ORDER
AND O.ID_DISCOUNT = D.ID_DISCOUNT
AND O.ID_USER = U.ID_USER
 ORDER BY 
    ORDERED DESC,
    ID ASC ;



CREATE OR REPLACE VIEW VIEW_RESERVATIONS ( ID,
    USERNAME,
    PERSONNAME,
    TITLE,
    YEAR,
    THREE_DIMENSIONAL,
    RESERVED,
    VALID )
 AS SELECT
    R.ID_RESERVATION ID,
    U.USERNAME,
    U.FIRSTNAME || ' ' || U.LASTNAME PERSONNAME,
    M.TITLE,
    M.YEAR,
    M.THREE_DIMENSIONAL,
    R.RES_START_DATE_TIME RESERVED,
    R.RES_END_DATE_TIME VALID
 FROM 
    RESERVATIONS R,
    RESERVATIONS_TO_MOVIES RM,
    MOVIES M,
    USERS U
 WHERE 
    M.ID_MOVIE = RM.MOVIES_ID_MOVIE
AND R.ID_RESERVATION = RM.RESERVATIONS_ID_RESERVATION
AND R.ID_USER = U.ID_USER
 ORDER BY 
    VALID DESC,
    ID ASC ;



CREATE OR REPLACE VIEW VIEW_USERS ( USERNAME,
    FIRSTNAME,
    LASTNAME,
    CITY,
    STREET_ADDRESS,
    EMAIL,
    TELEPHONE,
    CREDIT,
    ROLE,
    REGISTERED )
 AS SELECT
    U.USERNAME,
    U.FIRSTNAME,
    U.LASTNAME,
    U.CITY,
    U.STREET_ADDRESS,
    U.EMAIL,
    U.TELEPHONE,
    U.CREDIT,
    R.NAME_ROLE ROLE,
    U.REGISTER_DATE_TIME REGISTERED
 FROM 
    USERS U,
    ROLES R
 WHERE 
    U.ID_ROLE = R.ID_ROLE
 ORDER BY 
    REGISTERED DESC ;

























-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             29
-- CREATE VIEW                              6
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
