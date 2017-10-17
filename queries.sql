--1
--Query all of the entries in the Genre table
SELECT * FROM genre;

-- 2
--Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO artist (ArtistId, ArtistName, YearEstablished) VALUES (NULL, "The Rolling Stones", "1970");

-- 3
--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES (NULL, "Some Girls", "10/21/1957", "1233", "Columbia", 28, 2);

-- 4
--Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES (NULL, "A Special Song", "344", "10/21/1969", 2, 28, 23);

--5
--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title as 'Song', alb.Title as 'Album', artist.artistname
FROM Song s LEFT JOIN Album alb ON s.AlbumId = alb.AlbumId
LEFT JOIN Artist ON s.ArtistId = Artist.ArtistId;

--6
--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.Title, COUNT(s.Title)
FROM Song s LEFT JOIN Album a ON a.AlbumId = s.AlbumId
GROUP BY a.AlbumId;

--7
--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.ArtistName, COUNT(s.Title) as 'Count'
FROM Song s LEFT JOIN Artist a ON a.ArtistId = s.ArtistId
GROUP BY a.ArtistId;

--8
--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, COUNT(s.Title) as 'Count'
FROM Song s LEFT JOIN Genre g ON g.GenreId = s.GenreId
GROUP BY g.GenreId;

--9
--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Title, MAX(AlbumLength) as 'Album Length'
FROM Album;

--10
--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title, MAX(SongLength) as 'Song Length'
FROM Song;

--11
--Modify the previous query to also display the title of the album.
SELECT s.Title as 'Song Title', a.Title as 'Album Title', MAX(s.SongLength) as 'Song Length'
FROM Song s LEFT JOIN Album a on s.AlbumId = a.AlbumId;
