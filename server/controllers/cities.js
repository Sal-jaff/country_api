const City = require('../models/City')

async function index(req,res) {
    try {
        const cities = await City.getAll()
        res.status(200).json(cities)
    }catch (err){
        res.status(500).json({error:err.message})
    }
}

async function show(req,res){
    try{
        const name = req.params.name
        const city = await City.getOneByCityName(name) //fix this pls
        res.status(200).json(city)
    } catch(err){
        res.status(404).json({error:err.message})
    }
}


async function create(req,res){
    try{
        const data = req.body
        const newCity = await City.create(data)
        res.status(201).json(newCity)

    } catch(err){
        res.status(400).json({error:err.message})
    }
}

async function update(req,res){
    
    try{
        const name = req.params.name.toLowerCase()
        const city = await City.getOneByCityName(name) //fix
        const result = await city.update(req.body)
        
        res.status(200).json(result)
    } catch(err){
        res.status(404).send({error:err.message})

    }
}

async function destroy(req,res) {
    try{
        const name = req.params.name
        const city = await City.getOneByCityName(name)
        const result = await city.destroy()
        res.status(204).end()
    }catch (err) {
        res.status(404).json({error:err.message})

    }

}

module.exports = {index,show,create,update,destroy}
