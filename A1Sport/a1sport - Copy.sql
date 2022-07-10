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

insert into orders values(1,"shoes-dnablue","images/shoes-dnablue.jpg",'2017-03-07','admin');
insert into orders values(2,"shoes-adidas","images/shoes-adidas.jpg",'2017-06-01','admin');
insert into orders values(3,"shoes-dnablue","images/shoes-dnablue.jpg",'2017-10-23','admin');
insert into orders values(4,"kayak-pelican.jpg","images/kayak-pelican.jpg",'2016-12-02','admin');
insert into orders values(5,"tent-mckinley.jpg","images/tent-mckinley.jpg",'2015-07-15','admin');
 
insert into products values(1,"shoes-dnablue","images/shoes-dnablue.jpg");
insert into products values(2,"shoes-adidas","images/shoes-adidas.jpg");
insert into products values(3,"inlineskate-rollerblade","images/inlineskate-rollerblade.jpg");
insert into products values(4,"backpack-deuter","images/backpack-deuter.jpg");
insert into products values(5,"gym-powerinstrument","images/gym-powerinstrument.jpg");
insert into products values(6,"fishingpoles-shakespeare","images/fishingpoles-shakespeare.jpg");
insert into products values(7,"helment-k2varisity","images/helment-k2varisity.jpg");
insert into products values(8,"snowboard-salomon","images/snowboard-salomon.jpg");
insert into products values(9,"tent-mckinley","images/tent-mckinley.jpg");
insert into products values(10,"skis-rossignol","images/skis-rossignol.jpg");
insert into products values(11,"kayak-pelican","images/kayak-pelican.jpg");
insert into products values(12,"fitnesstracker-tomtom","images/fitnesstracker-tomtom.jpg");
insert into products values(13,"racquet-wilson","images/racquet-wilson.jpg");
insert into products values(14,"bike-cervelo","images/bike-cervelo.jpg");
insert into products values(15,"bike-motobecane","images/bike-motobecane.jpg");
insert into products values(16,"bike-bulls","images/bike-bulls.jpg");
insert into products values(17,"dumbbell-bowflex","images/dumbbell-bowflex.jpg");
insert into products values(18,"shoes-brooksred","images/shoes-brooksred.jpg");

