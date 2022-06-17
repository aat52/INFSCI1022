USE AAT52;

/*
DROP TABLE transactions;
DROP TABLE accounts;
*/

CREATE TABLE accounts (
	account_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	balance DOUBLE NOT NULL,
	`type` VARCHAR(30) NOT NULL,
	date_opened DATETIME NOT NULL,
	`status` VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	
    date_time DATETIME NOT NULL,
	amount DOUBLE NOT NULL,
	remaining_balance DOUBLE NOT NULL,
	fk_account_id INT NOT NULL
) ENGINE = InnoDB;
	
ALTER TABLE transactions 
	ADD CONSTRAINT fk_account_id
	FOREIGN KEY (fk_account_id)
	REFERENCES accounts(account_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

INSERT INTO accounts (account_id, balance, `type`, date_opened, `status`)
VALUES (1, 20, 'student', '2000-01-01', 'active');

INSERT INTO accounts (account_id, balance, `type`, date_opened, `status`)
VALUES (2, 20, 'savings', '2000-01-01', 'active');

INSERT INTO accounts (account_id, balance, `type`, date_opened, `status`)
VALUES (3, 20, 'savings', '2000-01-01', 'active');

INSERT INTO transactions (transaction_id, date_time, amount, remaining_balance, fk_account_id)
VALUES (1, '2000-02-02', 10, 30, 1);

INSERT INTO transactions (transaction_id, date_time, amount, remaining_balance, fk_account_id)
VALUES (2, '2000-03-03', 10, 40, 1);

INSERT INTO transactions (transaction_id, date_time, amount, remaining_balance, fk_account_id)
VALUES (3, '2000-01-01', 20, 40, 2);

INSERT INTO transactions (transaction_id, date_time, amount, remaining_balance, fk_account_id)
VALUES (4, '2000-01-01', 30, 50, 3);

INSERT INTO transactions (transaction_id, date_time, amount, remaining_balance, fk_account_id)
VALUES (5, '2000-02-02', 30, 80, 3);

SELECT*FROM accounts;
SELECT*FROM transactions;