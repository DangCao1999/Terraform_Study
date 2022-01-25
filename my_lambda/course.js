'use strict'
const AWS = require("aws-sdk");
const ddb = new AWS.DynamoDB.DocumentClient({region: "ap-southeast-1"});
exports.handler = async (event) => {
    // TODO implement
    const response = {
        statusCode: 200,
        body: "good",
    };
    return response;
};


