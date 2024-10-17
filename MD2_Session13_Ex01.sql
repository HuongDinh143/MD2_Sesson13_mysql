create database quanlykho;
use quanlykho;
create table vattu(
maVT int primary key auto_increment,
tenVT varchar(50) not null
);
create table phieuxuat(
soPX int primary key auto_increment,
ngayXuat datetime not null
);

create table phieunhap(
soPN int primary key auto_increment,
ngayNhap datetime not null
);

create table phieuxuatchitiet(
soPX int,
foreign key(soPX) references phieuxuat(soPX),
maVT int,
foreign key(maVT) references vattu(maVT),
dongiaxuat float not null,
soluongxuat int check (soluongxuat>=0)
);

create table phieunhapchitiet(
soPN int,
foreign key (soPN) references phieunhap(soPN),
maVT int,
foreign key (maVT) references vattu(maVT),
dongianhap float not null,
soluongnhap int not null check (soluongnhap>=0)
);

create table nhacungcap(
maNCC char(5) primary key,
tenNCC varchar(50) not null,
diachi varchar(250),
sodienthoai text(10)
);

create table dondathang(
soDH int primary key,
ngayDH datetime,
maNCC char,
foreign key (maNCC) references nhacungcap(maNCC)
);

create table chitietdonhang(
maVT INT,
    FOREIGN KEY(maVT) REFERENCES vattu(maVT),
soDH INT,
    FOREIGN KEY(soDH) REFERENCES dondathang(soDH),
    PRIMARY KEY(maVT, soDH)
);