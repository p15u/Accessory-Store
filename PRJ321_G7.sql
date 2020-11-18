-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 23, 2020 lúc 04:38 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `PRJ321_G7`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Account`
--

CREATE TABLE `Account` (
  `accId` int(11) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  `username` char(32) NOT NULL,
  `password` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Account`
--

INSERT INTO `Account` (`accId`, `roleId`, `username`, `password`) VALUES
(1, 0, 'admin', '25d55ad283aa400af464c76d713c07ad'),
(2, 2, 'duy', '25d55ad283aa400af464c76d713c07ad'),
(3, 1, 'nva', '25d55ad283aa400af464c76d713c07ad'),
(6, 2, 'hello', '25d55ad283aa400af464c76d713c07ad'),
(7, 1, 'nvb', '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Category`
--

CREATE TABLE `Category` (
  `catId` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Category`
--

INSERT INTO `Category` (`catId`, `name`, `description`) VALUES
(1, 'Fried cake', 'The cake is crispy, fragrant and fat.'),
(2, 'Made of bean', 'The main ingredient is beans, delicious fat fleshy.'),
(3, 'Made of coconut', 'The main ingredients are coconut meat, fat and nutritious.'),
(4, 'Made of flour', 'Made from flour, under steamed or baked to keep the delicious flavor of the cake.'),
(5, 'Made of rice', 'Made from rice or rice flour, delicious, pliable and rich in starch.'),
(6, 'Other', 'Combining from many different tastes.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Comment`
--

CREATE TABLE `Comment` (
  `cmtId` int(11) NOT NULL,
  `proId` int(11) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Comment`
--

INSERT INTO `Comment` (`cmtId`, `proId`, `author`, `content`, `time`) VALUES
(1, 1, 3, 'Very delicious!', '2020-07-22 23:28:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Image`
--

CREATE TABLE `Image` (
  `imgId` int(11) NOT NULL,
  `data` mediumblob DEFAULT NULL,
  `url` varchar(300) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `OrderDetail`
--

CREATE TABLE `OrderDetail` (
  `ordId` int(11) DEFAULT NULL,
  `proId` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `totalPay` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `OrderDetail`
--

INSERT INTO `OrderDetail` (`ordId`, `proId`, `price`, `quantity`, `discount`, `totalPay`) VALUES
(1, 2, 26000, 1, NULL, NULL),
(1, 1, 10000, 1, NULL, NULL),
(2, 3, 15000, 1, NULL, NULL),
(2, 2, 26000, 3, NULL, NULL),
(2, 1, 10000, 1, NULL, NULL),
(3, 2, 26000, 2, NULL, NULL),
(4, 1, 10000, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Order_`
--

CREATE TABLE `Order_` (
  `ordId` int(11) NOT NULL,
  `accId` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT current_timestamp(),
  `notes` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `receiverName` varchar(50) DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `receiverPhone` char(15) DEFAULT NULL,
  `totalCost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Order_`
--

INSERT INTO `Order_` (`ordId`, `accId`, `orderDate`, `notes`, `receiverName`, `address`, `receiverPhone`, `totalCost`) VALUES
(1, 2, '2020-07-23 02:15:01', '', 'Nguyen Duy', '10\'d CT AAA', '0386005111', 55000),
(2, 6, '2020-07-23 04:51:03', 'Hmm..', 'hello', '124B CF ', '01245742115', 136400),
(3, NULL, '2020-07-23 04:54:10', '', 'Nguyen Van C', '11T, Chau Thanh, Tien Giang', '03562152121', 64900),
(4, NULL, '2020-07-23 04:57:53', 'Hmm..', 'Nguyen Van C', '11T, Chau Thanh, Tien Giang', '03562152121', 73700);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Person`
--

CREATE TABLE `Person` (
  `accId` int(11) NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) NOT NULL,
  `idCard` char(12) NOT NULL,
  `phone` char(15) NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `avatar` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Person`
--

INSERT INTO `Person` (`accId`, `fullname`, `address`, `email`, `idCard`, `phone`, `gender`, `birthday`, `avatar`) VALUES
(1, 'ADMIN', '', '', '', '', '', '', NULL),
(2, 'Nguyen Duy', '10\'d CT AAA', 'duy.ng@gmail.com', '1234567890', '0386005111', 'Male', '2020-07-05', 'https://cdn.iconscout.com/icon/free/png-512/avatar-370-456322.png'),
(3, 'nva', 'Hai Ba Trung, CT', 'nva.avn@gmail.com', '', '0376408645', 'Male', '2020-07-05', NULL),
(6, 'hello', '', '', '', '', '', '', NULL),
(7, 'Ngyen Van Be', 'Hau Giang', 'nvbebebe@gmail.com', '', '0363045444', 'Female', '1990-01-05', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Product`
--

CREATE TABLE `Product` (
  `proId` int(11) NOT NULL,
  `catId` int(11) DEFAULT NULL,
  `seller` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Product`
--

INSERT INTO `Product` (`proId`, `catId`, `seller`, `name`, `size`, `weight`, `description`, `price`, `image`, `status`) VALUES
(1, 5, 3, 'Beef Cake', 10, 100, 'Beef cake or \"banh bo\" is a sweet, chewy sponge cake from Vietnam. It is made from rice flour, water, sugar, and yeast, and has a honeycomb-like appearance on the inside due to the presence of numerous small air bubbles.', 10000, 'https://i.postimg.cc/br10w0r6/beef-cake.png', 1),
(2, 2, 3, 'Mung Bean Pie', 25, 500, 'Mung Bean cakes a.k.a Banh Dau Xanh in Vietnamese. They are popular year round and make great gifts for those coming back from their travels in Vietnam.', 26000, 'https://i.postimg.cc/ZRV3Krkm/bean-0.jpg', 1),
(3, 6, 3, 'Tube Cake', 10, 220, 'This is a popular traditional food in Can Tho city. The cake is called Cong cake because the tool used to make this cake looks like a tube. The cake is made predominantly from glutinous rice flour, wheat flour, shrimp and green beans.', 15000, 'https://i.postimg.cc/WpS3CNVB/tube-0.png', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ProductImage`
--

CREATE TABLE `ProductImage` (
  `proId` int(11) NOT NULL,
  `url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ProductImage`
--

INSERT INTO `ProductImage` (`proId`, `url`) VALUES
(1, 'https://i.postimg.cc/nzjY6fJf/beef-cake-1.png'),
(1, 'https://i.postimg.cc/s2046DbJ/beef-cake-2.png'),
(1, 'https://i.postimg.cc/vBJLy2Yg/beef-cake-3.png'),
(1, 'https://i.postimg.cc/8CCbmrX5/beef-cake-4.png'),
(2, 'https://i.postimg.cc/6Qh4YdpZ/bean-1.png'),
(2, 'https://i.postimg.cc/brZGyWH0/bean-2.png'),
(2, 'https://i.postimg.cc/vBHgjc4N/bean-3.png'),
(2, 'https://i.postimg.cc/26cbfrv8/bean-4.png'),
(3, 'https://i.postimg.cc/15ttZk5f/tube-1.png'),
(3, 'https://i.postimg.cc/VLVNsKd4/tube-2.png'),
(3, 'https://i.postimg.cc/2SLS1nWY/tube-3.png'),
(3, 'https://i.postimg.cc/MHspQDt6/Untitled-4.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ProductPage`
--

CREATE TABLE `ProductPage` (
  `proId` int(11) NOT NULL,
  `content` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  `updateTime` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ProductPage`
--

INSERT INTO `ProductPage` (`proId`, `content`, `updateTime`) VALUES
(1, 'Beef cake or \"banh bo\" is a sweet, chewy sponge cake from Vietnam. It is made from rice flour, water, sugar, and yeast, and has a honeycomb-like appearance on the inside due to the presence of numerous small air bubbles. Coconut milk is also usually a part of the batter, imparting a slight flavor and aroma of coconut. The cake is of Southern Chinese origin, although the Chinese version, does not contain coconut milk. Banh bo are generally eaten as a dessert, although they may also be consumed as an accompaniment to a meal.', '2020-07-22 23:09:17'),
(2, 'These are Mung Bean cakes a.k.a Banh Dau Xanh in Vietnamese. They are popular year round and make great gifts for those coming back from their travels in Vietnam. These little sweet cubes melt in your mouth leaving a buttery, fragrant after-taste and make a perfect companion for your afternoon tea. Best served with green tea, the bitter tannin in the hot tea marries well with the sweet buttery taste of the cake. It is quite a relaxing afternoon activity to slowly pop a mung bean cube in your mouth and sip on some tea while entertaining a book. Indeed, it is a favourite past time of many Vietnamese elders to enjoy mung bean cakes with green tea while having a light chat with a friend.', '2020-07-22 23:54:45'),
(3, 'The cake is made predominantly from glutinous rice flour, wheat flour, shrimp and green beans.The recipe is also simple. Rice flour and wheat flour is mixed together with water, egg, salt and onion leaves. Green beans and meat are cooked and used as the filing. These ingredients are stuffed into a tube in the following order: flour mixture green beans and meats flour mixture.\r\n\r\nShrimp is put on top of the cake to enhance the taste and appearance. After that, the tube is fried until the flour becomes golden. Cong cake is often served with sweet-sour fish sauce and other fresh vegetables.', '2020-07-23 00:01:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Reply`
--

CREATE TABLE `Reply` (
  `cmtId` int(11) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `content` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Reply`
--

INSERT INTO `Reply` (`cmtId`, `author`, `content`, `time`) VALUES
(1, 3, 'Yes :))', '2020-07-23 00:28:22'),
(1, 2, 'How I comment on this?', '2020-07-23 00:49:44'),
(1, 3, 'Please buy it :))', '2020-07-23 00:52:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Role`
--

CREATE TABLE `Role` (
  `roleId` int(11) NOT NULL,
  `roleName` varchar(30) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `Role`
--

INSERT INTO `Role` (`roleId`, `roleName`) VALUES
(0, 'Admin'),
(1, 'Employee'),
(2, 'Customer');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`accId`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `roleId` (`roleId`);

--
-- Chỉ mục cho bảng `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`catId`);

--
-- Chỉ mục cho bảng `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`cmtId`),
  ADD KEY `proId` (`proId`),
  ADD KEY `author` (`author`);

--
-- Chỉ mục cho bảng `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`imgId`);

--
-- Chỉ mục cho bảng `OrderDetail`
--
ALTER TABLE `OrderDetail`
  ADD KEY `ordId` (`ordId`),
  ADD KEY `proId` (`proId`);

--
-- Chỉ mục cho bảng `Order_`
--
ALTER TABLE `Order_`
  ADD PRIMARY KEY (`ordId`),
  ADD KEY `accId` (`accId`);

--
-- Chỉ mục cho bảng `Person`
--
ALTER TABLE `Person`
  ADD PRIMARY KEY (`accId`),
  ADD KEY `avatar` (`avatar`);

--
-- Chỉ mục cho bảng `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`proId`),
  ADD KEY `catId` (`catId`),
  ADD KEY `seller` (`seller`);

--
-- Chỉ mục cho bảng `ProductImage`
--
ALTER TABLE `ProductImage`
  ADD KEY `proId` (`proId`);

--
-- Chỉ mục cho bảng `ProductPage`
--
ALTER TABLE `ProductPage`
  ADD PRIMARY KEY (`proId`);

--
-- Chỉ mục cho bảng `Reply`
--
ALTER TABLE `Reply`
  ADD KEY `author` (`author`),
  ADD KEY `cmtId` (`cmtId`);

--
-- Chỉ mục cho bảng `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`roleId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `Account`
--
ALTER TABLE `Account`
  MODIFY `accId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `Category`
--
ALTER TABLE `Category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `Image`
--
ALTER TABLE `Image`
  MODIFY `imgId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `Order_`
--
ALTER TABLE `Order_`
  MODIFY `ordId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `Product`
--
ALTER TABLE `Product`
  MODIFY `proId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `Role`
--
ALTER TABLE `Role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `Role` (`roleId`);

--
-- Các ràng buộc cho bảng `Comment`
--
ALTER TABLE `Comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`proId`) REFERENCES `Product` (`proId`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`author`) REFERENCES `Account` (`accId`);

--
-- Các ràng buộc cho bảng `OrderDetail`
--
ALTER TABLE `OrderDetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`ordId`) REFERENCES `Order_` (`ordId`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`proId`) REFERENCES `Product` (`proId`);

--
-- Các ràng buộc cho bảng `Order_`
--
ALTER TABLE `Order_`
  ADD CONSTRAINT `order__ibfk_1` FOREIGN KEY (`accId`) REFERENCES `Account` (`accId`);

--
-- Các ràng buộc cho bảng `Person`
--
ALTER TABLE `Person`
  ADD CONSTRAINT `person_ibfk_2` FOREIGN KEY (`accId`) REFERENCES `Account` (`accId`);

--
-- Các ràng buộc cho bảng `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `Category` (`catId`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`seller`) REFERENCES `Account` (`accId`);

--
-- Các ràng buộc cho bảng `ProductImage`
--
ALTER TABLE `ProductImage`
  ADD CONSTRAINT `productimage_ibfk_1` FOREIGN KEY (`proId`) REFERENCES `Product` (`proId`);

--
-- Các ràng buộc cho bảng `ProductPage`
--
ALTER TABLE `ProductPage`
  ADD CONSTRAINT `productpage_ibfk_1` FOREIGN KEY (`proId`) REFERENCES `Product` (`proId`),
  ADD CONSTRAINT `productpage_ibfk_2` FOREIGN KEY (`proId`) REFERENCES `Product` (`proId`);

--
-- Các ràng buộc cho bảng `Reply`
--
ALTER TABLE `Reply`
  ADD CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`author`) REFERENCES `Account` (`accId`),
  ADD CONSTRAINT `reply_ibfk_3` FOREIGN KEY (`cmtId`) REFERENCES `Comment` (`cmtId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
