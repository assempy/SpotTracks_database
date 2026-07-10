-- Basic Filtering


-- Display all artists
SELECT artist_id, artist_name, popularity, followers
FROM artists;

-- Artists with popularity greater than 60
SELECT artist_name, popularity
FROM artists
WHERE popularity > 60;

-- Songs between 2 and 4 minutes
SELECT *
FROM songs
WHERE duration_ms BETWEEN 120000 AND 240000;

-- Songs starting with the letter "S"
SELECT song_name
FROM songs
WHERE song_name LIKE 'S%';

-- Albums released after 2020
SELECT *
FROM albums
WHERE release_date > '2020-01-01';

-- Albums released between 2000 and 2020
SELECT album_name, release_date
FROM albums
WHERE release_date BETWEEN '2000-01-01' AND '2020-12-31';


-- Sorting and Ranking

-- Top 10 artists by followers
SELECT artist_name, followers
FROM artists
ORDER BY followers DESC
LIMIT 10;



-- JOIN Operations


-- Songs by Artemas
SELECT a.artist_name, s.song_name
FROM artists a
JOIN albums al ON a.artist_id = al.artist_id
JOIN songs s ON al.album_id = s.album_id
WHERE a.artist_name = 'Artemas';

-- Artists and their albums (LEFT JOIN)
SELECT a.artist_name, al.album_name
FROM artists a
LEFT JOIN albums al
ON a.artist_id = al.artist_id;

-- Albums and artists (RIGHT JOIN)
SELECT a.artist_name, al.album_name
FROM artists a
RIGHT JOIN albums al
ON a.artist_id = al.artist_id;

-- Songs available in selected markets
SELECT s.song_name, m.market_name
FROM songs s
JOIN song_markets sm
ON s.song_id = sm.song_id
JOIN markets m
ON sm.market_code = m.market_code
WHERE s.song_name = 'Summer 2000 Baby';

-- Playlist containing a specific song
SELECT p.playlist_name
FROM playlists p
JOIN playlists_songs ps
ON p.playlist_id = ps.playlist_id
WHERE ps.song_id = '5qdw9BTJbwzWSZa1sbNF3I';

-- Songs with danceability greater than 0.7
SELECT s.song_name, af.danceability
FROM songs s
JOIN audio_features af
ON s.song_id = af.song_id
WHERE af.danceability > 0.7;



-- Aggregation


-- Songs available in more than one market
SELECT song_id,
       COUNT(market_code) AS market_count
FROM song_markets
GROUP BY song_id
HAVING COUNT(market_code) > 1;

-- Number of songs in each playlist
SELECT playlist_id,
       COUNT(song_id) AS total_songs
FROM playlists_songs
GROUP BY playlist_id;

-- Average artist popularity by genre
SELECT g.genre_name,
       AVG(a.popularity) AS avg_popularity
FROM genres g
JOIN artist_genres ag
ON g.genre_id = ag.genre_id
JOIN artists a
ON ag.artist_id = a.artist_id
GROUP BY g.genre_name;

-- Number of songs in each album
SELECT al.album_name,
       COUNT(s.song_id) AS song_count
FROM albums al
LEFT JOIN songs s
ON al.album_id = s.album_id
GROUP BY al.album_name;

-- Artists associated with more than one genre
SELECT a.artist_name,
       COUNT(ag.genre_id) AS genre_count
FROM artists a
JOIN artist_genres ag
ON a.artist_id = ag.artist_id
GROUP BY a.artist_name
HAVING COUNT(ag.genre_id) > 1;



-- Subqueries


-- Songs with above-average popularity
SELECT song_name,
       popularity
FROM songs
WHERE popularity > (
    SELECT AVG(popularity)
    FROM songs
);

-- Songs longer than the average duration
SELECT song_name,
       duration_ms
FROM songs
WHERE duration_ms > (
    SELECT AVG(duration_ms)
    FROM songs
);



-- Set Operations


-- Artists and playlist owners (unique names)
SELECT artist_name AS name
FROM artists
UNION
SELECT owner_name
FROM playlists;

-- Artists without albums
SELECT artist_id
FROM artists
EXCEPT
SELECT artist_id
FROM albums;