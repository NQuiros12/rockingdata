create database if not exists rd_shows;
use rd_shows;
create table shows (
    show_id varchar(20) not null,
    primary key (show_id),
    type varchar(20),
    title varchar(500),
    date_added varchar(120),
    release_year int,
    rating varchar(10),
    duration float,
    duration_units varchar(20),
    description text,
    platform varchar(20));
create table actors(
    show_id varchar(20) not null,
    foreign key (show_id) references shows(show_id),
    actor varchar(200)
    );
create table directors(
    show_id varchar(20) not null,
    foreign key (show_id) references shows(show_id),
    director varchar(200)
    );
create table countries(
    show_id varchar(20) not null,
    foreign key (show_id) references shows(show_id),
    countries varchar(200)
    );
DROP TABLE IF EXISTS genres;
create table genres(
    show_id varchar(20) not null,
    foreign key (show_id) references shows(show_id),
    genre varchar(200)
    );