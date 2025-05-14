/*
 Navicat Premium Dump SQL

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : cnpm

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 14/05/2025 21:01:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartId` int NOT NULL,
  `dishId` int NOT NULL,
  `quantity` int NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cartId`(`cartId` ASC) USING BTREE,
  INDEX `dishId`(`dishId` ASC) USING BTREE,
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`dishId`) REFERENCES `dishes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_chk_1` CHECK (`quantity` > 0)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES (1, 1, 1, 2, '2025-05-14', NULL);
INSERT INTO `cart_items` VALUES (2, 1, 3, 1, '2025-05-14', NULL);
INSERT INTO `cart_items` VALUES (3, 2, 4, 3, '2025-05-14', NULL);

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `createdAt` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (1, 1, '2025-05-14');
INSERT INTO `carts` VALUES (2, 2, '2025-05-14');

-- ----------------------------
-- Table structure for deliverys
-- ----------------------------
DROP TABLE IF EXISTS `deliverys`;
CREATE TABLE `deliverys`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `createdAt` date NOT NULL,
  `updatedAt` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderId`(`orderId` ASC) USING BTREE,
  CONSTRAINT `deliverys_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deliverys
-- ----------------------------
INSERT INTO `deliverys` VALUES (1, 1, 'pending', '2025-05-14', NULL);
INSERT INTO `deliverys` VALUES (2, 2, 'delivered', '2025-05-14', '2025-05-14');

-- ----------------------------
-- Table structure for dishes
-- ----------------------------
DROP TABLE IF EXISTS `dishes`;
CREATE TABLE `dishes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menuId` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NULL DEFAULT NULL,
  `available` tinyint NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menuId`(`menuId` ASC) USING BTREE,
  CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dishes
-- ----------------------------
INSERT INTO `dishes` VALUES (1, 1, 'Bánh Flan', 'Bánh flan trứng mềm mịn', 25000.00, 'banh_flan.jpg', '2025-05-14', NULL, 1);
INSERT INTO `dishes` VALUES (2, 1, 'Chè Đậu Đỏ', 'Chè đậu đỏ ngọt thanh', 30000.00, 'che_dau_do.jpg', '2025-05-14', NULL, 1);
INSERT INTO `dishes` VALUES (3, 2, 'Phở Bò', 'Phở bò Hà Nội truyền thống', 65000.00, 'pho_bo.jpg', '2025-05-14', NULL, 1);
INSERT INTO `dishes` VALUES (4, 3, 'Nước Ép Cam', 'Nước ép cam tươi nguyên chất', 35000.00, 'nuoc_ep_cam.jpg', '2025-05-14', NULL, 1);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'Món Tráng Miệng', 'Các loại bánh và đồ ngọt', '2025-05-14', NULL);
INSERT INTO `menu` VALUES (2, 'Món Chính', 'Cơm, phở, bún và các món ăn chính', '2025-05-14', NULL);
INSERT INTO `menu` VALUES (3, 'Đồ Uống', 'Nước ép, trà và cà phê', '2025-05-14', NULL);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `dishId` int NOT NULL,
  `quantity` int NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderId`(`orderId` ASC) USING BTREE,
  INDEX `dishId`(`dishId` ASC) USING BTREE,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`dishId`) REFERENCES `dishes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_chk_1` CHECK (`quantity` > 0)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 1, 1, 2, '2025-05-14', NULL);
INSERT INTO `order_items` VALUES (2, 1, 3, 1, '2025-05-14', NULL);
INSERT INTO `order_items` VALUES (3, 2, 4, 3, '2025-05-14', NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `createdAt` date NOT NULL,
  `updatedAt` date NULL DEFAULT NULL,
  `shippingAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 115000.00, 'pending', '2025-05-14', NULL, '123 Đường Láng, Hà Nội');
INSERT INTO `orders` VALUES (2, 2, 105000.00, 'completed', '2025-05-14', '2025-05-14', '456 Nguyễn Trãi, TP.HCM');

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `orderId` int NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `createdAt` date NOT NULL,
  `updatedAt` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `orderId`(`orderId` ASC) USING BTREE,
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES (1, 1, 1, 115000.00, 'pending', '2025-05-14', NULL);
INSERT INTO `payments` VALUES (2, 2, 2, 105000.00, 'completed', '2025-05-14', '2025-05-14');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `dishId` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `updatedAt` date NULL DEFAULT NULL,
  `shippingAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `dishId`(`dishId` ASC) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`dishId`) REFERENCES `dishes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` >= 1) and (`rating` <= 5))
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (1, 1, 3, 5, 'Phở bò rất ngon, nước dùng đậm đà!', '2025-05-14', '123 Đường Láng, Hà Nội');
INSERT INTO `reviews` VALUES (2, 2, 4, 4, 'Nước ép cam tươi, nhưng hơi ngọt.', '2025-05-14', '456 Nguyễn Trãi, TP.HCM');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `userName`(`userName` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'nguyenvanA', 'nguyenvana@gmail.com', 'hashed_password_123', 'Nguyễn Văn A', '123 Đường Láng, Hà Nội', '0901234567', 0);
INSERT INTO `users` VALUES (2, 'tranbichB', 'tranbichb@gmail.com', 'hashed_password_456', 'Trần Bích B', '456 Nguyễn Trãi, TP.HCM', '0912345678', 0);
INSERT INTO `users` VALUES (3, 'admin', 'admin@xai.com', 'hashed_admin_pass', 'Admin Hệ Thống', '789 Tô Hiến Thành, Đà Nẵng', '0923456789', 1);

SET FOREIGN_KEY_CHECKS = 1;
