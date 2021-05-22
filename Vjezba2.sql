drop database if exists baza2;
create database baza2;
use baza2;

create table punac(
sifra int primary key auto_increment not null,
dukserica varchar(13),
prviputa datetime not null,
majica varchar(36),
svekar int not null
); 

create table svekar(
sifra int primary key auto_increment not null,
bojakose varchar(33),
majica varchar(31),
carape varchar(31) not null,

);