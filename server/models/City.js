const db = require('../db/connect')

class City {
    constructor({city_id,city_name,city_population,latitude,longitude,country_id}){
        this.city_id = city_id
        this.city_name = city_name
        this.city_population = city_population
        this.latitude = latitude
        this.longitude = longitude
        this.country_id = country_id
    }   


    static async getAll() {
        const response= await db.query('SELECT * FROM city;')

        if (response.rows.length === 0){
            throw new Error('no cities available')
        }

        return response.rows.map(c => new City(c))
    }   

    static async getOneByCityName(CityName){

        const response = await db.query('SELECT city.* FROM city JOIN country ON country.country_id = city.country_id WHERE LOWER(country.name) = LOWER($1);',
            [CityName]
        )

        if (response.rows.length ===0){
            throw new Error('Unable to locate city')
        }

        return response.rows

    }


    static async create(data){
        const {city_name,city_population} = data
        const existingCity = await db.query('SELECT city_name FROM city WHERE LOWER(city_name) = LOWER($1);',
            [city_name]
        )

        if(existingCity.rows.length ===0){
            let response = await db.query('INSERT INTO city (city_name,city_population) VALUES ($1,$2) RETURNING *;',
                [city_name,city_population]
            )
            return new City (response.rows[0])
        } else{
            throw new Error('A City with this name already exists')
        }


    }
    async update(data) {
        const city_name = data.city_name || this.city_name
        const city_population = data.city_population || this.city_population
        const latitude = data.latitude || this.latitude 
        const longitude = data.longitude || this.longitude 


        const response = await db.query('UPDATE city SET city_name = $1,city_population = $2, latitude = $3, longitude = $4 WHERE city_id =$5 RETURNING *;',
            [city_name,city_population,latitude,longitude,this.city_id]
        )

        return new City (response.rows[0])
    }
    async destroy() {
        let response = await db.query('DELETE FROM city WHERE city_name = $1 RETURNING *;',
            [this.city_name]
        )
        return new City(response.rows[0])
    }    
}
module.exports = City
