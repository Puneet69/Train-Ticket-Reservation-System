# 🚀 Deploy Train Ticket Reservation System Online

## Complete Hosting Guide - Multiple Options

Your application is ready to deploy! Here are the best options for hosting your Java web application online.

---

## 🎯 Quick Comparison

| Platform | Free Tier | Difficulty | Best For | Deploy Time |
|----------|-----------|------------|----------|-------------|
| **Railway** | ✅ Yes ($5 credit) | ⭐ Easy | Beginners | 5 mins |
| **Render** | ✅ Yes | ⭐⭐ Easy | Small apps | 10 mins |
| **Heroku** | ❌ Paid only | ⭐⭐ Medium | Production | 15 mins |
| **AWS Elastic Beanstalk** | ✅ 12 months | ⭐⭐⭐ Hard | Enterprise | 20 mins |
| **DigitalOcean** | ❌ $4/month | ⭐⭐⭐ Hard | Custom setup | 30 mins |

**Recommended for you**: ⭐ **Railway.app** or **Render.com** (Easiest & Free)

---

# Option 1: 🚂 Railway.app (RECOMMENDED - Easiest!)

## Why Railway?
- ✅ **$5 free credit** per month
- ✅ **Automatic HTTPS**
- ✅ **Easy GitHub integration**
- ✅ **No credit card** required initially
- ✅ **Auto-deploy** on git push
- ✅ **Built-in database** (PostgreSQL included)

## Step-by-Step Deployment

### Step 1: Prepare Your Project

Create a `Procfile` in your project root:

```bash
cd /Users/puneet/Desktop/java/Train-Ticket-Reservation-System
cat > Procfile << 'EOF'
web: java -jar target/dependency/webapp-runner.jar --port $PORT target/*.war
EOF
```

Create `railway.json` for configuration:

```bash
cat > railway.json << 'EOF'
{
  "build": {
    "builder": "NIXPACKS"
  },
  "deploy": {
    "startCommand": "java -jar target/dependency/webapp-runner.jar --port $PORT target/TrainBook-1.0.0-SNAPSHOT.war",
    "restartPolicyType": "ON_FAILURE",
    "restartPolicyMaxRetries": 10
  }
}
EOF
```

### Step 2: Update `pom.xml` for Railway

Add this plugin to your `<build><plugins>` section to ensure Maven builds on Railway:

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>3.13.0</version>
    <configuration>
        <source>21</source>
        <target>21</target>
        <release>21</release>
    </configuration>
</plugin>
```

### Step 3: Commit and Push

```bash
git add Procfile railway.json
git commit -m "Add Railway deployment configuration"
git push origin main
```

### Step 4: Deploy on Railway

1. **Go to Railway**: https://railway.app/
2. **Sign up** with GitHub (free)
3. Click **"New Project"**
4. Select **"Deploy from GitHub repo"**
5. Choose: `Puneet69/Train-Ticket-Reservation-System`
6. Railway will automatically:
   - Detect it's a Java/Maven project
   - Run `mvn clean package`
   - Start your application

### Step 5: Configure Environment Variables

In Railway dashboard:
1. Go to your project → **Variables** tab
2. Add these variables:
   ```
   DB_USERNAME=postgres
   DB_PASSWORD=Train@Reservation01
   DB_HOST=db.adozsmkdxblihnaoodiu.supabase.co
   DB_PORT=5432
   DB_NAME=postgres
   ```

### Step 6: Update `application.properties` for Environment Variables

Modify `src/application.properties` to use environment variables:

```properties
username=${DB_USERNAME:postgres}
password=${DB_PASSWORD:Train@Reservation01}
driverName=org.postgresql.Driver
connectionString=jdbc:postgresql://${DB_HOST:db.adozsmkdxblihnaoodiu.supabase.co}:${DB_PORT:5432}/${DB_NAME:postgres}?sslmode=require
```

### Step 7: Access Your Live App

Railway will provide a URL like:
```
https://your-app-name.up.railway.app
```

**Done!** 🎉 Your app is live!

---

# Option 2: 🎨 Render.com (Also Easy & Free!)

## Why Render?
- ✅ **Free tier available**
- ✅ **Automatic HTTPS**
- ✅ **Easy web interface**
- ✅ **Good documentation**

## Deployment Steps

### Step 1: Create `render.yaml`

```bash
cd /Users/puneet/Desktop/java/Train-Ticket-Reservation-System
cat > render.yaml << 'EOF'
services:
  - type: web
    name: train-reservation-system
    env: java
    buildCommand: mvn clean package -DskipTests
    startCommand: java -jar target/dependency/webapp-runner.jar --port $PORT target/TrainBook-1.0.0-SNAPSHOT.war
    envVars:
      - key: JAVA_VERSION
        value: 21
      - key: DB_USERNAME
        value: postgres
      - key: DB_PASSWORD
        value: Train@Reservation01
      - key: DB_HOST
        value: db.adozsmkdxblihnaoodiu.supabase.co
      - key: DB_PORT
        value: 5432
EOF
```

### Step 2: Deploy

1. Go to: https://render.com/
2. Sign up with GitHub
3. Click **"New +"** → **"Web Service"**
4. Connect your GitHub repository
5. Render will:
   - Auto-detect Java
   - Build with Maven
   - Deploy automatically

### Step 3: Configure

- **Name**: `train-reservation`
- **Build Command**: `mvn clean package -DskipTests`
- **Start Command**: `java -jar target/dependency/webapp-runner.jar --port $PORT target/*.war`
- **Plan**: Free

**Live URL**: `https://train-reservation.onrender.com`

---

# Option 3: 🟣 Heroku (Classic Platform)

## Why Heroku?
- ✅ **Mature platform**
- ✅ **Great documentation**
- ❌ **No free tier** (paid only)
- ✅ **Excellent Java support**

## Deployment Steps

### Step 1: Install Heroku CLI

```bash
# macOS
brew tap heroku/brew && brew install heroku

# Verify installation
heroku --version
```

### Step 2: Login and Create App

```bash
cd /Users/puneet/Desktop/java/Train-Ticket-Reservation-System

# Login to Heroku
heroku login

# Create new app
heroku create train-reservation-puneet

# Or use a custom name
heroku create your-custom-name
```

### Step 3: Create `Procfile`

```bash
cat > Procfile << 'EOF'
web: java -jar target/dependency/webapp-runner.jar --port $PORT target/*.war
EOF
```

### Step 4: Create `system.properties`

```bash
cat > system.properties << 'EOF'
java.runtime.version=21
maven.version=3.9.11
EOF
```

### Step 5: Configure Environment Variables

```bash
heroku config:set DB_USERNAME=postgres
heroku config:set DB_PASSWORD=Train@Reservation01
heroku config:set DB_HOST=db.adozsmkdxblihnaoodiu.supabase.co
heroku config:set DB_PORT=5432
heroku config:set DB_NAME=postgres
```

### Step 6: Deploy

```bash
# Add Heroku remote (if not automatically added)
heroku git:remote -a train-reservation-puneet

# Commit changes
git add Procfile system.properties
git commit -m "Add Heroku configuration"

# Deploy to Heroku
git push heroku main

# Open your app
heroku open
```

### Step 7: View Logs

```bash
# View real-time logs
heroku logs --tail

# Check app status
heroku ps
```

**Live URL**: `https://train-reservation-puneet.herokuapp.com`

---

# Option 4: ☁️ AWS Elastic Beanstalk (Enterprise-Grade)

## Why AWS?
- ✅ **12 months free tier**
- ✅ **Scalable**
- ✅ **Enterprise features**
- ⚠️ **More complex setup**

## Deployment Steps

### Step 1: Install AWS CLI and EB CLI

```bash
# Install AWS CLI
brew install awscli

# Install Elastic Beanstalk CLI
brew install aws-elasticbeanstalk

# Verify
eb --version
```

### Step 2: Configure AWS Credentials

```bash
aws configure
# Enter your:
# - AWS Access Key ID
# - AWS Secret Access Key
# - Default region: us-east-1
# - Output format: json
```

### Step 3: Initialize Elastic Beanstalk

```bash
cd /Users/puneet/Desktop/java/Train-Ticket-Reservation-System

# Initialize EB
eb init -p "Tomcat 8.5 with Corretto 21" train-reservation --region us-east-1

# Select options:
# - Application name: train-reservation
# - Platform: Tomcat 8.5
# - Use CodeCommit: No
# - SSH: Yes (for debugging)
```

### Step 4: Create Environment

```bash
# Create environment (this takes 5-10 minutes)
eb create train-reservation-env \
  --instance-type t2.micro \
  --envvars DB_USERNAME=postgres,DB_PASSWORD=Train@Reservation01,DB_HOST=db.adozsmkdxblihnaoodiu.supabase.co
```

### Step 5: Deploy

```bash
# Build WAR file
mvn clean package -DskipTests

# Deploy to AWS
eb deploy

# Open your application
eb open
```

### Step 6: Manage Environment

```bash
# View status
eb status

# View logs
eb logs

# SSH into instance
eb ssh

# Terminate (to avoid charges)
eb terminate train-reservation-env
```

**Live URL**: Auto-generated AWS URL

---

# Option 5: 🌊 DigitalOcean (VPS - Full Control)

## Why DigitalOcean?
- ✅ **Full server control**
- ✅ **Simple pricing** ($4-6/month)
- ⚠️ **Manual setup required**
- ✅ **Great for learning**

## Deployment Steps

### Step 1: Create Droplet

1. Go to: https://digitalocean.com
2. Create account (get $200 credit with GitHub Student Pack)
3. **Create Droplet**:
   - **Image**: Ubuntu 22.04 LTS
   - **Plan**: Basic ($4/month)
   - **Datacenter**: Choose nearest
   - **Authentication**: SSH key (recommended)

### Step 2: Connect to Server

```bash
# SSH into your droplet
ssh root@your_droplet_ip
```

### Step 3: Install Java 21

```bash
# Update system
apt update && apt upgrade -y

# Install Java 21
apt install -y openjdk-21-jdk

# Verify
java -version
```

### Step 4: Install and Configure Tomcat

```bash
# Create tomcat user
useradd -m -d /opt/tomcat -U -s /bin/false tomcat

# Download Tomcat 10
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.33/bin/apache-tomcat-10.1.33.tar.gz

# Extract
tar xzvf apache-tomcat-10*tar.gz -C /opt/tomcat --strip-components=1

# Set permissions
chown -R tomcat:tomcat /opt/tomcat/
chmod -R u+x /opt/tomcat/bin
```

### Step 5: Upload WAR File

```bash
# From your local machine
scp target/TrainBook-1.0.0-SNAPSHOT.war root@your_droplet_ip:/opt/tomcat/webapps/

# Or use FileZilla/WinSCP to upload
```

### Step 6: Configure Systemd Service

```bash
# Create service file
cat > /etc/systemd/system/tomcat.service << 'EOF'
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment="JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd
systemctl daemon-reload

# Start Tomcat
systemctl start tomcat
systemctl enable tomcat

# Check status
systemctl status tomcat
```

### Step 7: Configure Firewall

```bash
# Allow HTTP and HTTPS
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 8080/tcp
ufw enable
```

### Step 8: Setup Nginx Reverse Proxy

```bash
# Install Nginx
apt install -y nginx

# Create Nginx config
cat > /etc/nginx/sites-available/train-reservation << 'EOF'
server {
    listen 80;
    server_name your_domain.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

# Enable site
ln -s /etc/nginx/sites-available/train-reservation /etc/nginx/sites-enabled/
nginx -t
systemctl restart nginx
```

### Step 9: Setup SSL (Optional but Recommended)

```bash
# Install Certbot
apt install -y certbot python3-certbot-nginx

# Get SSL certificate
certbot --nginx -d your_domain.com

# Auto-renewal
certbot renew --dry-run
```

**Access**: `http://your_droplet_ip` or `https://your_domain.com`

---

# 🔧 Required Configuration Changes

## Update `application.properties` for Production

Create a production version that reads from environment variables:

```bash
# Edit src/application.properties
cat > src/application.properties << 'EOF'
username=${DB_USERNAME:postgres}
password=${DB_PASSWORD:Train@Reservation01}
driverName=org.postgresql.Driver
connectionString=jdbc:postgresql://${DB_HOST:db.adozsmkdxblihnaoodiu.supabase.co}:${DB_PORT:5432}/${DB_NAME:postgres}?sslmode=require
EOF
```

## Create `.gitignore` Entry

Ensure sensitive data is not committed:

```bash
# Add to .gitignore
echo "src/application.properties" >> .gitignore
echo "!src/application.properties.example" >> .gitignore
```

---

# 📊 Cost Comparison

| Platform | Free Tier | Paid Tier | Best Use Case |
|----------|-----------|-----------|---------------|
| **Railway** | $5 credit/month | $5+/month | Quick demo |
| **Render** | 750 hrs/month | $7+/month | Small app |
| **Heroku** | None | $7+/month | Production |
| **AWS EB** | 12 months free | $10+/month | Enterprise |
| **DigitalOcean** | $200 credit | $4+/month | Learning |

---

# 🎯 Recommended Approach for You

## Best Option: Railway.app

**Why?**
1. ✅ Easiest setup (5 minutes)
2. ✅ Free $5 credit per month
3. ✅ Auto-deploy from GitHub
4. ✅ Built-in HTTPS
5. ✅ Already using Supabase (perfect combo!)

## Quick Start:

```bash
cd /Users/puneet/Desktop/java/Train-Ticket-Reservation-System

# Create Procfile
echo "web: java -jar target/dependency/webapp-runner.jar --port \$PORT target/*.war" > Procfile

# Commit
git add Procfile
git commit -m "Add Procfile for Railway deployment"
git push origin main

# Then go to railway.app and deploy!
```

---

# 🔒 Security Checklist Before Deployment

- [ ] Change default passwords (admin/admin, shashi/shashi)
- [ ] Use environment variables for database credentials
- [ ] Enable HTTPS (most platforms do this automatically)
- [ ] Add rate limiting for login attempts
- [ ] Update Supabase RLS policies
- [ ] Review SQL injection prevention
- [ ] Test session timeout
- [ ] Add error page instead of stack traces

---

# 📝 Post-Deployment Steps

1. **Test All Features**:
   - User registration
   - User login
   - Train search
   - Booking
   - Admin panel

2. **Monitor Performance**:
   - Check response times
   - Monitor database queries
   - Watch error logs

3. **Setup Monitoring** (Optional):
   - Use platform's built-in monitoring
   - Setup Supabase alerts
   - Configure email notifications

4. **Share Your Project**:
   - Update README with live URL
   - Add screenshots
   - Share on LinkedIn/Portfolio

---

# 🆘 Troubleshooting

## Common Issues:

### 1. "Port already in use"
```bash
# Railway/Render use $PORT variable automatically
# Make sure your Procfile has: --port $PORT
```

### 2. "Database connection failed"
```bash
# Check environment variables are set
# Verify Supabase allows connections from deployment IP
```

### 3. "ClassNotFoundException"
```bash
# Ensure all dependencies are in pom.xml
# Run: mvn clean package -DskipTests
```

### 4. "Out of memory"
```bash
# Add to Procfile:
web: java -Xmx512m -jar target/dependency/webapp-runner.jar --port $PORT target/*.war
```

---

# 📚 Additional Resources

- Railway Docs: https://docs.railway.app/
- Render Docs: https://render.com/docs
- Heroku Java: https://devcenter.heroku.com/articles/getting-started-with-java
- AWS EB: https://docs.aws.amazon.com/elasticbeanstalk/
- Supabase: https://supabase.com/docs

---

**Ready to deploy?** Choose a platform above and follow the steps!

**Need help?** Let me know which platform you want to use and I'll guide you through it step-by-step! 🚀
