-- ============================================
-- VERIFY LOGIN DATA EXISTS
-- Copy and paste these queries ONE BY ONE in Supabase SQL Editor
-- ============================================

-- Query 1: Check if admin exists
SELECT 'ADMIN DATA:' as check_type, * FROM admin;
-- Expected result: 1 row with admin@demo.com

-- Query 2: Check if customer exists  
SELECT 'CUSTOMER DATA:' as check_type, * FROM customer;
-- Expected result: 1 row with shashi@demo.com

-- Query 3: Test exact login query for ADMIN
SELECT * FROM admin WHERE mailid='admin@demo.com' AND pword='admin';
-- Expected result: 1 row (if this returns nothing, login will fail)

-- Query 4: Test exact login query for CUSTOMER
SELECT * FROM customer WHERE mailid='shashi@demo.com' AND pword='shashi';
-- Expected result: 1 row (if this returns nothing, login will fail)

-- Query 5: Count all records
SELECT 
    'admin' as table_name, 
    COUNT(*) as record_count,
    STRING_AGG(mailid, ', ') as emails
FROM admin
UNION ALL
SELECT 
    'customer',
    COUNT(*),
    STRING_AGG(mailid, ', ')
FROM customer;
-- Expected: admin: 1 (admin@demo.com), customer: 1 (shashi@demo.com)

-- ============================================
-- If any query returns 0 rows, the data is NOT in the database
-- and you need to run the migration script again
-- ============================================
