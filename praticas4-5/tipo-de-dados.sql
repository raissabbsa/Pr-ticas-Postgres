CREATE DATABASE ecommerce;

CREATE TABLE users(
    id,
    name,
    email,
    password
);

CREATE TABLE products(
    id,
    name,
    price,
    "photoId",
    "categoryId",
    "sizeId"
);

CREATE TABLE photos(
    id,
    "imageURL",
    "productId"
);


CREATE TABLE categories(
    id,
    name
);

CREATE TABLE size(
    id,
    size
);

CREATE TABLE productCard(
    id,
    "productId",
    "cardId"
    quantity
);

CREATE TABLE Card(
    id,
    "userId",
    date,
    status,
    "adressId"
);

CREATE TABLE adresses(
    id,
    "userId",
    street,
    number,
    cityId,
    cep,
    complement
);

CREATE TABLE cities(
    id,
    name,
    state
);



