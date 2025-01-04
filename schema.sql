-- Represent patients admitted
CREATE TABLE "patients" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "gender" TEXT NOT NULL,
    "blood_type" TEXT NOT NULL,
    "medical_condition" TEXT NOT NULL,
    "bank_account_number" INTEGER NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

-- Represent doctors assigned to an admission
CREATE TABLE "doctors" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent hospitals that receive admissions
CREATE TABLE "hospitals" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent patient admissions
CREATE TABLE "admissions" (
    "id" INTEGER,
    "patient_id" INTEGER,
    "doctor_id" INTEGER,
    "hospital_id" INTEGER,
    "admission_date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "type" TEXT NOT NULL,
    "room_number" INTEGER NOT NULL,
    "discharged_date" DATETIME DEFAULT NULL CHECK("discharged_date" > "admission_date"),
    PRIMARY KEY("id"),
    FOREIGN KEY("patient_id") REFERENCES "patients"("id"),
    FOREIGN KEY("doctor_id") REFERENCES "doctors"("id"),
    FOREIGN KEY("hospital_id") REFERENCES "hospitals"("id")
);

-- Represent bills sent to patients
CREATE TABLE "bills" (
    "id" INTEGER,
    "patient_id" INTEGER,
    "hospital_id" INTEGER,
    "amount" NUMERIC NOT NULL,
    "paid" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("patient_id") REFERENCES "patients"("id"),
    FOREIGN KEY("hospital_id") REFERENCES "hospitals"("id")
);

-- Create indexes to speed common searches
CREATE INDEX "patient_name_search" ON "patients" ("first_name", "last_name");
CREATE INDEX "hospital_name_search" ON "hospitals" ("name");
