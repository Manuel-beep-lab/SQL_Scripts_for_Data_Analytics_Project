select 
	u.Month,
    c.Region,
    sum(u.DataGB) as TotalDataGB,
    sum(u.Minutes) as TotalMinutes,
    sum(u.sms) as TotalSMS
from
	customerusage u
join 
	customer c on u.CustomerID = c.CustomerID
group by 
	u.Month, c.Region
order by
	u.Month, c.Region;

         