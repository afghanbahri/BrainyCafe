-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for brainycafe
CREATE DATABASE IF NOT EXISTS `brainycafe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `brainycafe`;

-- Dumping structure for table brainycafe.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id_menu` varchar(12) NOT NULL,
  `id_user` varchar(12) NOT NULL,
  `qty` bigint NOT NULL,
  `ket` text NOT NULL,
  KEY `id_menu` (`id_menu`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table brainycafe.cart: ~0 rows (approximately)

-- Dumping structure for table brainycafe.detail_pesanan
CREATE TABLE IF NOT EXISTS `detail_pesanan` (
  `id_detail_pesanan` varchar(12) NOT NULL,
  `id_pesanan` varchar(12) NOT NULL,
  `id_menu` varchar(12) NOT NULL,
  `qty` bigint NOT NULL,
  `ket` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_detail_pesanan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table brainycafe.detail_pesanan: ~12 rows (approximately)

-- Dumping structure for table brainycafe.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` varchar(15) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table brainycafe.kategori: ~4 rows (approximately)
INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
	('KTR-1', 'Ventela'),
	('KTR-2', 'Compass'),
	('KTR-3', 'Warrior'),
	('KTR-4', 'Patrobas');

-- Dumping structure for table brainycafe.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` varchar(12) NOT NULL,
  `name_menu` varchar(60) NOT NULL,
  `id_kategori` varchar(15) NOT NULL,
  `harga` bigint NOT NULL,
  `picturl` text NOT NULL,
  `status_menu` bigint NOT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `id_ketegoti` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table brainycafe.menu: ~26 rows (approximately)
INSERT INTO `menu` (`id_menu`, `name_menu`, `id_kategori`, `harga`, `picturl`, `status_menu`) VALUES
	('MN-001', 'Public Low', 'KTR-1', 290000, '1671625898-MN-001.jpg', 1),
	('MN-0010', 'Slip On Avatar 2.0', 'KTR-3', 179900, '1671626182-MN-0010.jpg', 1),
	('MN-0011', 'Tristan High Cut', 'KTR-3', 239900, '1671626207-MN-0011.jpg', 1),
	('MN-0012', 'Zeus', 'KTR-3', 26990, '1671626225-MN-0012.jpg', 1),
	('MN-0013', 'Ivan Black White', 'KTR-4', 279900, '1671626270-MN-0013.jpg', 1),
	('MN-0014', 'Cloud Slip On Black White', 'KTR-4', 289900, '1671626294-MN-0014.jpg', 1),
	('MN-0015', 'Cleo Black Low', 'KTR-4', 529900, '1671626318-MN-0015.jpg', 1),
	('MN-0016', 'Cleo Black High', 'KTR-4', 549900, '1671626339-MN-0016.jpg', 1),
	('MN-002', 'Public High', 'KTR-1', 300000, '1671625918-MN-002.jpg', 1),
	('MN-003', 'Noir Low', 'KTR-1', 450000, '1671625933-MN-003.jpg', 1),
	('MN-004', 'Noir High', 'KTR-1', 470000, '1671625947-MN-004.jpg', 1),
	('MN-005', 'Gazelle Low Black White', 'KTR-2', 408000, '1671625975-MN-005.jpg', 1),
	('MN-006', 'Gazelle Hi Black White', 'KTR-2', 438000, '1671625996-MN-006.jpg', 1),
	('MN-007', 'Boy Pablo Low Black', 'KTR-2', 778000, '1671626016-MN-007.jpg', 1),
	('MN-008', 'Retrograde Slip On Black', 'KTR-2', 458000, '1671626062-MN-008.jpg', 1),
	('MN-009', 'Classic High Black White', 'KTR-3', 149900, '1671626127-MN-009.jpg', 1);

-- Dumping structure for table brainycafe.pesanan
CREATE TABLE IF NOT EXISTS `pesanan` (
  `id_pesanan` varchar(12) NOT NULL,
  `id_user` varchar(12) NOT NULL,
  `tgl_order` datetime NOT NULL,
  `status_order` int NOT NULL,
  `ket` text,
  PRIMARY KEY (`id_pesanan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table brainycafe.pesanan: ~9 rows (approximately)

-- Dumping structure for table brainycafe.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` varchar(12) NOT NULL,
  `id_user` varchar(12) NOT NULL,
  `id_pesanan` varchar(12) NOT NULL,
  `id_va` varchar(15) NOT NULL,
  `tgl_order` datetime NOT NULL,
  `alamat` text NOT NULL,
  `total` bigint NOT NULL,
  `status_bayar` int NOT NULL,
  `status_kirim` int NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table brainycafe.transaksi: ~9 rows (approximately)

-- Dumping structure for table brainycafe.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` varchar(100) NOT NULL,
  `name_user` varchar(60) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `access_level` int NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table brainycafe.user: ~4 rows (approximately)
INSERT INTO `user` (`id_user`, `name_user`, `username`, `password`, `access_level`) VALUES
	('USR-001', 'Galih Respati Permana', 'admin', 'admin', 1),
	('USR-002', 'Pengguna', 'user', '1234', 2),
	('USR-005', 'Rio Dwianto', 'rio', '123', 1),
	('USR-006', 'Afghan Muhammad Bahri', 'afghan', '123', 2);

-- Dumping structure for view brainycafe.vcart
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vcart` (
	`id_menu` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`name_menu` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`harga` BIGINT(19) NOT NULL,
	`picturl` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`id_user` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`name_user` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`qty` BIGINT(19) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view brainycafe.vfavorit
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vfavorit` (
	`id_menu` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`name_menu` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`harga` BIGINT(19) NOT NULL,
	`picturl` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`status_menu` BIGINT(19) NOT NULL,
	`qty` BIGINT(19) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table brainycafe.virtual_account
CREATE TABLE IF NOT EXISTS `virtual_account` (
  `id_va` varchar(15) NOT NULL,
  `name_bank` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id_va`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table brainycafe.virtual_account: ~4 rows (approximately)
INSERT INTO `virtual_account` (`id_va`, `name_bank`, `code`) VALUES
	('VA-001', 'BCA', '3901'),
	('VA-002', 'Mandiri', '89508'),
	('VA-003', 'BNI', '88810'),
	('VA-004', 'BRI', '8810');

-- Dumping structure for view brainycafe.vmenu
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vmenu` (
	`id_menu` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`name_menu` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_kategori` VARCHAR(15) NOT NULL COLLATE 'latin1_swedish_ci',
	`nama_kategori` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`harga` BIGINT(19) NOT NULL,
	`picturl` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`status_menu` BIGINT(19) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view brainycafe.vordermenu
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vordermenu` (
	`id_menu` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`name_menu` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`orderan` DECIMAL(41,0) NULL
) ENGINE=MyISAM;

-- Dumping structure for view brainycafe.vpesanan
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vpesanan` (
	`id_pesanan` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_user` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`name_user` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_order` DATETIME NOT NULL,
	`id_menu` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`name_menu` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`picturl` TEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`harga` BIGINT(19) NOT NULL,
	`qty` BIGINT(19) NOT NULL,
	`status_order` INT(10) NOT NULL,
	`ket` TEXT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view brainycafe.vtransaksi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vtransaksi` (
	`id_transaksi` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_user` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`name_user` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_pesanan` VARCHAR(12) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_va` VARCHAR(15) NOT NULL COLLATE 'latin1_swedish_ci',
	`name_bank` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_order` DATETIME NOT NULL,
	`total` BIGINT(19) NOT NULL,
	`status_bayar` INT(10) NOT NULL,
	`status_kirim` INT(10) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view brainycafe.vcart
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vcart`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vcart` AS select `cart`.`id_menu` AS `id_menu`,`menu`.`name_menu` AS `name_menu`,`menu`.`harga` AS `harga`,`menu`.`picturl` AS `picturl`,`cart`.`id_user` AS `id_user`,`user`.`name_user` AS `name_user`,`cart`.`qty` AS `qty` from ((`cart` join `menu` on((`cart`.`id_menu` = `menu`.`id_menu`))) join `user` on((`cart`.`id_user` = `user`.`id_user`)));

-- Dumping structure for view brainycafe.vfavorit
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vfavorit`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vfavorit` AS select distinct `detail_pesanan`.`id_menu` AS `id_menu`,`menu`.`name_menu` AS `name_menu`,`menu`.`harga` AS `harga`,`menu`.`picturl` AS `picturl`,`menu`.`status_menu` AS `status_menu`,`detail_pesanan`.`qty` AS `qty` from (`detail_pesanan` join `menu` on((`detail_pesanan`.`id_menu` = `menu`.`id_menu`))) where (`menu`.`status_menu` = '1') order by `detail_pesanan`.`qty` desc limit 0,3;

-- Dumping structure for view brainycafe.vmenu
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vmenu`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vmenu` AS select `menu`.`id_menu` AS `id_menu`,`menu`.`name_menu` AS `name_menu`,`menu`.`id_kategori` AS `id_kategori`,`kategori`.`nama_kategori` AS `nama_kategori`,`menu`.`harga` AS `harga`,`menu`.`picturl` AS `picturl`,`menu`.`status_menu` AS `status_menu` from (`menu` join `kategori` on((`menu`.`id_kategori` = `kategori`.`id_kategori`))) order by `menu`.`name_menu`;

-- Dumping structure for view brainycafe.vordermenu
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vordermenu`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vordermenu` AS select `menu`.`id_menu` AS `id_menu`,`menu`.`name_menu` AS `name_menu`,sum(`detail_pesanan`.`qty`) AS `orderan` from (`menu` join `detail_pesanan` on((`menu`.`id_menu` = `detail_pesanan`.`id_menu`))) group by `menu`.`id_menu`;

-- Dumping structure for view brainycafe.vpesanan
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vpesanan`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vpesanan` AS select `pesanan`.`id_pesanan` AS `id_pesanan`,`pesanan`.`id_user` AS `id_user`,`user`.`name_user` AS `name_user`,`pesanan`.`tgl_order` AS `tgl_order`,`detail_pesanan`.`id_menu` AS `id_menu`,`menu`.`name_menu` AS `name_menu`,`menu`.`picturl` AS `picturl`,`menu`.`harga` AS `harga`,`detail_pesanan`.`qty` AS `qty`,`pesanan`.`status_order` AS `status_order`,`pesanan`.`ket` AS `ket` from (((`pesanan` join `user` on((`pesanan`.`id_user` = `user`.`id_user`))) join `detail_pesanan` on((`pesanan`.`id_pesanan` = `detail_pesanan`.`id_pesanan`))) join `menu` on((`detail_pesanan`.`id_menu` = `menu`.`id_menu`)));

-- Dumping structure for view brainycafe.vtransaksi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vtransaksi`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vtransaksi` AS select `transaksi`.`id_transaksi` AS `id_transaksi`,`transaksi`.`id_user` AS `id_user`,`user`.`name_user` AS `name_user`,`pesanan`.`id_pesanan` AS `id_pesanan`,`virtual_account`.`id_va` AS `id_va`,`virtual_account`.`name_bank` AS `name_bank`,`transaksi`.`tgl_order` AS `tgl_order`,`transaksi`.`total` AS `total`,`transaksi`.`status_bayar` AS `status_bayar`,`transaksi`.`status_kirim` AS `status_kirim` from (((`transaksi` join `user` on((`transaksi`.`id_user` = `user`.`id_user`))) join `pesanan` on((`transaksi`.`id_pesanan` = `pesanan`.`id_pesanan`))) join `virtual_account` on((`transaksi`.`id_va` = `virtual_account`.`id_va`)));

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
