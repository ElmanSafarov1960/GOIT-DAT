-- Table: companies
DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);  


-- Table: employees
DROP TABLE IF EXISTS status;
CREATE TABLE status(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL
);     


-- Table: payments
DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL, 
    status_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,    
    FOREIGN KEY (status_id) REFERENCES status (id),
    FOREIGN KEY (user_id) REFERENCES users (id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
SELECT * FROM tasks WHERE user_id =2;

SELECT title FROM tasks WHERE tasks.status_id = (SELECT id FROM status WHERE 
status.name = 'new');

UPDATE tasks  SET status_id = 2  WHERE status_id  = 1;
 

SELECT fullname FROM users WHERE id = (SELECT id FROM status WHERE name NOT IN ('new', 'in progress', 'completed'));

INSERT INTO tasks (user_id, title, description, status_id)
VALUES (2, 'Find information about cinema', 'Find information about cinema and authors', 3);

SELECT title FROM tasks WHERE status_id = (SELECT id FROM status WHERE name != 'completed');

DELETE FROM tasks WHERE id = 4;

SELECT email  FROM users WHERE users.email like 'j%';

UPDATE users SET fullname = 'Michelle Smit'  WHERE fullname = 'Michelle Irwin';

SELECT  COUNT(*)
AS title_count
FROM tasks 
GROUP BY status_id;


SELECT users.id, tasks.title
FROM users
JOIN  tasks  ON tasks.user_id = users.id WHERE users.email  like '%@example.com';

SELECT title FROM tasks WHERE description = 'NULL';

SELECT users.fullname,  tasks.title 
FROM users
INNER JOIN  tasks  ON tasks.user_id = users.id  WHERE tasks.status_id = (SELECT status.id FROM status  WHERE status.name = 'in progress');


SELECT users.id, users.fullname, users.email, tasks.title, COUNT(*)  AS title_count 
FROM users
LEFT JOIN tasks ON tasks.user_id = users.id
GROUP BY users.id;