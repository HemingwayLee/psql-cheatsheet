-- up
CREATE TABLE IF NOT EXISTS bankstatement_tmp(
  id BIGSERIAL,
  bank_account VARCHAR(32) NOT NULL,
  bank_account_name VARCHAR(200) NOT NULL,
  date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  amount NUMERIC(24, 8) NOT NULL,
  counterparty VARCHAR(200) NOT NULL,
  dummy_transaction_id BIGINT NOT NULL,
  UNIQUE(bank_account, bank_account_name, date, amount, counterparty, dummy_transaction_id)
);

CREATE TABLE IF NOT EXISTS bankstatement(
  id BIGSERIAL,
  bank_account VARCHAR(32) NOT NULL,
  bank_account_name VARCHAR(200) NOT NULL,
  date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  amount NUMERIC(24, 8) NOT NULL,
  counterparty VARCHAR(200) NOT NULL,
  dummy_transaction_id BIGINT NOT NULL,
  UNIQUE(bank_account, bank_account_name, date, amount, counterparty, dummy_transaction_id)
);


CREATE TABLE IF NOT EXISTS bankstatement(
  id BIGSERIAL,
  bank_account VARCHAR(32) NOT NULL,
  bank_account_name VARCHAR(200) NOT NULL,
  date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  amount NUMERIC(24, 8) NOT NULL,
  counterparty VARCHAR(200) NOT NULL,
  dummy_transaction_id BIGINT NOT NULL,
  UNIQUE(bank_account, bank_account_name, date, amount, counterparty, dummy_transaction_id)
);

CREATE TABLE IF NOT EXISTS consolidated(
  id BIGSERIAL,
  bank_account VARCHAR(32) NOT NULL,
  bank_account_name VARCHAR(200) NOT NULL,
  date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  amount NUMERIC(24, 8) NOT NULL,
  balance NUMERIC(24, 8) NOT NULL,
  counterparty VARCHAR(200) NOT NULL,
);

CREATE TABLE IF NOT EXISTS analyzeddailyconsolidated(
  id BIGSERIAL,
  bank_account VARCHAR(32) NOT NULL,
  bank_account_name VARCHAR(200) NOT NULL,
  date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  amount_net_cashflow NUMERIC(24, 8) NOT NULL,
  amount_net_payment NUMERIC(24, 8) NOT NULL,
  amount_net_receipts NUMERIC(24, 8) NOT NULL,
  balance_closing NUMERIC(24, 8) NOT NULL,
  balance_min NUMERIC(24, 8) NOT NULL,
  balance_max NUMERIC(24, 8) NOT NULL,
);

CREATE TABLE IF NOT EXISTS analyzedmonthlyconsolidated(
);

CREATE TABLE IF NOT EXISTS analyzedyearlyconsolidated(
);

-- down
DROP TABLE bankstatement_tmp;
DROP TABLE bankstatement;



