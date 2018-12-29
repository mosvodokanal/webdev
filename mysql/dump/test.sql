CREATE DATABASE IF NOT EXISTS test; 

USE test;

SET NAMES 'utf8';

-- 
-- Установка базы данных по умолчанию
--
USE test;

--
-- Описание для таблицы Person
--
DROP TABLE IF EXISTS Person;
CREATE TABLE Person (
  id INT(11) NOT NULL,
  name VARCHAR(20) NOT NULL
)
ENGINE = INNODB
AVG_ROW_LENGTH = 5461
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

-- 
-- Вывод данных для таблицы Person
--
INSERT INTO Person VALUES
(1, 'William'),
(2, 'Marc'),
(3, 'John');
