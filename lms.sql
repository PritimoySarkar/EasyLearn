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
-- Table structure for table `course_score`
--

DROP TABLE IF EXISTS `course_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_score` (
  `csid` int NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`csid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_score`
--

LOCK TABLES `course_score` WRITE;
/*!40000 ALTER TABLE `course_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_usercourses`
--

DROP TABLE IF EXISTS `course_usercourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_usercourses` (
  `course_cid` int NOT NULL,
  `usercourses_ucid` int NOT NULL,
  KEY `FK4a5gw6tvu4xvi5o55hbjog8ps` (`usercourses_ucid`),
  KEY `FK267sy2g7kdwxkuf4hi3obm126` (`course_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_usercourses`
--

LOCK TABLES `course_usercourses` WRITE;
/*!40000 ALTER TABLE `course_usercourses` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_usercourses` ENABLE KEYS */;
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
INSERT INTO `questions` VALUES (1,1,1,'Which of the following is not the keyword in C++?','volatile','friend','extends','this','C'),(2,1,2,'Which is the storage specifier used to modify the member variable even though the class object is a constant object?','auto','register','static','mutable','D'),(3,1,3,'How can we make an class act as an interface in C++?','By only providing all the functions as virtual functions in the class.','Defining the class following with the keyword virtual','Defining the class following with the keyword interface','Defining the class following with the keyword abstract','A'),(4,1,4,'Objects created using new operator are stored in __ memory.','Cache','Heap','Stack','None of these','B'),(5,1,5,'An array can be passed to the function with call by value mechanism.','True','False',NULL,NULL,'B'),(6,1,6,'What is the size of ‘int’?','2','4','8','Compiler dependent','D'),(7,1,7,'Which of the following statements is incorrect?','Friend keyword can be used in the class to allow access to another class.','Friend keyword can be used for a function in the public section of a class','Friend keyword can be used for a function in the private section of a class.','Friend keyword can be used on main().','D'),(8,1,8,'Which of the following statement is correct regarding destructor of base class?','Destructor of base class should always be static.','Destructor of base class should always be virtual.','Destructor of base class should not be virtual.','Destructor of base class should always be private.','C'),(9,1,9,'Which of the following two entities (reading from Left to Right) can be connected by the dot operator?','A class member and a class object.','A class object and a class.','A class and a member of that class.','A class object and a member of that class.','D'),(10,1,10,'How can we make a class abstract?','By making all member functions constant.','By making at least one member function as pure virtual function.','By declaring it abstract using the static keyword.','By declaring it abstract using the virtual keyword.','B'),(11,1,11,'Which of the following statements is correct when a class is inherited publicly?','Public members of the base class become protected members of derived class.','Public members of the base class become private members of derived class.','Private members of the base class become protected members of derived class.','Public members of the base class become public members of derived class.','D'),(12,1,12,'Which of the following statements is correct about the constructors and destructors?','Destructors can take arguments but constructors cannot.','Constructors can take arguments but destructors cannot.','Destructors can be overloaded but constructors cannot be overloaded.','Constructors and destructors can both return a value.','B'),(13,1,13,'Which of the following access specifies is used in a class definition by default?','Protected','Public','Private','Friend','C'),(14,1,14,'Which of the following statement is correct with respect to the use of friend keyword inside a class?','A private data member can be declared as a friend.','A class may be declared as a friend.','An object may be declared as a friend.','We can use friend keyword as a class name.','B'),(15,1,15,'Which of the following keywords is used to control access to a class member?','Default','Break','Protected','Asm','C'),(16,1,16,'Which of the following can access private data members or member functions of a class?','Any function in the program.','All global functions in the program.','Any member function of that class.','Only public member functions of that class.','C'),(17,1,17,'Which of the following type of data member can be shared by all instances of its class?','Public','Inherited','Static','Friend','C'),(18,1,18,'Which of the following also known as an instance of a class?','Friend Functions','Object','Member Functions','Member Variables','B'),(19,1,19,'Constructor is executed when _____.','an object is created','an object is used','a class is declared','an object goes out of scope.','A'),(20,1,20,'Which of the following statements about virtual base classes is correct?','It is used to provide multiple inheritance.','It is used to avoid multiple copies of base class in derived class.','It is used to allow multiple copies of base class in a derived class.','It allows private members of the base class to be inherited in the derived class.','B'),(21,2,1,'Which of the following option leads to the portability and security of Java?','Bytecode is executed by JVM','The applet makes the Java code secure and portable','Use of exception handling','Dynamic binding between objects','A'),(22,2,2,'Which of the following is not a Java features?','Dynamic','Architecture Neutral','Use of pointers','Object-oriented','C'),(23,2,3,'The \\u0021 article referred to as a','Unicode escape sequence','Octal escape','Hexadecimal','Line feed','A'),(24,2,4,'_____ is used to find and fix bugs in the Java programs.','JVM','JRE','JDK','JDB','D'),(25,2,5,'Which of the following is a valid declaration of a char?','char ch = \'\\utea\';','char ca = \'tea\';','char cr = \\u0223;','char cc = \'\\itea\';','A'),(26,2,6,'What is the return type of the hashCode() method in the Object class?','Object','int','long','void','B'),(27,2,7,'Which of the following is a valid long literal?','ABH8097','L990023','904423','0xnf029L','D'),(28,2,8,'What does the expression float a = 35 / 0 return?','0','Not a Number','Infinity','Run time exception','C'),(29,2,9,'Which of the following tool is used to generate API documentation in HTML format from doc comments in source code?','javap tool','javaw command','Javadoc tool','javah command','C'),(30,2,10,'Which of the following creates a List of 3 visible items and multiple selections abled?','new List(false, 3)','new List(3, true)','new List(true, 3)','new List(3, false)','B'),(31,2,11,'Which of the following for loop declaration is not valid?','for ( int i = 99; i >= 0; i / 9 )','for ( int i = 7; i <= 77; i += 7 )','for ( int i = 20; i >= 2; - -i )','for ( int i = 2; i <= 20; i = 2* i )','A'),(32,2,12,'Which method of the Class.class is used to determine the name of a class represented by the class object as a String?','getClass()','intern()','getName()','toString()','C'),(33,2,13,'In which process, a local variable has the same name as one of the instance variables?','Serialization','Variable Shadowing','Abstraction','Multi-threading','B'),(34,2,14,'Which of the following is true about the anonymous inner class?','It has only methods','Objects can\'t be created','It has a fixed class name','It has no class name','D'),(35,2,15,'Which package contains the Random class?','java.util package','java.lang package','java.awt package','java.io package','A'),(36,2,16,'What do you mean by nameless objects?','An object created by using the new keyword.','An object of a superclass created in the subclass.','An object without having any name but having a reference.','An object that has no reference.','D'),(37,2,17,'An interface with no fields or methods is known as a ______.','Runnable Interface','Marker Interface','Abstract Interface','CharSequence Interface','B'),(38,2,18,'Which of the following is an immediate subclass of the Panel class?','Applet class','Window class','Frame class','Dialog class','A'),(39,2,19,'Which option is false about the final keyword?','A final method cannot be overridden in its subclasses.','A final class cannot be extended.','A final class cannot extend other classes.','A final method can be inherited.','c'),(40,2,20,'Which of these classes are the direct subclasses of the Throwable class?','RuntimeException and Error class','Exception and VirtualMachineError class','Error and Exception class','IOException and VirtualMachineError class','c'),(41,3,1,'What is the maximum possible length of an identifier?','16','32','64','None of these above','D'),(42,3,2,'In which language is Python written?','English','PHP','C','All of the above','C'),(43,3,3,'Which one of the following is the correct extension of the Python file?','.py','.python','.p','None of these','A'),(44,3,4,'What do we use to define a block of code in Python language?','Key','Brackets','Indentation','None of these','C'),(45,3,5,'Which of the following statements is correct regarding the object-oriented programming concept in Python?','Classes are real-world entities while objects are not real','Objects are real-world entities while classes are not real','Both objects and classes are real-world entities','All of the above','B'),(46,3,6,'What is the method inside the class in python language?','Object','Function','Attribute','Argument','B'),(47,3,7,'Which of the following declarations is incorrect?','_x = 2','__x = 3','__xyz__ = 5','None of these','D'),(48,3,8,'Why does the name of local variables start with an underscore discouraged?','To identify the variable','It confuses the interpreter','It indicates a private variable of a class','None of these','C'),(49,3,9,'Which of the following is not a keyword in Python language?','val','raise','try','with','A'),(50,3,10,'Which of the following statements is correct for variable names in Python language?','All variable names must begin with an underscore.','Unlimited length','The variable name length is a maximum of 2.','All of the above','B'),(51,3,11,'Which of the following declarations is incorrect in python language?','xyzp = 5,000,000','x y z p = 5000 6000 7000 8000','x,y,z,p = 5000, 6000, 7000, 8000','x_y_z_p = 5,000,000','B'),(52,3,12,'Which of the following words cannot be a variable in python language?','_val','val','try','_try_','C'),(53,3,13,'Which of the following operators is the correct option for power(ab)?','a ^ b','a**b','a ^ ^ b','a ^ * b','B'),(54,3,14,'Which of the following precedence order is correct in Python?','Parentheses, Exponential, Multiplication, Division, Addition, Subtraction','Multiplication, Division, Addition, Subtraction, Parentheses, Exponential','Division, Multiplication, Addition, Subtraction, Parentheses, Exponential','Exponential, Parentheses, Multiplication, Division, Addition, Subtraction','A'),(55,3,15,'Which one of the following has the same precedence level?','Division, Power, Multiplication, Addition and Subtraction','Division and Multiplication','Subtraction and Division','Power and Division','B'),(56,3,16,'Which one of the following has the highest precedence in the expression?','Division','Subtraction','Power','Parentheses','D'),(57,3,17,'Which of the following functions is a built-in function in python language?','var()','print()','None of these',NULL,'B'),(58,3,18,'Which of the following option is not a core data type in the python language?','Dictionary','Lists','Class','All of the above','C'),(59,3,19,'What happens when \'2\' == 2 is executed?','False','True','ValueError occurs','TypeError occurs','A'),(60,3,20,'Who developed the Python language?','Zim Den','Guido van Rossum','Niene Stom','Wick van Rossum','B'),(61,4,1,'The term PHP is an acronym for PHP:_______________.','Hypertext Preprocessor','Hypertext multiprocessor','Hypertext markup Preprocessor','Hypertune Preprocessor','A'),(62,4,2,'PHP is a ____________ language?','user-side scripting','client-side scripting','server-side scripting','Both B and C','C'),(63,4,3,'Who among this is the founder of php language?','Tim Berners-Lee','Brendan Eich','Guido van Rossum','Rasmus Lerdorf','D'),(64,4,4,'In which year php was created?','1993','1994','1995','1996','B'),(65,4,5,'PHP files have a default file extension of_______.','.html','.xml','.php','.hphp','C'),(66,4,6,'Which of the following is the correct syntax of php?','<?php >','<php >','?php ?','<?php ?>','D'),(67,4,7,'Which statement will output $lfc on the screen?','echo \"$lfc\";','echo \"$$lfc\";','echo \"/$lfc\";','echo \"$lfc;\";','A'),(68,4,8,'Which of the below statements is equivalent to $sub -= $sub?','$sub = $sub','$sub = $sub -$sub','$sub = $sub - 1','$sub = $sub - $sub - 1','B'),(69,4,9,'Which of the following type of variables have only two possible values either true or false?','Integers','Doubles','Booleans','Strings','C'),(70,4,10,'Which of the following is true about php variables?','All variables in PHP are denoted with a leading dollar sign ($).','The value of a variable is the value of its most recent assignment.','Variables are assigned with the = operator, with the variable on the left-hand side and the expression to be evaluated on the right.','All of the above.','D'),(71,4,11,'Which of the following is correct about NULL?','NULL is a special type that only has one value: NULL.','The special constant NULL is capitalized by convention, but actually it is case insensitive.','Both of the above.','None of the above.','C'),(72,4,12,'Which of the following array represents an array with strings as index?','Numeric Array','Associative Array','Multidimentional Array','None of the above.','B'),(73,4,13,'Which of the following variable is used to generate random numbers using PHP?','srand()','rand()','random()','None of the above.','B'),(74,4,14,'If there is any problem in loading a file then the include() function generates a warning but the script will continue execution.','true','false',NULL,NULL,'A'),(75,4,15,'Which of the following is used to delete a cookie?','setcookie() function','$_COOKIE variable','isset() function','None of the above.','A'),(76,4,16,'Which of the following provides content type of the uploaded file in PHP?','$_FILES[\'file\'][\'tmp_name\']','$_FILES[\'file\'][\'name\']','$_FILES[\'file\'][\'size\']','$_FILES[\'file\'][\'type\']','D'),(77,4,17,'Which of the following is correct about preg_match() function?','The preg_match() function searches a string specified by string for a string specified by pattern, returning true if the pattern is found, and false otherwise.','The preg_match() function searches throughout a string specified by pattern for a string specified by string. The search is not case sensitive.','The preg_match() function searches string for pattern, returning true if pattern exists, and false otherwise.','None of the above','C'),(78,4,18,'Which of the following method acts as a constructor function in a PHP class?','class_name()','__construct','constructor','None of the above.','B'),(79,4,19,'Which of the following is correct about NULL?','NULL is a special type that only has one value: NULL.','The special constant NULL is capitalized by convention, but actually it is case insensitive.','Both of the above.','None of the above.','C'),(80,4,20,'Which of the following array represents an array with strings as index?','Numeric Array','Associative Array','Multidimentional Array','None of the above.','B'),(81,5,1,'What is the 16-bit compiler allowable range for integer constants?','-3.4e38 to 3.4e38','-32767 to 32768','-32668 to 32667','-32768 to 32767','D'),(82,5,2,'What is required in each C program?','The program must have at least one function.','The program does not require any function.','Input data','Output data','A'),(83,5,3,'Which of the following comment is correct when a macro definition includes arguments?','The opening parenthesis should immediately follow the macro name.','There should be at least one blank between the macro name and the opening parenthesis.','There should be only one blank between the macro name and the opening parenthesis.','All the above comments are correct.','A'),(84,5,4,'What is a lint?','C compiler','Interactive debugger','Analyzing tool','C interpreter','C'),(85,5,5,'What is the output of this statement \"printf(\"%d\", (a++))\"?','The value of (a + 1)','The current value of a','Error message','Garbage','B'),(86,5,6,'Why is a macro used in place of a function?','It reduces execution time.','It reduces code size.','It increases execution time.','It increases code size.','B'),(87,5,7,'In the C language, the constant is defined _______.','Before main','After main','Anywhere, but starting on a new line.','None of the these.','C'),(88,5,8,'A pointer is a memory address. Suppose the pointer variable has p address 1000, and that p is declared to have type int*, and an int is 4 bytes long. What address is represented by expression p + 2?','1002','1004','1006','1008','D'),(89,5,9,'Which one of the following is a loop construct that will always be executed once?','for','while','switch','do while','D'),(90,5,10,'Which of the following best describes the ordering of destructor calls for stack-resident objects in a routine?','The first object created is the first object destroyed; last created is last destroyed.','The first object destroyed is the last object destroyed; last created is first destroyed.','Objects are destroyed in the order they appear in memory, the object with the lowest memory address is destroyed first.','The order is undefined and may vary from compiler to compiler.','B'),(91,5,11,'Directives are translated by the','Pre-processor','Compiler','Linker','Editor','A'),(92,5,12,'How many bytes does \"int = D\" use?','0','1','2 or 4','10','C'),(93,5,13,'Which of the following will copy the null-terminated string that is in array src into array dest?','dest = src;','dest == src;','strcpy(dest, src);','strcpy(src, dest);','C'),(94,5,14,'In the statement \"COUT << \"javatpoint\" << end1;\", end1 is a ___.','Extractor','Inserter','Manipulator','Terminator','C'),(95,5,15,'Each instance of a class has a different set of','Class interfaces','Methods','Return types','Attribute values','D'),(96,5,16,'How many instances of a class can be declared?','1','10','As per required','None of the these','C'),(97,5,17,'What is the maximum number of characters that can be held in the string variable char address line [40]?','38','39','40','41','B'),(98,5,18,'Which of the following statement is not true?','A pointer to an int and a pointer to a double are of the same size.','A pointer must point to a data item on the heap (free store).','A pointer can be reassigned to point to another data item.','A pointer can point to an array.','B'),(99,5,19,'Which of the following SLT template class is a container adaptor class?','Stack','List','Deque','Vector','A'),(100,5,20,'What kinds of iterators can be used with vectors?','Forward iterator','Bi-directional iterator','Random access iterator','All of the above','D');
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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'$2a$10$XORtncmW/xhfFaV4j3u0f.0LOg/I3peDzor2z0RUPbVnRrqtBxbYC','Pritimoy'),(2,'$2a$10$CGyuSQCHauTheexXopfehukWmD3vv6gXDPRq6pZRqoucfelnGpaQ6','abcdxyz'),(3,'$2a$10$D/TLFeNDH46mJ93vGc8An.K0CmrK/kIJLBgXGVmwbym1QiABO9zNy','Ashutosh'),(4,'$2a$10$b8/nCf5dAUPQRON2sWUxPesQRBm//TsnJulooTWDg4CMgbGlmGJG.','Prerak'),(5,'$2a$10$SodDlTS3tJW9g0UKQNXfXewpzPJQkfDzbj.XHjRdFnZLVGkdUKU4e','Sachin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course`
--

DROP TABLE IF EXISTS `user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_course` (
  `ucid` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `score` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `uid` bigint DEFAULT NULL,
  PRIMARY KEY (`ucid`),
  KEY `FK9i32hd38k9pm5pjv8lwmvydd1` (`uid`),
  KEY `FKkm473bp3uhqhpgh7h4uug7x53` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course`
--

LOCK TABLES `user_course` WRITE;
/*!40000 ALTER TABLE `user_course` DISABLE KEYS */;
INSERT INTO `user_course` VALUES (1,1,4,'Failed',1),(2,2,-1,'Enrolled',1),(3,5,-1,'Enrolled',1),(5,2,-1,'Enrolled',3),(6,1,1,'Failed',3),(7,1,1,'Failed',4),(8,5,-1,'Enrolled',4),(9,3,-1,'Enrolled',4),(10,4,-1,'Enrolled',4),(11,2,-1,'Enrolled',5),(12,3,-1,'Enrolled',5);
/*!40000 ALTER TABLE `user_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `users_id` bigint NOT NULL,
  `roles_id` bigint NOT NULL,
  PRIMARY KEY (`users_id`,`roles_id`),
  KEY `FKj9553ass9uctjrmh0gkqsmv0d` (`roles_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-28  0:06:26
