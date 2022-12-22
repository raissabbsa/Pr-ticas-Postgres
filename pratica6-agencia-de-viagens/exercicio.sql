CREATE DATABASE "travelAgencies";

CREATE TABLE airport(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT NOT NULL
);

CREATE TABLE companies(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT NOT NULL
);

CREATE TABLE flights(
    id SERIAL NOT NULL PRIMARY KEY,
    surname TEXT NOT NULL,
    "companyId" INTEGER NOT NULL REFERENCES companies(id),
    "airportOriginId" INTEGER NOT NULL REFERENCES airport(id),
    "airportDestinyId" INTEGER NOT NULL REFERENCES airport(id),
    "exitTime" TIMESTAMP NOT NULL DEFAULT NOW(),
    "arrivalTime" TIMESTAMP   
);