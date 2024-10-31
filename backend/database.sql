CREATE DATABASE ShopApp;
USE ShopApp;
CREATE TABLE users(
    id int primary key auto_increment,
    fullname varchar(100) default '',
    phone_number varchar(10) not null,
    address varchar(200) default '',
    password varchar(100) not null default'',
    create_at datetime,
    update_at datetime,
    is_active tinyint(1) default 1,
    date_of_birth date,
    facebook_account_id INT default 0,
    google_account_id INT default 0
);
alter TABLE user add column role_id int;
CREATE TABLE roles(
    id int primary key,
    name varchar(20) NOT NULL
);
alter table users add FOREIGN key (role_id) REFERENCES roles(id);
CREATE TABLE tokens(
    id int PRIMARY KEY AUTO_INCREMENT,
    token varchar(255) UNIQUE NOT NULL,
    tokenType varchar(50) NOT NUll,
    expiration_date datetime,
    revoked tinyint(1) NOT NULL,
    expired tinyint(1) NOT NULL,
    users_id int,
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE social_accounts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    provider varchar(20) NOT NULL COMMENT 'Ten nha social network',
    provider_id varchar(50) NOT NULL,
    email varchar(150) NOT NULL COMMENT 'Email tai khoan',
    name varchar(100) NOT NULL COMMENT 'Ten nguoi dung',
    users_id int 
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE categories(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL default ''
);

CREATE TABLE products(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(350),
    price Float Not null check(price >=0),
    thumbnail varchar(300) default '',
    description longtext default '',
    create_at datetime,
    update_at datetime,
    category_id int,
    FOREIGN KEY (category_id) REFERENCES categories(id)
 );

 CREATE TABLE orders(
    id INT PRIMARY key auto_increment,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    fullname varchar(100),
    email varchar(100),
    phone_number varchar(20) NOT null, 
    address varchar(200) not null,
    note varchar (100) default '',
    order_date datetime default CURRENT_TIMESTAMP,
    status varchar(20),
    total_money Float check(total_money >=0)
 );
alter table orders add column shipping_method varchar(100);
alter table orders add column shipping_address varchar(200);
alter table orders add column shipping_date date;
alter table orders add column tracking_number varchar(100);
alter table orders add column payment_method varchar(100);
alter table orders add column active tinyint(1) ;
alter table orders modify column  status enum('pending','processing','shipped','delivered','cancelled') ;


 CREATE TABLE order_details(
    id int primary key AUTO_INCREMENT,
    order_id int,
    FOREIGN KEY (order_id) REFERENCES orders (id),
    product_id int,
    FOREIGN KEY (product_id) REFERENCES products(id),
    price Float check(price >= 0),
    number_of_products int check (number_of_products >0),
    total_money Float check(total_money >= 0),
    color varchar(20) default ''
 );