CREATE DATABASE DB_MOVIE

USE DB_MOVIE

----ACTOR TABLE
CREATE TABLE actor (
	actor_id INT IDENTITY(1,1) PRIMARY KEY,
	actor_fname CHAR(20) NOT NULL,
	actor_lname CHAR(20) NOT NULL,
	actor_gender CHAR(1) NOT NULL
)

----GENRES TABLE
CREATE TABLE genres (
	genres_id INT IDENTITY(1,1) PRIMARY KEY,
	genres_title CHAR(20) NOT NULL
)

----DIRECTOR TABLE
CREATE TABLE director (
	director_id INT IDENTITY(1,1) PRIMARY KEY,
	director_fname CHAR(20) NOT NULL,
	director_lname CHAR(20) NOT NULL
)

----MOVIE TABLE
CREATE TABLE movie (
	movie_id INT IDENTITY(1,1) PRIMARY KEY,
	movie_title CHAR(20) NOT NULL,
	movie_year CHAR(20) NOT NULL,
	movie_language CHAR(20) NOT NULL,
	movie_release_date DATE DEFAULT GETDATE(),
	movie_release_country CHAR(20)
)

----MOVIE_GENRES TABLE
CREATE TABLE movie_genres (
	movie_id INT FOREIGN KEY REFERENCES movie(movie_id),
	genres_id INT FOREIGN KEY REFERENCES genres(genres_id)
)

----MOVIE_DIRECTOR
CREATE TABLE movie_director (
	director_id INT FOREIGN KEY REFERENCES director(director_id),
	movie_id INT FOREIGN KEY REFERENCES movie(movie_id)
)

----REVIEWER TABLE
CREATE TABLE reviewer (
	reviewer_id INT IDENTITY(1,1) PRIMARY KEY,
	reviewer_name CHAR(20)
)

----RATING_TABLE
CREATE TABLE rating (
	movie_id INT FOREIGN KEY REFERENCES movie(movie_id),
	reviewer_id INT FOREIGN KEY REFERENCES reviewer(reviewer_id),
	reviewer_rating INT,
	number_of_rating INT
)

----MOVIE_CAST
CREATE TABLE movie_cast (
	actor_id INT FOREIGN KEY REFERENCES actor(actor_id),
	movie_id INT FOREIGN KEY REFERENCES movie(movie_id),
	character_role CHAR(30)
)

------------------INSERTING VALUES--------------------
USE DB_MOVIE

----INSERT VALUES IN ACTOR TABLE
INSERT INTO actor (actor_fname, actor_lname, actor_gender) 
VALUES 
('James', 'Stewart', 'M'),
('Deborah', 'Kerr', 'F'),
('Peter', 'OToole', 'M'),
('Robert', 'De Niro', 'M'),
('F. Murray', 'Abraham', 'M'),
('Harrison', 'Ford', 'M'),
('Nicole', 'Kidman', 'F'),
('Stephen', 'Baldwin', 'M'),
('Jack', 'Nicholson', 'M'),
('Mark', 'Wahlberg', 'M'),
('Woody', 'Allen', 'M'),
('Claire', 'Danes', 'F'),
('Tim', 'Robbins', 'M'),
('Kevin', 'Spacey', 'M'),
('Kate', 'Winslet', 'F'),
('Robin', 'Williams', 'M'),
('Jon', 'Voight', 'M'),
('Ewan', 'McGregor', 'M'),
('Christian', 'Bale', 'M'),
('Maggie', 'Gyllenhaal', 'F'),
('Dev', 'Patel', 'M'),
('Sigourney', 'Weaver', 'F'),
('David', 'Aston', 'M'),
('Ali', 'Astin', 'F')

----INSERT VALUES IN GENRES TABLE
INSERT INTO genres (genres_title) 
VALUES 
('Action'),
('Adventure'),
('Animation'),
('Biography'),
('Comedy'),
('Crime'),
('Drama'),
('Horror'),
('Music'),
('Mystery'),
('Romance'),
('Thriller'),
('War')
INSERT INTO genres (genres_title)
VALUES ('Action and Comedy')

----INSERT VALUES IN DIRECTOR TABLE
INSERT INTO director (director_fname, director_lname) 
VALUES 
('Alfred', 'Hitchcock'),
('Jack', 'Clayton'),
('David', 'Lean'),
('Michael', 'Cimino'),
('Milos', 'Forman'),
('Ridley', 'Scott'),
('Stanley', 'Kubrick'),
('Bryan', 'Singer'),
('Roman', 'Polanski'),
('Paul Thomas', 'Anderson'),
('Woody', 'Allen'),
('Hayao', 'Miyazaki'),
('Frank', 'Darabont'),
('Sam', 'Mendes'),
('James', 'Cameron'),
('Gus', 'Van Sant'),
('John', 'Boorman'),
('Danny', 'Boyle'),
('Christopher', 'Nolan'),
('Richard', 'Kelly'),
('Kevin', 'Spacey'),
('Andrei', 'Tarkovsky'),
('Peter', 'Jackson'),
('Rahul', 'Rana')

ALTER TABLE movie ADD movie_time INT
SELECT *FROM movie

----INSERT VALUES IN MOVIE
INSERT INTO movie (movie_title, movie_year, movie_language, movie_release_country, movie_time)
VALUES
('Vertigo', '1958', 'English', 'UK', 128),
('The Innocents', '1961', 'English', 'SW', 100),
('Lawrence of Arabia', '1962', 'English', 'UK', 216),
('The Deer Hunter', '1978', 'English', 'UK', 183),
('Amadeus', '1984', 'English', 'UK', 160),
('Blade Runner', '1982', 'English', 'UK', 117),
('Eyes Wide Shut', '1999', 'English', 'UK', 159),
('The Usual Suspects', '1995', 'English', 'UK', 106),
('Chinatown', '1974', 'English', 'UK', 130),
('Boogie Nights', '1997', 'English', 'UK', 155),
('Annie Hall', '1977', 'English', 'USA', 93),
('Princess Mononoke', '1997', 'Japanese', 'UK', 134),
('The Shawshank', '1994', 'English', 'UK', 142),
('American Beauty', '1999', 'English', 'UK', 122),
('Titanic', '1997', 'English', 'UK', 194),
('Good Will Hunting', '1997', 'English', 'UK', 126),
('Deliverance', '1972', 'English', 'UK', 109),
('Trainspotting', '1996', 'English', 'UK', 94),
('The Prestige', '2006', 'English', 'UK', 130),
('Donnie Darko', '2001', 'English', 'UK', 113),
('Slumdog Millionaire', '2008', 'English', 'UK', 120),
('Aliens', '1986', 'English', 'UK', 137),
('Beyond the Sea', '2004', 'English', 'UK', 118),
('Avatar', '2009', 'English', 'UK', 162),
('Seven Samurai', '1954', 'Japanese', 'JP', 207),
('Spirited Away', '2001', 'Japanese', 'UK', 125),
('Back to the Future', '1985', 'English', 'UK', 116),
('Braveheart', '1995', 'English', 'UK', 178);

----INSERT VALUES MOVIE_GENRES
INSERT INTO movie_genres(movie_id, genres_id)
VALUES
(40, 1),
(41, 2), 
(42, 3),
(43, 4),
(44, 5),
(45, 6),
(46, 7),
(47, 8),
(48, 9),
(49, 10),
(50, 11),
(51, 12),
(52, 13),
(53, 14),
(54, 15),
(55, 16),
(56, 17),
(57, 18),
(58, 19),
(59, 20),
(60, 21),
(61, 22),
(62, 22),
(63, 23),
(64, 24),
(65, 25),
(66, 26),
(67, 27)

----INSERT VALUES MOVIE_DIRECTOR
INSERT INTO movie_director (director_id)
VALUES
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48)

----INSERT VALUES REVIEWER TABLE
INSERT INTO reviewer (reviewer_name)
VALUES
  ('Righty Sock'),
  ('Jack Malvern'),
  ('Flagrant Baronessa'),
  ('Alec Shaw'),
  (''),
  ('Victor Woeltjen'),
  ('Simon Wright'),
  ('Neal Wruck'),
  ('Paul Monks'),
  ('Mike Salvati'),
  (''),
  ('Wesley S. Walker'),
  ('Sasha Goldshtein'),
  ('Josh Cates'),
  ('Krug Stillo'),
  ('Scott LeBrun'),
  ('Hannah Steele'),
  ('Vincent Cadena'),
  ('Brandt Sponseller'),
  ('Richard Adams')

----INSERT VALUES RATING TABLE
INSERT INTO rating (movie_id, reviewer_id, reviewer_rating, number_of_rating)
VALUES
 (40, 1, 8.40, 263575),
  (41, 2, 7.90, 20207),
  (42, 3, 8.30, 202778),
  (43, 4, 8.20, 484746),
  (44, 5, 7.30, NULL),
  (45, 6, 8.60, 779489),
  (46, 7, NULL, 227235),
  (47, 8, 3.00, 195961),
  (48, 9, 8.10, 203875),
  (49, 10, NULL, NULL),
  (50, 11, 7.00, 862618),
  (51, 12, 7.70, 830095),
  (52, 13, 4.00, 642132),
  (53, 14, 7.70, 81328),
  (54, 15, NULL, 580301),
  (55, 16, 8.10, 609451),
  (56, 17, 8.00, 667758),
  (57, 18, 8.40, 511613),
  (58, 19, 6.70, 13091),
  (59, 20, NULL, NULL),	
(60, NULL, NULL, NULL),		
(61, NULL, NULL, NULL),	
(62, NULL, NULL, NULL),		
(63, NULL, NULL, NULL),		
(64, NULL, NULL, NULL),		
(65, NULL, NULL, NULL),		
(66, NULL, NULL, NULL),		
(67, NULL, NULL, NULL)
		

----INSERT VALUES MOIVE_CAST
INSERT INTO movie_cast (actor_id, movie_id, character_role)
VALUES
	(1, 40, 'John Scottie Ferguson'),
	(2, 41, 'Miss Giddens'),
	(3, 42, 'T.E. Lawrence'),
	(4, 43, 'Michael'),
	(5, 44, 'Antonio Salieri'),
	(6, 45, 'Rick Deckard'),
	(7, 46, 'Alice Harford'),
	(8, 47, 'McManus'),
	(9, 48, 'Eddie Adams'),
	(10, 49, 'Alvy Singer'),
	(11, 50, 'San'),
	(12, 51, 'Andy Dufresne'),
	(13, 52, 'Lester Burnham'),
	(14, 53, 'Rose DeWitt Bukater'),
	(15, 54, 'Sean Maguire'),
	(16, 55, 'Ed'),
	(17, 56, 'Renton'),
	(18, 57, 'Elizabeth Darko'),
	(19, 58, 'Older Jamal'),
	(20, 59, 'Ripley'),
	(21, 60, 'Bobby Darin'),
	(22, 61, 'J.J. Gittes'),
	(23, 62, 'Alfred Borden'),
	(24, 63, NULL),
	(25, 64, NULL),
	(26, 65, NULL),
	(27, 66, NULL),
	(28, 67, NULL),
	(29, NULL, NULL),
	(30, NULL, NULL),
	(31, NULL, NULL),
	(32, NULL, NULL),
	(33, NULL, NULL),
	(34, NULL, NULL),
	(35, NULL, NULL),
	(36, NULL, NULL),
	(37, NULL, NULL),
	(38, NULL, NULL),
	(39, NULL, NULL),
	(40, NULL, NULL),
	(41, NULL, NULL),
	(42, NULL, NULL),
	(43, NULL, NULL),
	(44, NULL, NULL),
	(45, NULL, NULL),
	(46, NULL, NULL),
	(47, NULL, NULL),
	(48, NULL, NULL)


--1. From the following table, write a SQL query to find the name and year of the movies.
--Return movie title, movie release year
SELECT movie_title, movie_year
FROM movie

--2. From the following table, write a SQL query to find when the movie 'American Beauty' released.
--Return movie release year. 
SELECT movie_year
FROM movie
WHERE movie_title = 'American Beauty'

--3. From the following table, write a SQL query to find the movie that was released in 1999.
--Return movie title.
SELECT movie_title
FROM movie
WHERE movie_year = 1999

--4. From the following table, write a SQL query to find those movies, which were released before 1998.
--Return movie title.
SELECT movie_title
FROM movie
WHERE movie_year < 1998

--5. From the following tables, write a SQL query to find the name of all reviewers and
--movies together in a single list.
SELECT reviewer_name
FROM reviewer
UNION
SELECT movie_title
FROM movie

--6. From the following table, write a SQL query to find all reviewers who have rated
--seven or more stars to their rating. Return reviewer name.
SELECT reviewer_name, reviewer_rating
FROM reviewer
INNER JOIN
rating ON reviewer.reviewer_id = rating.reviewer_id
WHERE reviewer_rating > 7

--7. From the following tables, write a SQL query to find the movies without any rating. Return movie title.
SELECT movie_title, reviewer_rating
FROM movie
INNER JOIN
rating ON movie.movie_id = rating.movie_id
WHERE reviewer_rating IS NULL

--checking null values in reviewer_rating column in rating table
SELECT  movie_id, reviewer_rating FROM rating WHERE 
reviewer_rating IS NULL

--counting null values in reviewer_rating column in rating table
select count(reviewer_rating) from rating
SELECT movie_id, reviewer_rating from rating where movie_id = 46

SELECT movie_id, movie_title FROM movie where movie_id = 46

--8. From the following table, write a SQL query to find the movies with ID 45 or 47 or 57. Return movie title. 
SELECT movie_title 
FROM movie
WHERE movie_id IN (45, 47, 57)

--9. From the following table, write a SQL query to find the movie titles that contain the 
--word 'Boogie Nights'. Sort the result-set in ascending order by movie year.
--Return movie ID, movie title and movie release year.
SELECT movie_id, movie_title, movie_year
FROM movie
WHERE movie_title LIKE '%Boogie Nights%'
ORDER BY movie_year ASC

--10. From the following table, write a SQL query to find those actors with the first name
--'Woody' and the last name 'Allen'. Return actor ID
SELECT actor_id
FROM actor
WHERE actor_fname LIKE 'Woody' AND actor_lname LIKE 'Allen'


				---SUBQUERIES---
--1. From the following table, write a SQL query to find the actors who played a 
--role in the movie 'Michael'. Return all the fields of actor table.
SELECT * FROM actor WHERE character_role = 'Michael'(
select character_role from movie_cast
)
