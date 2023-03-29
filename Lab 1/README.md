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
```

## Q4
```sql
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

## Q5
```sql
