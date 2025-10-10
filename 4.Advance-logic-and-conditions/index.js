import { PGlite } from '@electric-sql/pglite';
import fs from 'fs';



(async () => {
  const db = new PGlite();


  // Set up the DB files
  const createTables = fs.readFileSync('create-tables.sql', 'utf8');
  const insertCarsData = fs.readFileSync('insert-cars-data.sql', 'utf8');
  await db.exec(createTables);
  await db.exec(insertCarsData);

  // Run the changes made in DM section
  const crudOperations = fs.readFileSync('crud-operations.sql', 'utf8');
  await db.exec(crudOperations);

  //Populate tables
  const populateTables = fs.readFileSync('populate-tables.sql', 'utf-8');
  await db.exec(populateTables);

  //alter tables
  const alterTables = fs.readFileSync('alter-tables.sql', 'utf-8');
  await db.exec(alterTables);


  //insert newData Into tables
  const insertNewData = fs.readFileSync('insert-newData.sql', 'utf-8')
  await db.exec(insertNewData)

  //alter constraints
  const alterConstraints = fs.readFileSync('alter-constraints.sql', 'utf-8')
  await db.exec(alterConstraints);

  // Load the SQL query file
  let query = fs.readFileSync('query.sql', 'utf8');

  // Replace placeholder with user input
  // query = query.replace('<<BRAND>>', userInput);


  // Run the query from the query file
  const response = await db.query(query);


  console.clear();
  console.table(response.rows);
})();
