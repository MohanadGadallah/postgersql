


/*
> **"Write a SQL query to list all albums by a given artist name, 
along with the total duration of tracks in each album. 
The duration should be returned as an interval (e.g., in minutes/seconds). 
Order the results alphabetically by album title."**
>
> ✅ Assume:
>
> * You are working with the following tables: `artist`, `album`, and `track`.
> * Relationships:
>
>   * `album` has a foreign key `artistid` referencing `artist`.
>   * `track` has a foreign key `albumid` referencing `album`.
>
> 🔢 The query should use a parameter `:name` to filter by the artist's name.

*/


select "Album"."Title" as album,
        sum("Milliseconds") * interval '1 ms' as duration
    from "Album"
        join "Artist" using ("ArtistId")
        join "Track" using ("AlbumId")
    where "Artist"."Name" ='Accept'
group by album
order by album;
