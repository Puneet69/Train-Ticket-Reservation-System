# 🚂 Train Ticket Reservation System

<div align="center">

![Java](https://img.shields.io/badge/Java-21-orange?style=for-the-badge&logo=java)
![Servlet](https://img.shields.io/badge/Servlet-4.0-blue?style=for-the-badge)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Cloud-blue?style=for-the-badge&logo=postgresql)
![Maven](https://img.shields.io/badge/Maven-3.13.0-red?style=for-the-badge&logo=apache-maven)
![Supabase](https://img.shields.io/badge/Supabase-Database-green?style=for-the-badge&logo=supabase)

**A modern, cloud-enabled train ticket reservation system built with enterprise Java technologies**

[Features](#-features) • [Technology Stack](#-complete-technology-stack) • [Setup Guide](#-complete-setup-guide) • [Architecture](#-system-architecture--workflow) • [Screenshots](#-application-screenshots)

</div>

---

## 📖 Project Overview

### What is This Project?

The **Train Ticket Reservation System** is a comprehensive web-based application that digitizes and automates the entire train ticket booking process. This system provides a secure, efficient, and user-friendly platform for passengers to search trains, check availability, book tickets, and manage their reservations online - eliminating the need for physical ticket counters and long queues.

### Problem Statement

Traditional train ticket booking faces several challenges:
- ⏰ **Long waiting times** at ticket counters
- 📝 **Manual booking errors** and inefficiencies
- 🔍 **Limited visibility** of train schedules and availability
- 💳 **Lack of payment flexibility** and booking history
- 👥 **Resource-intensive** manual management by railway staff

### Solution Provided

This application solves these problems by providing:
- ✅ **24/7 Online Booking**: Book tickets anytime, anywhere
- ✅ **Real-time Availability**: Instant seat availability checking
- ✅ **Secure Transactions**: Safe payment processing and data management
- ✅ **Booking History**: Complete transaction records for users
- ✅ **Admin Control**: Centralized train and schedule management
- ✅ **Cloud Database**: Reliable, scalable, and globally accessible data storage

---

## 🎯 Key Features

### 👤 User Features

| Feature | Description |
|---------|-------------|
| **User Registration** | New users can create accounts with email verification |
| **Secure Login** | Session-based authentication with password encryption |
| **Search Trains** | Search trains between source and destination stations |
| **View Train Schedule** | Complete train timetable with departure/arrival times |
| **Check Availability** | Real-time seat availability for specific trains and dates |
| **Fare Enquiry** | Check ticket prices between any two stations |
| **Book Tickets** | Online ticket booking with seat selection |
| **Payment Integration** | Secure payment gateway for ticket transactions |
| **Booking History** | View all past and current bookings with details |
| **Profile Management** | Update personal information and contact details |
| **Change Password** | Secure password modification functionality |

### 🔑 Admin Features

| Feature | Description |
|---------|-------------|
| **Admin Dashboard** | Centralized control panel for all operations |
| **Add Trains** | Create new train schedules with complete details |
| **Update Trains** | Modify train information, fares, and seat capacity |
| **Cancel Trains** | Remove trains from the system when needed |
| **View All Trains** | Complete list of all trains in the database |
| **Search Trains** | Filter and find specific trains quickly |
| **Manage Users** | View user registrations and booking patterns |
| **System Monitoring** | Track system usage and booking statistics |

---

## 💻 Complete Technology Stack

### Why Each Technology Was Chosen

#### 🔧 Backend Technologies

##### 1. **Java 21 (LTS - Long Term Support)**
- **What**: Latest Long-Term Support version of Java with modern features
- **Why Used**:
  - ✅ **Performance**: Up to 30% faster than Java 8 with improved JVM
  - ✅ **Security**: Latest security patches and vulnerability fixes
  - ✅ **Modern Features**: Pattern matching, records, text blocks for cleaner code
  - ✅ **Long-term Support**: Guaranteed updates until 2031
  - ✅ **Industry Standard**: Used by major enterprises worldwide
- **Where Useful**: Enterprise applications requiring stability, security, and performance

##### 2. **Java Servlets 4.0 (Java EE)**
- **What**: Server-side Java components for handling HTTP requests
- **Why Used**:
  - ✅ **Lightweight**: No heavy framework overhead like Spring
  - ✅ **Performance**: Direct request handling with minimal abstraction
  - ✅ **Container Support**: Works with any servlet container (Tomcat, Jetty, etc.)
  - ✅ **Simplicity**: Easy to understand and debug
  - ✅ **Control**: Fine-grained control over request/response cycle
- **Where Useful**: Mid-sized web applications, learning servlet architecture, projects requiring minimal dependencies

##### 3. **Apache Maven 3.13.0**
- **What**: Build automation and dependency management tool
- **Why Used**:
  - ✅ **Dependency Management**: Automatic library download and version control
  - ✅ **Build Lifecycle**: Standardized compile, test, package workflow
  - ✅ **Project Structure**: Convention over configuration approach
  - ✅ **Plugin Ecosystem**: Extensive plugins for testing, deployment, etc.
  - ✅ **Industry Standard**: Used in 70% of Java projects
- **Where Useful**: Any Java project requiring dependency management and automated builds

##### 4. **Apache Tomcat 8.0.30**
- **What**: Lightweight servlet container and web server
- **Why Used**:
  - ✅ **Lightweight**: Only ~10MB, minimal resource usage
  - ✅ **Fast Startup**: Boots in seconds
  - ✅ **Servlet Support**: Full Java EE servlet implementation
  - ✅ **Embedded Mode**: Can run as embedded server via webapp-runner
  - ✅ **Production Ready**: Powers millions of websites globally
- **Where Useful**: Servlet-based applications, microservices, embedded web servers

#### 🎨 Frontend Technologies

##### 5. **HTML5**
- **What**: Latest HTML standard for web markup
- **Why Used**:
  - ✅ **Semantic Elements**: Better structure and accessibility
  - ✅ **Form Validation**: Built-in input validation
  - ✅ **Browser Support**: Universal compatibility
  - ✅ **SEO Friendly**: Better search engine optimization
- **Where Useful**: Any web application requiring standard markup

##### 6. **CSS3**
- **What**: Cascading Style Sheets for visual presentation
- **Why Used**:
  - ✅ **Responsive Design**: Media queries for mobile compatibility
  - ✅ **Modern Styling**: Gradients, shadows, animations
  - ✅ **Layout Control**: Flexbox and Grid for complex layouts
  - ✅ **Cross-browser**: Consistent styling across browsers
- **Where Useful**: Professional, visually appealing web interfaces

##### 7. **Bootstrap 4/5**
- **What**: Popular CSS framework for responsive design
- **Why Used**:
  - ✅ **Responsive Grid**: 12-column grid system for all screen sizes
  - ✅ **Pre-built Components**: Buttons, forms, cards, modals, etc.
  - ✅ **Mobile-First**: Optimized for mobile devices by default
  - ✅ **Fast Development**: Reduces CSS coding time by 60%
  - ✅ **Consistency**: Uniform design across all pages
- **Where Useful**: Rapid development, responsive web applications, professional UI

##### 8. **JavaScript (Vanilla)**
- **What**: Client-side scripting for dynamic behavior
- **Why Used**:
  - ✅ **No Framework Overhead**: Faster page loads, no library dependencies
  - ✅ **Form Validation**: Client-side input validation before submission
  - ✅ **DOM Manipulation**: Dynamic content updates without page reload
  - ✅ **User Interaction**: Enhanced user experience with real-time feedback
  - ✅ **Universal Support**: Works in all browsers without transpilation
- **Where Useful**: Interactive web forms, dynamic content, real-time validations

#### 🗄️ Database Technologies

##### 9. **PostgreSQL (via Supabase Cloud)**
- **What**: Advanced open-source relational database hosted on cloud
- **Why Used**:
  - ✅ **ACID Compliance**: Guaranteed data integrity and transaction safety
  - ✅ **Advanced Features**: Support for JSON, full-text search, complex queries
  - ✅ **Scalability**: Handles millions of records efficiently
  - ✅ **Open Source**: No licensing costs, community-driven
  - ✅ **Standards Compliant**: Full SQL standard support
- **Where Useful**: Applications requiring complex queries, data integrity, and reliability

##### 10. **Supabase (Database as a Service)**
- **What**: Open-source Firebase alternative providing PostgreSQL hosting
- **Why Used**:
  - ✅ **Free Tier**: 500 MB database, 50,000 monthly active users
  - ✅ **Automatic Backups**: Daily automated backups for data safety
  - ✅ **SSL/TLS Encryption**: Secure data transmission by default
  - ✅ **Global CDN**: Fast database access from anywhere
  - ✅ **Web Interface**: Easy database management via GUI
  - ✅ **Zero Maintenance**: No server setup or maintenance required
  - ✅ **Real-time Subscriptions**: Built-in real-time capabilities
  - ✅ **RESTful API**: Auto-generated APIs for database access
- **Where Useful**: Startups, MVPs, projects requiring quick deployment without infrastructure management

##### 11. **JDBC (Java Database Connectivity)**
- **What**: Java API for database connections and operations
- **Why Used**:
  - ✅ **Database Independence**: Works with any SQL database
  - ✅ **Connection Pooling**: Efficient database connection management
  - ✅ **Prepared Statements**: Protection against SQL injection attacks
  - ✅ **Transaction Support**: Commit/rollback functionality
  - ✅ **Native Java**: No additional frameworks required
- **Where Useful**: Java applications requiring database operations

---

## 🏗️ System Architecture & Workflow

### Application Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                         CLIENT LAYER                         │
│  (Web Browser - HTML, CSS, JavaScript, Bootstrap)           │
└────────────────────────┬────────────────────────────────────┘
                         │ HTTP Request/Response
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                      WEB SERVER LAYER                        │
│              Apache Tomcat 8.0.30 (Port 8080)               │
└────────────────────────┬────────────────────────────────────┘
                         │ Servlet Container
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                    APPLICATION LAYER                         │
│                                                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │   Servlets   │  │    Beans     │  │   Services   │     │
│  │  (55 files)  │  │  (Models)    │  │  (Business)  │     │
│  │              │  │              │  │              │     │
│  │ - User       │  │ - UserBean   │  │ - UserSvc    │     │
│  │ - Admin      │  │ - TrainBean  │  │ - TrainSvc   │     │
│  │ - Booking    │  │ - HistoryBean│  │ - BookingSvc │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
│                                                              │
└────────────────────────┬────────────────────────────────────┘
                         │ JDBC Connection
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                     DATABASE LAYER                           │
│                Supabase PostgreSQL (Cloud)                   │
│                                                              │
│  ┌────────────┐ ┌────────────┐ ┌────────────┐ ┌─────────┐ │
│  │  CUSTOMER  │ │   ADMIN    │ │   TRAIN    │ │ HISTORY │ │
│  └────────────┘ └────────────┘ └────────────┘ └─────────┘ │
│                                                              │
│  SSL/TLS Encrypted Connection                               │
└─────────────────────────────────────────────────────────────┘
```

### Step-by-Step Application Workflow

#### 🔐 **User Registration & Login Flow**

```
1. User Opens Browser
   ↓
2. Navigates to http://localhost:8080/UserLogin.html
   ↓
3. Clicks "Register" → UserRegister.html
   ↓
4. Fills Registration Form:
   - Email (becomes username)
   - Password
   - First Name, Last Name
   - Address, Phone Number
   ↓
5. Clicks "Register" Button
   ↓
6. Form Data → UserRegServlet.java
   ↓
7. Servlet Validates Data:
   - Checks if email already exists
   - Validates phone number format
   - Ensures all required fields filled
   ↓
8. If Valid:
   - Calls UserService.registerUser()
   - Hashes password (security)
   - Stores in CUSTOMER table via JDBC
   - Returns success response
   ↓
9. User Redirected to Login Page
   ↓
10. User Enters Credentials
    ↓
11. UserLoginServlet.java processes:
    - Queries database: SELECT * FROM CUSTOMER WHERE MAILID=? AND PWORD=?
    - If match found → Create HTTP Session
    - Store user details in session
    ↓
12. Redirect to UserHome.html (Dashboard)
```

#### 🔍 **Train Search & Booking Flow**

```
1. User Logged In → UserHome.html
   ↓
2. Clicks "Search Trains"
   ↓
3. Fills Search Form:
   - From Station (e.g., "DELHI")
   - To Station (e.g., "MUMBAI")
   - Journey Date
   ↓
4. Clicks "Search" Button
   ↓
5. Data → UserSearchTrain.java (Servlet)
   ↓
6. Servlet Calls TrainService.searchTrains():
   - SQL Query: 
     SELECT * FROM TRAIN 
     WHERE FROM_STN=? AND TO_STN=?
   - JDBC executes query via DBUtil.java
   - PostgreSQL processes query on Supabase
   ↓
7. Results Retrieved:
   - List of TrainBean objects created
   - Each contains: Train No, Name, Seats, Fare
   ↓
8. Servlet Sets Results in Request Attribute
   ↓
9. Forwards to UserViewTrains.html
   ↓
10. JSP/HTML Displays Train List:
    - Train details in table format
    - "Book Now" button for each train
    ↓
11. User Clicks "Book Now" on Selected Train
    ↓
12. Redirected to BookTrains.html with train details
    ↓
13. User Enters:
    - Number of seats (validated against availability)
    - Journey date
    ↓
14. Clicks "Proceed to Payment"
    ↓
15. Data → BookTrains.java (Servlet)
    ↓
16. Servlet Validates:
    - Seat availability: SELECT SEATS FROM TRAIN WHERE TR_NO=?
    - Checks if requested seats ≤ available seats
    ↓
17. If Available:
    - Calculates total amount: seats × fare
    - Displays Payment.html page
    ↓
18. User Enters Payment Details:
    - Card Number, CVV, Expiry (demo mode)
    ↓
19. Clicks "Pay Now"
    ↓
20. BookTrainPayment.java processes:
    - Generates unique Transaction ID (UUID)
    - Creates booking record:
      INSERT INTO HISTORY VALUES(
        transId, userId, trainNo, date, 
        fromStn, toStn, seats, amount
      )
    - Updates train seats:
      UPDATE TRAIN SET SEATS = SEATS - ? 
      WHERE TR_NO = ?
    - Commits transaction to database
    ↓
21. If Successful:
    - Displays booking confirmation with:
      * Transaction ID
      * Train details
      * Seat numbers
      * Total amount paid
    ↓
22. Booking Saved in Database
    ↓
23. User Can View in "Booking History"
```

#### 👨‍💼 **Admin Train Management Flow**

```
1. Admin Opens Browser
   ↓
2. Navigates to http://localhost:8080/AdminLogin.html
   ↓
3. Enters Admin Credentials
   ↓
4. AdminLogin.java validates:
   - SELECT * FROM ADMIN WHERE MAILID=? AND PWORD=?
   ↓
5. If Valid → AdminHome.html (Dashboard)
   ↓
6. Admin Options:
   
   [OPTION A: ADD NEW TRAIN]
   - Clicks "Add Train"
   - Fills form: Train No, Name, From, To, Seats, Fare
   - Submits → AdminAddTrain.java
   - Servlet executes:
     INSERT INTO TRAIN VALUES(?, ?, ?, ?, ?, ?)
   - Success message displayed
   
   [OPTION B: UPDATE TRAIN]
   - Clicks "Update Train"
   - Enters Train Number to search
   - System displays current details
   - Admin modifies: Seats, Fare, Schedule
   - Submits → AdminTrainUpdate.java
   - Servlet executes:
     UPDATE TRAIN SET 
     SEATS=?, FARE=?, FROM_STN=?, TO_STN=? 
     WHERE TR_NO=?
   - Confirmation displayed
   
   [OPTION C: CANCEL TRAIN]
   - Clicks "Cancel Train"
   - Enters Train Number
   - Confirms deletion
   - AdminCancleTrain.java executes:
     DELETE FROM TRAIN WHERE TR_NO=?
   - Success message shown
   
   [OPTION D: VIEW ALL TRAINS]
   - Clicks "View Trains"
   - System queries:
     SELECT * FROM TRAIN ORDER BY TR_NO
   - Displays complete train list with all details
```

#### 🗄️ **Database Operations Flow (JDBC)**

```
1. Application Needs Data
   ↓
2. Servlet/Service Layer Called
   ↓
3. DBUtil.java (Database Utility) Invoked
   ↓
4. Connection Established:
   Class.forName("org.postgresql.Driver")
   DriverManager.getConnection(
     "jdbc:postgresql://db.adozsmkdxblihnaoodiu.supabase.co:5432/postgres?sslmode=require",
     "postgres",
     "password"
   )
   ↓
5. Connection Object Created
   ↓
6. PreparedStatement Created (prevents SQL injection):
   PreparedStatement ps = conn.prepareStatement(
     "SELECT * FROM TRAIN WHERE FROM_STN=? AND TO_STN=?"
   )
   ps.setString(1, fromStation)
   ps.setString(2, toStation)
   ↓
7. Query Executed:
   - For SELECT: ResultSet rs = ps.executeQuery()
   - For INSERT/UPDATE/DELETE: int rows = ps.executeUpdate()
   ↓
8. Data Travels via SSL/TLS:
   Application (localhost) 
   → Internet (encrypted) 
   → Supabase Cloud (db.adozsmkdxblihnaoodiu.supabase.co)
   ↓
9. PostgreSQL Processes Query:
   - Parses SQL
   - Optimizes execution plan
   - Executes on database tables
   - Returns results
   ↓
10. Results Return via Encrypted Channel
    ↓
11. Application Processes ResultSet:
    while(rs.next()) {
      TrainBean train = new TrainBean()
      train.setTrainNo(rs.getLong("TR_NO"))
      train.setTrainName(rs.getString("TR_NAME"))
      // ... populate all fields
      trainList.add(train)
    }
    ↓
12. Connection Closed (Resource Cleanup):
    rs.close()
    ps.close()
    conn.close()
    ↓
13. Data Returned to Servlet
    ↓
14. Servlet Sends to Frontend
    ↓
15. User Sees Results in Browser
```

---

## 📋 Prerequisites

### Required Software

| Software | Version | Purpose | Download Link |
|----------|---------|---------|---------------|
| **Java JDK** | 21 or higher | Run Java applications | [Oracle JDK](https://www.oracle.com/java/technologies/downloads/) |
| **Apache Maven** | 3.6+ | Build automation | [Maven Download](https://maven.apache.org/download.cgi) |
| **Git** | Latest | Version control | [Git Download](https://git-scm.com/downloads) |
| **Web Browser** | Modern (Chrome, Firefox, Edge) | Access application | Pre-installed |
| **Text Editor/IDE** | VS Code, IntelliJ, Eclipse | Code editing (optional) | [VS Code](https://code.visualstudio.com/) |

### Supabase Account (Free Tier)

| Feature | Free Tier Limit | Sufficient For |
|---------|-----------------|----------------|
| **Database Size** | 500 MB | ~100,000+ bookings |
| **Monthly Active Users** | 50,000 | Small to medium traffic |
| **Bandwidth** | 5 GB | Thousands of requests |
| **Storage** | 1 GB | Future file uploads |

**Create Account**: [https://supabase.com/dashboard](https://supabase.com/dashboard)

---

## 🛠️ Complete Setup Guide

### Step 1: Clone the Repository

```bash
# Clone from GitHub
git clone https://github.com/Puneet69/Train-Ticket-Reservation-System.git

# Navigate to project directory
cd Train-Ticket-Reservation-System



See `SUPABASE_SETUP.md` for detailed instructions.### ========== Dummy Database Initialization ===========



### 3. Configure Database ConnectionSTEP 1: Open SQL Plus OR SQL Developer



Edit `src/application.properties`:STEP 2: Login and connect to database using administrator username and password

```properties

username=postgresSTEP 3 :Execute the below command first to create a new user:

password=YOUR_PASSWORD

driverName=org.postgresql.Driver```SQL

connectionString=jdbc:postgresql://YOUR_HOST:5432/postgres?sslmode=require

```ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;  

CREATE USER RESERVATION IDENTIFIED BY MANAGER;

### 4. Build and RunGRANT DBA TO RESERVATION;

```bashCOMMIT;

# Build

mvn clean package -DskipTests```

NOTE: If the above command fails for alter session issues, try to remove first line and then execute it.

# Run

java -jar target/dependency/webapp-runner.jar target/TrainBook-1.0.0-SNAPSHOT.warSTEP 4: Now execute the below sql query in same terminal

```

```SQL

### 5. Access Application

- **User Portal**: http://localhost:8080CONNECT RESERVATION/MANAGER;

- **Admin Portal**: http://localhost:8080/AdminLogin.htmlCREATE TABLE "RESERVATION"."CUSTOMER" 

(	

## 🔑 Default Credentials"MAILID" VARCHAR2(40) PRIMARY KEY, 

"PWORD" VARCHAR2(20) NOT NULL, 

**Admin**: admin@demo.com / admin  "FNAME" VARCHAR2(20) NOT NULL, 

**User**: shashi@demo.com / shashi"LNAME" VARCHAR2(20), 

"ADDR" VARCHAR2(100), 

⚠️ Change these in production!"PHNO" NUMBER(12) NOT NULL

);

## 📊 Database Schema

CREATE TABLE "RESERVATION"."ADMIN"

### Tables(	

- **admin** - Admin accounts"MAILID" VARCHAR2(40) PRIMARY KEY, 

- **customer** - Customer accounts"PWORD" VARCHAR2(20) NOT NULL, 

- **train** - Train information"FNAME" VARCHAR2(20) NOT NULL, 

- **history** - Booking records"LNAME" VARCHAR2(20), 

"ADDR" VARCHAR2(100), 

## 🚀 Deployment"PHNO" NUMBER(12) NOT NULL

);

Cloud-ready! Deploy to:

- AWS (Elastic Beanstalk, EC2)

- Azure (App Service)CREATE TABLE "RESERVATION"."TRAIN" 

- Google Cloud (App Engine)(	

- Heroku / Railway"TR_NO" NUMBER(10) PRIMARY KEY, 

"TR_NAME" VARCHAR2(70) NOT NULL, 

Database already on Supabase (500 MB free, auto-backups, SSL)."FROM_STN" VARCHAR2(20) NOT NULL, 

"TO_STN" VARCHAR2(20) NOT NULL, 

## 🧪 Testing"SEATS" NUMBER(4) NOT NULL, 

"FARE" NUMBER(6,2) NOT NULL 

```bash);

# Run automated tests

bash test-complete-app.shCREATE TABLE "RESERVATION"."HISTORY" 

(	

# See manual testing guide"TRANSID" VARCHAR2(36) PRIMARY KEY, 

bash manual-test-guide.sh"MAILID" VARCHAR2(40) REFERENCES "RESERVATION"."CUSTOMER"(MAILID), 

```"TR_NO" NUMBER(10),

"DATE" DATE,

## 📝 Key Endpoints"FROM_STN" VARCHAR2(20) NOT NULL, 

"TO_STN" VARCHAR2(20) NOT NULL, 

### User"SEATS" NUMBER(3) NOT NULL, 

- POST `/userlogin` - Login"AMOUNT" NUMBER(8,2) NOT NULL

- POST `/searchtrains` - Search trains);

- POST `/booktrains` - Book ticket

- GET `/history` - Booking historyCOMMIT;



### AdminINSERT INTO RESERVATION.ADMIN VALUES('admin@demo.com','admin','System','Admin','Demo Address 123 colony','9874561230');

- POST `/adminlogin` - LoginINSERT INTO RESERVATION.CUSTOMER VALUES('shashi@demo.com','shashi','Shashi','Raj','Kolkata, West Bengal',954745222);

- POST `/addtrain` - Add train

- POST `/updatetrain` - Update trainINSERT INTO RESERVATION.TRAIN VALUES(10001,'JODHPUR EXP','HOWRAH','JODHPUR', 152, 490.50);

- POST `/canceltrain` - Cancel trainINSERT INTO RESERVATION.TRAIN VALUES(10002,'YAMUNA EXP','GAYA','DELHI', 52, 550.50);

INSERT INTO RESERVATION.TRAIN VALUES(10003,'NILANCHAL EXP','GAYA','HOWRAH', 92, 451);

## 🔒 SecurityINSERT INTO RESERVATION.TRAIN VALUES(10004,'JAN SATABDI EXP','RANCHI','PATNA', 182, 550);

INSERT INTO RESERVATION.TRAIN VALUES(10005,'GANGE EXP','MUMBAI','KERALA', 12, 945);

- Password authenticationINSERT INTO RESERVATION.TRAIN VALUES(10006,'GARIB RATH EXP','PATNA','DELHI', 1, 1450.75);

- Session management

- SQL injection preventionINSERT INTO RESERVATION.HISTORY VALUES('BBC374-NSDF-4673','shashi@demo.com',10001,TO_DATE('02-FEB-2024'), 'HOWRAH', 'JODHPUR', 2, 981);

- SSL/TLS database connectionINSERT INTO RESERVATION.HISTORY VALUES('BBC375-NSDF-4675','shashi@demo.com',10004,TO_DATE('12-JAN-2024'), 'RANCHI', 'PATNA', 1, 550);

- Authorization checksINSERT INTO RESERVATION.HISTORY VALUES('BBC373-NSDF-4674','shashi@demo.com',10006,TO_DATE('22-JULY-2024'), 'PATNA', 'DELHI', 3, 4352.25);



## 🌟 Recent Updates (November 2025)COMMIT;

```

- ✅ Upgraded to Java 21 (from Java 8)STEP 5: Now Execute the below query one by one to check if the tables are created successfully

- ✅ Migrated to Supabase PostgreSQL```SQL

- ✅ Added SSL secure connectionSELECT * FROM ADMIN;

- ✅ Updated Maven compiler to 3.13.0SELECT * FROM CUSTOMER;

- ✅ Cloud-ready architectureSELECT * FROM TRAIN;

SELECT * FROM HISTORY;

## 📖 Documentation

```

- `SUPABASE_SETUP.md` - Database setup guideNote: If any of the above commands fails, please try to fix it first and then proceed to next step

- `TESTING_SUMMARY.md` - Test results	

- `database-verification.sql` - DB validation### ====== Importing and Running the Project Through Eclipse EE ===========

Step 0: Open Eclipse Enterprise Edition. [Install if not available](https://www.youtube.com/watch?v=8aDsEV7txXE)

## 👤 Author

Step 1: Click On File > Import > Git > Projects From Git > Clone Uri  > Paste The Repository Url: ```https://github.com/shashirajraja/Train-Ticket-Reservation-System.git``` > Next > Select Master Branch > Next > Finish

**Puneet**

- GitHub: [@Puneet69](https://github.com/Puneet69)Step 2.A: Right Click on Project > Run as > Maven Build > In the goals field enter "clean install" > apply > run

- Email: puneetgupta11459282@gmail.com

Step 2.B: Right Click On Project > Build Path > Configure Build Path > Libraries > Remove And Update Any Libraries With Red Mark > Finish

## 🙏 Acknowledgments

Step 3: [Only if Tomcat v8.0 is not Configured in Eclipse]: Right Click On Project > Run As > Run On Server > Select Tomcat v8.0 > (Select Tomcat V8.0 Installation Location If Asked) Next > Add <project-name> > Finish

- Bootstrap for UI

- Supabase for cloud databaseStep 4: In The Server Tab > Double Click On Tomcat Server > Ports  > Change The Port Number For Http/1.1 To 8083 > Close And Save

- Apache Tomcat

Step 5: Right Click On Project > Run As > Run On Server > Select Tomcat V8.0 > Next > Add All> Done

---

Step 6: Check Running The Site At  <a Href="Http://localhost:8083/trainbook/">http://localhost:8083/trainbook/</a>

**⭐ Star this project if you find it useful!**

Step 7: Default Username And Password For Admin Is "admin@demo.com" And "admin"

Last Updated: November 16, 2025

Step 8: Default Username And Password For User Is "shashi@demo.com" And "shashi"



### The Screenshots of some of the  webPages of this project are Here:

1. Login Page
<img width="100%" alt="Login to Book Trains" src="https://user-images.githubusercontent.com/34605595/232219369-85b55a1d-6640-4821-941a-dcca08036fbe.png">

2. Register New User
<img width="100%" alt="Register New User" src="https://user-images.githubusercontent.com/34605595/232219485-2b00949a-be20-44f7-b6c1-107213221f94.png">

3. User Profile
<img width="100%" alt="View User Profile" src="https://user-images.githubusercontent.com/34605595/232219729-2720e50f-e14b-4253-831a-85c59e3054b3.png">

4. Search Trains Between Stations
<img width="100%" alt="Search Trains Between Stations" src="https://user-images.githubusercontent.com/34605595/232220357-54b634d6-afae-427c-b3af-57b372b70906.png">

5. View Trains
<img width="100%" alt="View Available Trains" src="https://user-images.githubusercontent.com/34605595/232219905-983eeefe-977b-40ad-a695-4ec577272dcc.png">

7. Book Trains
<img width="100%" alt="Book Trains Project" src="https://user-images.githubusercontent.com/34605595/232220107-415b251f-90b9-4e70-aff8-e94d370927f6.png">

8. Payment Gateway
<img width="100%" alt="Pay to Book Trains" src="https://user-images.githubusercontent.com/34605595/232220744-351c2c6d-e1f6-49ad-a11b-7680aa63dbe3.png">

9. Booked Ticket Information
<img width="100%" alt="Show Booked Ticket Details" src="https://user-images.githubusercontent.com/34605595/232220935-654bda38-cbde-4203-84b8-3078a32ac6ec.png">

10. Ticket Booking History
<img width="100%" alt="All Ticket Booking History" src="https://user-images.githubusercontent.com/34605595/232220491-3e7996cb-a54c-4375-a35a-6ab1d211a001.png">

11. Fare Enquiry
<img alt="Fare Enquiry between stations" src="https://github.com/shashirajraja/Train-Ticket-Reservation-System/blob/master/Screenshots/fareenquiry.png" width="100%">

12. Change Password
<img alt="Change user Password" src="https://github.com/shashirajraja/Train-Ticket-Reservation-System/blob/master/Screenshots/passwordchange.png" width="100%">

13. Add Trains By Admin
<img alt="Admin Home" src="https://github.com/shashirajraja/Train-Ticket-Reservation-System/blob/master/Screenshots/addtrains.png" width="100%">


#### "Suggestions and project Improvement are Invited"
#### Shashi Raj
##### Project Leader
