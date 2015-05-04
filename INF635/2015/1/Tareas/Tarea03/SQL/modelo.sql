BEGIN TRANSACTION;

DROP TABLE IF EXISTS sistemas_operativos CASCADE;
CREATE TABLE sistemas_operativos (
    pk serial NOT NULL,
    nombre varchar(255) NOT NULL,
    version varchar(255) NOT NULL,
    descripcion text,
    bits int NOT NULL DEFAULT 32,
    propietario varchar(255) NOT NULL,
    UNIQUE (nombre,version,bits),
    PRIMARY KEY (pk)
);


DROP TABLE IF EXISTS browsers CASCADE;
CREATE TABLE browsers (
    pk serial NOT NULL,
    nombre varchar(255) NOT NULL,
    version varchar(255) NOT NULL,
    propietario varchar(255) NOT NULL,
    bits int NOT NULL DEFAULT 32,
    so_fk int NOT NULL REFERENCES sistemas_operativos(pk) ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (nombre,version,bits),
    PRIMARY KEY (pk)
);


DROP TABLE IF EXISTS agentes CASCADE;
CREATE TABLE agentes (
    pk bigserial NOT NULL,
    nombre varchar(255) NOT NULL,
    browser_fk int NOT NULL REFERENCES browsers(pk) ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (nombre, browser_fk),
    PRIMARY KEY (pk)
);




COMMIT;
