-- Airport Dimension
CREATE TABLE Airport (
    AirportID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    IATA VARCHAR(3),
    Location VARCHAR(255),
    Country VARCHAR(100),
    TimeZone VARCHAR(50)
);

-- Airline Dimension
CREATE TABLE Airline (
    AirlineID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    ICAO VARCHAR(3),
    HeadquartersLocation VARCHAR(255),
    FleetSize INTEGER
);

-- Customers Dimension
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Nationality VARCHAR(100),
    PassportNumber VARCHAR(50),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Type VARCHAR(50)
);

-- Date Dimension
CREATE TABLE DateDimension (
    DateID SERIAL PRIMARY KEY,
    Date DATE,
    Day INTEGER,
    Month INTEGER,
    Year INTEGER,
    Quarter INTEGER,
    Weekday INTEGER,
    Holiday BOOLEAN
);

-- Payment Method Dimension
CREATE TABLE PaymentMethod (
    PaymentMethodID SERIAL PRIMARY KEY,
    PaymentMethod VARCHAR(100)
);

-- Travel Class Dimension
CREATE TABLE TravelClass (
    ClassID SERIAL PRIMARY KEY,
    ClassName VARCHAR(100),
    Description TEXT
);

-- Aircraft Dimension
CREATE TABLE Aircraft (
    AircraftID SERIAL PRIMARY KEY,
    Year INTEGER,
    Type VARCHAR(100),
    Manufacturer VARCHAR(100),
    Model VARCHAR(100),
    Engines INTEGER,
    Seats INTEGER,
    Engine VARCHAR(100)
);

-- Service Dimension
CREATE TABLE Service (
    ServiceID SERIAL PRIMARY KEY,
    ServiceName VARCHAR(255)
);

-- Crew Dimension
CREATE TABLE Crew (
    CrewID SERIAL PRIMARY KEY,
    PilotID INTEGER,
    HostessID INTEGER,
    Hostess2ID INTEGER,
    AssistantID INTEGER
);

-- Bookings Fact
CREATE TABLE Bookings (
    BookingID SERIAL PRIMARY KEY,
    AirportID INTEGER REFERENCES Airport(AirportID),
    AirlineID INTEGER REFERENCES Airline(AirlineID),
    CustomerID INTEGER REFERENCES Customers(CustomerID),
    DateID INTEGER REFERENCES DateDimension(DateID),
    PaymentMethodID INTEGER REFERENCES PaymentMethod(PaymentMethodID),
    ClassID INTEGER REFERENCES TravelClass(ClassID),
    Amount NUMERIC
);

-- Flights Fact
CREATE TABLE Flights (
    FlightID SERIAL PRIMARY KEY,
    AircraftID INTEGER REFERENCES Aircraft(AircraftID),
    DepartureAirportID INTEGER REFERENCES Airport(AirportID),
    ArrivalAirportID INTEGER REFERENCES Airport(AirportID),
    AirlineID INTEGER REFERENCES Airline(AirlineID),
    DateID INTEGER REFERENCES DateDimension(DateID),
    ServiceID INTEGER REFERENCES Service(ServiceID),
    CrewID INTEGER REFERENCES Crew(CrewID)
);
