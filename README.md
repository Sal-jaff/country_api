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
| POST   | /countries                | Creates a new country           |
| DELETE | /countries/:name            | Deletes a country               |

## Get all countries

### Example Request

To retrieve all countries, you can use the following `GET` request:

`GET /countries`

`curl - X GET http://localhost:<port>/countries`

### Example Response

A successful response will return a JSON array of countries objects, similar to the following:
```json
   [
        {
          "id": 1,
          "name": "country1",
          "capital": "capital1",
          "population": 1,
          "languages": "language1",
          "fun_fact": "fact1",
          "map_image_url": "url1"
        },
        {
          "id": 2,
          "name": "country2",
          "capital": "capital2",
          "population": 2,
          "languages": "language2",
          "fun_fact": "fact2",
          "map_image_url": "url2"
        },
    ]
```