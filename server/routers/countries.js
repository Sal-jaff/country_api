const {Router} = require('express')
const countryController = require('../controllers/countries')
//const cityController = require('../controllers/cities')

const countryRouter = Router()

countryRouter.get('/', countryController.index)
//countryRouter.get('/:name', countryController.showInCountry)
countryRouter.get('/:name', countryController.show)
countryRouter.post('/', countryController.create)
countryRouter.patch('/:name', countryController.update)
countryRouter.delete('/:name', countryController.destroy)

module.exports = countryRouter
