BEGIN;

DROP TABLE IF EXISTS factbook;

CREATE TABLE factbook (
  year    int,
  date    date,
  shares  text,
  trades  text,
  dollars text
);

\copy factbook FROM '/Users/mohanadgad/Desktop/postgersql/factbook.csv' WITH DELIMITER E'\t' NULL ''

ALTER TABLE factbook
  ALTER COLUMN shares TYPE bigint USING replace(shares, ',', '')::bigint;

ALTER TABLE factbook
  ALTER COLUMN trades TYPE bigint USING replace(trades, ',', '')::bigint;

ALTER TABLE factbook
  ALTER COLUMN dollars TYPE numeric USING substring(replace(dollars, ',', '') from 2)::numeric;

COMMIT;



--- to import it ----
-- psql -U your_username -d your_database -f insert_data.sql ----