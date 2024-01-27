CREATE TABLE sakila.customer (
  customer_id   SMALLINT NOT NULL AUTOINCREMENT,
  store_id      TINYINT NOT NULL,
  first_name    VARCHAR(45) NOT NULL,
  last_name     VARCHAR(45) NOT NULL,
  email         VARCHAR(50) DEFAULT NULL,
  address_id    SMALLINT NOT NULL,
  active        BOOLEAN NOT NULL DEFAULT TRUE,
  create_date   DATETIME NOT NULL,
  last_update   TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY  (customer_id)
--   CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE,
--   CONSTRAINT fk_customer_store FOREIGN KEY (store_id) REFERENCES store (store_id) ON DELETE RESTRICT ON UPDATE CASCADE
);
