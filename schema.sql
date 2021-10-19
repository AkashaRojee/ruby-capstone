CREATE DATABASE catalog

CREATE TABLE games (
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE
    genre_id INT
    author_id INT
    source_id INT
    label_id INT
    archived BOOLEAN
    PRIMARY KEY(id)
    FOREIGN KEY(genre_id) REFERENCES genre(id)
    FOREIGN KEY(author_id) REFERENCES author(id)
    FOREIGN KEY(source_id) REFERENCES source(id)
    FOREIGN KEY(label_id) REFERENCES label(id)
)

CREATE TABLE author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50)
    last_name VARCHAR(50)
    PRIMARY KEY(id)
)

CREATE TABLE source (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50)
    PRIMARY KEY(id)
)
