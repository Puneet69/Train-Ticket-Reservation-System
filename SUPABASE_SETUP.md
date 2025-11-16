# 🚀 Supabase Migration Guide

This guide will help you migrate from Oracle Database to Supabase (PostgreSQL) for free cloud hosting.

## Step 1: Create Supabase Account

1. Go to **https://supabase.com**
2. Click **"Start your project"**
3. Sign up with **GitHub** (recommended) or email
4. Verify your email if required

## Step 2: Create a New Project

1. Click **"New Project"**
2. Fill in the details:
   - **Name**: `train-reservation`
   - **Database Password**: Create a strong password (save this!)
   - **Region**: Choose closest to you
   - **Pricing Plan**: Free (select the free tier)
3. Click **"Create new project"**
4. Wait 2-3 minutes for setup to complete

## Step 3: Get Database Connection Details

1. In your Supabase project dashboard, click **"Settings"** (gear icon on left sidebar)
2. Click **"Database"** section
3. Scroll down to **"Connection string"**
4. Select **"JDBC"** tab
5. Copy the connection string - it looks like:
   ```
   jdbc:postgresql://db.xxxxxxxxxxxxx.supabase.co:5432/postgres?user=postgres&password=[YOUR-PASSWORD]
   ```

## Step 4: Run Database Migration Script

1. In Supabase dashboard, click **"SQL Editor"** (on left sidebar)
2. Click **"New query"**
3. Copy the entire contents of `supabase-migration.sql` file
4. Paste it into the SQL editor
5. Click **"Run"** button (or press Cmd/Ctrl + Enter)
6. You should see: **"Tables created successfully!"**

## Step 5: Verify Tables Created

1. Click **"Table Editor"** (on left sidebar)
2. You should see 4 tables:
   - ✅ customer
   - ✅ admin
   - ✅ train
   - ✅ history
3. Click on each table to verify data is inserted

## Step 6: Update Application Configuration

1. Open `src/application.properties` in your project
2. Update with your Supabase connection details:

```properties
username=postgres
password=YOUR_ACTUAL_SUPABASE_PASSWORD
driverName=org.postgresql.Driver
connectionString=jdbc:postgresql://db.xxxxxxxxxxxxx.supabase.co:5432/postgres?sslmode=require
```

**Important**: 
- Replace `YOUR_ACTUAL_SUPABASE_PASSWORD` with the password you created in Step 2
- Replace `db.xxxxxxxxxxxxx.supabase.co` with your actual Supabase host from Step 3
- Keep `?sslmode=require` at the end (required for secure connection)

### Example Configuration:
```properties
username=postgres
password=MyStr0ngP@ssw0rd!
driverName=org.postgresql.Driver
connectionString=jdbc:postgresql://db.abcdefghijklmnop.supabase.co:5432/postgres?sslmode=require
```

## Step 7: Rebuild and Test

Run the following commands:

```bash
cd /Users/puneet/Desktop/java/Train-Ticket-Reservation-System
JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home mvn clean package -DskipTests
java -jar target/dependency/webapp-runner.jar target/*.war
```

## Step 8: Test the Application

1. Open browser: **http://localhost:8080**
2. Test login with default credentials:
   - **Admin**: admin@demo.com / admin
   - **User**: shashi@demo.com / shashi

## 🎉 Success Checklist

- ✅ Supabase project created
- ✅ Database tables created (customer, admin, train, history)
- ✅ Sample data inserted
- ✅ application.properties updated
- ✅ Application rebuilt successfully
- ✅ Can login and book tickets

## 📊 Supabase Free Tier Limits

- **Database**: 500 MB storage
- **Bandwidth**: Unlimited
- **API Requests**: Unlimited
- **Projects**: 2 free projects
- **Backups**: 7 days retention
- **No credit card required!**

## 🔧 Troubleshooting

### Connection Error: "Connection refused"
- Check your connection string is correct
- Verify password has no special characters that need escaping
- Ensure `sslmode=require` is in the connection string

### "No suitable driver" error
- PostgreSQL driver is already in pom.xml (version 42.7.4)
- Rebuild the project: `mvn clean package`

### Tables not showing in Supabase
- Re-run the migration script in SQL Editor
- Check for error messages in SQL Editor output

### Login not working
- Verify data was inserted: Check Table Editor in Supabase
- Run this query in SQL Editor to verify:
  ```sql
  SELECT * FROM admin;
  SELECT * FROM customer;
  ```

## 🌐 Access Your Database Anywhere

Your database is now in the cloud! You can:
- Access from any machine
- Share with team members
- Deploy to cloud servers
- Use Supabase dashboard to manage data

## 📱 Bonus: Supabase Features

Your free account also includes:
- **Auto-generated REST API** for your tables
- **Real-time subscriptions** (live data updates)
- **Authentication** (can integrate with your app)
- **Storage** (for file uploads)
- **Edge Functions** (serverless functions)

## Need Help?

- Supabase Docs: https://supabase.com/docs
- Supabase Discord: https://discord.supabase.com
- Project GitHub Issues: Create an issue if you encounter problems

---

**Last Updated**: November 16, 2025  
**Compatible with**: Java 21, PostgreSQL 42.7.4, Supabase Free Tier
