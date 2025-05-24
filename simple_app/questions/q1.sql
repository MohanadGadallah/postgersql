/* 
Question:
You are given two tables from a music database:

    genre:

        genreid (primary key)

        name (name of the genre)

    track:

        trackid (primary key)

        name (track name)

        genreid (foreign key referencing genre)

Write a SQL query to display a list of all genres along with the number of tracks in each genre. The output should include genres even if they have zero tracks, and should be sorted by the number of tracks in descending order.
*/

select genre.name , Count(*) as count
    from genre
    left join track using(genreid)
group by genre.name
order by count desc;