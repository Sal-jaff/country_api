# Country API

## Overview

A Country API that allows you to add,remove and view countries.

## Getting Started

### Prerequisites

- Node.js
- NPM
- A cloud-based database hosting platform, e.g [Supabase](https://www.supabase.com)



#### Installations

1. Clone the repo
    - Run `git clone your_github_url` in the CLI of your choice
2. Navigate to the project directory
    - Navigate to the project with `cd country_api`
3. Install dependencies
    - Run `npm install` to install all dependencies for the project
    - This project uses:
        - Express
        - PG = Deals with connection to DBMS
        - cors
        -dotenv
        - nodemon for development
4. Set up your database
    - Create a database on Supabase, or other cloud-based database management system platform
    - retrieve the database URL and copy it
    - Create a `.env` file in the root directory with the following:
        - `DB_URL=<your_database_url>`
    - Replace `<your_database_url>` with the database URL you just copied from Supabase
    - run `npm run setup-db` to setup the database
5. Setup your port
    - Add a `port` key assigned to the port of your choice in your `.env` file
        - `PORT=<port_of_your_choice>`
6. Run the server  
    - run `npm run dev` to run the server in development mode
    - run `npm run start` to run the server in production mode


### Database Schema

`country` - table name

```sql
country_id: Primary Key
name: String, not null
capital: String, not null
population: Integer, not null
fun_fact: String
map_image_url: String
```

## API Endpoints

All available API endpoints with their methods and descriptions.

### Base URL
`http://localhost:<port>/countries` (or your deployed URL)

### API Endpoints

| Method | Endpoint                  | Description                  |
|--------|---------------------------|------------------------------|
| GET    | /countries                | Retrieves all countries          |
| GET    | /countries/:name            | Retrieves a single country      |
| GET    | /countries/:countryName/cities/:cityName | Retrieves a city and its country details |
| POST   | /countries                | Creates a new country           |
|  PATCH     |        /countries/:name    |    Modifies country parameters                             |
| DELETE | /countries/:name            | Deletes a country               |

## Get all countries

### Example Request

To retrieve all countries, you can use the following `GET` request:

`GET /countries`

`curl - X GET http://localhost:<port>/countries`

 ## Get one country

### Example Request

To retrieve a country, you can use the following `GET` request:

`GET /countries/:name`

`curl - X GET http://localhost:<port>/countries/:name`

### Example Response

A successful request returns the country object, for example:

```json
{
  "country_id": 1,
  "name": "Brazil",
  "capital": "Brasília",
  "population": 212559417,
  "languages": "Portuguese",
  "fun_fact": "Brazil is the fifth largest country in the world by both land area and population.",
  "map_image_url": "https://example.com/brazil.png"
}
```

## Get one city in a country

Use the country name and city name in the URL. The lookup is case-insensitive and returns the city fields with a nested `country` object.

`GET /countries/:countryName/cities/:cityName`

Example: `GET http://localhost:<port>/countries/Brazil/cities/S%C3%A3o%20Paulo`

### Example Response

```json
{
  "city_id": 1,
  "city_name": "São Paulo",
  "city_population": 11451999,
  "latitude": "-23.550520",
  "longitude": "-46.633308",
  "country_id": 1,
  "country": {
    "country_id": 1,
    "name": "Brazil",
    "capital": "Brasília",
    "population": 212559417,
    "languages": "Portuguese",
    "fun_fact": "Brazil is the fifth largest country in the world by both land area and population.",
    "map_image_url": "https://example.com/brazil.png"
  }
}
```
## Create a new country

### Example Request

To create a new country, you can use the following `POST` request and give in a  JSON object:
```json
        {
          "name": "new_country",
          "capital": "new_capital",
          "population": 1,
          "languages": "new_language",
          "fun_fact": "new_fact",
          "map_image_url": "new_url"
        }
```
`POST /countries`

`curl - X POST http://localhost:<port>/countries`

### Example Response
A successful response will return a JSON object of the new country , similar to the following:
```json
        {
          "name": "new_country",
          "capital": "new_capital",
          "population": 1,
          "languages": "new_language",
          "fun_fact": "new_fact",
          "map_image_url": "new_url"
        }
```
## Update a Country Parameters

### Example Request

To update a country, you can use the following `PATCH` request and give in a JSON object:
```json
        {
          "name": "new_country",
          "capital": "new_capital",
          "population": 1,
          "languages": "new_language",

        }
```
`PATCH /countries/:name`

`curl - X PATCH http://localhost:<port>/countries/:name`

### Example Response
A successful response will return a JSON object of the updated country , similar to the following:
```json
        {
          "name": "new_country",
          "capital": "new_capital",
          "population": 1,
          "languages": "new_language",
          "fun_fact": "fact",
          "map_image_url": "url"
        }
```
Note how the fun facts and url remains unchanged

## Delete a Country 

### Example Request

To delete a country, you can use the following `DELETE` request giving in the name of the country to be deleted in the URL:

`DELETE /countries/:name`

`curl - X DELETE http://localhost:<port>/countries/:name`

### Example Response
A successful response will return a status of `204 No Content`
