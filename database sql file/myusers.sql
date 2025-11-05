DROP DATABASE IF EXISTS myusers;
CREATE DATABASE myusers;
USE myusers;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `cart` (
  `quantity1` int(11) NOT NULL,
  `quantity2` int(11) NOT NULL,
  `quantity3` int(11) NOT NULL,
  `quantity4` int(11) NOT NULL,
  `quantity5` int(11) NOT NULL,
  `quantity6` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `cart` (`quantity1`, `quantity2`, `quantity3`, `quantity4`, `quantity5`, `quantity6`) VALUES
(0, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0);

CREATE TABLE `cart0_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity4` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `food` (
  `id` varchar(45) NOT NULL,
  `item` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `formID` varchar(50) NOT NULL,
  `cartID` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `food` (`id`, `item`, `price`, `quantity`, `url`, `formID`, `cartID`) VALUES
('abc', 'Cheeseburger', 120, 20, 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cheeseburger.jpg', 'modalCart.quantity1', 'quantity1'),
('bcd', 'French Fries', 60, 16, 'https://i.pinimg.com/736x/67/2f/1a/672f1a53e902126b8ee0db6dbc7940f5.jpg', 'modalCart.quantity2', 'quantity2'),
('def', 'Fried Chicken', 150, 18, 'https://thumbs.dreamstime.com/b/fried-chicken-legs-isolated-white-background-deep-crispy-fast-food-clipping-path-146069919.jpg', 'modalCart.quantity3', 'quantity3'),
('dos', 'Hotdog', 90, 12, 'https://rosepng.com/wp-content/uploads/elementor/thumbs/s11728_hot_dog_isolated_on_white_background_0485289a-f11a-44fa-8416-e8ab27da05ac_3-photoroom-qr8xohl7yee2zfr419www4ztfzmfhorxxoyj5zq8bk.png', '', ''),
('idl', 'Sundae', 50, 52, 'https://i.pinimg.com/736x/93/a0/c6/93a0c6f8a06b93e1a74976fca811eda9.jpg', '', '');

CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `merchant` tinyint(4) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user` (`username`, `password`, `firstname`, `lastname`, `email`, `address`, `phone`, `merchant`) VALUES
('merchant', 'merchant', 'Merchant', 'Merchant', 'merchant@merchant.com', 'Merchant LTD', '1234567890', 1),
('cymon', 'cymon', 'Cymon', 'Vargas', 'cymon@gmail.com', 'Manila, Philippines', '0912345678', 0);
COMMIT;
