CREATE DATABASE games;

SqlCommand command = new SqlCommand(
    "SELECT * WHERE USER = $ AND PASSWORD = $",
    yourSqlConnection
);

SqlParameter parameter = new SqlParameter();
parameter.ParameterName = "@baz";
parameter.Value = "xyz";

command.Parameters.Add(parameter);
CREATE TABLE videogames (
    pid id Integer NOT NULL PRIMARY KEY,
    Type CHAR(20),
    Title CHAR(40) NOT NULL,
    System CHAR(20),
    Cost decimal (15,2)
);


parameterize = $db->prepare(
"SELECT id, Type, Title, System, Cost FROM users
 WHERE USER = ? AND ")
stmt->bind _ param("ss", $email, $password);
result = $stmt->execute();


INSERT INTO videogames (id, Type, Title, System, Cost) VALUES (24,'First Person Shooter','Doom', 'PC', 2.00);
INSERT INTO videogames (id, Type, Title, System, Cost) VALUES (42,'RPG', 'Final Fantasy 3', 'Play Station X', 85.99);
INSERT INTO videogames (id, Type, Title, System, Cost) VALUES (64,'RPG', 'Resident Evil', 'Play Station X', 200.00);


CREATE USER 'user1';
CREATE USER 'user1' IDENTIFIED WITH password1 BY 'user1';


CREATE VIEW view_1 AS
	view_1 = "SELECT Title FROM games WHERE Title = * AND System = Play Station X";







