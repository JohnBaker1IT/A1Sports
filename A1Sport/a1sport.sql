drop database if exists a1sport;

create database a1sport;  

use a1sport;


-- create tables
create table products(product_id integer primary key, product_name varchar(50), image_path varchar(100));


create table users(username varchar(50) primary key not null,password varchar(50),
 first_name varchar(50), last_name varchar(50),age integer,activity varchar(100));
 
 
create table orders(order_id int primary key auto_increment, product_name varchar(50), image_path varchar(50),order_date date, user_name varchar(50),
FOREIGN KEY (user_name) REFERENCES users(username));
 
-- insert statements

insert into users values('admin','admin','admin','admin',23,'gym');
insert into users values('admin1','admin1','admin1','admin1',32,'Playing a sport');

insert into orders values(1,"beer-kodiak","images/beer-kodiak.jpg",'2017-03-07','admin');
insert into orders values(2,"beer-duff","images/beer-duff.jpg",'2017-06-01','admin');
insert into orders values(3,"food-restaurant","images/food-restaurant.jpg",'2017-10-23','admin');
insert into orders values(4,"catering-wedding","images/catering-wedding.jpg",'2016-12-02','admin');
insert into orders values(5,"beer-klukva.jpg","images/beer-klukva.jpg",'2015-07-15','admin');
 
insert into products values(1,"food-restaurant","images/food-restaurant.jpg");
insert into products values(2,"beer-duff","images/beer-duff.jpg");
insert into products values(3,"beer-milkshake","images/beer-milkshake.jpg");
insert into products values(4,"beer-fivesummers","images/beer-fivesummers.jpg");
insert into products values(5,"beer-corona","images/beer-corona.jpg");
insert into products values(6,"beer-tapkocorange","images/beer-tapkocorange.jpg");
insert into products values(7,"beer-milkstout","images/beer-milkstout.jpg");
insert into products values(8,"beer-haywards","images/beer-haywards.jpg");
insert into products values(9,"beer-klukva","images/beer-klukva.jpg");
insert into products values(10,"tours-tasting","images/tours-tasting.jpg");
insert into products values(11,"catering-wedding","images/catering-wedding.jpg");
insert into products values(12,"beer-kodiak","images/beer-kodiak.jpg");
insert into products values(13,"beer-icaro","images/beer-icaro.jpg");
insert into products values(14,"beer-vocation","images/beer-vocation.jpg");
insert into products values(15,"beer-dvabobra","images/beer-dvabobra.jpg");
insert into products values(16,"beer-peroni","images/beer-peroni.jpg");
insert into products values(17,"beer-raspberryweizenbock","images/beer-raspberryweizenbock.jpg");
insert into products values(18,"beer-bintang","images/beer-bintang.jpg");

