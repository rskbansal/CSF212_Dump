# Answers to Lab 0
## Q1
### 1
```sql
CREATE TABLE Albums(
  AlbumID INT PRIMARY KEY, 
  AlbumName VARCHAR(20) NOT NULL, 
  ArtistName VARCHAR(20) NOT NULL, 
  HoursStreamed INT DEFAULT 0, 
  Label VARCHAR(20), 
  Genre VARCHAR(20), 
  ReleaseDate DATE NOT NULL
);
```
### 2
```sql
CREATE TABLE Artists(
  ArtistID INT PRIMARY KEY, 
  Name VARCHAR(20) NOT NULL, 
  ActiveSince DATE NOT NULL, 
  RetirementDate DATE, s
  NumberOfFollowers int, 
  Nationality VARCHAR(20) NOT NULL
);
```
### 3
```sql
CREATE TABLE Users(
  UserID INT, 
  UserName VARCHAR(20), 
  EmailID VARCHAR(255) UNIQUE NOT NULL, 
  MembershipCategory ENUM('P', 'F') DEFAULT 'F', 
  PRIMARY KEY(UserID, UserName)
);
```