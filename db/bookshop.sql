DROP TABLE authors_books;
DROP TABLE authors;
DROP TABLE books;
DROP TABLE publishers;


CREATE TABLE publishers
(
  id SERIAL primary key,
  name VARCHAR(255) not null
);

CREATE TABLE books
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  description VARCHAR(255),
  quantity INT,
  price FLOAT,
  cost FLOAT
);

CREATE TABLE authors
(
  id SERIAL primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  publisher_id INT references publishers(id)
);

CREATE TABLE authors_books
(
  id SERIAL primary key,
  author_id INT references authors(id),
  book_id INT references authors(id)
)
