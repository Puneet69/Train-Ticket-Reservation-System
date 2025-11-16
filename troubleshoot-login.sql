-- ============================================
-- TROUBLESHOOTING LOGIN ISSUE
-- Run these queries in Supabase SQL Editor
-- ============================================

-- 1. Check table names (should be lowercase)
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Expected: admin, customer, history, train (all lowercase)

-- 2. Verify admin data exists
SELECT * FROM admin;
-- Expected: admin@demo.com with password 'admin'

-- 3. Verify customer data exists
SELECT * FROM customer;
-- Expected: shashi@demo.com with password 'shashi'

-- 4. Test the exact login query for ADMIN (uppercase table name)
SELECT * FROM ADMIN WHERE MAILID='admin@demo.com' AND PWORD='admin';
-- This might fail because table name is case-sensitive in quotes

-- 5. Test the login query for admin (lowercase table name)
SELECT * FROM admin WHERE MAILID='admin@demo.com' AND PWORD='admin';
-- This should work

-- 6. Test customer login
SELECT * FROM customer WHERE MAILID='shashi@demo.com' AND PWORD='shashi';
-- This should work

-- ============================================
-- THE ISSUE:
-- Java code uses UserRole.toString() which returns "ADMIN" or "CUSTOMER"
-- But PostgreSQL tables are created as lowercase: "admin", "customer"
-- 
-- In PostgreSQL:
-- - admin = ADMIN = Admin (case-insensitive, works)
-- - "ADMIN" would require exact case match (doesn't work)
-- 
-- The query: SELECT * FROM ADMIN WHERE ...
-- Should work in PostgreSQL (unquoted identifiers are case-insensitive)
-- ============================================

-- 7. Check if data is actually there
SELECT 
    'admin' as table_name,
    COUNT(*) as record_count
FROM admin
UNION ALL
SELECT 
    'customer' as table_name,
    COUNT(*) as record_count
FROM customer;

-- Expected: admin: 1, customer: 1
