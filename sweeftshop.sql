CREATE TABLE consultants
(
    id          int AUTO_INCREMENT NOT NULL,
    name        varchar(45)        NOT NULL,
    surname     varchar(45)        NOT NULL,
    personal_id varchar(45)        NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE providers
(
    id   int AUTO_INCREMENT NOT NULL,
    name varchar(45)        NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE sections
(
    id   int AUTO_INCREMENT NOT NULL,
    name varchar(45)        NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE types
(
    id   int AUTO_INCREMENT NOT NULL,
    name varchar(45)        NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE products
(
    id                 int AUTO_INCREMENT NOT NULL,
    name               varchar(45)        NOT NULL UNIQUE,
    code               varchar(45)        NOT NULL UNIQUE,
    manufacturing_date datetime           NOT NULL,
    validity_period    datetime           NOT NULL,
    provider_id        int                NOT NULL,
    section_id         int                NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (provider_id) REFERENCES providers (id),
    FOREIGN KEY (section_id) REFERENCES sections (id)
);

CREATE TABLE product_type
(
    product_id int NOT NULL,
    type_id    int NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (id),
    FOREIGN KEY (type_id) REFERENCES types (id)
);

CREATE TABLE consultant_section
(
    consultant_id int NOT NULL,
    section_id    int NOT NULL,
    FOREIGN KEY (consultant_id) REFERENCES consultants (id),
    FOREIGN KEY (section_id) REFERENCES sections (id)
);


-- Random code for product is generated with this logic --
    -- SUBSTR(MD5(RAND()), 1, 10) --

-- Select product its type and section --
SELECT p.name, p.code, t.name, p.validity_period, p2.name, s.name
FROM product_type pt
         inner join products p on pt.product_id = p.id
         inner join providers p2 on p.provider_id = p2.id
         inner join sections s on p.section_id = s.id
         inner join types t on pt.type_id = t.id

-- Select consultants with their respective section
SELECT c.name, c.surname, s.name
FROM consultant_section as cs
         JOIN consultants c on c.id = cs.consultant_id
         JOIN sections s on s.id = cs.section_id


