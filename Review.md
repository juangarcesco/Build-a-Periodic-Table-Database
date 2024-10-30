**Complete the tasks below**

`psql --username=freecodecamp --dbname=periodic_table`
`\d`
`\d properties`

**1) You should rename the weight column to atomic_mass**

`ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;`

**2) You should rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius**

`ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;`
`ALTER TABLE properties RENAME COLUMN  boiling_point TO boiling_point_celsius;`

**3) Your melting_point_celsius and boiling_point_celsius columns should not accept null values**

`ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;`
`ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;`

**4) You should add the UNIQUE constraint to the symbol and name columns from the elements table**

`ALTER TABLE elements ADD CONSTRAINT unique_symbol UNIQUE (symbol);`
`ALTER TABLE elements ADD CONSTRAINT unique_name UNIQUE (name);`

**5) Your symbol and name columns should have the NOT NULL constraint**

`ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;`
`ALTER TABLE elements ALTER COLUMN name SET NOT NULL;`

**6) You should set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table**

`ALTER TABLE properties ADD CONSTRAINT fk_properties_elements FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);`

**7) You should create a types table that will store the three types of elements**

`CREATE TABLE types();`

**8) Your types table should have a type_id column that is an integer and the primary key**

`ALTER TABLE types ADD COLUMN type_id SERIAL PRIMARY KEY;`

**9) Your types table should have a type column that's a VARCHAR and cannot be null. It will store the different types from the type column in the properties table**

`ALTER TABLE types ADD COLUMN type VARCHAR(255) NOT NULL;`

**10) You should add three rows to your types table whose values are the three different types from the properties table**

`SELECT * FROM properties;`
`INSERT INTO types(type) VALUES ('metal'), ('nonmetal'), ('metalloid');`

**11) Your properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint**

**12) Each row in your properties table should have a type_id value that links to the correct type from the types table**

`SELECT * FROM properties;`
`ALTER TABLE properties ADD COLUMN temp_type NULL;`
`\d properties;`
`UPDATE properties SET temp_type = 1 WHERE type_id = 'metal';`
`UPDATE properties SET temp_type = 2 WHERE type_id = 'nonmetal';`
`UPDATE properties SET temp_type = 3 WHERE type_id = metalloid';`
`ALTER TABLE properties DROP COLUMN type_id;`
`ALTER TABLE properties RENAME COLUMN temp_type TO type_id;`
`ALTER TABLE properties ADD CONSTRAINT fk_properties_types FOREIGN KEY (type_id) REFERENCES types(type_id);`
`ALTER TABLE properties ADD CONSTRAINT fk_type_id FOREIGN KEY (type_id) REFERENCES types(type_id);`

**13) You should capitalize the first letter of all the symbol values in the elements table. Be careful to only capitalize the letter and not change any others**

`SELECT * FROM elements;`
UPDATE elements SET symbol = INITCAP(symbol);
UPDATE elements SET symbol = 'He' WHERE symbol = 'he';
UPDATE elements SET symbol = 'Li' WHERE symbol = 'li';
UPDATE elements SET symbol = 'MT' WHERE symbol = 'mT';

**14) You should remove all the trailing zeros after the decimals from each row of the atomic_mass column. You may need to adjust a data type to DECIMAL for this. The final values they should be are in the atomic_mass.txt file**

SELECT * FROM properties;
ALTER TABLE properties ALTER COLUMN atomic_mass SET DATA TYPE DECIMAL;
UPDATE properties SET atomic_mass = 1.008 WHERE atomic_number = 1;
UPDATE properties SET atomic_mass = 4.0026 WHERE atomic_number = 2;
UPDATE properties SET atomic_mass = 6.94 WHERE atomic_number = 3;
UPDATE properties SET atomic_mass = 9.0122 WHERE atomic_number = 4;
UPDATE properties SET atomic_mass = 10.81 WHERE atomic_number = 5;
UPDATE properties SET atomic_mass = 12.011 WHERE atomic_number = 6;
UPDATE properties SET atomic_mass = 14.007 WHERE atomic_number = 7;
UPDATE properties SET atomic_mass = 15.999 WHERE atomic_number = 8;
UPDATE properties SET atomic_mass = 18.998 WHERE atomic_number = 9;
UPDATE properties SET atomic_mass = 20.18 WHERE atomic_number = 1000;

**15) You should add the element with atomic number 9 to your database. Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal**

**16) You should add the element with atomic number 10 to your database. Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's a nonmetal**

INSERT INTO elements(atomic_number, name, symbol) VALUES (9, 'Fluorine', 'F'), (10, 'Neon', 'Ne');
INSERT INTO elements(atomic_number, name, symbol) VALUES (9, 'Fluorine', 'F'), (10, 'Neon', 'Ne');
INSERT INTO properties(atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES (9, 18.998, -220, -188.1, (SELECT type_id FROM types WHERE type = 'nonmetal')), (10, 20.18, -248.6, -246.1, (SELECT type_id FROM types WHERE type = 'nonmetal'));

**17) You should create a periodic_table folder in the project folder and turn it into a git repository with git init**

mkdir periodic_table
cd periodic_table
git init
git add .
git commit -m "Initial commit"

**18) Your repository should have a main branch with all your commits**

**19) Your periodic_table repo should have at least five commits**

**20) You should create an element.sh file in your repo folder for the program I want you to make**

**21) Your script (.sh) file should have executable permissions**
touch element.sh
chmod +x element.sh

**22) If you run ./element.sh, it should output only Please provide an element as an argument. and finish running.**

**23) If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output only The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.**

**24) If you run ./element.sh script with another element as input, you should get the same output but with information associated with the given element.**

**25) If the argument input to your element.sh script doesn't exist as an atomic_number, symbol, or name in the database, the only output should be I could not find that element in the database.**


**26) The message for the first commit in your repo should be Initial commit**

git add element.sh
git commit -m "feat: add script to query and display element details"

**27) The rest of the commit messages should start with fix:, feat:, refactor:, chore:, or test:**

**28) You should delete the non existent element, whose atomic_number is 1000, from the two tables**

DELETE FROM properties WHERE atomic_number = 1000;
DELETE FROM elements WHERE atomic_number = 1000;

**29) Your properties table should not have a type column**

**30) You should finish your project while on the main branch. Your working tree should be clean and you should not have any uncommitted changes**
