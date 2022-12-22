CREATE DATABASE "drivenBank"

CREATE TABLE customers(
    id SERIAL NOT NULL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE "bankAccount"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
    "accountNumber" TEXT NOT NULL,
    agency TEXT NOT NULL,
    "openDate" DATE NOT NULL DEFAULT NOW(),
    "closeDate" DATE
);

CREATE TYPE "transactionType" AS ENUM ( 'deposit', 'withdraw');

CREATE TABLE transactions(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    amount INTEGER NOT NULL,
    type "transactionType" NOT NULL,
    time TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE "creditCards"(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    name TEXT NOT NULL,
    number INTEGER NOT NULL,
    "securityCode" TEXT NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    password TEXT NOT NULL,
    "limit" INTEGER NOT NULL
);

CREATE TYPE "phoneType" AS ENUM ('landline', 'mobile');

CREATE TABLE "customersPhones"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES customers(id),
    number INTEGER NOT NULL,
    type "phoneType" NOT NULL 
);

CREATE TABLE "customersAddresses"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
    street TEXT NOT NULL,
    number INTEGER NOT NULL,
    complement TEXT,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
    
);

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE states(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL 
);