CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE Customer(
    cID CHAR(5) PRIMARY KEY,
    cName TEXT NOT NULL,
    cAge INT NOT NULL
);

CREATE TABLE Orderes(
    oId INT PRIMARY KEY AUTO_INCREMENT,
    cId CHAR(5),
    FOREIGN KEY (cId) REFERENCES Customer(cID),
    oDate DATE,
    totalPrice FLOAT CHECK (totalPrice >= 0)
);

CREATE TABLE product(
    pID CHAR(5) PRIMARY KEY,
    pName VARCHAR(255) NOT NULL UNIQUE,
    pPrice FLOAT CHECK (pPrice > 0)
);

CREATE TABLE Orderdetail(
    oID INT,
    FOREIGN KEY (oID) REFERENCES Orderes(oID),
    pID CHAR(5),
    FOREIGN KEY (pID) REFERENCES product(pID),
    odQTY INT CHECK (odQTY >= 0),
    PRIMARY KEY (oID, pID)
);

