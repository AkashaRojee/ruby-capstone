CREATE DATABASE catalog

CREATE TABLE book (
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

CREATE TABLE label (
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50)
    color VARCHAR(50)
    PRIMARY KEY(id)
)

