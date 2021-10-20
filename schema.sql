CREATE DATABASE catalog;

CREATE TABLE genre (
    id    INT GENERATED ALWAYS AS IDENTITY,
    name  VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE author (
    id          INT GENERATED ALWAYS AS IDENTITY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE label (
    id    INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50),
    color VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE book (
    id            INT GENERATED ALWAYS AS IDENTITY,
    publisher     VARCHAR(50),
    cover_state   VARCHAR(50),
    publish_date  DATE,
    genre_id      INT,
    author_id     INT,
    label_id      INT,
    archived      BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY(genre_id) REFERENCES genre(id),
    FOREIGN KEY(author_id) REFERENCES author(id),
    FOREIGN KEY(label_id) REFERENCES label(id)
);

CREATE TABLE game (
    id              INT GENERATED ALWAYS AS IDENTITY,
    multiplayer     BOOLEAN,
    last_played_at  DATE,
    publish_date    DATE,
    genre_id        INT,
    author_id       INT,
    label_id        INT,
    archived        BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY(genre_id) REFERENCES genre(id),
    FOREIGN KEY(author_id) REFERENCES author(id),
    FOREIGN KEY(label_id) REFERENCES label(id)
);

CREATE TABLE music_album (
    id            INT GENERATED ALWAYS AS IDENTITY,
    on_spotify    BOOLEAN,
    publish_date  DATE,
    genre_id      INT,
    author_id     INT,
    label_id      INT,
    archived      BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY(genre_id) REFERENCES genre(id),
    FOREIGN KEY(author_id) REFERENCES author(id),
    FOREIGN KEY(label_id) REFERENCES label(id)
);