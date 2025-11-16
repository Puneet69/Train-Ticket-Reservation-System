# 📊 Render Deployment Flowchart

**Visual Guide for Deploying Train Ticket Reservation System**

---

## Deployment Flow Diagram

```
START
  │
  ├─► Step 1: Sign Up / Login to Render
  │   └─► https://render.com
  │       └─► "Sign in with GitHub"
  │
  ├─► Step 2: Create New Web Service
  │   └─► Dashboard → "New +" → "Web Service"
  │
  ├─► Step 3: Connect Repository
  │   └─► Select "Train-Ticket-Reservation-System"
  │       └─► Click "Connect"
  │
  ├─► Step 4: Auto-Configuration
  │   ├─► Name: train-reservation-system
  │   ├─► Region: Oregon (US West)
  │   ├─► Branch: main
  │   ├─► Runtime: Docker (auto-detected)
  │   └─► Plan: Free
  │
  ├─► Step 5: Environment Variables
  │   ├─► DB_USERNAME=postgres
  │   ├─► DB_PASSWORD=Train@Reservation01
  │   ├─► DB_HOST=db.adozsmkdxblihnaoodiu.supabase.co
  │   ├─► DB_PORT=5432
  │   └─► DB_NAME=postgres
  │
  ├─► Step 6: Click "Create Web Service"
  │   │
  │   ├─► [Build Process Starts]
  │   │   │
  │   │   ├─► Clone Repository (20 sec)
  │   │   │   └─► ✓ Code downloaded from GitHub
  │   │   │
  │   │   ├─► Docker Build (3-5 min)
  │   │   │   ├─► Install Java 21
  │   │   │   ├─► Install Maven & wget
  │   │   │   ├─► Download dependencies
  │   │   │   ├─► Compile Java code
  │   │   │   ├─► Build WAR file
  │   │   │   └─► Download webapp-runner
  │   │   │
  │   │   ├─► Create Runtime Image (1 min)
  │   │   │   └─► Copy WAR + webapp-runner
  │   │   │
  │   │   └─► Deploy Container (30 sec)
  │   │       └─► Start application on port 8080
  │   │
  │   └─► [Build Complete]
  │       │
  │       └─► SUCCESS? ──┬─► YES → Go to Step 7
  │                       │
  │                       └─► NO → Troubleshoot
  │                           ├─► Check logs
  │                           ├─► Verify Dockerfile
  │                           ├─► Check env variables
  │                           └─► Retry deployment
  │
  ├─► Step 7: Get Live URL
  │   └─► https://train-reservation-system-xxxx.onrender.com
  │       └─► Copy and save this URL
  │
  ├─► Step 8: Test Application
  │   ├─► Visit homepage
  │   ├─► Test user login
  │   ├─► Test admin login
  │   └─► Test booking feature
  │
  └─► DEPLOYED! 🎉
      │
      └─► Monitor & Maintain
          ├─► Check logs regularly
          ├─► Update code (auto-deploys)
          └─► Consider upgrading plan

```

---

## Build Process Detailed Flow

```
Docker Build Stages:
═══════════════════

Stage 1: Build Image
┌─────────────────────────────────────────────────┐
│  FROM eclipse-temurin:21-jdk-jammy              │
│  ↓                                              │
│  Install: Maven + wget                          │
│  ↓                                              │
│  Copy: pom.xml                                  │
│  ↓                                              │
│  Download: Dependencies (offline)               │
│  ↓                                              │
│  Copy: src/ + WebContent/                       │
│  ↓                                              │
│  Execute: mvn clean package                     │
│  ↓                                              │
│  Output: TrainBook-1.0.0-SNAPSHOT.war (11MB)    │
│  ↓                                              │
│  Output: webapp-runner.jar (9.1MB)              │
└─────────────────────────────────────────────────┘
                       ↓
Stage 2: Runtime Image
┌─────────────────────────────────────────────────┐
│  FROM eclipse-temurin:21-jre-jammy              │
│  ↓                                              │
│  Copy: app.war (from build stage)               │
│  ↓                                              │
│  Copy: webapp-runner.jar (from build stage)     │
│  ↓                                              │
│  Expose: Port 8080                              │
│  ↓                                              │
│  CMD: java -jar webapp-runner.jar app.war       │
└─────────────────────────────────────────────────┘
                       ↓
                 Final Image
              (~380 MB total)
```

---

## Environment Variables Flow

```
Application Startup:
═══════════════════

render.yaml
   │
   ├─► DB_USERNAME ──┐
   ├─► DB_PASSWORD ──┤
   ├─► DB_HOST ──────┼─► Render Platform
   ├─► DB_PORT ──────┤   (Sets env variables)
   └─► DB_NAME ──────┘
          │
          ↓
   Container Starts
          │
          ↓
   application.properties reads:
   ├─► ${DB_USERNAME:postgres}
   ├─► ${DB_PASSWORD:Train@Reservation01}
   ├─► ${DB_HOST:db.adozsmkdxblihnaoodiu.supabase.co}
   ├─► ${DB_PORT:5432}
   └─► ${DB_NAME:postgres}
          │
          ↓
   DBUtil.java builds connection string:
   jdbc:postgresql://HOST:PORT/DATABASE?sslmode=require
          │
          ↓
   Connection Pool Created
          │
          ↓
   Application Ready! ✓
```

---

## Decision Tree: Troubleshooting

```
Deployment Failed?
       │
       ├─► Build Failed?
       │   ├─► YES → Check Docker build logs
       │   │         ├─► "Dockerfile not found"
       │   │         │   └─► Set Dockerfile Path: ./Dockerfile
       │   │         │
       │   │         ├─► Maven errors
       │   │         │   └─► Retry with cache clear
       │   │         │
       │   │         └─► wget error
       │   │             └─► Check webapp-runner URL
       │   │
       │   └─► NO → Build succeeded but...
       │
       ├─► App Won't Start?
       │   ├─► Check application logs
       │   ├─► Look for SQLException
       │   │   └─► Verify environment variables
       │   └─► Look for OutOfMemoryError
       │       └─► Free tier has 512MB RAM limit
       │
       ├─► 502 Bad Gateway?
       │   ├─► Free tier cold start?
       │   │   └─► Wait 60 seconds, retry
       │   └─► App crashed?
       │       └─► Check logs for exceptions
       │
       └─► Login Not Working?
           ├─► Check database connection
           │   └─► Verify Supabase is running
           └─► Check environment variables
               └─► DB_HOST, DB_PASSWORD correct?
```

---

## Timeline Chart

```
Deployment Timeline (First Time):
═════════════════════════════════

Min 0 ├─────────────────────────────────────────────┐
      │ Click "Create Web Service"                  │
      │                                             │
Min 1 ├─── Clone Repository ──────────────────────┐│
      │    ✓ GitHub → Render                      ││
      │                                            ││
Min 2 ├─── Docker Build Starts ──────────────────┐││
      │    • Pull base image (JDK 21)            │││
      │    • Install Maven + wget                │││
      │                                           │││
Min 3 │    • Download dependencies               │││
      │                                           │││
Min 4 │    • Compile Java code                   │││
      │    • Build WAR file                       │││
      │                                           │││
Min 5 │    • Download webapp-runner              │││
      │    ✓ Build complete                       │││
      │                                           │││
Min 6 ├─── Create Runtime Image ────────────────┐│││
      │    • Copy artifacts                     ││││
      │    ✓ Image ready                        ││││
      │                                          ││││
Min 7 ├─── Deploy & Start ─────────────────────┐││││
      │    • Container starting                ││││
      │    • Tomcat initializing               ││││
      │    ✓ Application live!                 ││││
      │                                         ││││
      └────────────────────────────────────────┘│││
                                                 │││
      🎉 DEPLOYMENT COMPLETE                     │││
         Your app is now accessible at:          │││
         https://...onrender.com                 │││
                                                 │││
═════════════════════════════════════════════════┘│
                                                   │
Subsequent Deploys: 3-5 minutes (cache used)      │
═════════════════════════════════════════════════┘
```

---

## User Journey Flow

```
User Access Flow:
════════════════

User Types URL
      │
      ↓
https://train-reservation-system-xxxx.onrender.com
      │
      ├─► First Visit (Cold Start on Free Tier)
      │   ├─► Instance Spun Down
      │   ├─► Render Detects Request
      │   ├─► Wakes Up Container (50 sec)
      │   ├─► Tomcat Starts
      │   └─► Page Loads
      │
      └─► Subsequent Visits (Instance Warm)
          ├─► Request → Response (100-200ms)
          └─► Fast! ✓
              │
              ├─► /UserLogin.html
              │   └─► Login Form
              │       ├─► Submit Credentials
              │       ├─► DBUtil.getConnection()
              │       ├─► Query Database
              │       └─► Redirect to UserHome
              │
              ├─► /AdminLogin.html
              │   └─► Admin Login Form
              │       ├─► Validate Admin
              │       └─► Redirect to AdminHome
              │
              └─► /BookTrains.html
                  └─► Search & Book
                      ├─► Search Trains
                      ├─► Check Availability
                      ├─► Select Seats
                      ├─► Payment
                      └─► Confirmation
```

---

## Cost & Performance Comparison

```
Plan Comparison Chart:
═════════════════════

FREE TIER                          STARTER ($7/mo)
┌─────────────────────┐            ┌─────────────────────┐
│ Cost: $0/month      │            │ Cost: $7/month      │
│ RAM: 512 MB         │            │ RAM: 512 MB         │
│ CPU: Shared         │            │ CPU: Shared         │
│ ─────────────────── │            │ ─────────────────── │
│ Uptime:             │            │ Uptime:             │
│   Spins down after  │            │   Always On ✓       │
│   15 min inactivity │            │                     │
│                     │            │ Cold Start:         │
│ Cold Start:         │            │   None ✓            │
│   50-60 seconds ⚠   │            │                     │
│                     │            │ Response Time:      │
│ Response Time:      │            │   100-200ms ✓       │
│   After warmup:     │            │                     │
│   100-200ms ✓       │            │ Monthly Hours:      │
│                     │            │   Unlimited ✓       │
│ Monthly Hours:      │            │                     │
│   750 hours         │            │ SSL: Free ✓         │
│                     │            │ Custom Domain: ✓    │
│ SSL: Free ✓         │            │                     │
│ Custom Domain: ✓    │            │ Best for:           │
│                     │            │ • Production        │
│ Best for:           │            │ • Real users        │
│ • Testing           │            │ • Business apps     │
│ • Development       │            │ • 24/7 availability │
│ • Personal projects │            │                     │
└─────────────────────┘            └─────────────────────┘
```

---

## File Structure Reference

```
Project Files Used in Deployment:
═════════════════════════════════

Train-Ticket-Reservation-System/
├── Dockerfile ─────────────────────► Multi-stage build config
│   ├── Stage 1: Build (JDK 21 + Maven)
│   └── Stage 2: Runtime (JRE 21 + WAR)
│
├── render.yaml ────────────────────► Render configuration
│   ├── Service type: web
│   ├── Runtime: docker
│   ├── Plan: free
│   └── Environment variables (5)
│
├── pom.xml ────────────────────────► Maven build config
│   ├── Dependencies
│   ├── Build plugins
│   └── WAR packaging
│
├── src/
│   ├── application.properties ────► Database config
│   │   └── Uses ${ENV_VAR:default} pattern
│   │
│   └── com/shashi/
│       ├── beans/ ─────────────────► Data models
│       ├── service/ ───────────────► Business logic
│       ├── servlets/ ──────────────► HTTP handlers
│       └── utility/
│           └── DBUtil.java ────────► Database connection
│
├── WebContent/ ────────────────────► Web pages
│   ├── *.html ─────────────────────► User interface
│   ├── *.css ──────────────────────► Styling
│   └── WEB-INF/
│       └── web.xml ────────────────► Servlet mapping
│
└── target/ ────────────────────────► Build output (generated)
    ├── TrainBook-1.0.0-SNAPSHOT.war
    └── dependency/
        └── webapp-runner.jar
```

---

## Network Architecture

```
Production Architecture on Render:
═══════════════════════════════════

Internet
   │
   ↓
Render Edge Network (CDN)
   │
   ↓
Load Balancer
   │
   ↓
┌─────────────────────────────────────────────┐
│ Docker Container                            │
│ ┌─────────────────────────────────────────┐ │
│ │ Java 21 Runtime (JRE)                   │ │
│ │ ┌─────────────────────────────────────┐ │ │
│ │ │ webapp-runner (Tomcat 8.0.30)       │ │ │
│ │ │ Port: 8080                          │ │ │
│ │ │ ┌─────────────────────────────────┐ │ │ │
│ │ │ │ TrainBook.war                   │ │ │ │
│ │ │ │ ├─ Servlets                     │ │ │ │
│ │ │ │ ├─ Business Logic               │ │ │ │
│ │ │ │ └─ Database Connection Pool     │ │ │ │
│ │ │ └─────────────────────────────────┘ │ │ │
│ │ └─────────────────────────────────────┘ │ │
│ └─────────────────────────────────────────┘ │
└─────────────────────────────────────────────┘
   │
   │ JDBC Connection (SSL)
   │ jdbc:postgresql://...?sslmode=require
   │
   ↓
┌─────────────────────────────────────────────┐
│ Supabase PostgreSQL Database                │
│ Host: db.adozsmkdxblihnaoodiu.supabase.co   │
│ Port: 5432                                  │
│ Database: postgres                          │
│ User: postgres                              │
└─────────────────────────────────────────────┘
```

---

## Summary: What Happens When You Deploy

```
Complete Deployment Process:
═══════════════════════════

1. Configuration
   └─► render.yaml defines infrastructure
   
2. GitHub Connection
   └─► Render clones repository
   
3. Docker Build
   ├─► Build Stage
   │   ├─► Install Java 21 + Maven
   │   ├─► Download dependencies
   │   ├─► Compile code
   │   └─► Create WAR file
   └─► Runtime Stage
       ├─► Copy WAR + webapp-runner
       └─► Create final image
       
4. Container Deployment
   ├─► Start container
   ├─► Inject environment variables
   ├─► Start Tomcat on port 8080
   └─► Health check passes
   
5. Live!
   ├─► Assign URL
   ├─► SSL certificate (automatic)
   └─► Accept traffic

6. Continuous Deployment
   └─► Push to GitHub → Auto-deploys
```

---

**Need detailed instructions? See `RENDER_DEPLOYMENT_MANUAL.md`**
