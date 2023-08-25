const axios = require('axios');
const moment = require('moment');

const args = process.argv.slice(2);

const date = moment(args[0], 'DD-MM-YYYY');
const formattedDate = date.format('DD/MM/YYYY');

console.log(`Date: ${formattedDate}`);

axios.get('https://reqres.in/api/users/1')
    .then((response) => {
        console.log(`Response: ${JSON.stringify(response.data)}`);
    })
    .catch((error) => {
        console.log(error);
    });