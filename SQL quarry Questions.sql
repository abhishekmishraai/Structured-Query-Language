--Find the most profitable company in the financial sector of the entire world along with its continent
select company,continent
from forbes_global_2010_2014
where sector ='Financials'
order by profits desc
limit 1


--Most Profitable Companies
select *
from forbes_global_2010_2014
order by profits desc 
limit 1


--Count the number of companies in the IT sector in each country
select count(company),country
from forbes_global_2010_2014
where sector = 'Information Technology'
group by country


--Find the average profit for major banks
select avg(profits)
from forbes_global_2010_2014
where industry = 'Major Banks'


--Find the industry which has the lowest average sales compared to all industries
select avg(sales)as avg,industry
from forbes_global_2010_2014
group by industry
order by avg asc 
limit 1


--Find the number of USA companies that are on the list
select count(company) 
from forbes_global_2010_2014
where country = 'United States'


--Find the profit to sales ratio of Royal Dutch Shell
select company,(profits/sales) as ratio
from forbes_global_2010_2014
where company = 'Royal Dutch Shell'


--Find the total assets of the energy sector
select count(company)
from forbes_global_2010_2014
where sector ='Energy'


--Find the total market value for the financial sector
select sum(marketvalue)
from forbes_global_2010_2014
where sector = 'Financials'


--Highest Market Value For Each Sector
select sum(marketvalue)as sum_marketvalue,sector
from forbes_global_2010_2014
group by sector
order by sum_marketvalue desc
limit 1


--Highest Market Value For Each Sector
select company,sector,marketvalue as highest_market_value from(
select *,row_number() over(partition by sector order by marketvalue desc)as rn
from forbes_global_2010_2014) as e
where e.rn = 1


--Highest Market Value Per Sector
select sector,marketvalue as highest_market_value from(
select *,row_number() over(partition by sector order by marketvalue desc)as rn
from forbes_global_2010_2014) as e
where e.rn = 1


--List all companies working in the financial sector with headquarters in Europe or Asia
select company
from forbes_global_2010_2014
where sector = 'Financials' and (continent = 'Asia' or continent = 'Europe')


--Find a content that has the highest number of companies
select count(company)as count_com,continent
from forbes_global_2010_2014
group by continent
order by count_com desc
limit 1


--Find industries that make a profit
select industry, avg(profits), min(sales), avg(sales)
from forbes_global_2010_2014
group by industry
having avg(profits) > 0


--Find industries with the highest market value in Asia
select continent, industry, max(marketvalue)
from forbes_global_2010_2014
where continent ='Asia'
group by industry


--Find industries with the highest number of companies
select industry, count(company) as c
from forbes_global_2010_2014
group by industry
order by c desc



--Find the country that has the most companies listed on Forbes
select country,count(company) as company_count
from forbes_global_2010_2014
group by country
order by company_count desc
limit 1


--Top 3 US Sectors
select country, rank 
from forbes_global_2010_2014
where country = 'United States'
order by rank asc 
limit 3


--


                                             --(sheet 2)--

                                             
--Find the date with the highest opening stock price(sheet 2)
select date,open
from aapl_historical_stock_price
order by open desc 
limit 1


--Find The Best Day For Trading AAPL Stock
selct year,(open - close) as sk
from aapl_historical_stock_price;



                                             --(sheet 3)--

                                             

create table google_file_store(
filename varchar(1000),
contents varchar(1000)
)

insert into google_file_store values(
('draft1.txt','The stock exchange predicts a bull market which would make many investors happy.'),
('draft2.txt','The stock exchange predicts a bull market which would make many investors happy, but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market.'),
('final.txt','The stock exchange predicts a bull market which would make many investors happy, but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market. As always predicting the future market is an uncertain game and all investors should follow their instincts and best practices.')
)



--Find the number of times the words 'bull' and 'bear' occur in the contents. 
--We're counting the number of times the words occur so words like 'bullish' should not be included in our count.
--Output the word 'bull' and 'bear' along with the corresponding number of occurrences.

select contents,
((LENGTH(contents) - length(replace(contents,'bull','')))/4) as count_bull,
((LENGTH(contents) - length(replace(contents,'bear','')))/4) as Count_bear
from google_file_store



                                             --(sheet 4)--


--Find companies that have at least 2 Chinese speaking users.
select count(language) as language_china,company_id
from playbook_users
where language = 'chinese'
group by company_id
having language_china >1


--Count the number of speakers per each language
select count(language), language
from playbook_users
group by  language



                                             --(sheet 5)--


                                             
--Count the number of accounts used for logins in 2016
select count(distinct account_id)
from product_logins
where login_date BETWEEN '2016-01-01' AND '2016-12-31'
