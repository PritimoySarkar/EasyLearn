-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `cid` int NOT NULL,
  `cname` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'C++','C++ Beginner Course'),(2,'Java','Core Java Course'),(3,'Python','Python Beginner COurse'),(4,'PHP','Raw PHP course'),(5,'C','C course for beginner');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `lid` int NOT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `slno` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `cid_idx` (`cid`),
  CONSTRAINT `course` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'ADVANCED CALCULATOR || C++ || IF ELSE STATEMENTS || EASY','-OAYgEhgIO4',1,1),(2,'Adding Colours To Text (C++ FULL TUTORIAL)','AfVbMG828AA',2,1),(3,'The For Loop ( C++ Easy Tutorial )','eBm55hqQ_AE',3,1),(4,'Calculate the area of a rectangle || C++','PhWEZOwdmgE',4,1),(5,'Calculate area of a square ||| C++','m0pcZpvikls',5,1),(6,'Calculate area of a square ||| C++','9wQHmyZSsCs',6,1),(7,'Currency Converter || C++||DOLLAR & RUPEE','FG91yVjtpSk',7,1),(8,'Java Tutorial for Beginners | Full Course','https://www.youtube.com/watch?v=8cm1x4bC610&list=PLsyeobzWxl7pSqMzPF_SlvQ0IdcGA-XI2&index=1',1,2),(9,'Servlet & JSP Tutorial | Full Course','https://www.youtube.com/watch?v=OuBUUkQfBYM&list=PLsyeobzWxl7pSqMzPF_SlvQ0IdcGA-XI2&index=2',2,2),(10,'Hibernate Tutorial | Full Course','https://www.youtube.com/watch?v=JR7-EdxDSf0&list=PLsyeobzWxl7pSqMzPF_SlvQ0IdcGA-XI2&index=3',3,2),(11,'Spring Framework Tutorial | Full Course','https://www.youtube.com/watch?v=If1Lw4pLLEo&list=PLsyeobzWxl7pSqMzPF_SlvQ0IdcGA-XI2&index=4',4,2),(12,'Spring MVC Tutorial | Full Course','https://www.youtube.com/watch?v=g2b-NbR48Jo&list=PLsyeobzWxl7pSqMzPF_SlvQ0IdcGA-XI2&index=5',5,2),(13,'Spring Boot Tutorials | Full Course','https://www.youtube.com/watch?v=35EQXmHKZYs&list=PLsyeobzWxl7pSqMzPF_SlvQ0IdcGA-XI2&index=6',6,2),(14,'Spring Security Tutorial','https://www.youtube.com/watch?v=fjkelzWNSuA&list=PLsyeobzWxl7pSqMzPF_SlvQ0IdcGA-XI2&index=7',7,2),(15,'Python Tutorial for Absolute Beginners #1 - What Are Variables?','https://www.youtube.com/watch?v=Z1Yd7upQsXY&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=1',1,3),(16,'Python Tutorial for Absolute Beginners #1 - What Are Variables?','https://www.youtube.com/watch?v=AWek49wXGzI&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=2',2,3),(17,'How To Use Functions In Python (Python Tutorial #3)','https://www.youtube.com/watch?v=NSbOtYzIQI0&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=3',3,3),(18,'How To Use Functions In Python (Python Tutorial #3)','https://www.youtube.com/watch?v=tw7ror9x32s&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=4',4,3),(19,'Introduction to For Loops in Python (Python Tutorial #5)','https://www.youtube.com/watch?v=OnDr4J2UXSA&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=5',5,3),(20,'While Loops and The Break Statement in Python (Python Tutorial #6)','https://www.youtube.com/watch?v=6TEGxJXLAWQ&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=6',6,3),(21,'More About For Loops in Python & Solutions to the Last 2 Problems (Python Tutorial #7)','https://www.youtube.com/watch?v=iVyWLmQ0QYA&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=7',7,3),(22,'How To Use Dictionaries In Python (Python Tutorial #8)','https://www.youtube.com/watch?v=ZEZdys-fHDw&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=8',8,3),(23,'Classes and Objects with Python - Part 1 (Python Tutorial #9)','https://www.youtube.com/watch?v=wfcWRAxRVBA&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=9',9,3),(24,'Classes and Objects with Python - Part 2 (Python Tutorial #10)','https://www.youtube.com/watch?v=WOwi0h_-dfA&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=10',10,3),(25,'Using Boolean in Python (Python Tutorial #11)','https://www.youtube.com/watch?v=r526yum0EYQ&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=11',11,3),(26,'List Comprehension Basics with Python (Python Tutorial #12)','https://www.youtube.com/watch?v=5K08WcjGV6c&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=12',12,3),(27,'How To Use Sets in Python (Python Tutorial #13)','https://www.youtube.com/watch?v=2u_ZExcNBzA&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=13',13,3),(28,'6 Python Exercise Problems for Beginners - from CodingBat (Python Tutorial #14)','https://www.youtube.com/watch?v=lx7oqZ7Nl3k&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=14',14,3),(29,'How To Create A Twitter Bot With Python | Build a Startup #4','https://www.youtube.com/watch?v=W0wWwglE1Vc&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=15',15,3),(30,'I Created a New Q&A Website for Coders with Python | Devlog #1','https://www.youtube.com/watch?v=RwOC7onT48Y&list=PLBZBJbE_rGRWeh5mIBhD-hhDwSEDxogDg&index=16',16,3),(31,'Introduction To PHP | What Is PHP Programming | PHP Tutorial For Beginners','https://www.youtube.com/watch?v=KBT2gmAfav4&list=PLEiEAq2VkUUIjP-QLfvICa1TvqTLFvn1b&index=1',1,4),(32,'Hello World In PHP | How To Run PHP Hello World Program | PHP Tutorial For Beginners','https://www.youtube.com/watch?v=wxzyZzEvS58&list=PLEiEAq2VkUUIjP-QLfvICa1TvqTLFvn1b&index=2',2,4),(33,'OOP In PHP | Object Oriented Programming In PHP | PHP Tutorial For Beginners','https://www.youtube.com/watch?v=JSX0HMYgtvc&list=PLEiEAq2VkUUIjP-QLfvICa1TvqTLFvn1b&index=3',3,4),(34,'PHP With MySQL Tutorial For Beginners | PHP And MySQL Database Tutorial | PHP Tutorial','https://www.youtube.com/watch?v=nP-MvFoDVZE&list=PLEiEAq2VkUUIjP-QLfvICa1TvqTLFvn1b&index=4',4,4),(35,'PHP Form Validation Tutorial | Form Validation In PHP | PHP Tutorial For Beginners','https://www.youtube.com/watch?v=xqI2hdDn47k&list=PLEiEAq2VkUUIjP-QLfvICa1TvqTLFvn1b&index=5',5,4),(36,'PHP Get And Post Methods | Get And Post Method In PHP With Example | PHP Tutorial','https://www.youtube.com/watch?v=hgFD7O058cw&list=PLEiEAq2VkUUIjP-QLfvICa1TvqTLFvn1b&index=6',6,4),(37,'PHP Crud Operations - Select, Insert, Update, Delete | PHP Tutorial For Beginners','https://www.youtube.com/watch?v=whvDzJFiyi4&list=PLEiEAq2VkUUIjP-QLfvICa1TvqTLFvn1b&index=7',7,4),(38,'PHP Form Login | How To Make Login Form In PHP | PHP Tutorial For Beginners','https://www.youtube.com/watch?v=scd8YKiuS7I&list=PLEiEAq2VkUUIjP-QLfvICa1TvqTLFvn1b&index=8',8,4),(39,' C Language Tutorial For Beginners || Programming Basics || Start Coding For Beginners In Hindi','https://www.youtube.com/watch?v=zgE_3dadBQo&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=1',1,5),(40,'Turbo C++ IDE | C Language Tutorial, Compile & Execute C Programs using Code block By Arvind','https://www.youtube.com/watch?v=T8WiCQAkpvE&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=2',2,5),(41,'C Programming Language || C Language Tutorial For Beginners || C language का परिचय By Arvind','https://www.youtube.com/watch?v=fXlYy9gSKWc&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=3',3,5),(42,'C Programming Language || C Language Tutorial For Beginners || C language Variables By Arvind','https://www.youtube.com/watch?v=Nds9lnGqkE4&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=4',4,5),(43,'C Programming Language || C Language Tutorial For Beginners || C language Constants By Arvind','https://www.youtube.com/watch?v=H1MiK0z19us&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=5',5,5),(44,'C Programming Language || C Language Tutorial For Beginners || C language Operators By Arvind','https://www.youtube.com/watch?v=FQqYT_9Az2E&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=6',6,5),(45,'C language Conditional Statement || C Programming || C Language Tutorial For Beginners By Arvind','https://www.youtube.com/watch?v=F61i7gYCg3E&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=7',7,5),(46,'C language Array, Types of Array || C Programming || C Language Tutorial For Beginners By Arvind','https://www.youtube.com/watch?v=R-VU5plP3LU&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=8',8,5),(47,'C language Debugging & Testing || C Programming || C Language Tutorial For Beginners By Arvind','https://www.youtube.com/watch?v=NA0R4DHSV2w&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=9',9,5),(48,'C language Input/Output Function || C Programming || C Language Tutorial For Beginners By Arvind','https://www.youtube.com/watch?v=K1qbd5yomd0&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=10',10,5),(49,'C language Programming Approach || C Programming || C Language Tutorial For Beginners By Arvind','https://www.youtube.com/watch?v=EVW9RPbyWvg&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=11',11,5),(50,'C language Programming Function || C Programming || C Language Tutorial For Beginners By Arvind','https://www.youtube.com/watch?v=y4xGzZuq7T4&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=12',12,5),(51,'C language Programming Function || C Programming || C Language Tutorial For Beginners By Arvind','https://www.youtube.com/watch?v=FAmbbuQN5pQ&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=13',13,5),(52,'C Language Tutorial For Beginners In Hindi (With PDF) -Learn C Programming-Complete Course By Arvind','https://www.youtube.com/watch?v=yvDh5KQ-mEk&list=PLOd2apPiwn-afd-ugTdHUQb2cBJw2-Z3V&index=14',14,5);
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `qqid` int NOT NULL,
  `qid` int DEFAULT NULL,
  `slno` int DEFAULT NULL,
  `question` varchar(400) DEFAULT NULL,
  `option1` varchar(300) DEFAULT NULL,
  `option2` varchar(300) DEFAULT NULL,
  `option3` varchar(300) DEFAULT NULL,
  `option4` varchar(300) DEFAULT NULL,
  `answer` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`qqid`),
  KEY `quizid_idx` (`qid`),
  CONSTRAINT `quizid` FOREIGN KEY (`qid`) REFERENCES `quiz` (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,1,'Which of the following is not the keyword in C++?','volatile','friend','extends','this','extends'),(2,1,2,'Which is the storage specifier used to modify the member variable even though the class object is a constant object?','auto','register','static','mutable','mutable'),(3,1,3,'How can we make an class act as an interface in C++?','By only providing all the functions as virtual functions in the class.','Defining the class following with the keyword virtual','Defining the class following with the keyword interface','Defining the class following with the keyword abstract','By only providing all the functions as virtual functions in the class.'),(4,1,4,'Objects created using new operator are stored in __ memory.','Cache','Cache','Cache','None of these','Heap'),(5,1,5,'An array can be passed to the function with call by value mechanism.','True','False',NULL,NULL,'False'),(6,1,6,'What is the size of ‘int’?','2','4','8','Compiler dependent','Compiler dependent'),(7,1,7,'Which of the following statements is incorrect?','Friend keyword can be used in the class to allow access to another class.','Friend keyword can be used for a function in the public section of a class','Friend keyword can be used for a function in the private section of a class.','Friend keyword can be used on main().','Friend keyword can be used on main().'),(8,1,8,'Which of the following statement is correct regarding destructor of base class?','Destructor of base class should always be static.','Destructor of base class should always be virtual.','Destructor of base class should not be virtual.','Destructor of base class should always be private.','Destructor of base class should always be virtual.'),(9,1,9,'Which of the following two entities (reading from Left to Right) can be connected by the dot operator?','A class member and a class object.','A class object and a class.','A class and a member of that class.','A class object and a member of that class.','A class object and a member of that class.'),(10,1,10,'How can we make a class abstract?','By making all member functions constant.','By making at least one member function as pure virtual function.','By declaring it abstract using the static keyword.','By declaring it abstract using the virtual keyword.','By making at least one member function as pure virtual function.');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `qid` int NOT NULL,
  `qname` varchar(45) DEFAULT NULL,
  `total_score` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`qid`),
  KEY `cid_idx` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'C++',20,1),(2,'Java',20,2),(3,'Python',20,3),(4,'PHP',20,4),(5,'C',20,5);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `profilePicture` varchar(45) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'abcd','abcd@sdf','12343',NULL,NULL),(2,'fdgfdgfd','dfrewrwer','32423324',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course`
--

DROP TABLE IF EXISTS `user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_course` (
  `ucid` int NOT NULL,
  `uid` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`ucid`),
  KEY `uid_idx` (`uid`),
  KEY `cid_idx` (`cid`),
  CONSTRAINT `courseid` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `userid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course`
--

LOCK TABLES `user_course` WRITE;
/*!40000 ALTER TABLE `user_course` DISABLE KEYS */;
INSERT INTO `user_course` VALUES (1,1,1,'Enrolled',-1),(2,2,3,'Enrolled',-1),(3,1,4,'Enrolled',-1),(4,1,5,'Enrolled',-1);
/*!40000 ALTER TABLE `user_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-24 19:11:59
