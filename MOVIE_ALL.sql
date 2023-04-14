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
drop table movie_genres
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




select *from movie_genres
