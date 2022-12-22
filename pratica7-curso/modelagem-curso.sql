CREATE DATABASE "modelingCourse";

CREATE TABLE module(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE classes(
    id SERIAL NOT NULL PRIMARY KEY,
    surname TEXT NOT NULL
);

CREATE TABLE students(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf TEXT NOT NULL,
    email TEXT NOT NULL,
    classId INTEGER NOT NULL REFERENCES classes(id)
);

CREATE TABLE historic(
    id SERIAL NOT NULL PRIMARY KEY,
    "studentId" INTEGER NOT NULL REFERENCES students(id),
    "classId" INTEGER NOT NULL REFERENCES classes(id),
    "dateBegin" DATE NOT NULL DEFAULT NOW(),
    "dateEnd" DATE
);

CREATE TYPE "gradeType" AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE projects(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    "dateDelivery" DATE NOT NULL DEFAULT NOW(),
    studentId INTEGER NOT NULL REFERENCES students(id),
    grade "gradeType" NOT NULL,
    "moduleId" INTEGER NOT NULL REFERENCES module(id)
);

