with s as (select f1.user_id, month(created_at) as thang,sum(number_of_comments) as tong,country
from fb_comments_count f1
join fb_active_users f2
on f1.user_id = f2.user_id
where created_at between '2019-12-01' and '2020-01-31'
group by month(created_at), country),

s2 as (select country, thang, dense_rank() over(partition by thang order by tong) as r
from s
order by country, thang desc),

s3 as (select country,r, lag(r) over(partition by country order by thang desc) as l
from s2)

select country from s3
where r>l

-- WITH rankbefore AS (SELECT a.country, RANK() OVER(ORDER BY SUM(c.number_of_comments) DESC) as ranking
-- FROM fb_comments_count c
-- JOIN fb_active_users a ON c.user_id = a.user_id
-- WHERE DATE_FORMAT(c.created_at, '%Y-%m') = '2019-12'
-- GROUP BY a.country),

-- rankafter AS (SELECT a.country, RANK() OVER(ORDER BY SUM(c.number_of_comments) DESC) as ranking
-- FROM fb_comments_count c
-- JOIN fb_active_users a ON c.user_id = a.user_id
-- WHERE DATE_FORMAT(c.created_at, '%Y-%m') = '2020-01'
-- GROUP BY a.country)

-- SELECT 
-- rankbefore.country,
-- rankbefore.ranking AS before_ranking,
-- rankafter.ranking AS after_ranking
-- FROM rankbefore JOIN rankafter
-- ON rankbefore.country = rankafter.country
-- WHERE rankafter.ranking > rankbefore.ranking

