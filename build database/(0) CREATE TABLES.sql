SET autocommit=0;
SET FOREIGN_KEY_CHECKS=0;
START TRANSACTION;

create table flight(
    flightId int not null primary key auto_increment,
    airlineCode char(2)
        check(length(airlineCode)<=2),
    craftTypeCode char(3) default '737'
        check(length(craftTypeCode)<=3),
    departureTerminalId int not null,
    arrivalTerminalId int not null,
    departureDate datetime not null,
    arrivalDate datetime not null,
    punctualityRate varchar(5)
        check(length(punctualityRate)<=5),
    mealType varchar(10)
        check(length(mealType)<=10),
    stopTimes int default 0,
    ticketsOfBusinessSold int default 0,
    ticketsOfEconomy int default 0,
    priceOfBusiness int default 4400,
    priceOfEconomy int default 1800,
    flightNumber varchar(10) not null
        check(length(flightNumber)<=10),
    
    foreign key(airlineCode) references airline(airlineCode),
    foreign key(craftTypeCode) references craft(craftTypeCode)
);

create table airline(
    airlineCode char(2) primary key,
    airlineName varchar(30) not null
        check(length(airlineName)<=30)
);

create table craft(
    craftTypeCode varchar(3)
        check(length(craftTypeCode)<=3),
    craftKind varchar(5) default 'None'
        check(length(craftKind)<=5),
    craftTypeName varchar(50) default 'None'
        check(length(craftTypeName)<=50),
    seatsOfBusiness int not null,
    seatsOfEconomy int not null,

    primary key(craftTypeCode)
);

create table airport(
    terminalId int primary key,
    terminalName varchar(5)
        check(length(terminalName)<=5),
    airportCode char(3) not null
        check(length(airportCode)<=3),
    airportName varchar(30) not null
        check(length(airportName)<=30),
    cityCode char(3) not null
        check(length(cityCode)<=3),

    foreign key(cityCode) references city(cityCode)
);

create table city(
    cityCode char(3) not null primary key
        check(length(cityCode)<=3),
    cityName varchar(10) not null
        check(length(cityName)<=10)
);

create table stop_info(
    flightId int primary key,
    startDate datetime not null,
    endDate datetime not null,
    cityCode char(3) not null
        check(length(cityCode)<=3),
    stopType varchar(10) not null
        check(length(stopType)<=10),

    foreign key(flightId) references flight(flightId),
    foreign key(cityCode) references city(cityCode)
);

create table user(
    id int primary key auto_increment,
    username varchar(128)
        check(length(username)<=128),
    password varchar(128) not null
        check(length(password)<=128),
    firstName varchar(128) not null
        check(length(firstName)<=128),
    lastName varchar(128) not null
        check(length(lastName)<=128),
    email varchar(256) not null
        check(length(email)<=256),
    registerDate datetime,
    age int not null,
    residentId char(18) not null
        check(length(residentId)<=18),
    cash decimal(8,2) default 0,

    unique(residentId)
);

create table orders(
    orderId int primary key auto_increment,
    userId int not null,
    ticketNum int not null,
    totalAmount decimal(8,2) not null,
    orderDate datetime not null,
    
    foreign key(userId) references user(id)
);

create table tickets(
    id int primary key auto_increment,
    orderId int,
    flightId int not null,
    residentIdOfpassenger char(18) not null
        check(length(residentIdOfpassenger)<=18),
    ticketType varchar(10) not null,
        check(length(ticketType)<=10),
    score int,
    feedback varchar(1024)
        check(length(feedback)<=1024),
    
    foreign key(orderId) references orders(orderId),
    foreign key(flightId) references flight(flightId)
);

create table score(
    flightId int not null primary key,
    avgScore int default 0,
    scoreCount int default 0,

    foreign key(flightId) references flight(flightId)
);

COMMIT;
SET FOREIGN_KEY_CHECKS=1;
set autocommit=1;