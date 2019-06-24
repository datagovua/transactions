select id from transactions order by id desc limit 1;
select id from transactions order by id limit 1;
select * from generate_series(134862877,137972036);



select id, count(*) from (select generate_series as id from generate_series(134862877,137972036)
union all 
(select id from transactions where id between (134862877,137972036)))
tt 
group by id 
having count(*) < 2 
order by id;

