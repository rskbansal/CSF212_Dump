USE db212;
CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    AlbumName VARCHAR(255) NOT NULL,
    ArtistName VARCHAR(255) NOT NULL,
    HoursStreamed INT DEFAULT 0,
    Label VARCHAR(255),
    Genre VARCHAR(255),
    ReleaseDate DATE NOT NULL
);

CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ActiveSince DATE NOT NULL,
    RetirementDate DATE,
    NumberOfFollowers INT
);

CREATE TABLE Users (
    UserID INT,
    UserName VARCHAR(255),
    EmailID VARCHAR(255) UNIQUE NOT NULL,
    MembershipCategory ENUM('P', 'F') DEFAULT 'F',
    PRIMARY KEY (UserID, UserName)
);

ALTER TABLE Users CHANGE COLUMN MembershipCategory Account_Type ENUM('P', 'F') DEFAULT 'F';
ALTER TABLE Albums MODIFY COLUMN HoursStreamed DECIMAL(6,2);

INSERT INTO Albums (AlbumID, AlbumName, ArtistName, HoursStreamed, Label, Genre, ReleaseDate)
VALUES  (39391, 'A Thousand Suns', 'Linkin Park', 128, 'Warner Bros', 'Rock', '2016/06/17'),
        (14573, 'Overexposed', 'Maroon 5', 452, 'A&M', 'Funk', '2016/11/11'),
        (17371,'Vaaqif','TLT',312,'OK Listen Media','Indie','2018/1/10');

-- Insert entries into the Artists table
INSERT INTO Artists (ArtistID, Name, ActiveSince, RetirementDate, NumberOfFollowers)
VALUES  (100, 'Maroon 5', '2007/11/13', NULL, 16000123),
        (101, 'Linkin Park', '2000/02-14', '2017/07/20', 21174672),
        (102, 'Eminem', '2001/01/15', NULL, 14093412),
        (103, 'Coldplay', '2002/05/13', NULL, 18000992),
        (104,'TLT','2009/11/11',NULL,21203972);

-- Insert entries into the Users table
INSERT INTO Users (UserID, UserName, EmailID, Account_Type)
VALUES (10003, 'Anurag Dwivedi', 'adwivedi@gmail.com', 'F'),
       (10004, 'Sana Kothari', 'sana123@hotbing.com', 'P'),
       (10005, 'Vishal Ghosh', 'vishy@gmail.com', DEFAULT),
       (10006, 'Rishab Gayatonde', 'gayatonde@hotmail.com', 'P'),
       (10007, 'Kunal Sargaonkar', 'kunalk@goa.bits-pilani.ac.in', 'F');
