# Answers to Lab 1
## Q1
```bash
$ mysql -u csf212 -p db212 < import_data.sql
```

## Q2
```sql
ALTER TABLE Artists
  ADD CONSTRAINT UNIQUE(Name);

ALTER TABLE Albums
  ADD CONSTRAINT FOREIGN KEY(ArtistName) REFERENCES Artists(Name)
    ON DELETE CASCADE 
    ON UPDATE CASCADE;
```

## Q3
```sql
ALTER TABLE Albums
  ADD CONSTRAINT UNIQUE(AlbumName);

CREATE TABLE Songs (
  Likes INT,
  SongID INT PRIMARY KEY,
  SongName VARCHAR(255) NOT NULL,
  AlbumName VARCHAR(255),
  FOREIGN KEY(AlbumName) REFERENCES Albums(AlbumName)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  ArtistName VARCHAR(255),
  FOREIGN KEY(ArtistName) REFERENCES Artists(Name)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
  Duration DECIMAL(3, 2)
  ); 
```

## Q4
```sql
INSERT INTO Songs
VALUES 
(243234, 1, 'Daylight', 'Overexposed', 'Maroon 5', 3.45),
(323249, 2, 'Payphone', 'Overexposed', 'Maroon 5', 3.51),
(98271, 10, 'Gustaakh', 'Vaaqif', 'TLT', 3.04),
(378923, 15, 'The Catalyst', 'A Thousand Suns', 'Linkin Park', 5.39);
```

## Q5
```sql
UPDATE Artists
SET Name = "Weeknd"
WHERE Name = "TLT";
```

## Q6
```sql
SELECT *
FROM Songs
WHERE SongName LIKE '%e_' AND Duration > 4;
```

## Q7
```sql
SELECT *
FROM Songs
ORDER BY Duration ASC, Likes DESC;
```

## Q8
```sql
SELECT CONCAT(AlbumName, ' ', ArtistName) AS Music
FROM Albums
WHERE YEAR(ReleaseDate) = 2016;
```
(OR) 
```sql
```

## Q9
```sql
