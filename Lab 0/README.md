# Answers to Lab 0
## Q1
### 1
```sql
CREATE TABLE Albums (
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
CREATE TABLE Artists (
  ArtistID INT PRIMARY KEY, 
  Name VARCHAR(20) NOT NULL, 
  ActiveSince DATE NOT NULL, 
  RetirementDate DATE,
  NumberOfFollowers INT, 
  Nationality VARCHAR(20) NOT NULL
);
```
### 3
```sql
CREATE TABLE Users (
  UserID INT, 
  UserName VARCHAR(20), 
  EmailID VARCHAR(255) UNIQUE NOT NULL, 
  MembershipCategory ENUM('P', 'F') DEFAULT 'F', 
  PRIMARY KEY(UserID, UserName)
);
```

## Q2
Primary Key uniquely identifies every row in the column it is applied to. Hence, the attributes `NOT NULL` and `UNIQUE` are applied to it automatically.

## Q3
### 1
```sql
ALTER TABLE Users
  CHANGE MembershipCategory Account_Type ENUM('P', 'F') DEFAULT 'F'; 
```
### 2
```sql
ALTER TABLE Artists
  DROP COLUMN Nationality; 
```
### 3
```sql
ALTER TABLE Albums
  MODIFY HoursStreamed DECIMAL(6, 2); 
```

## Q4
It outputs the SQL query for creating the table `Albums`.

## Q5
### Albums
#### 1
```sql
INSERT INTO Albums 
VALUES (
  39391, 'A Thousand Suns', 'Linkin Park', 128, 'Warner Bros', 'Rock', '2016/06/17'
);
```
#### 2
```sql
INSERT INTO Albums 
VALUES (
  14573, 'Overexposed', 'Maroon 5', 452, 'A&M', 'Funk', '2016/11/11'
);
```
#### 3
On executing the following query:
```sql
INSERT INTO Albums 
VALUES (
  24573, 'Overexposed', 'Maroon', 400, 'A&M', 'Funk', '2016/11/31'
);
```
The following error is thrown:
```
ERROR 1292 (22007): Incorrect date value: '2016/11/31' for column 'ReleaseDate' at row 1
```

### Artists
#### 1
```sql
INSERT INTO Artists 
VALUES (
  100, 'Maroon 5', '2007/11/13', NULL, 16000123
);
```
#### 2
```sql
INSERT INTO Artists 
VALUES (
  101, 'Linkin Park', '2000/02/14', '2017/07/20', 21174672
);
```
#### 3
```sql
insert into Artists 
values (
  102, 'Eminem', '2001/01/15', NULL, 14093412
);
```
#### 4
```sql
INSERT INTO Artists 
VALUES (
  103, 'Coldplay', '2002/05/13', NULL, 18000992
);
```

### Users
#### 1
```sql  
INSERT INTO Users 
VALUES (
  10003, 'Anurag Dwivedi', 'adwivedi@gmail.com', 'F'
);
```
#### 2
```sql
INSERT INTO Users 
VALUES (
  10004, 'Sana Kothari', 'sana123@gmail.com', 'P'
);
```
#### 3
```sql
INSERT INTO Users 
VALUES (
  10005, 'Vishal Ghosh', 'vishy@gmail.com', DEFAULT
);
```

## Q6
```sql
SELECT DISTINCT Label
FROM Albums; 
```
The difference is that the `DISTINCT` will not return duplicate values.

## Q7
```sql
SELECT *
FROM Users
WHERE Account_Yype = 'P'; 
```

## Q8
```sql
SELECT *
FROM Albums
WHERE ArtistName='Maroon 5' AND Genre='Rock';
```

## Q9
```sql
UPDATE Albums
SET HoursStreamed=HoursStreamed+200
WHERE Genre='Rock';

SELECT * FROM Albums;
```

## Q10
```sql
ALTER TABLE Artists
  ADD COLUMN Duration INT NOT NULL; 
```

## Q11
```sql
DELETE
FROM Albums
WHERE HoursStreamed>400;
```

## Q12
```sql
SELECT HoursStreamed*1.2, AlbumName
FROM Albums;
```

## Q13
```sql
UPDATE Artists
SET NumberOfFollowers=NumberOfFollowers+200
WHERE ArtistID=100;
```

## Q14
```sql
