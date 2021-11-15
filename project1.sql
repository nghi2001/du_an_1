-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2021 lúc 02:21 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `attribute`
--

INSERT INTO `attribute` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'size', 'S', '2021-11-11 09:06:26', '2021-11-11 09:33:15'),
(2, 'size', 'M', '2021-11-11 09:07:02', '2021-11-11 09:33:21'),
(3, 'size', 'L', '2021-11-11 09:33:47', NULL),
(4, 'size', 'XL', '2021-11-11 09:36:44', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_temporary`
--

CREATE TABLE `cart_temporary` (
  `id` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `attribute_value` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(19, 'Test1', 1, '2021-11-11 06:19:42', '2021-11-11 06:19:42'),
(20, 'test2', 1, '2021-11-11 07:58:41', '2021-11-11 07:58:41'),
(21, 'test3', 1, '2021-11-11 07:58:45', '2021-11-11 07:58:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `fullname` varchar(40) NOT NULL,
  `mobile` varchar(40) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `attr_value` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ordermethod_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `orderdate` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `total` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `note` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `views` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `categoryid`, `name`, `image`, `description`, `views`, `status`, `created_at`, `updated_at`) VALUES
(85, 19, 'Pizza1', '1636696364_1.jpg', 'Mô tả', NULL, 1, '2021-11-12 05:52:44', '2021-11-12 05:52:44'),
(86, 20, 'test223322', '1636697870_phat.jpg', '123', NULL, 1, '2021-11-12 06:17:50', '2021-11-12 06:17:50'),
(87, 19, 't123123', '1636697982_phat.jpg', '312312312', NULL, 1, '2021-11-12 06:19:42', '2021-11-12 06:19:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_type`
--

CREATE TABLE `product_type` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_type`
--

INSERT INTO `product_type` (`id`, `attribute_id`, `product_id`, `price`, `quantity`, `sold`, `created_at`, `updated_at`) VALUES
(88, 1, 85, 50000, 100, 0, '2021-11-12 05:52:44', '2021-11-12 05:52:44'),
(89, 2, 85, 60000, 90, 0, '2021-11-12 05:52:44', '2021-11-12 05:52:44'),
(90, 3, 85, 80000, 50, 0, '2021-11-12 05:52:44', '2021-11-12 05:52:44'),
(91, NULL, 86, 818, 100, 0, '2021-11-12 06:17:50', '2021-11-12 06:17:50'),
(92, 3, 87, 1, 2, 0, '2021-11-12 06:19:42', '2021-11-12 06:19:42'),
(93, 4, 87, 3, 4, 0, '2021-11-12 06:19:42', '2021-11-12 06:19:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `prod_image`
--

CREATE TABLE `prod_image` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `gallery` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `prod_image`
--

INSERT INTO `prod_image` (`id`, `productid`, `gallery`, `created_at`, `updated_at`) VALUES
(65, 85, '1636696364_1.jpg', '2021-11-12 05:52:44', '2021-11-12 05:52:44'),
(66, 85, '1636696364_phat.jpg', '2021-11-12 05:52:44', '2021-11-12 05:52:44'),
(67, 86, '1636697870_Me - Copy - Copy.jpg', '2021-11-12 06:17:50', '2021-11-12 06:17:50'),
(68, 86, '1636697870_phat.jpg', '2021-11-12 06:17:50', '2021-11-12 06:17:50'),
(69, 87, '1636697982_Me - Copy.jpg', '2021-11-12 06:19:42', '2021-11-12 06:19:42'),
(70, 87, '1636697982_Me.jpg', '2021-11-12 06:19:42', '2021-11-12 06:19:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_account`
--

CREATE TABLE `user_account` (
  `memberid` int(11) NOT NULL,
  `username` int(40) NOT NULL,
  `password` int(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart_temporary`
--
ALTER TABLE `cart_temporary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_temp_fk_prodtype` (`product_type_id`),
  ADD KEY `cart_temp_fk_member` (`member_id`),
  ADD KEY `cart_temp_fk_attr` (`attribute_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_fk_member` (`member_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category` (`categoryid`);

--
-- Chỉ mục cho bảng `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_type_fk_product` (`product_id`),
  ADD KEY `product_type_fk_attr` (`attribute_id`);

--
-- Chỉ mục cho bảng `prod_image`
--
ALTER TABLE `prod_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_listimgid` (`productid`);

--
-- Chỉ mục cho bảng `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`memberid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cart_temporary`
--
ALTER TABLE `cart_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT cho bảng `prod_image`
--
ALTER TABLE `prod_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_temporary`
--
ALTER TABLE `cart_temporary`
  ADD CONSTRAINT `cart_temp_fk_attr` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  ADD CONSTRAINT `cart_temp_fk_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `cart_temp_fk_prodtype` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`);

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_fk_order` FOREIGN KEY (`id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_fk_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `product_type`
--
ALTER TABLE `product_type`
  ADD CONSTRAINT `product_type_fk_attr` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  ADD CONSTRAINT `product_type_fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `prod_image`
--
ALTER TABLE `prod_image`
  ADD CONSTRAINT `fk_listimgid` FOREIGN KEY (`productid`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `fk_accountmbid` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
