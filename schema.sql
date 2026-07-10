CREATE DATABASE spotify_tracks;

CREATE TABLE artists (
    artist_id VARCHAR(22) PRIMARY KEY,
    artist_name VARCHAR(150) NOT NULL, 
    popularity INT CHECK (popularity BETWEEN 0 AND 100), 
    followers INT
); 

CREATE TABLE genres(
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL,
    description TEXT,
    origin_year INT
);

CREATE TABLE artist_genres(
    artist_id VARCHAR(22),
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id), 
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE albums(
    album_id VARCHAR(22) PRIMARY KEY, 
    album_name VARCHAR(150) NOT NULL,
    release_date DATE,
    album_type VARCHAR(20),
    artist_id VARCHAR(22),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE songs(
    song_id VARCHAR(22) PRIMARY KEY,
    song_name VARCHAR(255) NOT NULL,
    duration_ms INT CHECK(duration_ms > 0),
    popularity INT CHECK (popularity BETWEEN 0 AND 100),
    album_id VARCHAR(22),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE audio_features(
    song_id VARCHAR(22) PRIMARY KEY,
    danceability REAL CHECK (danceability BETWEEN 0 AND 1),
    energy REAL CHECK (energy BETWEEN 0 AND 1),
    valence REAL CHECK (valence BETWEEN 0 AND 1),
    tempo REAL CHECK (tempo > 0),
    loudness REAL CHECK (loudness BETWEEN -60 AND 5),
    FOREIGN KEY (song_id) REFERENCES songs(song_id) 
);


CREATE TABLE markets(
    market_code VARCHAR(2) PRIMARY KEY,
    market_name VARCHAR(60)
);

CREATE TABLE song_markets(
    song_id VARCHAR(22),
    market_code VARCHAR(2),
    PRIMARY KEY (song_id, market_code), 
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (market_code) REFERENCES markets(market_code)
);

CREATE TABLE playlists(
    playlist_id VARCHAR(22) PRIMARY KEY,
    playlist_name VARCHAR(255) NOT NULL,
    owner_name VARCHAR(100)
);

CREATE TABLE playlists_songs(
    playlist_id VARCHAR(22),
    song_id VARCHAR(22),
    PRIMARY KEY (playlist_id, song_id), 
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);


