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
  cost FLOAT,
  publisher_id INT references publishers(id)
);
