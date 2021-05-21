drop database if exists baza1;
create database baza1;
use baza1;

create table sestra( 
sifra int not null primary key auto_increment,
introvertno bit,
haljina varchar(31) not null,
maraka decimal(16,6) not null,
hlace varchar(46) not null,
narukvica int not null
);

create table zena(
sifra int primary key auto_increment not null,
treciputa datetime,
hlace varchar(46),
kratkamajica varchar(31) not null,
jmbag char (11) not null,
bojaociju varchar(39) not null,
haljina varchar(44),
sestra int not null
);

create table muskarac( 
sifra int primary key auto_increment not null,
bojaociju varchar(50) not null,
hlace varchar(30),
modelnaocala varchar(43),
maraka decimal(14,5 )not null,
zena int not null
);

create table mladic( 
sifra int primary key auto_increment not null,
suknja varchar(50) not null,
kuna decimal(16,8) not null,
drugiputa datetime,
asocijalno bit,
ekstroventno bit not null,
dukserica varchar(48) not null,
muskarac int
);

create table sestra_svekar( 
sifra int primary key auto_increment not null,
sestra int  not null,
svekar int not null
);

create table svekar( 
sifra int primary key auto_increment not null,
bojaociju varchar(40)not null,
prstena int,
dukserica varchar(41),
lipa decimal (13,8),
majica varchar(35)
);


create table punac( 
sifra int primary key auto_increment not null,
ogrlica int,
gustoca decimal(14,9),
hlace varchar(41)not null
);

create table cura(
sifra int primary key auto_increment not null,
novcica decimal(16,5)not null,
gustoca decimal(18,6) not null,
lipa decimal(13,10),
ogrlica int not null,
bojakose varchar(38),
suknja varchar(36),
punac int
);

alter table zena add foreign key (sestra) references sestra(sifra);
alter table muskarac add foreign key(zena) references zena(sifra);
alter table mladic add  foreign key (muskarac) references muskarac(sifra);
alter table sestra_svekar add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add  foreign key (svekar)  references svekar(sifra);
alter table cura add foreign key (punac) references punac(sifra);

insert into sestra(haljina,maraka ,hlace ,narukvica )
values('lijepa haljina',20.15,'ljepše hlaèe',4),
('Nije loša haljina',15.12,'bez hlaèa',6),
('bez haljine',11.15,'hlaèe iz Zare',9);

insert into zena(kratkamajica,jmbag,bojaociju,sestra)
values('bez rukava',123456789,'zelena',1),
('bez majice ',987654321,'plava',2),
('dekolte',123459876,'žuta',3);

insert into muskarac(bojaociju,maraka,zena)
values('zelena',10.10,1),
('smeða',11.10,2),
('smeða',12.10,3);

insert into svekar(bojaociju,lipa ,majica )
values('smeða',11.10,'adidas'),
('zelena',15.12,'nike'),
('plava',20.15,'champion');

insert into sestra_svekar(sestra,svekar) 
values(1,2),(2,3),(3,1);


update cura set gustoca = 15.77;

delete from mladic where kuna > 15.78;

select kratkamajica from zena where hlace like '%ana%';

select a.dukserica, f.asocijalno, e.hlace 
from svekar a inner join sestra_svekar b on a.sifra = b.svekar 
inner join sestra c on b.sestra = c.sifra 
inner join zena d on c.sifra = d.sestra 
inner join muskarac e on d.sifra = e.zena 
inner join mladic f on e.sifra = f.muskarac 
where d.hlace like 'a%' and c.haljina like '%ba%';