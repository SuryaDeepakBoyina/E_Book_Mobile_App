const { MongoClient } = require('mongodb');

const uri = process.env.MONGODB_URI;
const client = new MongoClient(uri);

async function connectToDatabase() {
  try {
    await client.connect();
    console.log("Connected successfully to MongoDB");
    return client.db(process.env.DB_NAME);
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
}

module.exports = { connectToDatabase, client };
