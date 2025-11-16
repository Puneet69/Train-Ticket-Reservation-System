# Render Deployment Manual
## Train Ticket Reservation System

This is a complete step-by-step guide to deploy your Java application on Render.com.

---

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Step-by-Step Deployment Guide](#step-by-step-deployment-guide)
3. [Environment Variables Configuration](#environment-variables-configuration)
4. [Troubleshooting](#troubleshooting)
5. [Post-Deployment Testing](#post-deployment-testing)
6. [Cost & Performance](#cost--performance)

---

## Prerequisites

Before starting, ensure you have:

- ✅ **GitHub Account** - Your code is already pushed to: https://github.com/Puneet69/Train-Ticket-Reservation-System.git
- ✅ **Render Account** - Sign up at https://render.com (free)
- ✅ **Supabase Database** - Already configured and running
- ✅ **All code committed** - Latest commit: `3e12d53` (Dockerfile fix)

---

## Step-by-Step Deployment Guide

### Step 1: Sign Up / Log In to Render

1. Go to **https://render.com**
2. Click **"Get Started"** or **"Sign In"**
3. Choose **"Sign in with GitHub"** (recommended)
4. Authorize Render to access your GitHub repositories

**Screenshot Guide:**
```
┌─────────────────────────────────────┐
│         Welcome to Render           │
│                                     │
│  [Sign in with GitHub]              │
│  [Sign in with GitLab]              │
│  [Sign in with Email]               │
└─────────────────────────────────────┘
```

---

### Step 2: Create a New Web Service

1. Once logged in, you'll see the **Render Dashboard**
2. Click the **"New +"** button in the top right corner
3. Select **"Web Service"** from the dropdown menu

**Screenshot Guide:**
```
Dashboard > New + > Web Service
┌─────────────────────────────────────┐
│  New +                       ▼      │
│  ├── Web Service                    │
│  ├── Static Site                    │
│  ├── Private Service                │
│  ├── Cron Job                       │
│  └── Background Worker              │
└─────────────────────────────────────┘
```

---

### Step 3: Connect Your GitHub Repository

1. On the **"Create a new Web Service"** page, you'll see your GitHub repositories
2. Find **"Train-Ticket-Reservation-System"** in the list
3. Click the **"Connect"** button next to it

**If you don't see the repository:**
- Click **"Configure account"** link
- Grant Render access to your repositories
- Come back and refresh

**Screenshot Guide:**
```
┌─────────────────────────────────────────────────┐
│  Connect a repository                           │
│                                                 │
│  Puneet69/Train-Ticket-Reservation-System      │
│  main branch • Updated 2 minutes ago            │
│                               [Connect]         │
└─────────────────────────────────────────────────┘
```

---

### Step 4: Configure Service Settings

Render will auto-detect your `render.yaml` file and pre-fill most settings. Verify the following:

#### 4.1 Basic Settings

| Field | Value | Notes |
|-------|-------|-------|
| **Name** | `train-reservation-system` | Can customize if you want |
| **Region** | `Oregon (US West)` | Choose closest to your users |
| **Branch** | `main` | Default branch |
| **Runtime** | `Docker` | Auto-detected from Dockerfile |

#### 4.2 Build Settings

| Field | Value |
|-------|-------|
| **Root Directory** | `.` (leave empty) |
| **Dockerfile Path** | `./Dockerfile` |
| **Docker Context** | `.` |

#### 4.3 Plan Selection

| Plan | Cost | Features |
|------|------|----------|
| **Free** | $0/month | ✅ Choose this for testing |
| | | ⚠️ Spins down after 15 min inactivity |
| | | ⚠️ 50-second cold start delay |
| **Starter** | $7/month | ✅ Always on, no cold starts |

**For now, select FREE plan.**

**Screenshot Guide:**
```
┌─────────────────────────────────────────────────┐
│  Configure Web Service                          │
│                                                 │
│  Name: train-reservation-system                 │
│  Region: Oregon (US West)              ▼       │
│  Branch: main                          ▼       │
│  Runtime: Docker                       ▼       │
│                                                 │
│  Instance Type: Free                   ▼       │
│                                                 │
│  [Advanced ▼]                                   │
└─────────────────────────────────────────────────┘
```

---

### Step 5: Configure Environment Variables

This is **CRITICAL** - your application needs these to connect to the database.

#### 5.1 Scroll to "Environment Variables" Section

Click **"Add Environment Variable"** for each of the following:

#### 5.2 Add These 5 Variables:

**Variable 1: Database Username**
```
Key:   DB_USERNAME
Value: postgres
```

**Variable 2: Database Password**
```
Key:   DB_PASSWORD
Value: Train@Reservation01
```

**Variable 3: Database Host**
```
Key:   DB_HOST
Value: db.adozsmkdxblihnaoodiu.supabase.co
```

**Variable 4: Database Port**
```
Key:   DB_PORT
Value: 5432
```

**Variable 5: Database Name**
```
Key:   DB_NAME
Value: postgres
```

#### 5.3 Quick Copy-Paste (All Variables at Once)

Click **"Add from .env"** and paste this:

```env
DB_USERNAME=postgres
DB_PASSWORD=Train@Reservation01
DB_HOST=db.adozsmkdxblihnaoodiu.supabase.co
DB_PORT=5432
DB_NAME=postgres
```

**Screenshot Guide:**
```
┌─────────────────────────────────────────────────┐
│  Environment Variables                          │
│                                                 │
│  KEY              VALUE                         │
│  DB_USERNAME      postgres              [x]     │
│  DB_PASSWORD      ••••••••••••          [x]     │
│  DB_HOST          db.adozsmkd...        [x]     │
│  DB_PORT          5432                  [x]     │
│  DB_NAME          postgres              [x]     │
│                                                 │
│  [+ Add Environment Variable]                   │
│  [Add from .env]                                │
└─────────────────────────────────────────────────┘
```

---

### Step 6: Deploy Your Application

1. Scroll to the bottom of the page
2. Review all settings one final time
3. Click the **"Create Web Service"** button

**What happens next:**
- Render will clone your GitHub repository
- Start building your Docker image
- This takes approximately **5-7 minutes** for the first build

**Screenshot Guide:**
```
┌─────────────────────────────────────────────────┐
│                                                 │
│  You will be charged $0.00/month                │
│                                                 │
│  [Cancel]              [Create Web Service]     │
└─────────────────────────────────────────────────┘
```

---

### Step 7: Monitor the Build Process

After clicking "Create Web Service", you'll see the **deployment logs** in real-time.

#### 7.1 Build Stages to Watch For:

```
✓ Cloning repository...
✓ Building Docker image...
  ├── [build 1/9] FROM eclipse-temurin:21-jdk-jammy
  ├── [build 2/9] RUN apt-get update && apt-get install -y maven wget
  ├── [build 3/9] WORKDIR /app
  ├── [build 4/9] COPY pom.xml
  ├── [build 5/9] RUN mvn dependency:go-offline
  ├── [build 6/9] COPY src ./src
  ├── [build 7/9] COPY WebContent ./WebContent
  ├── [build 8/9] RUN mvn clean package -DskipTests
  └── [build 9/9] DONE
✓ Creating runtime image...
✓ Deploying...
✓ Service is live!
```

#### 7.2 Expected Timeline:

| Stage | Time | Description |
|-------|------|-------------|
| Clone | 10-20 sec | Downloading code from GitHub |
| Build | 3-5 min | Compiling Java code, downloading dependencies |
| Deploy | 30-60 sec | Starting the container |
| **Total** | **5-7 min** | First build is slowest |

#### 7.3 Success Indicators:

Look for these messages in the logs:
```
INFO: Starting ProtocolHandler ["http-nio-8080"]
INFO: Server startup in [XXXX] milliseconds
Your service is live 🎉
```

---

### Step 8: Get Your Live URL

Once deployment succeeds:

1. At the top of the page, you'll see your **live URL**:
   ```
   https://train-reservation-system-xxxx.onrender.com
   ```
   (The `xxxx` part is randomly generated)

2. **Copy this URL** - this is your production application!

3. Click the URL to open your application in a new tab

**Screenshot Guide:**
```
┌─────────────────────────────────────────────────┐
│  train-reservation-system                       │
│  https://train-reservation-system-xxxx.onrender.com
│  🟢 Live                                        │
│                                                 │
│  [Logs] [Metrics] [Environment] [Settings]     │
└─────────────────────────────────────────────────┘
```

---

### Step 9: Test Your Application

#### 9.1 Access the Homepage

Open: `https://your-app-name.onrender.com/`

You should see the welcome page with options:
- User Login
- Admin Login
- New User Registration

#### 9.2 Test User Login

1. Navigate to: `https://your-app-name.onrender.com/UserLogin.html`
2. Use test credentials from your database
3. Try logging in

#### 9.3 Test Admin Login

1. Navigate to: `https://your-app-name.onrender.com/AdminLogin.html`
2. Use admin credentials from your database
3. Try logging in

#### 9.4 What to Check:

- ✅ Pages load correctly (no 404 errors)
- ✅ Login forms are visible
- ✅ Database connections work (can log in)
- ✅ Booking features work
- ✅ Train search functionality works

---

## Environment Variables Configuration

### Quick Reference Table

| Variable | Purpose | Example Value |
|----------|---------|---------------|
| `DB_USERNAME` | PostgreSQL username | `postgres` |
| `DB_PASSWORD` | PostgreSQL password | `Train@Reservation01` |
| `DB_HOST` | Supabase database host | `db.adozsmkdxblihnaoodiu.supabase.co` |
| `DB_PORT` | PostgreSQL port (standard) | `5432` |
| `DB_NAME` | Database name | `postgres` |

### How to Update Environment Variables Later

1. Go to your Render Dashboard
2. Click on your service: **"train-reservation-system"**
3. Click **"Environment"** in the left sidebar
4. Click **"Add Environment Variable"** or edit existing ones
5. Click **"Save Changes"**
6. Render will **automatically redeploy** with new values

---

## Troubleshooting

### Issue 1: Build Fails - "Dockerfile not found"

**Symptoms:**
```
Error: Dockerfile not found at ./Dockerfile
```

**Solution:**
1. Go to **Settings** → **Build & Deploy**
2. Set **Dockerfile Path** to: `./Dockerfile`
3. Click **Save** and **Manual Deploy**

---

### Issue 2: Application Starts But Can't Connect to Database

**Symptoms:**
- App loads but login fails
- Error in logs: `Connection refused` or `Unknown host`

**Solution:**
1. Check **Environment** tab - verify all 5 variables are set
2. Verify Supabase database is running
3. Check Supabase connection string is correct
4. Ensure SSL mode is enabled in your database connection

---

### Issue 3: "Service Unavailable" or 502 Error

**Symptoms:**
```
502 Bad Gateway
Service temporarily unavailable
```

**Causes & Solutions:**

**Cause 1: Free Instance Spun Down**
- Free tier spins down after 15 minutes of inactivity
- **Solution:** Just wait 50-60 seconds for it to wake up
- Or upgrade to $7/month Starter plan for always-on

**Cause 2: Application Crashed**
- Check **Logs** tab for Java exceptions
- Look for `OutOfMemoryError` or `SQLException`
- **Solution:** Fix the error and redeploy

---

### Issue 4: Very Slow First Load (50+ seconds)

**This is NORMAL for Free tier!**

**Why:**
- Free instances spin down after 15 minutes inactive
- First request wakes it up (cold start = 50-60 seconds)
- Subsequent requests are fast (100-200ms)

**Solutions:**
1. **Upgrade to Starter Plan** ($7/month) - always-on, no cold starts
2. **Keep alive service** - Use cron-job.org to ping your app every 10 minutes
3. **Accept the limitation** - Fine for development/testing

---

### Issue 5: Maven Build Fails - Dependencies Download Error

**Symptoms:**
```
Could not resolve dependencies
Failed to download artifact
```

**Solution:**
1. This is usually temporary - just **retry the deployment**
2. Click **Manual Deploy** → **Clear build cache & deploy**
3. If persistent, check Maven Central is accessible from Render

---

### Issue 6: Wrong Java Version

**Symptoms:**
```
Unsupported class file major version 65
```

**Solution:**
- Your Dockerfile uses Java 21 (correct)
- This error means Render is trying to use a different Java version
- Verify Dockerfile is being used (not auto-detected buildpack)

---

## Post-Deployment Testing

### Complete Feature Test Checklist

#### User Features:
- [ ] User Registration
- [ ] User Login
- [ ] Search Trains between stations
- [ ] View Train Details
- [ ] Check Seat Availability
- [ ] Book Tickets
- [ ] Make Payment
- [ ] View Booking History
- [ ] View Profile
- [ ] Update Profile
- [ ] Change Password

#### Admin Features:
- [ ] Admin Login
- [ ] Add New Train
- [ ] View All Trains
- [ ] Search Trains
- [ ] Update Train Schedule
- [ ] Cancel Train
- [ ] View Train Details

---

## Cost & Performance

### Free Tier Limitations

| Aspect | Free Tier | Paid Tier (Starter) |
|--------|-----------|---------------------|
| **Cost** | $0/month | $7/month |
| **RAM** | 512 MB | 512 MB |
| **CPU** | Shared | Shared |
| **Uptime** | Spins down after 15 min | Always on |
| **Cold Start** | 50-60 seconds | None |
| **Monthly Hours** | 750 hours | Unlimited |
| **Custom Domain** | ✅ Yes | ✅ Yes |
| **SSL Certificate** | ✅ Free | ✅ Free |

### When to Upgrade?

**Stay on Free if:**
- Testing / development
- Personal project
- Low traffic
- Can accept 50-second delays

**Upgrade to Starter if:**
- Production application
- Real users
- Need instant response times
- Professional use case

---

## Maintenance & Updates

### How to Deploy Code Changes

1. Make changes to your code locally
2. Commit and push to GitHub:
   ```bash
   git add .
   git commit -m "Your change description"
   git push origin main
   ```
3. **Render auto-deploys** within 1-2 minutes!
4. Check **Events** tab to see deployment status

### Manual Deployment

If you need to redeploy without code changes:

1. Go to your Render Dashboard
2. Click on **"train-reservation-system"**
3. Click **"Manual Deploy"** at the top right
4. Select **"Clear build cache & deploy"** if you want a fresh build
5. Click **"Deploy"**

---

## Additional Resources

### Important URLs

| Resource | URL |
|----------|-----|
| **Render Dashboard** | https://dashboard.render.com |
| **GitHub Repository** | https://github.com/Puneet69/Train-Ticket-Reservation-System |
| **Supabase Dashboard** | https://supabase.com/dashboard |
| **Live Application** | `https://train-reservation-system-xxxx.onrender.com` |

### Render Documentation

- [Docker Deployments](https://render.com/docs/docker)
- [Environment Variables](https://render.com/docs/environment-variables)
- [Deploy Hooks](https://render.com/docs/deploy-hooks)
- [Custom Domains](https://render.com/docs/custom-domains)

### Support

- **Render Support**: support@render.com
- **Render Community**: https://community.render.com
- **GitHub Issues**: https://github.com/Puneet69/Train-Ticket-Reservation-System/issues

---

## Summary Checklist

Before considering deployment complete:

- [ ] Render account created and GitHub connected
- [ ] Web Service created from repository
- [ ] All 5 environment variables configured
- [ ] First build completed successfully (5-7 minutes)
- [ ] Live URL obtained and accessible
- [ ] Homepage loads correctly
- [ ] User login tested and working
- [ ] Admin login tested and working
- [ ] Database connection confirmed working
- [ ] At least one booking tested successfully
- [ ] Live URL added to README.md

---

## Next Steps

After successful deployment:

1. **Update README.md** with your live URL
2. **Share with users** - send them the Render URL
3. **Monitor logs** - check for any errors regularly
4. **Consider upgrading** - if you get real traffic, upgrade to Starter plan
5. **Set up custom domain** - if you want a professional URL like `trainbook.yourdomain.com`

---

**🎉 Congratulations! Your application is now live on Render!**

---

*Last Updated: November 16, 2025*
*Version: 1.0*
*Repository: Train-Ticket-Reservation-System*
