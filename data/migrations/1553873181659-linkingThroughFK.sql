Setup Database

I created a new database for the lab called lab14. CREATE DATABASE lab14.

I then populated that new database using preworked schema file from Code Fellows and also hard coded some data into it.: psql -f /data/schema.sql -d lab14.


Creation of migration Database: CREATE DATABASE lab14_normal WITH TEMPLATE lab14;

Database Migration
Query 1: Creating the table 'BOOKSHELVES' with following ids: CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

Query 2: Creation of the duplicate data prior to linking: INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

Query 3: Creation of new column to books table that will connect each book to a specific bookshelf: ALTER TABLE books ADD COLUMN bookshelf_id INT;

Query 4: Changing the values of the bookshelf_id to match the id of bookshelf row: UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

Query 5: Deletion of the column bookshelf: ALTER TABLE books DROP COLUMN bookshelf;

Query 6: Creation of the Foreign Key as the bookshelf_id in the books table. ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
