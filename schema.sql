CREATE DATABASE catalog;

CREATE TABLE genre (
    id    INT GENERATED ALWAYS AS IDENTITY,
    name  VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE author (
    id          INT GENERATED ALWAYS AS IDENTITY,
    first_name  VARCHAR(50)
    last_name   VARCHAR(50)
    PRIMARY KEY(id)
);

CREATE TABLE games (
    id            INT GENERATED ALWAYS AS IDENTITY,
    multiplayer   BOOLEAN,
    last_played_at DATE,
    publish_date  DATE
    genre_id      INT
    author_id     INT
    label_id      INT
    archived      BOOLEAN
    PRIMARY KEY(id)
    FOREIGN KEY(genre_id) REFERENCES genre(id)
    FOREIGN KEY(author_id) REFERENCES author(id)
    FOREIGN KEY(label_id) REFERENCES label(id)
);

CREATE TABLE music_albums (
    id            INT GENERATED ALWAYS AS IDENTITY,
    on_spotify    BOOLEAN,
    publish_date  DATE,
    genre_id      INT,
    author_id     INT,
    label_id      INT,
    archived      BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)
);