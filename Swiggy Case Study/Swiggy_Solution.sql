use swiggy;

select * from swiggy limit 10;

#1. HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select count(distinct restaurant_name) as High_rated_restaurant
from swiggy 
where rating>4.5;

#2. WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city, count(distinct restaurant_name) as restaurant_count
from swiggy
group by city
order by restaurant_count desc
limit 1;

#3.HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
select count(distinct restaurant_name) as Restaurant_with_pizza
from swiggy
where cuisine like '%Pizza%';


#4.WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select cuisine,count(*) as cuisine_count
from swiggy
group by cuisine
order by cuisine_count desc
limit 1;


#5.WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
select city,avg(rating) as Average_Rating
from swiggy
group by city;


#6. WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
select restaurant_name, menu_category,max(price) as Highest_price
from swiggy
where menu_category= 'Recommended'
group by restaurant_name,menu_category;


#7.FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE.
select distinct restaurant_name, cuisine,cost_per_person
from swiggy
where cuisine <> '%Indian%'
order by cost_per_person desc
limit 5;


#8.FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
select distinct restaurant_name,cost_per_person 
from swiggy
where cost_per_person>(select avg(cost_per_person) from swiggy);

#9. RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES.
select distinct s1.restaurant_name, s1.city, s2.city
from swiggy s1 join swiggy s2
on s1.restaurant_name = s2.restaurant_name
and s1.city != s2.city;


#10. WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
select distinct restaurant_name, menu_category, count(item) as no_of_items
from swiggy 
where menu_category = 'Main Course'
group by restaurant_name,menu_category
order by no_of_items limit 1;

#11. LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.
select distinct restaurant_name, 
(count(case when veg_or_nonveg ='Veg' then 1 end)*100/count(*)) as vegeterian_percentage
from swiggy
group by restaurant_name
having vegeterian_percentage = 100.00
order by restaurant_name ; 

#12. WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?
select distinct restaurant_name,avg(price) as Average_price
from swiggy
group by restaurant_name
order by Average_price;

#13. WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
select distinct restaurant_name, count(distinct menu_category) as Number_of_category 
from swiggy
group by restaurant_name
order by Number_of_category desc limit 5;


#14. WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
select distinct restaurant_name, 
(count(case when veg_or_nonveg= 'Non-veg' then 1 end)*100/count(*)) as Non_vegeterian_percentage
from swiggy
group by restaurant_name
order by Non_vegeterian_percentage desc limit 1;


