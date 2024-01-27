CREATE TABLE sakila.rental (
  rental_id INT NOT NULL AUTOINCREMENT,
  rental_date DATETIME NOT NULL,
  inventory_id INTEGER NOT NULL,
  customer_id SMALLINT NOT NULL,
  return_date DATETIME DEFAULT NULL,
  staff_id TINYINT NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (rental_id),
--   UNIQUE KEY  (rental_date,inventory_id,customer_id),
  CONSTRAINT fk_rental_staff FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_rental_inventory FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_rental_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE
);
