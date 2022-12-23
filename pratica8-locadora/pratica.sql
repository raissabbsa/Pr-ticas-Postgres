CREATE DATABASE rentals;

CREATE TABLE categories(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE movies(
    id SERIAL NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL REFERENCES categories(id)
);

CREATE TABLE disks(
    id SERIAL NOT NULL PRIMARY KEY,
    identifier INTEGER NOT NULL UNIQUE,
    "codeBar" TEXT NOT NULL UNIQUE,
    "movieId" INTEGER NOT NULL REFERENCES movies(id)
);

CREATE TABLE actors(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    "countryOrigin" TEXT NOT NULL,
    birth DATE NOT NULL DEFAULT NOW()
);

CREATE TABLE casts(
    id SERIAL NOT NULL PRIMARY KEY,
    "movieId" INTEGER NOT NULL REFERENCES movies(id),
    "actorId" INTEGER NOT NULL REFERENCES actors(id)
);

CREATE TABLE clients(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
);

CREATE TABLE phones();
    id SERIAL NOT NULL PRIMARY KEY,
    "phoneNumber" TEXT NOT NULL UNIQUE,
    "clientId" INTEGER NOT NULL REFERENCES clients(id)

CREATE TABLE adresses(
    id SERIAL NOT NULL PRIMARY KEY,
    "clientId" INTEGER NOT NULL REFERENCES clients(id),
    street TEXT NOT NULL,
    number INTEGER NOT NULL,
    complement TEXT NOT NULL,
    ditrict TEXT NOT NULL,
    cep TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
);

CREATE TABLE locations(
    id SERIAL NOT NULL PRIMARY KEY,
    "clientId" INTEGER NOT NULL REFERENCES clients(id),
    "dateLocation" DATE NOT NULL DEFAULT NOW(),

);

CREATE TABLE "moviesLocation"(
    id SERIAL NOT NULL PRIMARY KEY,
    "locationId" INTEGER NOT NULL REFERENCES locations(id),
    "movieId" INTEGER NOT NULL REFERENCES movies(id)

);

CREATE TABLE returns(
    id SERIAL NOT NULL PRIMARY KEY,
    "clientId" INTEGER NOT NULL REFERENCES clients(id),
    "dateReturn" DATE NOT NULL DEFAULT NOW(),
);

CREATE TABLE "moviesReturn"(
    id SERIAL NOT NULL PRIMARY KEY,
    "returnId" INTEGER NOT NULL REFERENCES returns(id),
    "movieId" INTEGER NOT NULL REFERENCES movies(id),
    "movieSatisfaction" INTEGER NOT NULL,
    "storeSatisfaction" INTEGER NOT NULL
);





