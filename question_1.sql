/* 
 Interview Question

Question:
You are given a factbook table containing daily stock market statistics with the following columns:

    date (date): the date of the record

    shares (bigint): number of shares traded on that day

    trades (bigint): number of trades executed

    dollars (bigint): total dollar value of all trades

Write a prepared SQL statement that takes a single date as input (e.g., '2023-01-01') and returns all records from the same month as that date. The results should be ordered by date.

*/


prepare foo as
    select date,shares,trades,dollars 
        from factbook;
    where date >= $1 :: date and
        date < $1:: date + interval '1 month '
    order by date


--- to run it --
-- execute foo('2010-02-01'); ---
