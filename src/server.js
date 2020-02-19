const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const bodyParserError = require('bodyparser-json-error');
const version = require('./version');

app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
app.use(bodyParserError.beautify({ status: 500, res: { msg: 'You sent a bad JSON !' } }));// Beautify body parser json syntax error



//GET the version
app.get('/version', (req, res) => {
    res.status(200).send(version.getVersion());
});

//POST a json
app.post('/', (req, res) => {
    var data = req.body;
    console.log(data);
    return res.status(200).send("success")
});

// Listen to the App Engine-specified port, or 8080 otherwise
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}...`);
});