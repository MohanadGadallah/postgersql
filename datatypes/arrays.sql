/*

https://www.postgresql.org/docs/current/arrays.html

https://www.postgresql.org/docs/current/functions-array.html


This time, as the query must scan all the hashtags in the table, it won’t use the previous index. The unnest() function is a must-have when dealing with arrays in PostgreSQL because it allows processing the array’s content as if it were just another relation. And SQL comes with all the tooling to process relations, as we’ve already seen in this course.
*/