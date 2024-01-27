CREATE TABLE sakila.language (
  language_id TINYINT NOT NULL AUTOINCREMENT,
  name CHAR(20) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (language_id)
);
