create table CUSTOMER (
	PHONE numeric primary KEY,
	FIRST_NAME VARCHAR(100),
	LAST_NAME VARCHAR(100),
	ADDRESS VARCHAR(150)
);

create table SALESPERSON (
	EMPLOYEE_ID SERIAL primary key
);

create table CAR (
	VIN VARCHAR(17) primary key,
);

create table INVOICE (
	INVOICE_NUM SERIAL primary key,
	PHONE numeric,
	EMPLOYEE_ID SERIAL,
	VIN VARCHAR(17),
	foreign KEY(PHONE) references CUSTOMER (PHONE),
	foreign KEY(EMPLOYEE_ID) references SALESPERSON (EMPLOYEE_ID),
	foreign KEY(VIN) references CAR (VIN)
);

create table MECHANIC (
	MECH_ID SERIAL primary key
);

create table PARTS_ORDER (
	PO_NUM SERIAL primary key,
	PART_NUM SERIAL,
	PART_COST numeric
);

create table REPAIR_ORDER (
	RO_NUM SERIAL primary key,
	VIN VARCHAR(17),
	PO_NUM SERIAL,
	PHONE numeric,
	DUE_ON_RETURN numeric,
	MECH_ID SERIAL,
	foreign KEY(VIN) references CAR(VIN),
	foreign KEY(PO_NUM) references PARTS_ORDER(PO_NUM),
	foreign KEY(PHONE) references CUSTOMER (PHONE),
	foreign KEY(MECH_ID) references MECHANIC(MECH_ID)
);

