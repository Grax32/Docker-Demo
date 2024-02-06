
create database myDatabase;

use myDatabase;

create table users (
    id int primary key,
    name varchar(255),
    email varchar(255)
);

insert into users (id, name, email)
values
    (1, 'User 1', 'user1@example.com'),
    (2, 'User 2', 'user2@example.com'),
    (3, 'User 3', 'user3@example.com'),
    (4, 'User 4', 'user4@example.com'),
    (5, 'User 5', 'user5@example.com'),
    (6, 'User 6', 'user6@example.com'),
    (7, 'User 7', 'user7@example.com'),
    (8, 'User 8', 'user8@example.com'),
    (9, 'User 9', 'user9@example.com'),
    (10, 'User 10', 'user10@example.com');
