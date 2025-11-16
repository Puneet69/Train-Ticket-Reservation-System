# Train Ticket Reservation System# Train Ticket Reservation System 

<!-- - Youtube video for local setup of similar project: https://www.youtube.com/watch?v=mLFPodZO8Iw -->

A modern web-based train ticket reservation system built with Java 21 and cloud database.- Youtube video for Step by Step Guide on Local Setup: https://www.youtube.com/watch?v=Wd2GlEJJJlw

<!-- - Live Url: https://traintickets.herokuapp.com <br>  -->

## 🚀 Features<!-- - Login Credentials: admin/admin -->



### User Features### About:

- User registration and authenticationThis project is about the Train-Ticket-Reservation-System which is used to view Train Schedule, search trains, Seat availability, Train timings. We can also enquire about fare of different trains. We can get information about train between two stations. We can book seats online. This provides a safe and secure seat reservation system. 

- View all available trains### Online Train Information and Reservation

- Search trains between stations<span style="color:blue">**This Website is built for following purpose:-**</span>

- Check seat availability- View Trains Schedule

- Book train tickets online- Search Trains

- View booking history- Seat Availability

- Update user profile- Train Timings

- Change password- Fare Enquiry

- Secure payment gateway integration- Trains Between Stations

- Booking seats online.

### Admin Features- Login and Logout Security

- Admin authentication- Password Changes

- Add new trains- Payment Gateway

- Update train details (fare, seats, schedule)- Ticket Booking History

- Cancel/Remove trains

- Search and view all trains<span style="color:blue">**The Admin have the following access to this website:-**</span>

- Manage train schedules- Login

- Add Trains

## 💻 Technology Stack- Update Trains

- Remove  or cancle Trains

### Backend- View Trains

- **Language**: Java 21 (LTS)- Profile Edit

- **Framework**: Java Servlets (Java EE)- Logout

- **Build Tool**: Maven 3.13.0

- **Server**: Apache Tomcat 8.0.30<span style="color:blue">**The Users have the following Access:-**</span>

- Register

### Frontend- Login

- HTML5- View Trains

- CSS3- Check Seat Availability

- Bootstrap (Responsive Design)- Search Trains

- JavaScript- Train Avaiablity and Fare Between Stations

- Books Tickets

### Database- View Booking History

- **Production**: Supabase PostgreSQL (Cloud)- View Profile

- **SSL**: Enabled for secure connections- Update Profile

- **Driver**: PostgreSQL JDBC 42.7.4- Change Password

- Logout

## 📋 Prerequisites

### Technologies used:-

- Java JDK 21 or higher1. Front-End Development:

- Maven 3.x- HTML

- Supabase account (free tier available)- CSS

- Modern web browser- Bootstrap



## 🛠️ Installation & Setup2. Back-End Development

- Java [J2EE]

### 1. Clone the Repository- JDBC

```bash- Servlet

git clone <your-repository-url>- Oracle ( SQL )

cd Train-Ticket-Reservation-System

```### ==== Software And Tools Required ======

- : Git [https://www.youtube.com/watch?v=gv7VPQ4LZ7g]

### 2. Database Setup- : Java JDK 8+ [https://www.youtube.com/watch?v=O9PWH9SeTTE]

- : Eclipse EE [https://www.youtube.com/watch?v=8aDsEV7txXE]

Create a free account at [https://supabase.com](https://supabase.com) and:- : Apache Maven [https://www.youtube.com/watch?v=jd2zx3dLjuw]

1. Create a new project- : Tomcat v8.0+ [https://youtu.be/mLFPodZO8Iw?t=903]

2. Go to SQL Editor and run `supabase-migration.sql`- : Oracle (SQL) / SQL PLUS [https://www.youtube.com/watch?v=ZYOqykEDSqU]

3. Get your connection details from Settings → Database- : Oracle SQL Developer [https://www.youtube.com/watch?v=2a1JKIGVtd0]



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
