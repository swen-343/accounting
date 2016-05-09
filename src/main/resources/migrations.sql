--liquibase formatted sql

--changeset keegan:1 dbms:mysql
CREATE TABLE `transactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transactionId` int(11) unsigned NOT NULL,
  `toAccountId` int(11) unsigned NOT NULL,
  `fromAccountId` int(11) unsigned NOT NULL,
  `amount` decimal(60, 30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `accounts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `balance` decimal(60, 30) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `accounts` (`name`) VALUES ('Employees'), ('Inventory'), ('Cash'), ('Revenues'), ('Cost of Goods Sold'), ('Sales Tax Payable'), ('Refunds Paid');