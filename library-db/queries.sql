INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('Bob', '555-231-1123', 1);
INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('Rodrigo', '555-162-0123', 2);

INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('Meg', '555-222-1123', 3);
INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('Jane', '555-162-1111', 4);

INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('Mary', '555-123-1234', 5);
INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('Mike', '555-111-4444', 6);

INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('Kristen', '555-222-2222', 7);
INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('Luis', '555-333-0123', 8);

INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('James', '555-555-1123', 9);
INSERT INTO Accounts(`status`) VALUES (1);
INSERT INTO Users(`name`, `phoneNumber`,`accountNumber`) VALUES ('Victoria', '444-162-0123', 10);

SELECT * from Users;

UPDATE Users
SET email = 'bob@gmail.com'
WHERE name = 'Bob';

UPDATE Users
SET email = 'rodrigo@gmail.com'
WHERE id = 2;

UPDATE Users
SET email = 'meg@gmail.com'
WHERE name = 'Meg';

UPDATE Users
SET email = 'jane@gmail.com'
WHERE id = 4;

UPDATE Users
SET email = 'mary@gmail.com'
WHERE id = 5;

UPDATE Users
SET email = 'mike@gmail.com'
WHERE name = 'Mike';

UPDATE Users
SET email = 'kristen@gmail.com'
WHERE id = 7;

UPDATE Users
SET email = 'luis@gmail.com'
WHERE name = 'Luis';

UPDATE Users
SET email = 'james@gmail.com'
WHERE id = 9;

UPDATE Users
SET email = 'victoria@gmail.com'
WHERE id = 10;

SELECT * from Users;

DELETE from Users
WHERE id = 1;

DELETE from Users
WHERE id = 2;

DELETE from Users
WHERE id = 3;

DELETE from Users
WHERE id = 4;

DELETE from Users
WHERE id = 5;

DELETE from Users
WHERE id = 6;

DELETE from Users
WHERE id = 7;

DELETE from Users
WHERE id = 8;

DELETE from Users
WHERE id = 9;

DELETE from Users
WHERE id = 10;

SELECT * from Users;