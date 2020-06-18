create database Store;

create table Trader
(
	TraderId int primary key ,
	FName    varchar(100) not null ,
	LName    varchar(100) not null ,
	Age      int   check (Age>=21) ,


);

create table TraderPhones
(
	TraderId int references Trader(TraderId) ,
	Phone    char(11) not null unique ,
	
	primary key(TraderId, Phone)


);

create table Bill
(
	BillId	int primary key identity (1,1) ,
	BillDate	datetime2	default getdate() ,
	TotalAmount	decimal (8, 2)	check(TotalAmount>0) ,
	Discount	decimal (8, 2) ,	
	TraderId	int				references Trader(TraderId) ,
	check(Discount between 0 and TotalAmount) 
	
);

create table Product
(
	ProductId	int	primary key ,
	ProductName	varchar(300) not null unique ,
	Price		decimal (6, 2) not null	check(Price>0) ,
	ExpiredDate	date		check(ExpiredDate>getdate()) ,
	
);

create table BillProduct
(
	BillId	int references Bill(BillId) ,
	ProductId	int	references Product(ProductId) ,
	Quantity	decimal (4,2)	check(Quantity>0) ,
	primary key(BillId, ProductId)
);

