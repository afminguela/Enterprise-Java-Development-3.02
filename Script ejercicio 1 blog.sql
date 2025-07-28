CREATE SCHEMA IF NOT EXISTS `Blog` ;

USE Blog ;



Create Table IF NOT EXISTS `Author` (
id_author int auto_increment unique primary key,
name varchar(50) not null

);

CREATE TABLE if not exists `Blog-Posts`   (
  id_post int auto_increment unique primary key,
  title varchar(200),
  word_count int,
  views int,
  author int not null,
 
  FOREIGN KEY (`author`) REFERENCES `Blog`.`Author` (`id_author`)
  
);


Insert into `Author`(name) VALUES
('Maria Charlotte'),
('Juan Pérez'),
('Gemma Alcocer');


Insert INTO `Blog-Posts`(title, word_count, views, author) values
('Best Paint colors',814,14,1),
('Small Space Decorating Tips',1146,221,2),
('Hot Accessories',986,105,1),
('Mixing Textures',765,22,1),
('Kitchen refresh',1224,30,2),
('Homemade Art Hacks',1002,193,1),
('Refinishing Wood Floors', 1571,7542,3);







