/*Greatests*/
DROP TABLE IF EXISTS ;
CREATE TABLE
	office_products
	(
		office_code CHAR(3) NOT NULL,  /*支社コード*/
		branch_code CHAR(2) NOT NULL,  /*支店コード*/
		product_code CHAR(3) NOT NULL, /*商品コード*/
		PRIMARY KEY (office_code,branch_code,product_code)
	)
;
INSERT INTO
	office_products
VALUES
	('001','01','001'),
	('001','01','002'),
	('001','01','003'),
	('001','02','002'),
	('001','02','003'),
	('001','02','004'),
	('001','02','005'),
	('001','02','006'),
	('002','01','001'),
	('002','01','002'),
	('002','02','007'),
	('002','02','008')
;

/*支社*/
DROP TABLE IF EXISTS offices;
CREATE TABLE
	offices
	(
		office_code CHAR(3) NOT NULL,     /*支社コード*/
		office_name VARCHAR(20) NOT NULL, /*支社名*/
		PRIMARY KEY (office_code)
	)
;
INSERT INTO
	offices
VALUES
	('001','東京'),
	('002','大阪')
;


/*支店*/
DROP TABLE IF EXISTS branches;
CREATE TABLE
	branches
	(
		office_code CHAR(3) NOT NULL,     /*支社コード*/
		branch_code CHAR(2) NOT NULL,     /*支店コード*/
		branch_name VARCHAR(20) NOT NULL, /*支店名*/
		PRIMARY KEY (office_code,branch_code)
	)
;
INSERT INTO
	branches
VALUES
	('001','01','渋谷'),
	('001','02','八重洲'),
	('002','01','堺'),
	('002','02','豊中')
;


/*商品*/
DROP TABLE IF EXISTS products;
CREATE TABLE
	products
	(
		product_code CHAR(3) NOT NULL,     /*商品コード*/
		product_name VARCHAR(50) NOT NULL, /*商品名*/
		group_code CHAR(2) NOT NULL,       /*商品分類コード*/
		PRIMARY KEY (product_code)
	)
;
INSERT INTO
	products
VALUES
	('001','石鹸','C1'),
	('002','タオル','C1'),
	('003','ハブラシ','C1'),
	('004','コップ','C1'),
	('005','箸','C2'),
	('006','スプーン','C2'),
	('007','雑誌','C3'),
	('008','爪切り','C4')
;


/*商品分類*/
DROP TABLE IF EXISTS product_group;
CREATE TABLE
	product_group
	(
		group_code CHAR(2) NOT NULL,     /*商品分類コード*/
		group_name VARCHAR(50) NOT NULL, /*分類名*/
		PRIMARY KEY (group_code)
	)
;
INSERT INTO
	product_group
VALUES
	('C1','水洗用品'),
	('C2','食器'),
	('C3','書籍'),
	('C4','日用雑貨')
;

