INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Bob', '555-231-1123');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Rodrigo', '555-162-0123');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Meg', '555-222-1123');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Jane', '555-162-1111');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Mary', '555-123-1234');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Mike Robertson', '555-111-4444');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Kristen', '555-222-2222');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Luis', '555-333-0123');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('James', '555-555-1123');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Victoria', '444-162-0123');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Tyler Anderson', '512-231-1123');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Brian Higgin', '421-162-0123');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Peter Rosenthal', '555-123-2113');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Mike Wazowski', '555-162-1213');
INSERT INTO Accounts(`userName`, `userPhoneNum`) VALUES ('Clara', '511-223-1234');

SELECT * from Accounts;

UPDATE Accounts
SET email = 'bob@gmail.com'
WHERE userName = 'Bob';

UPDATE Accounts
SET email = 'rodrigo@gmail.com'
WHERE id = 2;

UPDATE Accounts
SET email = 'meg@gmail.com'
WHERE userName = 'Meg';

UPDATE Accounts
SET email = 'jane@gmail.com'
WHERE id = 4;

UPDATE Accounts
SET email = 'mary@gmail.com'
WHERE id = 5;

UPDATE Accounts
SET email = 'mikerobertson@gmail.com'
WHERE userName = 'Mike';

UPDATE Accounts
SET email = 'kristen@gmail.com'
WHERE id = 7;

UPDATE Accounts
SET email = 'luis@gmail.com'
WHERE userName = 'Luis';

UPDATE Accounts
SET email = 'james@gmail.com'
WHERE id = 9;

UPDATE Accounts
SET email = 'victoria@gmail.com'
WHERE id = 10;

SELECT * from Accounts;

DELETE from Accounts
WHERE userPhoneNum = '555-231-1123';
DELETE from Accounts
WHERE userName = 'Rodrigo';
DELETE from Accounts
WHERE id IN (3,4);
DELETE from Accounts
WHERE id = 5;
DELETE from Accounts
WHERE userName = 'Mike Robertson';
DELETE from Accounts
WHERE userName = 'Clara';
DELETE from Accounts
WHERE userPhoneNUm = '555-162-1213';
DELETE from Accounts
WHERE userPhoneNUm = '555-222-2222';
DELETE from Accounts
WHERE id = 8;
DELETE from Accounts
WHERE id = 9;

SELECT * from Accounts;

INSERT INTO Preferences(`favoriteBooks`, `favoriteDVDs`, `favoriteCDs` ) VALUES ('Harry Potter', 'Titanic, Spider-man 2, Alien', 'Nevermind, A Hard Day\'s Night');
INSERT INTO Preferences(`favoriteBooks`, `favoriteDVDs`, `favoriteCDs` ) VALUES ('The Lord of the rings', 'Avatar, Spider-man 3', 'Appetite for destruction, The Cars');
INSERT INTO Loans(`Accounts_id`) VALUES (10);
INSERT INTO DVDLoans(`copyNumber`, `idLoans`) VALUES (102, 1);
INSERT INTO CDLoans(`copyNumber`, `idLoans`) VALUES (16, 1);
INSERT INTO BookLoans(`copyNumber`, `idLoans`) VALUES (23, 1);
INSERT INTO ItemRecommendations(`id`,`Accounts_id`) VALUES (1, 10);
INSERT INTO Reservations(`Accounts_id`) VALUES (10);
INSERT INTO DVDs(`title`,`author`,`idItemRecommendations`) VALUES('Home Alone','Chris Columbus',1);
INSERT INTO CDs(`title`,`artist`, `idItemRecommendations`) VALUES('The Bends','Radiohead',1);
INSERT INTO Books(`isbn`,`idItemRecommendations`) VALUES('8213728713827498378597121',1);
INSERT INTO `History`(`Accounts_id`) VALUES (10);

UPDATE Accounts
SET idPreferences = 1
WHERE userName = 'Victoria';

UPDATE Accounts
SET idPreferences = 2
WHERE userName = 'Brian Higgin';

-- 1 BIG statement to JOIN all tables
SELECT *
FROM Accounts a 
JOIN Preferences p ON p.idPreferences = a.idPreferences
JOIN Loans l ON l.Accounts_id = a.id
JOIN DVDLoans dl ON dl.idLoans = l.id
JOIN CDLoans cl ON cl.idLoans = l.id
JOIN BookLoans bl ON bl.idLoans = l.id
JOIN Reservations r ON r.Accounts_id = a.id
JOIN ItemRecommendations ir ON ir.Accounts_id = a.id
JOIN DVDs d ON d.idItemRecommendations = ir.id
JOIN CDs c ON c.idItemRecommendations = ir.id
JOIN Books b ON b.idItemRecommendations = ir.id
JOIN `History` h ON h.Accounts_id = a.id;

ALTER TABLE Accounts ADD COLUMN `activeStatus` BOOL;
ALTER TABLE Loans ADD COLUMN `date_time` DATETIME;
ALTER TABLE CDs DROP COLUMN releaseDate;
ALTER TABLE DVDs RENAME COLUMN releaseDate to releaseYear;
ALTER TABLE DVDs MODIFY COLUMN releaseYear YEAR;
