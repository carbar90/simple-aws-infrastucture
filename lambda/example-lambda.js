const AWS = require('aws-sdk');

exports.handler = async (event, context) => {

    try {
        // Perform any logic or processing here
        const response = {
            statusCode: 200,
            body: JSON.stringify({ message: 'Hello from Lambda!' })
        };

        return response;
    } catch (error) {
        console.error(error);

        const response = {
            statusCode: 500,
            body: JSON.stringify({ error: 'Internal Server Error' })
        };

        return response;
    }
};