/* This is an example of an SQL DDL migration. It creates an `items` table and
 * then calls an `electric.electrify` procedure to expose the table to the
 * ElectricSQL replication machinery.
 *
 * Note that these statements are applied directly to the *Postgres* database.
 * Electric then handles keeping the local SQLite database schema in sync with
 * the electrified subset of your Postgres database schema.
 *
 * See https://electric-sql.com/docs/usage/data-modelling for more information.
 */

-- Create a simple items table.
CREATE TABLE person (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL
);

ALTER TABLE person ENABLE ELECTRIC;


CREATE TABLE club (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL
);

ALTER TABLE club ENABLE ELECTRIC;

CREATE TABLE clubperson (
    id UUID PRIMARY KEY,
    person_id UUID  NOT NULL,
    club_id UUID  NOT NULL
);

ALTER TABLE clubperson ENABLE ELECTRIC;
