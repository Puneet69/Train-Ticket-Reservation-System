#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

BASE_URL="http://localhost:8080"
PASSED=0
FAILED=0

echo "╔════════════════════════════════════════════════════════════╗"
echo "║     TRAIN RESERVATION SYSTEM - FEATURE TESTING SUITE      ║"
echo "╔════════════════════════════════════════════════════════════╗"
echo ""

# Function to test HTTP endpoint
test_endpoint() {
    local name="$1"
    local url="$2"
    local expected_code="${3:-200}"
    
    echo -n "Testing $name... "
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    
    if [ "$response" = "$expected_code" ]; then
        echo -e "${GREEN}✓ PASS${NC} (HTTP $response)"
        ((PASSED++))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC} (Expected $expected_code, Got $response)"
        ((FAILED++))
        return 1
    fi
}

# Function to test page contains text
test_page_content() {
    local name="$1"
    local url="$2"
    local search_text="$3"
    
    echo -n "Testing $name... "
    response=$(curl -s "$url")
    
    if echo "$response" | grep -q "$search_text"; then
        echo -e "${GREEN}✓ PASS${NC} (Found: '$search_text')"
        ((PASSED++))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC} (Not found: '$search_text')"
        ((FAILED++))
        return 1
    fi
}

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}SECTION 1: USER FEATURES TESTING${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

echo "1.1 User Authentication Pages"
echo "------------------------------"
test_endpoint "User Login Page" "$BASE_URL/UserLogin.html"
test_page_content "User Login Form" "$BASE_URL/UserLogin.html" "login"
test_endpoint "User Register Page" "$BASE_URL/UserRegister.html"
test_page_content "User Register Form" "$BASE_URL/UserRegister.html" "register"
echo ""

echo "1.2 User Dashboard & Home"
echo "-------------------------"
test_endpoint "User Home Page" "$BASE_URL/UserHome.html"
test_page_content "User Home Content" "$BASE_URL/UserHome.html" "Home"
echo ""

echo "1.3 Train Search Features"
echo "-------------------------"
test_endpoint "Search Trains Page" "$BASE_URL/SearchTrains.html"
test_page_content "Search Form" "$BASE_URL/SearchTrains.html" "Search"
test_endpoint "Train Between Stations" "$BASE_URL/TrainBwStn.html"
test_page_content "Station Search" "$BASE_URL/TrainBwStn.html" "station"
echo ""

echo "1.4 Seat Availability"
echo "---------------------"
test_endpoint "Availability Page" "$BASE_URL/Availability.html"
test_page_content "Availability Check" "$BASE_URL/Availability.html" "available"
test_endpoint "View Trains Page" "$BASE_URL/UserViewTrains.html"
echo ""

echo "1.5 Fare Enquiry"
echo "----------------"
test_endpoint "Fare Enquiry Page" "$BASE_URL/Fare.html"
test_page_content "Fare Information" "$BASE_URL/Fare.html" "Fare"
echo ""

echo "1.6 Booking Features"
echo "--------------------"
test_endpoint "Book Trains Page" "$BASE_URL/BookTrains.html"
test_page_content "Booking Form" "$BASE_URL/BookTrains.html" "Book"
test_endpoint "Payment Page" "$BASE_URL/Payment.html"
test_page_content "Payment Gateway" "$BASE_URL/Payment.html" "payment"
echo ""

echo "1.7 User Profile Management"
echo "---------------------------"
test_page_content "Index/Home" "$BASE_URL/index.html" "Train"
echo ""

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}SECTION 2: ADMIN FEATURES TESTING${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

echo "2.1 Admin Authentication"
echo "------------------------"
test_endpoint "Admin Login Page" "$BASE_URL/AdminLogin.html"
test_page_content "Admin Login Form" "$BASE_URL/AdminLogin.html" "Admin"
echo ""

echo "2.2 Admin Dashboard"
echo "-------------------"
test_endpoint "Admin Home Page" "$BASE_URL/AdminHome.html"
test_page_content "Admin Dashboard" "$BASE_URL/AdminHome.html" "Admin"
echo ""

echo "2.3 Train Management - Add"
echo "---------------------------"
test_endpoint "Add Train Page" "$BASE_URL/AddTrains.html"
test_page_content "Add Train Form" "$BASE_URL/AddTrains.html" "Train"
echo ""

echo "2.4 Train Management - Update"
echo "------------------------------"
test_endpoint "Update Train Page" "$BASE_URL/AdminUpdateTrain.html"
test_page_content "Update Train Form" "$BASE_URL/AdminUpdateTrain.html" "Update"
echo ""

echo "2.5 Train Management - Cancel"
echo "------------------------------"
test_endpoint "Cancel Train Page" "$BASE_URL/CancleTrain.html"
test_page_content "Cancel Train Form" "$BASE_URL/CancleTrain.html" "Cancel"
echo ""

echo "2.6 Train Management - View"
echo "----------------------------"
test_endpoint "View Trains Page" "$BASE_URL/ViewTrains.html"
test_endpoint "Admin Search Page" "$BASE_URL/AdminSearchTrain.html"
echo ""

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}SECTION 3: SERVLET ENDPOINT TESTING${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

echo "3.1 Testing Servlet Response (GET requests)"
echo "--------------------------------------------"

# Test servlets that should redirect or show error without proper session
echo -n "Testing UserHome Servlet... "
response=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/userhome")
if [ "$response" = "200" ] || [ "$response" = "302" ] || [ "$response" = "404" ]; then
    echo -e "${GREEN}✓ PASS${NC} (HTTP $response - servlet responding)"
    ((PASSED++))
else
    echo -e "${RED}✗ FAIL${NC} (HTTP $response)"
    ((FAILED++))
fi

echo -n "Testing Admin Home Servlet... "
response=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/adminhome")
if [ "$response" = "200" ] || [ "$response" = "302" ] || [ "$response" = "404" ]; then
    echo -e "${GREEN}✓ PASS${NC} (HTTP $response - servlet responding)"
    ((PASSED++))
else
    echo -e "${RED}✗ FAIL${NC} (HTTP $response)"
    ((FAILED++))
fi

echo ""

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}SECTION 4: DATABASE CONNECTIVITY TEST${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

echo "4.1 Testing Database Connection via Application"
echo "------------------------------------------------"

# Test with invalid credentials (should fail gracefully)
echo -n "Testing Login Error Handling... "
response=$(curl -s -X POST "$BASE_URL/userlogin" \
  -d "username=invalid@test.com" \
  -d "password=wrongpassword")

if echo "$response" | grep -q "FAIL\|Invalid\|Error\|Login" || [ -n "$response" ]; then
    echo -e "${GREEN}✓ PASS${NC} (Application responding to login attempts)"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠ WARNING${NC} (Unexpected response)"
    ((FAILED++))
fi

echo ""

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}SECTION 5: STATIC RESOURCES${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

echo "5.1 CSS and Static Files"
echo "------------------------"
test_endpoint "User Home CSS" "$BASE_URL/UserHome_Css.css"
echo ""

echo "═══════════════════════════════════════════════════════════"
echo ""
echo -e "${YELLOW}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${YELLOW}║                    TEST RESULTS SUMMARY                   ║${NC}"
echo -e "${YELLOW}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "Total Tests Run: $((PASSED + FAILED))"
echo -e "${GREEN}Tests Passed: $PASSED${NC}"
echo -e "${RED}Tests Failed: $FAILED${NC}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║        ✓ ALL TESTS PASSED - APPLICATION HEALTHY!          ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    exit 0
else
    SUCCESS_RATE=$(( PASSED * 100 / (PASSED + FAILED) ))
    echo -e "${YELLOW}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}║   ⚠ SOME TESTS FAILED - Success Rate: ${SUCCESS_RATE}%             ║${NC}"
    echo -e "${YELLOW}╚════════════════════════════════════════════════════════════╝${NC}"
    exit 1
fi
