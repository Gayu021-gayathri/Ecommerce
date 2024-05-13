
CREATE DATABASE `ecommerce` ;

USE `ecommerce`;


CREATE TABLE USER (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  address1 VARCHAR(255),
  phone VARCHAR(255),
  PASSWORD VARCHAR(255) NOT NULL,
  salt VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (email) 
);

CREATE TABLE PRODUCT (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  DESCRIPTION VARCHAR(255) NOT NULL,
  discountPercentage NUMERIC,
  rating NUMERIC NOT NULL,
  stock NUMERIC NOT NULL,
  brand VARCHAR(255) NOT NULL,
  category VARCHAR(255) NOT NULL,
  thumbnail VARCHAR(255) NOT NULL,
  Price  NUMERIC 
);

CREATE TABLE CART (
  cart_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  product_id INT,
  quantity INT DEFAULT 1,
  added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES USER(user_id),
  FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

CREATE TABLE `Orders` (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  shipping_address VARCHAR(255),
  billing_address VARCHAR(255),
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (user_id) REFERENCES `User`(user_id)
);

CREATE TABLE Order_Item (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES `Orders`(order_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id)
);



/*Data for the table `product` */

INSERT  INTO `product`(`product_id`,`title`,`description`,`discountPercentage`,`rating`,`stock`,`brand`,`category`,`thumbnail`,`Price`) VALUES 
(1,'iPhone 9','An apple mobile which is nothing like apple',549,13,8,'Apple','smartphones','https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',25000),
(2,'samsung','ultra pro',50,4,10,'samsung','smartphone','https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',1000000),
(3,'iPhone X\"','SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...',18,4,34,'Apple','smartphones','https://cdn.dummyjson.com/product-images/2/thumbnail.jpg',899),
(4,'Samsung Universe 9','Samsung\'s new variant which goes beyond Galaxy to the Universe',15,4,36,'Samsung','smartphones','https://cdn.dummyjson.com/product-images/3/thumbnail.jpg',1249),
(5,'OPPOF19','OPPO F19 is officially announced on April 2021.',18,4,10,'OPPO','smartphones','https://cdn.dummyjson.com/product-images/4/thumbnail.jpg',280),
(6,'MacBook Pro','MacBook Pro',11,5,83,'Apple','laptops','https://cdn.dummyjson.com/product-images/6/thumbnail.png',1749),
(7,'Samsung Galaxy Book','Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched',4,4,50,'Samsung','laptops','https://cdn.dummyjson.com/product-images/7/thumbnail.jpg',1499),
(8,'Microsoft Surface Laptop 4','Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.',10,4,68,'Microsoft Surface','laptops','https://cdn.dummyjson.com/product-images/8/thumbnail.jpg',1499),
(9,'perfume Oil','Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil',8,4,65,'Impression of Acqua Di Gio','fragrances','https://cdn.dummyjson.com/product-images/11/thumbnail.jpg',13),
(10,'Brown Perfume','Royal_Mirage Sport Brown Perfume for Men & Women - 120ml',6,5,60,'Royal_Mirage','fragrances','https://cdn.dummyjson.com/product-images/12/thumbnail.jpg',15678),
(11,'Hyaluronic Acid Serum','L\'OrÃ©al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid',13,5,10,'L\'Oreal Paris','skincare','https://cdn.dummyjson.com/product-images/16/thumbnail.jpg',19),
(12,'Tree Oil 30ml','Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria',4,5,78,'Hemani Tea','skincare','https://cdn.dummyjson.com/product-images/17/thumbnail.jpg',12),
(15,'D Embellishment Art Lamp','3D led lamp sticker Wall sticker 3d wall art light on/off button cell operated (included)',5,5,10,'LED Lights','home-decoration','https://cdn.dummyjson.com/product-images/28/thumbnail.jpg',90),
(16,'ulab Powder 50 Gram','Dry Rose Flower Powder Gulab Powder 50 Gram • Treats Wounds',70,5,9,'Dry Rose','groceries','https://cdn.dummyjson.com/product-images/25/thumbnail.jpg',100),
(18,'Orange Essence Food Flavou','Specifications of Orange Essence Food Flavour For Cakes and Baking Food Item',14,4,10,'Baking Food Items','groceries','https://cdn.dummyjson.com/product-images/23/thumbnail.jpg',2500),
(19,'Elbow Macaroni - 400 gm','Product details of Bake Parlor Big Elbow Macaroni - 400 gm',20,3,25,'Bake Parlor Big','groceries','https://cdn.dummyjson.com/product-images/22/thumbnail.jpg',1200),
(20,'Oil Free Moisturizer 100ml','Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen.',10,3,15,'Dermive','skincare','https://cdn.dummyjson.com/product-images/18/thumbnail.jpg',13890),
(21,'Women Shoes','2020 New Arrivals Genuine Leather Fashion Trend Platform Summer Women Shoe',10,10,90,'bata','shoes','https://cdn.dummyjson.com/product-images/50/thumbnail.jpg',10000);


