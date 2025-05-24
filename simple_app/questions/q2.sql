/*
Write a SQL query to find the top n artists with the most albums.
 Your query should return the artist's name and the total number of albums they have. Sort the results in descending order of album count, 
and use a parameter :n to limit the number of results returned."

*/

select "Artist"."Name",
    count(*) as albums
    from  "Artist"
    left join "Album" using ("ArtistId")
group by "Artist"."Name"
order by albums desc 
    limit 5;