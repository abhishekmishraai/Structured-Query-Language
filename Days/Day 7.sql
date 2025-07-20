create table match (season_end_year  integer,
			  week integer,
			  date date,
			  home_team text,
			  home_goals integer,
			  away_goals integer,
			  away_text text,
			  result text
			 )
			 
select * from match	


select home_team,count(home_team) from match
group by home_team