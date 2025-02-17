SHOW DATABASES;

CREATE DATABASE Travel_Dataset;
USE Travel_Dataset;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile= 1;

CREATE TABLE Destinations(
    DestinationID INT8 NOT NULL PRIMARY KEY,
    NameState VARCHAR(248),
    Type VARCHAR(248),
    Popularity FLOAT8,
    BestTimeToVisit VARCHAR(248)
);
LOAD DATA LOCAL INFILE 'F:/Alibaba-Technical interview/ML-Engineer/Final Datasets/Destinations.csv'
INTO TABLE Destinations
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(DestinationID, NameState, Type, Popularity, BestTimeToVisit);

CREATE TABLE Users(
    UserID INT8 NOT NULL PRIMARY KEY,
    Name VARCHAR(248),
    Email VARCHAR(248),
    Preferences VARCHAR(248),
    Gender VARCHAR(248),
    NumberOfAdults INT8,
    NumberOfChildren INT8
);
LOAD DATA LOCAL INFILE 'F:/Alibaba-Technical interview/ML-Engineer/Final Datasets/Users.csv'
INTO TABLE Users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(UserID, Name, Email, Preferences, Gender, NumberOfAdults, NumberOfChildren);

CREATE TABLE Reviews(
    ReviewID INT8 NOT NULL PRIMARY KEY,
    UserID INT8 NOT NULL,
    DestinationID INT8 NOT NULL,
    Rating INT8,
    ReviewText VARCHAR(248),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (DestinationID) REFERENCES Destinations(DESTINATIONID)
);
LOAD DATA LOCAL INFILE 'F:/Alibaba-Technical interview/ML-Engineer/Final Datasets/Reviews.csv'
INTO TABLE Reviews
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ReviewID, DestinationID, UserID, Rating, ReviewText);

CREATE TABLE History(
    HistoryID INT8 NOT NULL PRIMARY KEY,
    UserID INT8 NOT NULL,
    DestinationID INT8 NOT NULL,
    VisitDate DATETIME,
    ExperienceRating INT8,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (DestinationID) REFERENCES Destinations(DESTINATIONID)
);
LOAD DATA LOCAL INFILE 'F:/Alibaba-Technical interview/ML-Engineer/Final Datasets/History.csv'
INTO TABLE History
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(HistoryID, UserID, DestinationID, VisitDate, ExperienceRating);

SHOW TABLES;
SELECT * FROM destinations;
SELECT * FROM users;
SELECT * FROM reviews;
SELECT * FROM history;