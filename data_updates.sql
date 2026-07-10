-- Populate audio_features with generated values
INSERT INTO audio_features (song_id, danceability, energy, valence, tempo, loudness)
SELECT 
    song_id,

    -- Pop songs tend to be more danceable
    CASE 
        WHEN popularity > 70 THEN 0.6 + RANDOM() * 0.3
        WHEN popularity > 50 THEN 0.4 + RANDOM() * 0.4
        ELSE 0.2 + RANDOM() * 0.4
    END AS danceability,

    -- energy
    CASE 
        WHEN popularity > 70 THEN 0.5 + RANDOM() * 0.4
        ELSE 0.3 + RANDOM() * 0.5
    END AS energy,

    -- mood (valence)
    RANDOM() AS valence,

    -- tempo (realistic range)
    60 + RANDOM() * 140 AS tempo,

    -- loudness(dB) 
    -25 + RANDOM() * 10 AS loudness

FROM songs;

-- Update album types
-- Assign album types based on Spotify album metadata
UPDATE albums
SET album_type = CASE album_id

WHEN '5MQx9UktIiM86OYBZh1c4M' THEN 'deluxe'
WHEN '6exBK52toUpg3zj2Gog3K1' THEN 'studio'
WHEN '0SXtNBEYPTc7sXyLF9N7TT' THEN 'studio'
WHEN '2nVPmbiBiR3CrAqDnw1inZ' THEN 'studio'
WHEN '63yRRBtLX8eqbOLD6f0y9U' THEN 'studio'
WHEN '5chTLnnxlxQVAgEv6YbEBe' THEN 'studio'

WHEN '5HOHne1wzItQlIYmLXLYfZ' THEN 'studio'
WHEN '2wwCc6fcyhp1tfY3J6Javr' THEN 'studio'
WHEN '6QeosPQpJckkW0Obir5RT8' THEN 'studio'

WHEN '1RvJmGd47lKS4XMXs9j8hD' THEN 'studio'
WHEN '1aoWxOWHJNG1VPpJZwpYl2' THEN 'deluxe'
WHEN '4wtZQMNTC1O79kDxMBsEan' THEN 'studio'

WHEN '2KrREEyHxkdFGYAd1DmMdS' THEN 'studio'
WHEN '5vD5M5VW62LL78Ko8x0CVZ' THEN 'studio'
WHEN '3uPnO1aZBwMgWK1DI5zve9' THEN 'deluxe'

WHEN '1cqqIH16XzBnDchrXJ9Enf' THEN 'studio'
WHEN '5ho4S2bnJJdF0uwT8YiQsw' THEN 'studio'
WHEN '6DmPNcfpkXBVRJsEIJY9tl' THEN 'studio'

WHEN '7aJuG4TFXa2hmE4z1yxc3n' THEN 'studio'
WHEN '0JGOiO34nwfUdDrD612dOp' THEN 'studio'
WHEN '0S0KGZnfBGSIssfF54WSJh' THEN 'studio'

WHEN '4UlGauD7ROb3YbVOFMgW5u' THEN 'deluxe'
WHEN '48i37aZTC1prDr4EcpQeEa' THEN 'studio'
WHEN '5pLlGJrxuQO3jMoQe1XxZY' THEN 'deluxe'

WHEN '3ARwSvDQv2OHYnLeDC3Lxi' THEN 'studio'
WHEN '3X2oYJbZtrmszmNeXRpckc' THEN 'soundtrack'
WHEN '6eKdAMXNBlXNtPy7OdBL50' THEN 'soundtrack'

WHEN '1vWMw6pu3err6qqZzI3RhH' THEN 'studio'
WHEN '6mTQHfKvNR9x20dTBLhgmJ' THEN 'studio'

WHEN '16g3MJk9OmtNXwRrrPMPUK' THEN 'ep'
WHEN '6FoDELk022luh2Ap6t7bFH' THEN 'ep'
WHEN '2xpgb8R0BXVS2e1XnXI9xZ' THEN 'ep'
WHEN '04FS2RGpTrQMmWUbpUVNf4' THEN 'ep'

WHEN '5WulAOx9ilWy1h8UGZ1gkI' THEN 'studio'
WHEN '31qVWUdRrlb8thMvts0yYL' THEN 'studio'
WHEN '79dL7FLiJFOO0EoehUHQBv' THEN 'studio'

WHEN '68uIz7DtgDoPUFTKxdzL9t' THEN 'remaster'
WHEN '5eA0qtE7Yu29XiMlwoby2G' THEN 'remaster'
WHEN '4Sdfp3NL90GZoYYwLmhk0H' THEN 'live'

WHEN '1El3k8dU3sKyoGUeuyrolH' THEN 'studio'
WHEN '1KFWgQTw3EMTQebaaepVBI' THEN 'studio'
WHEN '2kAer61g2HN6upL2zXAjzd' THEN 'live'

WHEN '0CnpU8D00V1mfJeOt7tsqB' THEN 'studio'
WHEN '1ZG2nadmGlJER7mkWkh60u' THEN 'compilation'
WHEN '6EK8l8rFuMpAn27TNOCwsH' THEN 'remaster'

WHEN '2GROf0WKoP5Er2M9RXVNNs' THEN 'studio'
WHEN '7Heaa0B4KOxdWhSICTR2wE' THEN 'live'
WHEN '7v6FNgLDS8KmaWA1amUtqe' THEN 'studio'

WHEN '5BLrEOEDKoDDg5T8PzdIHN' THEN 'live'
WHEN '6ofEQubaL265rIW6WnCU8y' THEN 'remaster'
WHEN '0tzfI6NFJqcJkWb23R3lRZ' THEN 'compilation'

WHEN '5QfFvOMOJ0CrIDmu33RmSJ' THEN 'deluxe'
WHEN '4R6FV9NSzhPihHR0h4pI93' THEN 'studio'
WHEN '7qKEQkRXySP0rhjtXJksfg' THEN 'compilation'

WHEN '32gqZfrZ51UMunez3CZDJZ' THEN 'holiday'
WHEN '6lauK4mNENDUMSoekDVDNG' THEN 'studio'
WHEN '5rMOCuiWWbEBcHaKM69Hmv' THEN 'studio'

WHEN '1xQq0txMTpstjFUwp4c4E0' THEN 'studio'
WHEN '4H1YAR9PLOFSz9ks2t17t3' THEN 'compilation'
WHEN '5mTP7Oivpq88d7ZQ9DBt4F' THEN 'deluxe'

WHEN '5Fb59VtYjJNTXPcNGpoDU3' THEN 'soundtrack'
WHEN '4xdRjOhY9NHmMpI7U3e2c3' THEN 'compilation'
WHEN '097eYvf9NKjFnv4xA9s2oV' THEN 'studio'

WHEN '0l8zYqoUeBYg47Gmevq9HZ' THEN 'studio'
WHEN '5572B4RA9LsfrkXA7rU29M' THEN 'live'
WHEN '5YlBA1tCY0M8DDs75RB2LY' THEN 'studio'

WHEN '7I0m4dx3zk9W5lHbEhXNCY' THEN 'studio'
WHEN '3BSbeH6hi9LvkX97cWtgW9' THEN 'studio'
WHEN '5kvE1wvZJslKP2qKNia4gW' THEN 'studio'

WHEN '7bIEorGINUXmiYYtd7h1Tx' THEN 'live'
WHEN '3uMpcHUYzXhEnmKOloF6LU' THEN 'live'
WHEN '4YPN7ttGhaUIgEXtQPVux2' THEN 'live'

WHEN '6HG3ZH0opwhCZcby8Y2o8v' THEN 'live'
WHEN '0nVOSSbYkUBKBYh2D4WSDn' THEN 'live'
WHEN '7253n8oKnyOumxC2trgmM8' THEN 'live'

WHEN '10tYvuAzvxHz7K0Hujjjpr' THEN 'compilation'
WHEN '76CoN7GG8Oq1uuawUFifuX' THEN 'compilation'
WHEN '1r6CYUhkI07HNT5ONg6AqL' THEN 'deluxe'

ELSE album_type
END;

-- Add descriptions and origin years to genres
UPDATE genres
SET description = CASE genre_id
    WHEN 1 THEN 'Jazz style with strong swing rhythm and big band influence'
    WHEN 2 THEN 'Baroque-influenced pop music with orchestral elements'
    WHEN 3 THEN 'Fusion of metal with hip hop and alternative elements'
    WHEN 4 THEN 'Jazz focused on vocal performance and improvisation'
    WHEN 5 THEN 'Atmospheric, ethereal pop with dreamy textures'
    WHEN 6 THEN 'Experimental pop with artistic and avant-garde structure'
    WHEN 7 THEN 'Raw, energetic rock with DIY garage sound'
    WHEN 8 THEN 'Experimental rock with artistic and conceptual approach'
    WHEN 9 THEN 'Fusion of jazz, funk, and electronic elements'
    WHEN 10 THEN 'Large ensemble jazz with brass dominance'
    WHEN 11 THEN 'Distorted, angst-driven rock originating from grunge movement'
    WHEN 12 THEN 'Mainstream modern popular music'
    WHEN 13 THEN 'Rhythmic groove-based music emphasizing bass and percussion'
    WHEN 14 THEN 'Independent music outside major label system'
    WHEN 15 THEN 'Broad rock genre with electric guitar foundation'
    WHEN 16 THEN 'Psychedelic-influenced modern indie rock'
    WHEN 17 THEN 'Jazz blended with soul and groove elements'
    WHEN 18 THEN 'Dance-oriented music with steady four-on-the-floor rhythm'
    WHEN 19 THEN 'Non-mainstream rock with experimental influences'
    WHEN 20 THEN 'Heavy metal combined with alternative rock elements'
    WHEN 21 THEN 'Seasonal holiday-themed music'
    WHEN 22 THEN 'Smooth, melodic jazz with relaxed tempo'
    WHEN 23 THEN 'Fusion of rap and heavy metal instrumentation'
    WHEN 24 THEN 'Korean pop music with choreographed performance style'
    WHEN 25 THEN 'Soul-influenced pop with emotional vocals'
    WHEN 26 THEN 'Broad category of jazz music with improvisation'
    WHEN 27 THEN 'Traditional pop standards from mid-20th century'
END,

origin_year = CASE genre_id
    WHEN 1 THEN 1920
    WHEN 2 THEN 1960
    WHEN 3 THEN 1990
    WHEN 4 THEN 1920
    WHEN 5 THEN 1990
    WHEN 6 THEN 1970
    WHEN 7 THEN 1960
    WHEN 8 THEN 1970
    WHEN 9 THEN 1970
    WHEN 10 THEN 1920
    WHEN 11 THEN 1990
    WHEN 12 THEN 1950
    WHEN 13 THEN 1960
    WHEN 14 THEN 1980
    WHEN 15 THEN 1950
    WHEN 16 THEN 2000
    WHEN 17 THEN 1960
    WHEN 18 THEN 1970
    WHEN 19 THEN 1980
    WHEN 20 THEN 1990
    WHEN 21 THEN 1900
    WHEN 22 THEN 1980
    WHEN 23 THEN 1990
    WHEN 24 THEN 1990
    WHEN 25 THEN 1960
    WHEN 26 THEN 1920
    WHEN 27 THEN 1930
END;


