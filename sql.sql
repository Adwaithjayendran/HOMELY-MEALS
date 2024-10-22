/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.6.12-log : Database - meals
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`meals` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `meals`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add bank',7,'add_bank'),(20,'Can change bank',7,'change_bank'),(21,'Can delete bank',7,'delete_bank'),(22,'Can add cart',8,'add_cart'),(23,'Can change cart',8,'change_cart'),(24,'Can delete cart',8,'delete_cart'),(25,'Can add feedback',9,'add_feedback'),(26,'Can change feedback',9,'change_feedback'),(27,'Can delete feedback',9,'delete_feedback'),(28,'Can add food',10,'add_food'),(29,'Can change food',10,'change_food'),(30,'Can delete food',10,'delete_food'),(31,'Can add food_items',11,'add_food_items'),(32,'Can change food_items',11,'change_food_items'),(33,'Can delete food_items',11,'delete_food_items'),(34,'Can add food_provider',12,'add_food_provider'),(35,'Can change food_provider',12,'change_food_provider'),(36,'Can delete food_provider',12,'delete_food_provider'),(37,'Can add login',13,'add_login'),(38,'Can change login',13,'change_login'),(39,'Can delete login',13,'delete_login'),(40,'Can add order',14,'add_order'),(41,'Can change order',14,'change_order'),(42,'Can delete order',14,'delete_order'),(43,'Can add order_master',15,'add_order_master'),(44,'Can change order_master',15,'change_order_master'),(45,'Can delete order_master',15,'delete_order_master'),(46,'Can add user',16,'add_user'),(47,'Can change user',16,'change_user'),(48,'Can delete user',16,'delete_user');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'homely_meals','bank'),(8,'homely_meals','cart'),(9,'homely_meals','feedback'),(10,'homely_meals','food'),(11,'homely_meals','food_items'),(12,'homely_meals','food_provider'),(13,'homely_meals','login'),(14,'homely_meals','order'),(15,'homely_meals','order_master'),(16,'homely_meals','user'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2023-11-24 09:51:24.337785'),(2,'auth','0001_initial','2023-11-24 09:51:24.794041'),(3,'admin','0001_initial','2023-11-24 09:51:24.903150'),(4,'admin','0002_logentry_remove_auto_add','2023-11-24 09:51:24.944258'),(5,'contenttypes','0002_remove_content_type_name','2023-11-24 09:51:25.032401'),(6,'auth','0002_alter_permission_name_max_length','2023-11-24 09:51:25.071051'),(7,'auth','0003_alter_user_email_max_length','2023-11-24 09:51:25.115193'),(8,'auth','0004_alter_user_username_opts','2023-11-24 09:51:25.131566'),(9,'auth','0005_alter_user_last_login_null','2023-11-24 09:51:25.179848'),(10,'auth','0006_require_contenttypes_0002','2023-11-24 09:51:25.186075'),(11,'auth','0007_alter_validators_add_error_messages','2023-11-24 09:51:25.201744'),(12,'auth','0008_alter_user_username_max_length','2023-11-24 09:51:25.299478'),(13,'auth','0009_alter_user_last_name_max_length','2023-11-24 09:51:25.341678'),(14,'homely_meals','0001_initial','2023-11-24 09:51:26.235614'),(15,'sessions','0001_initial','2023-11-24 09:51:26.279472'),(16,'homely_meals','0002_feedback_food_provider','2023-12-03 10:58:52.350357');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('kwa8railhwusm3w4ym1dqv19k2dp00s0','MmJmZWI0ODljYjVkZDA0YjM0ZWZlYzJmNTIzYTA4ZDE5YzE4ZjAxMTp7ImhlYWQiOiJSRVBPUlQiLCJsaWQiOjE0fQ==','2023-12-17 12:00:06.966716');

/*Table structure for table `homely_meals_bank` */

DROP TABLE IF EXISTS `homely_meals_bank`;

CREATE TABLE `homely_meals_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) NOT NULL,
  `ifsc_code` varchar(20) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homely_meals_bank_LOGIN_id_6d8a3c75_fk_homely_meals_login_id` (`LOGIN_id`),
  CONSTRAINT `homely_meals_bank_LOGIN_id_6d8a3c75_fk_homely_meals_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `homely_meals_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_bank` */

insert  into `homely_meals_bank`(`id`,`bank_name`,`ifsc_code`,`amount`,`LOGIN_id`,`date`) values (4,'SBI','SBIN3667','36400',12,'2/12/2023'),(5,'HDFC','HDFC5443','1500',14,'1/12/2023');

/*Table structure for table `homely_meals_cart` */

DROP TABLE IF EXISTS `homely_meals_cart`;

CREATE TABLE `homely_meals_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` varchar(20) NOT NULL,
  `FOOD_ITEMS_id` int(11) NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homely_meals_cart_FOOD_ITEMS_id_baf7850f_fk_homely_me` (`FOOD_ITEMS_id`),
  KEY `homely_meals_cart_USER_id_1a219563_fk_homely_meals_user_id` (`USER_id`),
  CONSTRAINT `homely_meals_cart_FOOD_ITEMS_id_baf7850f_fk_homely_me` FOREIGN KEY (`FOOD_ITEMS_id`) REFERENCES `homely_meals_food_items` (`id`),
  CONSTRAINT `homely_meals_cart_USER_id_1a219563_fk_homely_meals_user_id` FOREIGN KEY (`USER_id`) REFERENCES `homely_meals_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_cart` */

/*Table structure for table `homely_meals_feedback` */

DROP TABLE IF EXISTS `homely_meals_feedback`;

CREATE TABLE `homely_meals_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `USER_id` int(11) NOT NULL,
  `FOOD_PROVIDER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homely_meals_feedback_USER_id_4a2e9b57_fk_homely_meals_user_id` (`USER_id`),
  KEY `homely_meals_feedbac_FOOD_PROVIDER_id_c534edf0_fk_homely_me` (`FOOD_PROVIDER_id`),
  CONSTRAINT `homely_meals_feedbac_FOOD_PROVIDER_id_c534edf0_fk_homely_me` FOREIGN KEY (`FOOD_PROVIDER_id`) REFERENCES `homely_meals_food_provider` (`id`),
  CONSTRAINT `homely_meals_feedback_USER_id_4a2e9b57_fk_homely_meals_user_id` FOREIGN KEY (`USER_id`) REFERENCES `homely_meals_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_feedback` */

insert  into `homely_meals_feedback`(`id`,`feedback`,`date`,`USER_id`,`FOOD_PROVIDER_id`) values (8,'good','20231203-163835',5,8),(9,'good','20231203-163925',5,8);

/*Table structure for table `homely_meals_food` */

DROP TABLE IF EXISTS `homely_meals_food`;

CREATE TABLE `homely_meals_food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_food` */

insert  into `homely_meals_food`(`id`,`food_name`) values (10,'chilly chicken');

/*Table structure for table `homely_meals_food_items` */

DROP TABLE IF EXISTS `homely_meals_food_items`;

CREATE TABLE `homely_meals_food_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(20) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `FOOD_id` int(11) NOT NULL,
  `FOOD_PROVIDER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homely_meals_food_items_FOOD_id_c11d5e3d_fk_homely_meals_food_id` (`FOOD_id`),
  KEY `homely_meals_food_it_FOOD_PROVIDER_id_168958f5_fk_homely_me` (`FOOD_PROVIDER_id`),
  CONSTRAINT `homely_meals_food_it_FOOD_PROVIDER_id_168958f5_fk_homely_me` FOREIGN KEY (`FOOD_PROVIDER_id`) REFERENCES `homely_meals_food_provider` (`id`),
  CONSTRAINT `homely_meals_food_items_FOOD_id_c11d5e3d_fk_homely_meals_food_id` FOREIGN KEY (`FOOD_id`) REFERENCES `homely_meals_food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_food_items` */

insert  into `homely_meals_food_items`(`id`,`amount`,`photo`,`FOOD_id`,`FOOD_PROVIDER_id`) values (9,'150','/static/food item image/20231203-153331.jpg',10,8);

/*Table structure for table `homely_meals_food_provider` */

DROP TABLE IF EXISTS `homely_meals_food_provider`;

CREATE TABLE `homely_meals_food_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(50) NOT NULL,
  `building_name` varchar(100) NOT NULL,
  `buiding_no` varchar(20) NOT NULL,
  `street` varchar(100) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homely_meals_food_pr_LOGIN_id_2e10b069_fk_homely_me` (`LOGIN_id`),
  CONSTRAINT `homely_meals_food_pr_LOGIN_id_2e10b069_fk_homely_me` FOREIGN KEY (`LOGIN_id`) REFERENCES `homely_meals_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_food_provider` */

insert  into `homely_meals_food_provider`(`id`,`provider_name`,`building_name`,`buiding_no`,`street`,`longitude`,`latitude`,`phone_no`,`email`,`LOGIN_id`) values (8,'abhiram','saphire','567','kannur','75.37066','11.87158','8790654321','1',14);

/*Table structure for table `homely_meals_login` */

DROP TABLE IF EXISTS `homely_meals_login`;

CREATE TABLE `homely_meals_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_login` */

insert  into `homely_meals_login`(`id`,`username`,`password`,`usertype`) values (1,'admin','admin','admin'),(12,'adwaith','321','user'),(14,'abhiram','432','food_provider');

/*Table structure for table `homely_meals_order` */

DROP TABLE IF EXISTS `homely_meals_order`;

CREATE TABLE `homely_meals_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` varchar(20) NOT NULL,
  `FOOD_ITEMS_id` int(11) NOT NULL,
  `ORDER_MASTER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homely_meals_order_FOOD_ITEMS_id_f067916d_fk_homely_me` (`FOOD_ITEMS_id`),
  KEY `homely_meals_order_ORDER_MASTER_id_6d13c14c_fk_homely_me` (`ORDER_MASTER_id`),
  CONSTRAINT `homely_meals_order_ORDER_MASTER_id_6d13c14c_fk_homely_me` FOREIGN KEY (`ORDER_MASTER_id`) REFERENCES `homely_meals_order_master` (`id`),
  CONSTRAINT `homely_meals_order_FOOD_ITEMS_id_f067916d_fk_homely_me` FOREIGN KEY (`FOOD_ITEMS_id`) REFERENCES `homely_meals_food_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_order` */

insert  into `homely_meals_order`(`id`,`quantity`,`FOOD_ITEMS_id`,`ORDER_MASTER_id`) values (8,'2',9,12),(9,'4',9,13),(10,'3',9,14),(11,'4',9,15),(12,'1',9,16),(13,'2',9,17);

/*Table structure for table `homely_meals_order_master` */

DROP TABLE IF EXISTS `homely_meals_order_master`;

CREATE TABLE `homely_meals_order_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `payment_date` varchar(25) NOT NULL,
  `FOOD_PROVIDER_id` int(11) NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homely_meals_order_m_FOOD_PROVIDER_id_82e85e10_fk_homely_me` (`FOOD_PROVIDER_id`),
  KEY `homely_meals_order_m_USER_id_5f95b4bc_fk_homely_me` (`USER_id`),
  CONSTRAINT `homely_meals_order_m_USER_id_5f95b4bc_fk_homely_me` FOREIGN KEY (`USER_id`) REFERENCES `homely_meals_user` (`id`),
  CONSTRAINT `homely_meals_order_m_FOOD_PROVIDER_id_82e85e10_fk_homely_me` FOREIGN KEY (`FOOD_PROVIDER_id`) REFERENCES `homely_meals_food_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_order_master` */

insert  into `homely_meals_order_master`(`id`,`amount`,`date`,`status`,`payment_status`,`payment_date`,`FOOD_PROVIDER_id`,`USER_id`) values (12,'300','2023-12-03','confirmed','online','2023-10-12',8,5),(13,'600','2023-12-03','confirmed','offline','2023-10-27',8,5),(14,'450','2023-12-03','pending','online','2023-11-04',8,5),(15,'600','2023-12-03','pending','online','2023-11-25',8,5),(16,'150','2023-12-03','pending','online','2023-12-03',8,5),(17,'300','2023-12-03','pending','offline','2023-12-03',8,5);

/*Table structure for table `homely_meals_user` */

DROP TABLE IF EXISTS `homely_meals_user`;

CREATE TABLE `homely_meals_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `house_name` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homely_meals_user_LOGIN_id_04c52219_fk_homely_meals_login_id` (`LOGIN_id`),
  CONSTRAINT `homely_meals_user_LOGIN_id_04c52219_fk_homely_meals_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `homely_meals_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `homely_meals_user` */

insert  into `homely_meals_user`(`id`,`username`,`house_name`,`street`,`email_id`,`phone_number`,`LOGIN_id`) values (5,'adwaith','chirammal','kannur','adwaith1a2b@gmail.com','6787654321',12);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
