// init-mongo.js
USERNAME = Process.env.USERNAME

// Create database and collections
database_name = USERNAME + "readings"
db = db.getSiblingDB(database_name);  // Specify the database to use or create it

// Create collections
db.createCollection('sensor');
db.createCollection('meter');
db.createCollection('lab');

print('Database and collections created successfully');
