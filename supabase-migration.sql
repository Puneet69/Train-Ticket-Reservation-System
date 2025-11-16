-- ============================================
-- Supabase (PostgreSQL) Migration Script
-- Converted from Oracle Database
-- ============================================

-- Drop tables if they exist (for clean migration)
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

-- Insert default admin account
INSERT INTO admin VALUES(
    'admin@demo.com',
    'admin',
    'System',
    'Admin',
    'Demo Address 123 colony',
    9874561230
);

-- Insert sample customer
INSERT INTO customer VALUES(
    'shashi@demo.com',
    'shashi',
    'Shashi',
    'Raj',
    'Kolkata, West Bengal',
    954745222
);

-- Insert sample trains
INSERT INTO train VALUES(10001, 'JODHPUR EXP', 'HOWRAH', 'JODHPUR', 152, 490.50);
INSERT INTO train VALUES(10002, 'YAMUNA EXP', 'GAYA', 'DELHI', 52, 550.50);
INSERT INTO train VALUES(10003, 'NILANCHAL EXP', 'GAYA', 'HOWRAH', 92, 451);
INSERT INTO train VALUES(10004, 'JAN SATABDI EXP', 'RANCHI', 'PATNA', 182, 550);
INSERT INTO train VALUES(10005, 'GANGE EXP', 'MUMBAI', 'KERALA', 12, 945);
INSERT INTO train VALUES(10006, 'GARIB RATH EXP', 'PATNA', 'DELHI', 1, 1450.75);
INSERT INTO train VALUES(10007, 'AJMER-SEALDAH EXP', 'SEALDAH', 'AJMER', 120, 1000.50);
INSERT INTO train VALUES(10008, 'MUMBAI MAIL', 'HAWRAH', 'MUMBAI', 100, 2150.75);

-- Insert sample booking history
INSERT INTO history VALUES(
    'BBC374-NSDF-4673',
    'shashi@demo.com',
    10001,
    '2024-02-02',
    'HOWRAH',
    'JODHPUR',
    2,
    981
);

INSERT INTO history VALUES(
    'BBC375-NSDF-4675',
    'shashi@demo.com',
    10004,
    '2024-01-12',
    'RANCHI',
    'PATNA',
    1,
    550
);

INSERT INTO history VALUES(
    'BBC373-NSDF-4674',
    'shashi@demo.com',
    10006,
    '2024-07-22',
    'PATNA',
    'DELHI',
    3,
    4352.25
);

-- Create indexes for better query performance
CREATE INDEX idx_history_mailid ON history(mailid);
CREATE INDEX idx_history_date ON history(date);
CREATE INDEX idx_train_from_to ON train(from_stn, to_stn);

-- Verify tables created successfully
SELECT 'Tables created successfully!' as status;
