exports.handler = async (event, context) => {

    // Your Lambda function logic here
    return {
        statusCode: 200,
        body: JSON.stringify('Hello from Lambda!'),
    };

};