CREATE DATABASE IF NOT EXISTS `maxwell`;

CREATE TABLE IF NOT EXISTS `maxwell`.`schemas` (
  id int unsigned auto_increment NOT NULL primary key,
  binlog_file varchar(255),
	binlog_position int unsigned,
  server_id int unsigned
);

CREATE TABLE IF NOT EXISTS `maxwell`.`databases` (
  id        int unsigned auto_increment NOT NULL primary key,
  schema_id int unsigned,
  name      varchar(255),
  encoding  varchar(255),
  index (schema_id)
);

CREATE TABLE IF NOT EXISTS `maxwell`.`tables` (
  id          int unsigned auto_increment NOT NULL primary key,
  schema_id   int unsigned,
  database_id int unsigned,
  name      varchar(255),
  encoding  varchar(255),
  index (schema_id),
  index (database_id)
);

CREATE TABLE IF NOT EXISTS `maxwell`.`columns` (
  id          int unsigned auto_increment NOT NULL primary key,
  schema_id   int unsigned,
  table_id    int unsigned,
  name        varchar(255),
  encoding    varchar(255),
  coltype     varchar(255),
  is_signed   tinyint(1) unsigned,
  index (schema_id),
  index (table_id)
);
