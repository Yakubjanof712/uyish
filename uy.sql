CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    book_name VARCHAR(150),
    author_id INT REFERENCES authors(author_id),
    publisher_id INT REFERENCES publishers(publisher_id),
    genre VARCHAR(50),
    publish_date DATE,
    price DECIMAL(10, 2)
);

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(150),
    birth_date DATE,
    country VARCHAR(25)
);

CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    publisher_name VARCHAR(350) ,
    city VARCHAR(50),
    founded_year INT
);
CREATE TABLE book_reviews (
    review_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id),
    review_text TEXT,
    rating DECIMAL(2, 1),
    review_date DATE
);
INSERT INTO authors (author_name, birth_date, country)
VALUES
    ('Otkir Hoshimov', '1956-12-21', 'Uzbekiton'),
    ('Robert Kiyosaki', '1935-11-13', 'Korea'),
    ('ABdula qodiriy', '1928-09-19', 'Uzbekiston'),
    ('Alisher Navoi', '1927-05-07', 'Uzbekistan'),
    ('Gofur Gulom', '1949-08-11', 'Uzbekiston');

INSERT INTO publishers (publisher_name, city, founded_year)
VALUES
    ('Shaytanat', 'Fergana', 1935),
    ('Rich dad and Poor dad', 'New York', 1989),
    ('Mehrobdan Chayon', 'Uzbekistan', 1843),
    ('Otkan kunlar', ' ', 1924),
    ('Shum bola', 'Uzbekistan', 1927);
INSERT INTO books (book_name, author_id, publisher_id, genre, publish_date, price)
VALUES
    ('Otkan kunlar', 1, 1, 'Roman', '1813-01-28', 15.000),
    ('Romana', 2, 2,'Kelajaga oyid', '1884-12-10', 12.000),
    ('Boy ota va kambagal ota', 3, 3, 'Hayotiy', '1869-01-01', 17.000),
    ('Shaytanat ', 4, 4, 'Qiziqarli', '1967-06-05', 13.000),
    ('Boburnoma', 5, 5, 'Drama', '1987-09-04', 10.000),
INSERT INTO book_reviews (book_id, review_text, rating, review_date)
VALUES
    (1, 'Juda ham qiziqarli', 4.5, '2024-01-10'),
    (2, 'Juda ham tasirli', 4.8, '2024-02-15'),
    (3, 'Qimatbaho sozlari', 4.7, '2024-03-20'),
    (4, 'Juda ajoyib gaplar', 5.0, '2024-04-25'),
    (5, 'Emotional holatlar', 4.2, '2024-05-30');
SELECT * FROM books;
SELECT * FROM authors;
SELECT * FROM publishers;
SELECT * FROM book_reviews;

SELECT book_name AS "Kitob nomi", price AS "Narxi" FROM books;
SELECT author_name AS "Muallif" FROM authors;

SELECT * FROM books ORDER BY price DESC;
SELECT * FROM authors ORDER BY author_name;

SELECT * FROM books WHERE genre = 'Roman';

SELECT * FROM books LIMIT 5;

SELECT * FROM books WHERE genre IN ('Roman', 'Kelajaga oyid');

SELECT * FROM books WHERE price BETWEEN 10 AND 15;

SELECT * FROM book_reviews WHERE review_text IS NULL;