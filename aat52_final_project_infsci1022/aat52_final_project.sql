USE AAT52;

/*
DROP TABLE patient_staff, visit, diagnosis, prescription, payment, patient, patient_bill, doctor, nurse, ward, hospital_branch, emergency_contact;
ALTER TABLE patient DROP FOREIGN KEY patient_ibfk_1; 
ALTER TABLE patient DROP FOREIGN KEY patient_ibfk_2; 
drop table patient;
*/

CREATE TABLE emergency_contact (
	emerg_cont_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    phone_number DOUBLE NOT NULL,
    relation VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE hospital_branch (
	hospital_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	hosp_name VARCHAR(30) NOT NULL,
    phone_number DOUBLE NOT NULL,
    address VARCHAR(50) NOT NULL,
	bed_number INT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE ward (
	ward_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	
    department_type VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE nurse (
	nurse_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    phone_number DOUBLE NOT NULL,
    fk_hospital_id INT NOT NULL,
	fk_ward_id INT NOT NULL,
  FOREIGN KEY (fk_hospital_id)
        REFERENCES hospital_branch(hospital_id)
        ON DELETE CASCADE,
  FOREIGN KEY (fk_ward_id )
        REFERENCES ward(ward_id )
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE doctor (
	doctor_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    phone_number DOUBLE NOT NULL,
    fk_hospital_id INT NOT NULL,
	fk_ward_id INT NOT NULL,
  FOREIGN KEY (fk_hospital_id)
        REFERENCES hospital_branch(hospital_id)
        ON DELETE CASCADE,
  FOREIGN KEY (fk_ward_id )
        REFERENCES ward(ward_id )
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE patient_bill (
	bill_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	
    fk_patient_id INT NOT NULL,
	no_of_days DOUBLE NOT NULL,
	room_charge DOUBLE NOT NULL,
	operation_charge DOUBLE NOT NULL,
    prescription_charge DOUBLE NOT NULL
) ENGINE = InnoDB;

CREATE TABLE patient (
	patient_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    date_of_birth DATETIME NOT NULL,
    phone_number DOUBLE NOT NULL,
	gender VARCHAR(30) NOT NULL,
	address VARCHAR(50) NOT NULL,
    fk_emerg_cont_id INT NOT NULL,
    fk_hospital_id INT NOT NULL,
  FOREIGN KEY (fk_emerg_cont_id)
        REFERENCES emergency_contact(emerg_cont_id)
        ON DELETE CASCADE,
  FOREIGN KEY (fk_hospital_id)
        REFERENCES hospital_branch(hospital_id)
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE prescription (
	prescription_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    pres_name  VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE visit (
	visit_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	assigned_room INT NOT NULL,
    reg_date DATETIME NOT NULL,
	fk_patient_id INT NOT NULL,
	fk_ward_id INT NOT NULL,
    fk_bill_id INT NOT NULL,
    fk_prescription_id INT NOT NULL,
  FOREIGN KEY (fk_patient_id)
        REFERENCES patient(patient_id)
        ON DELETE CASCADE,
  FOREIGN KEY (fk_ward_id)
        REFERENCES ward(ward_id)
        ON DELETE CASCADE,
  FOREIGN KEY (fk_bill_id)
        REFERENCES patient_bill(bill_id)
        ON DELETE CASCADE,
  FOREIGN KEY (fk_prescription_id)
        REFERENCES prescription(prescription_id)
        ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE patient_staff (
	staff_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,	
	blood_pressure VARCHAR(30) NOT NULL,
	heart_rate DOUBLE NOT NULL,
	height DOUBLE NOT NULL,
    weight DOUBLE NOT NULL,
	fk_patient_id INT NOT NULL,
	fk_doctor_id INT NOT NULL,
    fk_nurse_id INT NOT NULL,
  FOREIGN KEY (fk_patient_id)
        REFERENCES patient(patient_id)
        ON DELETE CASCADE,
  FOREIGN KEY (fk_doctor_id)
        REFERENCES doctor(doctor_id)
        ON DELETE CASCADE,
  FOREIGN KEY (fk_nurse_id)
        REFERENCES nurse(nurse_id)
        ON DELETE CASCADE
) ENGINE = InnoDB;

ALTER TABLE patient_bill
    ADD CONSTRAINT fk_patient_id
    FOREIGN KEY (fk_patient_id)
    REFERENCES patient(patient_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;



INSERT INTO emergency_contact (emerg_cont_id, first_name, last_name, phone_number, relation)
VALUES 
	(1, 'Allison', 'Boyle', '4121231234', 'sister'),
	(2, 'Callie', 'Delphi', '4122342345', 'cousin'),
	(3, 'Elliot', 'Finn', '41213453456', 'father'),
	(4, 'Gerald', 'Harrison', '4124564567', 'friend'),
	(5, 'Isaac', 'Jackson', '4125675678', 'brother'),
	(6, 'Kendrick', 'Leonard', '4126786789', 'brother'),
	(7, 'Maddie', 'Nelson', '4127897890', 'friend'),
	(8, 'Oscar', 'Price', '4128901234', 'coworker'),
	(9, 'Quinn', 'Riels', '4129012345', 'brother'),
	(10, 'Steven', 'Tells', '4120123456', 'cousin');

INSERT INTO hospital_branch (hospital_id, hosp_name, phone_number, address, bed_number)
VALUES 
	(1, 'Hospital A', '4121112222', '1111 Database Street 1111 Pittsburgh, PA', '897'),
	(2, 'Hospital B', '4122223333', '2222 Database Street 2222 Pittsburgh, PA', '1600'),
	(3, 'Hospital C', '4123334444', '3333 Database Street 3333 Pittsburgh, PA', '1540'),
	(4, 'Hospital D', '4124445555', '4444 Database Street 4444 Pittsburgh, PA', '1006'),
	(5, 'Hospital E', '4125556666', '5555 Database Street 5555 Pittsburgh, PA', '1021'),
	(6, 'Hospital F', '4126667777', '6666 Database Street 6666 Pittsburgh, PA', '1484'),
	(7, 'Hospital G', '4127778888', '7777 Database Street 7777 Pittsburgh, PA', '184'),
	(8, 'Hospital H', '4128889999', '8888 Database Street 8888 Pittsburgh, PA', '229'),
	(9, 'Hospital I', '4120001111', '9999 Database Street 9999 Pittsburgh, PA', '786'),
	(10, 'Hospital J', '4121212121', '1010 Database Street 1010 Pittsburgh, PA', '864');

INSERT INTO ward (ward_id, department_type)
VALUES 
	(1, 'Atrial Fibrillation'),
	(2, 'Breast Health'),
	(3, 'Cancer Services'),
	(4, 'Childbirth Services'),
	(5, 'Cystic Fibrosis'),
	(6, 'Emergency Services'),
	(7, 'Endoscopy Services'),
	(8, 'Gynecology'),
	(9, 'Heart and Vascular Services'),
	(10, 'Liver Disease Services'),
    (11, 'Lung Disease Services'),
	(12, 'Mental Health Services'),
	(13, 'Orthopedics'),
    (14, 'Pediatrics'),
    (15, 'Pharmacy'),
    (16, 'Radiology'),
    (17, 'Rehabilitation Services'),
    (18, 'Stroke Services'),
    (19, 'Surgical Services'),
    (20, 'Transplant Services');

INSERT INTO nurse (nurse_id, first_name, last_name, phone_number, fk_hospital_id, fk_ward_id)
VALUES 
	(1, 'Alan', 'Beyers', '4120001111', 2, 3),
	(2, 'Carter', 'Dickinson', '4121112222', 9, 13),
	(3, 'Eve', 'Frankinmeyers', '4122223333', 4, 8),
	(4, 'Gina', 'Hanks', '4123334444', 1, 4),
	(5, 'Ian', 'Jenkins', '4124445555', 3, 12),
	(6, 'Kevin', 'Lancaster', '4125556666', 5, 19),
	(7, 'Mira', 'Noland', '4126667777', 7, 16),
	(8, 'Opal', 'Patricks', '4127778888', 6, 18),
	(9, 'Quincy', 'Reyes', '4128889999', 8, 15),
	(10, 'Sally', 'Tilda', '4129990000', 10, 10);
    
INSERT INTO doctor (doctor_id, first_name, last_name, phone_number, fk_hospital_id, fk_ward_id)
VALUES 
	(1, 'Amanda', 'Belle', '4120101010', 3, 5),
	(2, 'Caroline', 'Dixie', '4120202020', 2, 1),
	(3, 'Ethan', 'Falken', '4120303030', 5, 3),
	(4, 'Greg', 'Helms', '4120404040', 4, 2),
	(5, 'Ivan', 'Jackson', '4124445555', 7, 17),
	(6, 'Kiki', 'Lennis', '4125556666', 6, 15),
	(7, 'Mary', 'Niels', '4126667777', 10, 18),
	(8, 'Oliver', 'Ponne', '4127778888', 1, 13),
	(9, 'Quint', 'Reynolds', '4128889999', 8, 12),
	(10, 'Sabrina', 'Tanaka', '4129990000', 9, 11);

INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, phone_number, gender, address,  fk_emerg_cont_id,  fk_hospital_id)
VALUES 
	(1, 'Amanda', 'Boyle', '2000-01-01', '4121111111', 'female', '1234 Final Project Street 1234 Pittsburgh, PA', 1, 2),
	(2, 'Carter', 'Delphi', '2000-02-01', '4122222222', 'male', '2345 Final Project Street 1234 Pittsburgh, PA', 2, 4 ),
	(3, 'Elizabeth', 'Finn', '2000-03-01', '4123333333', 'female', '3456 Final Project Street 1234 Pittsburgh, PA', 3, 5),
    (4, 'George', 'Huckleberry', '2000-04-01', '4124444444', 'male', '4567 Final Project Street 1234 Pittsburgh, PA', 4, 6),
    (5, 'Ian', 'Jackson', '2000-05-01', '4125555555', 'male', '4567 Final Project Street 1234 Pittsburgh, PA', 5, 3),
    (6, 'Kiley', 'Leonard', '2000-06-01', '4126666666', 'female', '5678 Final Project Street 15213 Pittsburgh, PA', 6, 7),
    (7, 'Monroe', 'Niels', '2000-07-01', '4127777777', 'male', '5678 Final Project Street 15213 Pittsburgh, PA', 7, 1),
    (8, 'Oliver', 'Peterson', '2000-08-01', '4128888888', 'male', '5678 Final Project Street 15213 Pittsburgh, PA', 8, 9),
	(9, 'Quincy', 'Riels', '2000-09-01', '4129999999', 'male', '5678 Final Project Street 15213 Pittsburgh, PA', 9, 6),
    (10, 'Stephanie', 'Toms', '2000-10-01', '4120000000', 'female', '5678 Final Project Street 15213 Pittsburgh, PA', 10, 3);

INSERT INTO patient_bill (bill_id, fk_patient_id, no_of_days, room_charge, operation_charge, prescription_charge)
VALUES 
	(1, 3, '13', '212', '110000', '10.45'),
	(2, 2, '10', '300', '35000', '23.11'),
	(3, 6, '21', '400', '17500', '3.21'),
	(4, 10, '3', '260', '1600', '16.23'),
	(5, 1, '43', '1100', '110000', '17.65'),
	(6, 5, '17', '280', '25000', '15.19'),
	(7, 8, '8', '320', '40364', '18.44'),
	(8, 4, '12', '212', '123000', '13.33'),
	(9, 9, '32', '224', '28000', '12.21'),
	(10, 7, '41', '419', '282000', '31.88');

INSERT INTO prescription (prescription_id, pres_name)
VALUES 
	(1, 'Lisinopril'),
	(2, 'Gabapentin'),
	(3, 'Amlodipine'),
	(4, 'Omeprazol'),
	(5, 'Amoxillin'),
	(6, 'Losartan'),
	(7, 'Albuterol'),
	(8, 'Vicodin'),
	(9, 'Simvastin'),
	(10, 'Lipitor');

INSERT INTO visit (visit_id, assigned_room, reg_date, fk_patient_id, fk_ward_id, fk_bill_id, fk_prescription_id)
VALUES 
	(1, '130', '2018-01-01', 1, 3, 2, 1),
	(2, '665', '2018-02-01', 2, 6, 4 , 3),
	(3, '241', '2018-03-01', 3, 9, 6, 5),
    (4, '401', '2018-04-01', 4, 2, 8, 7),
    (5, '322', '2018-05-01', 5, 1, 10, 2),
    (6, '277', '2018-06-01', 6, 2, 1, 4),
    (7, '148', '2018-07-01', 7, 8, 3, 6),
    (8, '229', '2018-08-01', 8, 16, 5, 8),
	(9, '24', '2018-09-01', 9, 12, 7, 10),
    (10, '87', '2018-10-01', 10, 17, 9, 9);

INSERT INTO patient_staff (staff_id, blood_pressure, heart_rate, height, weight, fk_patient_id, fk_doctor_id, fk_nurse_id)
VALUES 
	(1, '120/80', '60', '6.3', '130', 3, 6, 2),
	(2, '110/80', '65', '5.4', '120', 2, 8, 4),
	(3, '140/80', '56', '5.3', '180', 6, 2, 3),
	(4, '170/70', '72', '5.8', '230', 10, 5, 10),
	(5, '120/60', '77', '4.8', '140', 1, 3, 5),
	(6, '140/90', '64', '5.5', '170', 5, 1, 6),
	(7, '130/80', '88', '5.6', '160', 8, 4, 7),
	(8, '160/90', '67', '6.2', '280', 4, 9, 1),
	(9, '120/70', '84', '5.11', '170', 9, 7, 8),
	(10, '120/60', '67', '6.1', '180', 7, 10, 9);
    

SELECT*FROM hospital_branch;

SELECT visit.assigned_room AS Room, CONCAT(patient.last_name, ", ", patient.first_name) AS `Name`
FROM patient AS patient
INNER JOIN visit ON patient.patient_id = visit.fk_patient_id
WHERE patient.first_name = 'Amanda';

SELECT ward.department_type AS Ward, CONCAT(doctor.last_name, ", ", doctor.first_name) AS `Name`
FROM ward 
LEFT JOIN doctor ON ward.ward_id = doctor.fk_ward_id;

SELECT AVG(operation_charge) AS AvgOperationCharge
FROM patient_bill;

SELECT MAX(operation_charge) AS MaxOperationCharge
FROM patient_bill;

SELECT fk_patient_id AS PatientID, MIN(height) AS MinHeight
FROM patient_staff
GROUP BY fk_patient_id
ORDER BY MinHeight;

SELECT visit.assigned_room AS room, CONCAT(patient.last_name, ", ", patient.first_name) AS `Name`
FROM patient AS patient
INNER JOIN visit ON patient.patient_id = visit.fk_patient_id
GROUP BY patient_id
HAVING visit.assigned_room > 200 AND visit.assigned_room < 300;

SELECT bill.operation_charge AS OperationCharge, CONCAT(patient.last_name, ", ", patient.first_name) AS `Name`
FROM patient AS patient
INNER JOIN patient_bill AS bill ON patient.patient_id = bill.fk_patient_id
ORDER BY operation_Charge DESC;

SELECT bill.no_of_days AS NumberOfDays, CONCAT(patient.last_name, ", ", patient.first_name) AS `Name`
FROM patient AS patient
INNER JOIN patient_bill AS bill ON patient.patient_id = bill.fk_patient_id
ORDER BY no_of_days DESC
LIMIT 1;

SELECT CONCAT(patient.last_name, ", ", patient.first_name) AS `PatientName`, patient.phone_number AS PatientNumber, CONCAT(econt.last_name, ", ", econt.first_name)  AS EConName, econt.phone_number AS EConNumber
FROM patient AS patient
JOIN emergency_contact AS econt ON patient.fk_emerg_cont_id = econt.emerg_cont_id
WHERE fk_hospital_id IN
(SELECT hospital_id FROM hospital_branch WHERE bed_number < 800);



