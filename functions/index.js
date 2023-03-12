const functions = require("firebase-functions");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

exports.helloWorld = functions.
    region("us-west1").https.onRequest((request, response) => {
      functions.logger.info("Hello logs!", {structuredData: true});
      response.send("Hello from Firebase!");
    });
