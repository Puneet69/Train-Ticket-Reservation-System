-- ============================================
-- DATABASE VERIFICATION QUERIES
-- Run these in Supabase SQL Editor to verify data
-- ============================================

-- Check if all tables exist
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
ORDER BY table_name;

-- Expected output: admin, customer, history, train

-- ============================================
-- Verify ADMIN table
-- ============================================
SELECT COUNT(*) as admin_count FROM admin;
-- Expected: 1

SELECT mailid, fname, lname FROM admin;
-- Expected: admin@demo.com, System, Admin

-- ============================================
-- Verify CUSTOMER table
-- ============================================
SELECT COUNT(*) as customer_count FROM customer;
-- Expected: 1

SELECT mailid, fname, lname FROM customer;
-- Expected: shashi@demo.com, Shashi, Raj

-- ============================================
-- Verify TRAIN table
-- ============================================
SELECT COUNT(*) as train_count FROM train;
-- Expected: 8

SELECT tr_no, tr_name, from_stn, to_stn, seats, fare 
FROM train 
ORDER BY tr_no;
-- Expected: 8 trains (10001-10008)

-- ============================================
-- Verify HISTORY table
-- ============================================
SELECT COUNT(*) as booking_count FROM history;
-- Expected: 3

SELECT transid, mailid, tr_no, from_stn, to_stn, seats, amount 
FROM history 
ORDER BY date DESC;
-- Expected: 3 bookings for shashi@demo.com

-- ============================================
-- Test Complex Query (JOIN)
-- ============================================
SELECT 
    h.transid,
    h.date,
    c.fname || ' ' || c.lname as customer_name,
    t.tr_name,
    h.from_stn,
    h.to_stn,
    h.seats,
    h.amount
FROM history h
JOIN customer c ON h.mailid = c.mailid
JOIN train t ON h.tr_no = t.tr_no
ORDER BY h.date DESC;
-- Expected: 3 booking records with customer and train details

-- ============================================
-- Test Search Query (Trains between stations)
-- ============================================
SELECT tr_no, tr_name, from_stn, to_stn, seats, fare
FROM train
WHERE from_stn = 'HOWRAH' AND to_stn = 'JODHPUR';
-- Expected: 1 train (JODHPUR EXP)

-- ============================================
-- Verify Indexes
-- ============================================
SELECT indexname, tablename 
FROM pg_indexes 
WHERE schemaname = 'public'
ORDER BY tablename, indexname;
-- Expected: Primary keys + custom indexes

-- ============================================
-- VERIFICATION CHECKLIST
-- ============================================
-- ✓ All 4 tables created (admin, customer, train, history)
-- ✓ Admin account exists (admin@demo.com)
-- ✓ Customer account exists (shashi@demo.com)
-- ✓ 8 trains inserted
-- ✓ 3 booking history records
-- ✓ Foreign keys working (history -> customer, history -> train)
-- ✓ Indexes created for performance
-- ✓ Complex queries (JOINs) working
-- ✓ Search queries working
