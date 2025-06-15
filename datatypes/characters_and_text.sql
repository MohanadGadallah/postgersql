/*check this  https://www.postgresql.org/docs/current/datatype-character.html

for string  function and opreation methods check https://www.postgresql.org/docs/current/functions-string.html

pattern matching https://www.postgresql.org/docs/current/functions-matching.html#FUNCTIONS-POSIX-REGEXP


pg_trgm — support for similarity of text using trigram matching

https://www.postgresql.org/docs/current/pgtrgm.html



Chapter 12. Full Text Search


https://www.postgresql.org/docs/current/textsearch.html
*/

select id, regexp_split_to_table(themes, ',')
  from opendata.archives_planete
 where id = 'IF39599';
----------------
 select id,
       regexp_split_to_array(
         regexp_split_to_table(themes, ','),
         ' > ')
       as categories
  from opendata.archives_planete
 where id = 'IF39599';

 -----
 with categories(id, categories) as
 (
   select id,
          regexp_split_to_array(
            regexp_split_to_table(themes, ','),
            ' > ')
          as categories
     from opendata.archives_planete
 )
 select id,
        categories[1] as category,
        categories[2] as subcategory
   from categories
  where id = 'IF39599';



  ------

  with categories(id, categories) as
  (
    select id,
           regexp_split_to_array(
             regexp_split_to_table(themes, ','),
             ' > ')
           as categories
      from opendata.archives_planete
  )
  select categories[1] as category,
         categories[2] as subcategory,
         count(*)
    from categories
group by rollup(category, subcategory)
;


--------show client_encoding;
