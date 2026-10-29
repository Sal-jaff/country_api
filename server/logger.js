// logs the http method and the endpoint of the URL that the request is coming in
// useful for debug
// executes between req and res

const  logger = (req,res,next) => {
    console.log(req.method,req.originalUrl);
    next()
}
module.exports = logger