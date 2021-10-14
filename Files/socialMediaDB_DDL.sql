DROP database socialMedia;
CREATE database socialMedia;

\c socialMedia

CREATE TABLE User
(
    UserID INT NOT NULL,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(30) NOT NULL,
    School VARCHAR(100),
    Username VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Location VARCHAR(30),
    Phone INT,
    DOB DATE,
    GENDER VARCHAR(6),
    PRIMARY KEY (UserID),
);

CREATE TABLE UserAuth
(
    UserID INT,
    UserName, --Foreign Keys?
    Email,
    Pwd VARCHAR(12), --Add constraints for password ex. combo of caps, special chars, no.
    FOREIGN KEY (UserID) REFERENCES User(UserID),
);

CREATE TABLE Friends
(
    UserID INT,
    FriendID,  --Isn't the friendID and UserID same? cuz friends are also users(recursive)
    FOREIGN KEY (UserID) REFERENCES User(UserID),
);

CREATE TABLE Pages
(
    PageID INT NOT NULL,
    PageName VARCHAR(50) NOT NULL,
    PageContent VARCHAR(256), --Are we adding hyperlinks or defining BLOB Datatype?
    PRIMARY KEY(PageID),
);

CREATE TABLE Posts 
(
    PostID INT NOT NULL,
    PostDate DATE,
    PostContent, -- BLOB or varchar?
    UserID INT,
    PRIMARY KEY(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
);

CREATE TABLE PostLikes
(
    PostID INT,
    UserID INT,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
);

CREATE TABLE Photos
(
    PhotoID INT UNIQUE NOT NULL,
    ImgContent, -- What datatype?
    PostID INT,
    PRIMARY KEY(PhotoID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
),

Create TABLE Shares
(
    PostID INT,
    USERID INT,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
);

CREATE TABLE Comments
(
    CommentID INT UNIQUE NOT NULL,
    UserID INT,
    PostId INT,
    CommentContent VARCHAR(200),
    CommentDate DATE,
    PRIMARY KEY(CommentID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
);

