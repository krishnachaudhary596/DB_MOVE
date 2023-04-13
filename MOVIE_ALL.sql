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

CREATE TABLE reviewer (
	reviewer_id INT IDENTITY(1,1) PRIMARY KEY,
	reviewer_name CHAR(20)
)

