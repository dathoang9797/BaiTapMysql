create database food_hub;
use food_hub;

create table users(
	id int auto_increment,
    username varchar(250),
    password varchar(250),
    type_login varchar(50),
    
    primary key (id)
);

create table user_detail(
	user_id int,
    email varchar(250),
    fullname varchar(250),
    phone varchar(50),
    street varchar(250),
	id_state int,
	id_city int,
    
    foreign key (user_id) references users(id),
    foreign key (id_state) references state(id),
    foreign key (id_city) references city(id)
);

create table category (
	id int auto_increment,
    name varchar(250),
    url_img text,
    
    primary key (id)
);

create table restaurant (
	id int auto_increment,
    name varchar(250),
    url_img text,
    
    primary key (id)
);

create table menu (
	id int auto_increment,
    name varchar(250),
    url_img text,
    rating float,
    price float,
    description text,
    type varchar(250),
    
    primary key (id)
);

create table sub_menu (
	id int auto_increment,
    name varchar(250),
    url_img text,
    price float,
    
    primary key (id)
);

create table res_sub_menu_cat (
	id_res int,
    id_menu int,
    id_sub_menu int,
    id_cat int,
    
    foreign key (id_cat) references category(id),
    foreign key (id_res) references restaurant(id),
    foreign key (id_menu) references menu(id),
    foreign key (id_sub_menu) references sub_menu(id)
    
);

create table orders(
	id int auto_increment,
    start_date datetime,
    end_date datetime,
    id_status int,
    
    primary key (id),
    foreign key (id_status) references status(id)
);

create table order_detail(
	id int auto_increment,
    id_order int,
	id_user int,
	id_menu int,
    price float,
    quantity int,
    id_coupon int,

    primary key (id),
    foreign key (id_order) references orders(id),
	foreign key (id_menu) references menu(id),
    foreign key (id_coupon) references coupon(id),
	foreign key (id_user) references users(id)
);

create table review(
	id int auto_increment,
    comment text,
	rating float,
	id_res int,
    id_user int,
    
    primary key (id),
    foreign key (id_res) references restaurant(id),
	foreign key (id_user) references users(id)
);


create table coupon(
	id int auto_increment,
    name varchar(250),
	discount varchar(250),
    
    primary key (id)
);

create table menu_coupon(
	id_coupon int,
    id_menu int,
    
    foreign key (id_coupon) references coupon(id),
	foreign key (id_menu) references menu(id)
);


create table status(
	id int auto_increment,
    name varchar(250),
    
    primary key (id)
);

create table state(
	id int auto_increment,
    name varchar(250),
    
    primary key (id)
);

create table city(
	id int auto_increment,
    name varchar(250),
    
    primary key (id)
);