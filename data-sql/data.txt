-- Create aircraft table
CREATE TABLE aircraft (
    year INT,
    type VARCHAR(100),
    manufacturer VARCHAR(100),
    model VARCHAR(100),
    engines INT,
    seats INT,
    engine VARCHAR(100),
    aircraftId SERIAL PRIMARY KEY
);

-- Create airlines table
CREATE TABLE airlines (
    Name VARCHAR(100),
    ICAO VARCHAR(10),
    HeadquartersLocation VARCHAR(100),
    FleetSize INT
);

-- Create airports table
CREATE TABLE airports (
    Name VARCHAR(100),
    IATA VARCHAR(3),
    Location VARCHAR(100),
    Latitude FLOAT,
    Longitude FLOAT,
    Country VARCHAR(100),
    TimeZone VARCHAR(50)
);

-- Create booking table
CREATE TABLE booking (
    ReservationID SERIAL PRIMARY KEY,
    TransactionID INT,
    CustomerID INT,
    FlightID INT,
    Type VARCHAR(10)
);

-- Create booking_info table
CREATE TABLE booking_info (
    ReservationID INT,
    PassengerID INT,
    SeatID INT
);

-- Create crews table
CREATE TABLE crews (
    CrewID SERIAL PRIMARY KEY,
    PilotID INT,
    HostessID INT,
    Hostess2ID INT,
    AssistantID INT
);

-- Create customers table
CREATE TABLE customers (
    customerID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Nationality VARCHAR(100),
    PassportNumber VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    type VARCHAR(20)
);

-- Create employees table
CREATE TABLE employees (
    Name VARCHAR(100),
    Position VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(100),
    Gender VARCHAR(10),
    Salary INT,
    employee_id SERIAL PRIMARY KEY
);

-- Create flight_details table
CREATE TABLE flight_details (
    FlightID SERIAL PRIMARY KEY,
    airline_ID INT,
    DepartureAirportID INT,
    ArrivalAirportID INT,
    DepartureDateTime TIMESTAMP,
    ArrivalDateTime TIMESTAMP,
    aircraftId INT,
    FlightDuration INT,
    AvailableSeats INT,
    CrewID INT
);

-- Create flight_service table
CREATE TABLE flight_service (
    ServiceID SERIAL PRIMARY KEY,
    ServiceName VARCHAR(100)
);

-- Create payment_methods table
CREATE TABLE payment_methods (
    PaymentID SERIAL PRIMARY KEY,
    PaymentMethod VARCHAR(100)
);

-- Create seats table
CREATE TABLE seats (
    SeatID SERIAL PRIMARY KEY,
    FlightID INT,
    SeatNumber VARCHAR(10),
    ClassID INT
);

-- Create service_offering table
CREATE TABLE service_offering (
    ServiceID INT,
    FlightID INT
);

-- Create transactions table
CREATE TABLE transactions (
    TransactionID SERIAL PRIMARY KEY,
    PaymentID INT,
    TransactionDate DATE,
    Amount FLOAT
);

-- Create travel_class table
CREATE TABLE travel_class (
    ClassID SERIAL PRIMARY KEY,
    ClassName VARCHAR(100),
    Description TEXT
);
