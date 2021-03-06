/*******************************************************************************
Create Date:    2022-06-24
Author:         Enzo Peigne <enzo.peigne@isen-ouest.yncrea.fr>
Author:         Maël Grellier Neau <mael.grellier-neau@isen-ouest.yncrea.fr>
Description:    Creates the database tables and relations.
*******************************************************************************/

DROP TABLE IF EXISTS fitness CASCADE;
DROP TABLE IF EXISTS sports CASCADE;
DROP TABLE IF EXISTS address CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS score_app CASCADE;
DROP TABLE IF EXISTS matchs CASCADE;
DROP TABLE IF EXISTS participant CASCADE;

------------------------------------------------------------
-- Table: fitness
------------------------------------------------------------
CREATE TABLE fitness (
    id    SERIAL PRIMARY KEY,
    type  VARCHAR(50) NOT NULL
);


------------------------------------------------------------
-- Table: sports
------------------------------------------------------------
CREATE TABLE sports (
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(50) NOT NULL
);

------------------------------------------------------------
-- Table: address
------------------------------------------------------------
CREATE TABLE address (
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(50), -- name of the place
    street       VARCHAR(50),
    city         VARCHAR(50) NOT NULL,
    postal_code  NUMERIC(5,0)
);

------------------------------------------------------------
-- Table: users
------------------------------------------------------------
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    firstname    VARCHAR (50) NOT NULL,
	lastname     VARCHAR (50) NOT NULL,
	age          INTEGER ,
	email        VARCHAR (50) NOT NULL,
	password       VARCHAR (64) NOT NULL,
	link_image   VARCHAR (50),
	nb_match     INTEGER,
	fitness_id   INTEGER,
	address_id   INTEGER NOT NULL,
    access_token VARCHAR(64),

    FOREIGN KEY (fitness_id) REFERENCES fitness(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES address(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

------------------------------------------------------------
-- Table: score_app
------------------------------------------------------------
CREATE TABLE score_app(
    user_id  INTEGER PRIMARY KEY,
    score    INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

------------------------------------------------------------
-- Table: matchs
------------------------------------------------------------
CREATE TABLE matchs (
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(50) NOT NULL,
    score            VARCHAR(50),
    organization_id  INTEGER NOT NULL,
    sport_id         INTEGER NOT NULL,
    address_id       INTEGER NOT NULL,
    nb_player_min    INTEGER NOT NULL,
    nb_player_max    INTEGER NOT NULL,
    date_time        TIMESTAMP NOT NULL,
    duration         TIMESTAMP NOT NULL,
    price            FLOAT NOT NULL,
    best_player_id   INTEGER,

    FOREIGN KEY(organization_id) REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(sport_id) REFERENCES sports(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(address_id) REFERENCES address(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (best_player_id) REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

------------------------------------------------------------
-- Table: Participant
------------------------------------------------------------
CREATE TABLE participant (
    id        SERIAL PRIMARY KEY,
    match_id  INTEGER NOT NULL,
    user_id   INTEGER NOT NULL,
	status    INTEGER  NOT NULL,

    FOREIGN KEY(match_id) REFERENCES matchs(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);