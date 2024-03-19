CREATE DATABASE flubber;

USE flubber;

CREATE TABLE Professors(
    pid INTEGER NOT NULL,
    Professor_name CHAR(100) NOT NULL,
    Field CHAR(30),
    College CHAR(100) NOT NULL,
    Phd_Date DATE,
    PRIMARY KEY (pid));
    
    
CREATE TABLE Flubs(
    fid INTEGER NOT NULL,
    Content CHAR(255) NOT NULL,
    pid INTEGER NOT NULL, 
    Professor_name CHAR(40) NOT NULL,
    Moment DATETIME NOT NULL,
    FOREIGN KEY (pid) REFERENCES Professors(pid));
    
CREATE TABLE Created(
    fid INTEGER NOT NULL,
    pid INTEGER NOT NULL,
	Professor_name CHAR(100) NOT NULL, 
    FOREIGN KEY (pid) REFERENCES Professors(pid),
	FOREIGN KEY (fid) REFERENCES Flubs(fid)
    );
    

CREATE TABLE Citations(
    cid INTEGER NOT NULL,
    Citations CHAR(40) NOT NULL,
    Inventor_ID CHAR(40) NOT NULL,
    fid INTEGER NOT NULL,
    PosNeg BOOL,
    Cited  int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (cid),
    FOREIGN KEY (fid) REFERENCES Flubs(fid)
    );
    

CREATE TABLE Bounces(
    Sharer_pid INTEGER NOT NULL,
    Date_time TIMESTAMP NOT NULL,
    Bounced  int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Sharer_pid),
    FOREIGN KEY (fid) REFERENCES Flubs(fid),
    FOREIGN KEY (pid) REFERENCES Professors(pid)
    );


CREATE TABLE Interactions (
    Colleague_id INT,
    pid INT,
    fid INT,
    Sharer_pid INT,
    Date_time DATETIME,
    Citations CHAR(40),
    cid INTEGER,
    FOREIGN KEY (pid) REFERENCES Professors(pid),
    FOREIGN KEY (fid) REFERENCES Flubs(fid),
    FOREIGN KEY (cid) REFERENCES Citations(cid));


INSERT INTO Professors(pid, Professor_name, Field, College, Phd_Date) VALUES (13, 'Dr. Michael Helmers', 'Mathmetics', 'Valpariso',  1990-5-30);
INSERT INTO Professors(pid, Professor_name, Field, College, Phd_Date) VALUES (67, 'Dr. Roselyn Moran', 'Art History', 'Stony Brook University', 2009-12-23);
INSERT INTO Professors(pid, Professor_name, Field, College, Phd_Date) VALUES (4, 'Dr. Julian Zietlow', 'Robotics', 'Georgia Institute of Technology',  2005-5-15);
    
INSERT INTO Bounces(Sharer_pid, Date_time, fid,pid, Bounced) VALUES (13, '2009-12-18 15:13:00.000000', 901, 4, 1);
INSERT INTO Bounces(Sharer_pid, Date_time, fid,pid, Bounced) VALUES (4, '2007-02-17 20:10:02.000000', 89, 67, 1);
INSERT INTO Bounces(Sharer_pid, Date_time, fid, pid, Bounced) VALUES (67, '1000-01-01 05:34:56.000000', 378, 13, 1);

INSERT INTO Flubs(fid, Content, Moment, CargoSize, Inventor, pid) VALUES (89, 'Go Georgia Robots!', '2022-12-13 08:45:56.410000', 15 ,'Dr. Julian Zietlow', 4  );
INSERT INTO Flubs(fid, Content, Moment, CargoSize, Inventor, pid) VALUES (378, 'Try my daily Quiz!', '2022-11-31 07:25:02.030500', 18, 'Dr. Michael Helmers', 13);
INSERT INTO Flubs(fid, Content, Moment, CargoSize, Inventor, pid) VALUES (901, 'Free day at The MET!', '2023-02-02 10:15:05.002340', 20, 'Dr. Roselyn Moran', 67);

INSERT INTO Citations(cid, Citations, Inventor_ID, fid, PosNeg, Cited) VALUES (132,42, 67 ,89,TRUE, 1);
INSERT INTO Citations(cid, Citations, Inventor_ID,fid, PosNeg, Cited) VALUES (90 , 475, 13 ,18,378, FALSE, 1);
INSERT INTO Citations(cid, Citations, Inventor_ID,fid, PosNeg, Cited) VALUES (95,123, 4,901,TRUE, 1);


INSERT INTO Interactions(Colleague_id, pid, fid, Sharer_pid, Date_time, Citations, cid) VALUES (13,13, 378, 4, '2009-12-18 15:13:00.000000', 123, 95);
INSERT INTO Interactions(Colleague_id, pid, fid, Sharer_pid, Date_time, Citations, cid) VALUES (4, 89, 67, '2007-02-17 20:10:02.000000', 42, 132);
INSERT INTO Interactions(Colleague_id, pid, fid, Sharer_pid, Date_time, Citations, cid) VALUES ( 67, 67, 901, 13, '1000-01-01 05:34:56.000000', 475, 90); 

