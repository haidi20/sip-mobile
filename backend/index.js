const http = require('http');
const cors = require('cors');
const express = require('express');
const { Op } = require('sequelize');
const bodyParser = require('body-parser');

const v1Route = require("./routes/v1");
const { updateOrCreate } = require("./utils");

const app = express();
const server = http.createServer(app);
// const io = socketIo(server);

app.use(cors());
app.use(bodyParser.json());

// Use the v1 route
app.use('/api/v1', v1Route);

server.listen(3001, () => {
    console.log('listening on *:3001');
});
