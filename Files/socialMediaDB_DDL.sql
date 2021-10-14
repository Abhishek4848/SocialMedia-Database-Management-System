DROP database socialmedia;
CREATE database socialmedia;

\c socialmedia

--User is reserved word
CREATE TABLE User_Detail
(
    UserID INT UNIQUE NOT NULL,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(30) NOT NULL,
    School VARCHAR(100),
    Username VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(30) UNIQUE NOT NULL,
    Location VARCHAR(30),
    Phone INT,
    DOB DATE CHECK (DOB > '2011-01-01'),  --age restriction 10+
    Friends TEXT [],
    GENDER VARCHAR(15),
    PRIMARY KEY (UserID)
);

--Are we adding hyperlinks or defining BLOB Datatype? (TEXT can be used for large string values)
CREATE TABLE Pages
(
    PageID INT UNIQUE NOT NULL,
    PageName VARCHAR(50) NOT NULL,
    PageContent TEXT,
    PRIMARY KEY(PageID)
);

CREATE TABLE Posts 
(
    PostID INT UNIQUE NOT NULL,
    PostDate TIMESTAMP ,
    PostContent TEXT, -- BLOB or varchar?
    UserID INT,
    PRIMARY KEY(PostID),
    FOREIGN KEY (UserID) REFERENCES User_Detail(UserID)
);

CREATE TABLE PostLikes
(
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    Like_Count INT NOT NULL DEFAULT 0,
    PRIMARY KEY (PostID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES User_Detail(UserID)
);

-- What datatype? There is no blob in postgresql (instead BYTEA) 
CREATE TABLE Photos
(
    PhotoID INT UNIQUE NOT NULL,
    ImgContent BYTEA, 
    PostID INT NOT NULL,
    PRIMARY KEY(PhotoID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

Create TABLE Shares
(
    PostID INT NOT NULL,
    USERID INT NOT NULL,
    PRIMARY KEY (PostID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES User_Detail(UserID)
);

CREATE TABLE Comments
(
    CommentID INT UNIQUE NOT NULL,
    UserID INT NOT NULL,
    PostId INT NOT NULL,
    CommentContent VARCHAR(200),
    CommentDate TIMESTAMP,
    PRIMARY KEY(CommentID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES User_Detail(UserID)
);