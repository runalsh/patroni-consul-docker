create user repl_user with replication encrypted password 'repl_password';
select pg_create_physical_replication_slot('replication_slot');

CREATE TABLE inflation_data (
    RegionalMember TEXT,
    Year INT,
    Inflation DECIMAL,
    Unit_of_Measurement TEXT,
    Subregion TEXT,
    Country_Code TEXT
);
COPY inflation_data(RegionalMember, Year, Inflation, Unit_of_Measurement, Subregion, Country_Code)
FROM '/docker-entrypoint-initdb.d/inflation.csv' 
DELIMITER ',' 
CSV HEADER;