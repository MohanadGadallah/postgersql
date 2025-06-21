/*

https://www.postgresql.org/docs/current/functions-json.html

https://www.postgresql.org/docs/current/datatype-json.html

*/


-- Extract object value by key
SELECT ('{"a": 1}'::jsonb)['a'];

-- Extract nested object value by key path
SELECT ('{"a": {"b": {"c": 1}}}'::jsonb)['a']['b']['c'];

-- Extract array element by index
SELECT ('[1, "2", null]'::jsonb)[1];

-- Update object value by key. Note the quotes around '1': the assigned
-- value must be of the jsonb type as well
UPDATE table_name SET jsonb_field['key'] = '1';

-- This will raise an error if any record's jsonb_field['a']['b'] is something
-- other than an object. For example, the value {"a": 1} has a numeric value
-- of the key 'a'.
UPDATE table_name SET jsonb_field['a']['b']['c'] = '1';

-- Filter records using a WHERE clause with subscripting. Since the result of
-- subscripting is jsonb, the value we compare it against must also be jsonb.
-- The double quotes make "value" also a valid jsonb string.
SELECT * FROM table_name WHERE jsonb_field['key'] = '"value"';



/*


8.14.6. Transforms

Additional extensions are available that implement transforms for the jsonb type for different procedural languages.

The extensions for PL/Perl are called jsonb_plperl and jsonb_plperlu. If you use them, jsonb values are mapped to Perl arrays, hashes, and scalars, as appropriate.

The extension for PL/Python is called jsonb_plpython3u. If you use it, jsonb values are mapped to Python dictionaries, lists, and scalars, as appropriate.

Of these extensions, jsonb_plperl is considered “trusted”, that is, it can be installed by non-superusers who have CREATE privilege on the current database. The rest require superuser privilege to install.

*/
