CREATE TABLE "doctor" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "clinic_address" varchar,
  "clinic_phone" varchar,
  "dr_phone" varchar,
  "medical_field" varchar
);

CREATE TABLE "medicine" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "dosage" varchar,
  "type" enum(Liquid,Tablet,Capsules,Drops,Inhalers,Injections),
  "treats" varchar,
  "created_at" timestamp,
  "dr_id" integer
);

CREATE TABLE "medicine_stack" (
  "id" integer PRIMARY KEY,
  "medicine_id" varchar,
  "stack" varchar,
  "created_at" timestamp,
  "expiration_date" timestamp
);

CREATE TABLE "doctor_appointment" (
  "id" integer PRIMARY KEY,
  "appointment_date" timestamp,
  "reminder_date" timestamp,
  "dr_id" integer
);

CREATE TABLE "prescription" (
  "id" integer PRIMARY KEY,
  "dosage" integer,
  "start_date" timestamp,
  "end_date" timestamp,
  "scheduled_time_type" enum(daily,weekly),
  "med_id" integer,
  "dr_id" integer,
  "appointment_id" integer
);

CREATE TABLE "test_type" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "normal_range" float
);

CREATE TABLE "lab_test" (
  "id" integer PRIMARY KEY,
  "result" float,
  "taken_date" timestamp,
  "result_date" timestamp,
  "test_type" integer,
  "appoinment_id" integer
);

ALTER TABLE "medicine_stack" ADD FOREIGN KEY ("medicine_id") REFERENCES "medicine" ("id");

ALTER TABLE "medicine" ADD FOREIGN KEY ("dr_id") REFERENCES "doctor" ("id");

ALTER TABLE "doctor_appointment" ADD FOREIGN KEY ("dr_id") REFERENCES "doctor" ("id");

ALTER TABLE "prescription" ADD FOREIGN KEY ("med_id") REFERENCES "medicine" ("id");

ALTER TABLE "prescription" ADD FOREIGN KEY ("dr_id") REFERENCES "doctor" ("id");

ALTER TABLE "prescription" ADD FOREIGN KEY ("appointment_id") REFERENCES "doctor_appointment" ("id");

ALTER TABLE "lab_test" ADD FOREIGN KEY ("appoinment_id") REFERENCES "doctor_appointment" ("id");

ALTER TABLE "lab_test" ADD FOREIGN KEY ("test_type") REFERENCES "test_type" ("id");
