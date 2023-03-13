const functions = require("firebase-functions");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

exports.helloWorld = functions.
    region("us-west1").
    https.onRequest((request, response) => {
      functions.logger.info("Hello logs!", {structuredData: true});
      response.send("Hello from Firebase!");
    });

exports.date = functions.
    region("us-west1").
    https.onRequest((req, res) => {
      res.status(200).send(
          new Date().toString(),
      );
    });

exports.getCopyRightSpan = functions.
    region("us-west1").https.onRequest((req, res) => {
      const fullYear = new Date().getFullYear();
      res.status(200).send(`
        <span>© ${fullYear}</span>
      `);
    });

exports.getAppleMapScript = functions.
    region("us-west1").https.onRequest((req, res) => {
      res.status(200).send(`
          const appleMap = document.getElementById("apple-map");
          const token = 'TOKEN';
          console.log(appleMap);
      `);
    });
