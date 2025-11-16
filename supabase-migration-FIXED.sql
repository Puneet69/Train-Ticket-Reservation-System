-- ============================================
-- FIXED Supabase Migration Script
-- Run this in Supabase SQL Editor
-- ============================================

-- Drop existing tables if they exist
DROP TABLE IF EXISTS history CASCADE;
DROP TABLE IF EXISTS train CASCADE;
DROP TABLE IF EXISTS admin CASCADE;
DROP TABLE IF EXISTS customer CASCADE;

-- Create CUSTOMER table
CREATE TABLE customer (
    mailid VARCHAR(40) PRIMARY KEY,
    pword VARCHAR(20) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20),
    addr VARCHAR(100),
    phno BIGINT NOT NULL
);

-- Create ADMIN table  
CREATE TABLE admin (
    mailid VARCHAR(40) PRIMARY KEY,
    pword VARCHAR(20) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20),
    addr VARCHAR(100),
    phno BIGINT NOT NULL
);

-- Create TRAIN table
CREATE TABLE train (
    tr_no INTEGER PRIMARY KEY,
    tr_name VARCHAR(70) NOT NULL,
    from_stn VARCHAR(20) NOT NULL,
    to_stn VARCHAR(20) NOT NULL,
    seats INTEGER NOT NULL,
    fare NUMERIC(6,2) NOT NULL
);

-- Create HISTORY table
CREATE TABLE history (
    transid VARCHAR(36) PRIMARY KEY,
    mailid VARCHAR(40) REFERENCES customer(mailid),
    tr_no INTEGER,
    date DATE,
    from_stn VARCHAR(20) NOT NULL,
    to_stn VARCHAR(20) NOT NULL,
    seats INTEGER NOT NULL,
    amount NUMERIC(8,2) NOT NULL
);

-- Insert DEFAULT ADMIN (THIS IS CRITICAL FOR LOGIN)
INSERT INTO admin (mailid, pword, fname, lname, addr, phno) VALUES
('admin@demo.com', 'admin', 'System', 'Admin', 'Demo Address 123 colony', 9874561230);

-- Insert DEFAULT CUSTOMER (THIS IS CRITICAL FOR LOGIN)
INSERT INTO customer (mailid, pword, fname, lname, addr, phno) VALUES
('shashi@demo.com', 'shashi', 'Shashi', 'Raj', 'Kolkata, West Bengal', 954745222);

-- Insert TRAINS
INSERT INTO train (tr_no, tr_name, from_stn, to_stn, seats, fare) VALUES
(10001, 'JODHPUR EXP', 'HOWRAH', 'JODHPUR', 152, 490.50),
(10002, 'YAMUNA EXP', 'GAYA', 'DELHI', 52, 550.50),
(10003, 'NILANCHAL EXP', 'GAYA', 'HOWRAH', 92, 451),
(10004, 'JAN SATABDI EXP', 'RANCHI', 'PATNA', 182, 550),
(10005, 'GANGE EXP', 'MUMBAI', 'KERALA', 12, 945),
(10006, 'GARIB RATH EXP', 'PATNA', 'DELHI', 1, 1450.75),
(10007, 'AJMER-SEALDAH EXP', 'SEALDAH', 'AJMER', 120, 1000.50),
(10008, 'MUMBAI MAIL', 'HAWRAH', 'MUMBAI', 100, 2150.75);

-- Insert BOOKING HISTORY
INSERT INTO history (transid, mailid, tr_no, date, from_stn, to_stn, seats, amount) VALUES
('BBC374-NSDF-4673', 'shashi@demo.com', 10001, '2024-02-02', 'HOWRAH', 'JODHPUR', 2, 981),
('BBC375-NSDF-4675', 'shashi@demo.com', 10004, '2024-01-12', 'RANCHI', 'PATNA', 1, 550),
('BBC373-NSDF-4674', 'shashi@demo.com', 10006, '2024-07-22', 'PATNA', 'DELHI', 3, 4352.25);

-- Create indexes for performance
CREATE INDEX idx_history_mailid ON history(mailid);
CREATE INDEX idx_history_date ON history(date);
CREATE INDEX idx_train_from_to ON train(from_stn, to_stn);

-- VERIFY DATA WAS INSERTED
SELECT 'Admin accounts:' as info, COUNT(*) as count FROM admin
UNION ALL
SELECT 'Customer accounts:', COUNT(*) FROM customer
UNION ALL
SELECT 'Trains:', COUNT(*) FROM train
UNION ALL
SELECT 'Bookings:', COUNT(*) FROM history;

-- SHOW LOGIN CREDENTIALS
SELECT 'ADMIN LOGIN' as account_type, mailid as email, pword as password FROM admin
UNION ALL
SELECT 'CUSTOMER LOGIN', mailid, pword FROM customer;
