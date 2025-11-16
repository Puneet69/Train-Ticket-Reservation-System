# ⚡ Quick Start - Render Deployment

**5-Minute Setup Guide for Train Ticket Reservation System**

---

## Prerequisites ✓

- ✅ Code pushed to GitHub: `Puneet69/Train-Ticket-Reservation-System`
- ✅ Supabase database running
- ✅ Latest commit: `3e12d53`

---

## Step-by-Step (5 Minutes)

### 1️⃣ Sign Up on Render (1 min)
- Go to: https://render.com
- Click **"Sign in with GitHub"**
- Authorize Render

### 2️⃣ Create Web Service (30 sec)
- Click **"New +"** → **"Web Service"**
- Find `Train-Ticket-Reservation-System`
- Click **"Connect"**

### 3️⃣ Configure Settings (1 min)
- **Name**: `train-reservation-system`
- **Region**: `Oregon (US West)`
- **Branch**: `main`
- **Runtime**: `Docker` (auto-detected)
- **Plan**: `Free`

### 4️⃣ Add Environment Variables (2 min)

Click **"Add from .env"** and paste:

```env
DB_USERNAME=postgres
DB_PASSWORD=Train@Reservation01
DB_HOST=db.adozsmkdxblihnaoodiu.supabase.co
DB_PORT=5432
DB_NAME=postgres
```

### 5️⃣ Deploy (30 sec)
- Click **"Create Web Service"**
- Wait 5-7 minutes for build
- Get your URL: `https://train-reservation-system-xxxx.onrender.com`

### 6️⃣ Test (30 sec)
- Open: `https://your-url.onrender.com/UserLogin.html`
- Try logging in with test credentials

---

## Environment Variables Reference

| Key | Value |
|-----|-------|
| `DB_USERNAME` | `postgres` |
| `DB_PASSWORD` | `Train@Reservation01` |
| `DB_HOST` | `db.adozsmkdxblihnaoodiu.supabase.co` |
| `DB_PORT` | `5432` |
| `DB_NAME` | `postgres` |

---

## Important URLs

- **Render Dashboard**: https://dashboard.render.com
- **GitHub Repo**: https://github.com/Puneet69/Train-Ticket-Reservation-System
- **Full Manual**: See `RENDER_DEPLOYMENT_MANUAL.md`

---

## Troubleshooting Quick Fixes

| Problem | Solution |
|---------|----------|
| 502 Error | Wait 60 seconds (cold start on free tier) |
| Build Fails | Click "Manual Deploy" → "Clear build cache & deploy" |
| Login Fails | Check Environment Variables are set correctly |
| Slow Loading | Normal on free tier (50-60 sec first load) |

---

## Need Help?

📖 **Full Manual**: `RENDER_DEPLOYMENT_MANUAL.md` (comprehensive guide with screenshots)
🐛 **Issues**: https://github.com/Puneet69/Train-Ticket-Reservation-System/issues
💬 **Render Community**: https://community.render.com

---

**🎉 That's it! Your app will be live in ~7 minutes!**
