-- Find all admissions given patient first and last name
SELECT *
FROM "admissions"
WHERE "patient_id" IN (
    SELECT "id"
    FROM "patients"
    WHERE "first_name" = 'Caleb'
    AND "last_name" = 'Lee'
);

-- Find all current admissions given hospital name
SELECT "id", "patient_id", "doctor_id", "hospital_id", "admission_date", "type", "room_number"
FROM "admissions"
WHERE "hospital_id" IN (
    SELECT "id"
    FROM "hospitals"
    WHERE "name" = 'National University Hospital'
) AND "discharged_date" IS NULL;

-- Find all outstanding bills given patient first and last name
SELECT *
FROM "bills"
WHERE "patient_id" IN (
    SELECT "id"
    FROM "patients"
    WHERE "first_name" = 'Caleb'
    AND "last_name" = 'Lee'
) AND "paid" = 0;

-- Add a new patient
INSERT INTO "patients" ("first_name", "last_name", "age", "gender", "blood_type", "medical_condition", "bank_account_number")
VALUES ('Caleb', 'Lee', '40', 'Male', 'O-', 'Appendicitis', 1234567890098765);

-- Add a new doctor
INSERT INTO "doctors" ("first_name", "last_name")
VALUES ('Caleb', 'Lee');

-- Add a new hospital
INSERT INTO "hospitals" ("name", "location")
VALUES ('National University Hospital', '5 Lower Kent Ridge Rd');

-- Add a new admission
INSERT INTO "admissions" ("patient_id", "doctor_id", "hospital_id", "type", "room_number")
VALUES (1, 1, 1, 'Emergency', 1);

-- Discharge a patient
UPDATE "admissions"
SET "discharged_date" = DATETIME(CURRENT_TIMESTAMP, '+1 day')
WHERE "id" = 1;

-- Add a new bill
INSERT INTO "bills" ("patient_id", "hospital_id", "amount", "paid")
VALUES (1, 1, 100, 0);

-- Update bill as paid
UPDATE "bills"
SET "paid" = 1
WHERE "id" = 1;
