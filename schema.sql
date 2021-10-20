CREATE DATABASE 'catalog';


CREATE TABLE music_albums (
    id  INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN,
    genre VARCHAR(100),
    source VARCHAR(100),
    label VARCHAR(100),
    archived BOOLEAN,
    publish_date DATE,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
);

CREATE TABLE genres (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    on_spotify: BOOLEAN,
    PRIMARY KEY(id)
);