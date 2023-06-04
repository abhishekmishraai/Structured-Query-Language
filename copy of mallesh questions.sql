--From the tables write a SQL query to find those students appeared exams in various subjects in every year. Return examination ID, subject name, examination year, number of students.
-- Write your query here
select e.exam_id, s.subject_name, e.exam_year, e.no_of_student from exam_test as e
inner join subject_test as s on e.subject_id=s.subject_id
group by exam_id, subject_name, exam_year

----Compute total number of students
--Easy
--From the tables write a SQL query to compute total number of students who appeared for the first year of each examination of every subject. Return examination ID, subject name, first year, number of students.
-- Write your query here

select e.exam_id, s.subject_name, e.exam_year as first_year, e.no_of_student from exam_test as e
left join subject_test as s on e.subject_id=s.subject_id
where exam_year='2017'

--Total amount
Easy
What is the total amount each customer spent at the restaurant?




--Find item
Easy
What was the first item from the menu purchased by each customer?

-- Write your query here

With Rank as
(
Select S.customer_id, 
       M.product_name, 
       S.order_date,
       DENSE_RANK() OVER (PARTITION BY S.Customer_ID Order by S.order_date) as rank
From Menu m
join Sales s
On m.product_id = s.product_id
group by S.customer_id, M.product_name,S.order_date
)
Select Customer_id, product_name
From Rank
Where rank = 1
group by customer_id, product_name
order by  customer_id, product_name desc

--Search Insert Position
Easy
Given a sorted array of distinct integers and a target value, write a python program to return the index if the target is found. If not, return the index where it would be if it were inserted in order.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#nums= eval(input())
#target= int(input())
#def searchInsert(nums, target):

def search_insert(nums, target):
  left, right = 0, len(nums) - 1
  while left <= right:
    mid = (left + right) // 2
    if nums[mid] == target:
      return mid
    elif nums[mid] < target:
      left = mid + 1
    else:
      right = mid - 1
  return left
nums= eval(input())
target= int(input())
print(search_insert(nums, target)) 

--Find students
Easy
From the tables write a SQL query to find those students who achieved 100 percent marks in every subject for all the year. Return subject ID, subject name, students for all year.


select s.subject_id, s.subject_name, sum(no_of_student) as students_for_all_year from subject_test as s
left join exam_test as e on e.subject_id=s.subject_id
group by s.subject_id, s.subject_name

--Single Number
Easy
Given a non-empty array of integers nums, every element appears twice except for one. Write a python program to find that single one.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#nums=eval(input())
#def singleNumber(nums):
nums=eval(input())
def findSingle(nums):
    res = 0
    for num in nums:
        res ^= num
    return res
print(findSingle(nums))

--Find K Closest Elements
Medium
Given a sorted integer array arr, two integers k and x, write a python program to return the k closest integers to x in the array. The result should also be sorted in ascending order.

An integer a is closer to x than an integer b if:

- |a - x| < |b - x|, or - |a - x| == |b - x| and a < b

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#nums= eval(input())
#target= int(input())
#def searchInsert(nums, target):

def find_closest_elements(arr, k, x):
    left, right = 0, len(arr) - k
    
    while left < right:
        mid = (left + right) // 2
        if x - arr[mid] > arr[mid + k] - x:
            left = mid + 1
        else:
            right = mid
            
    return arr[left:left+k]

arr = [1,2,3,4,5]
k = 4
x = 3
result = find_closest_elements(arr, k, x)
print(result)  # Output: [1, 2, 3, 4]

--Next Greater Element
Easy
The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.

You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.

For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.

Write a python program to return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#nums= eval(input())
#target= int(input())
#def searchInsert(nums, target):
nums1=eval(input())
nums2=eval(input())
def nextGreaterElement(nums1, nums2):
    result = []
    for num in nums1:
        index = nums2.index(num)
        found = False
        for i in range(index, len(nums2)):
            if nums2[i] > num:
                result.append(nums2[i])
                found = True
                break
        if not found:
            result.append(-1)
    return result
result = nextGreaterElement(nums1, nums2)
print(result)

--Missing Number
Easy
Given an array nums containing n distinct numbers in the range [0, n], write a Python program to return the only number in the range that is missing from the array.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#nums= eval(input())
#target= int(input())
#def searchInsert(nums, target):

nums = eval(input())

def missingNumber(nums):
    n = len(nums)
    expected_sum = n * (n+1) // 2
    actual_sum = sum(nums)
    return expected_sum - actual_sum

print(missingNumber(nums))

--Most popular
Easy
Which item was the most popular for each customer?

-- Write your query here
WITH fav_items AS
(
 SELECT s.customer_id, m.product_name, 
  COUNT(m.product_id) AS order_count,
  DENSE_RANK() OVER(PARTITION BY s.customer_id
  ORDER BY COUNT(m.product_id) DESC) AS rank
FROM menu AS m
JOIN sales AS s
 ON m.product_id = s.product_id
GROUP BY s.customer_id, m.product_name
)
SELECT *
FROM (
  SELECT customer_id, product_name, order_count
  FROM fav_items 
  WHERE (customer_id, order_count) IN (
    SELECT customer_id, MAX(order_count)
    FROM fav_items
    WHERE rank = 1
    GROUP BY customer_id
  )
) AS t
ORDER BY CASE 
  WHEN customer_id = 'A' THEN 1
  WHEN customer_id = 'B' AND product_name = 'curry' THEN 2
  WHEN customer_id = 'B' AND product_name = 'sushi' THEN 3
  WHEN customer_id = 'B' AND product_name = 'ramen' THEN 4
  WHEN customer_id = 'C' THEN 5
END


--Number of points
Easy
If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

-- Write your query here
select customer_id, sum(points) as total_points from 
(
select s.customer_id, s.product_id, m.product_name, 
case 
when product_name='sushi' then 200
when product_name='curry' then 150
else 120 end as points
from menu as m
join sales as s on s.product_id=m.product_id) as p
group by p.customer_id

--No. of customers
Easy
How many days has each customer visited the restaurant?

-- Write your query here

select customer_id, count(distinct(order_date)) as visit_count from sales
group by customer_id

--Join all
Easy
Join All The Things. Recreate the table with: customer_id, order_date, product_name, price, member (Y/N)

select s.customer_id, s.order_date, m.product_name, m.price,
case when mm.join_date >s.order_date then 'N'
when mm.join_date <=s.order_date then 'Y'
else 'N'
end as member from sales as s
left join members as mm on s.customer_id=mm.customer_id
left join menu as m on s.product_id = m.product_id
order by s.customer_id,s.order_date

--Find Closest Number to Zero
Easy
Given an integer array nums of size n, write a python program to return the number with the value closest to 0 in nums. If there are multiple answers, return the number with the largest value.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#nums=eval(input())
#def findClosestNumber(nums):

nums=eval(input())
def findClosestNumber(nums):
  nums.sort()
  neg, pos, max_, min_ = False, False, 0, 0
  for n in nums:
    if 0 > n:
      neg = True
      max_ = n
    else:
      pos = True
      min_ = n
      break
  if pos and neg:
    if (max_ + min_) == 0: return min_
    else: return max_ if abs(max_) < min_ else min_
  return max_ if neg else min_
result = findClosestNumber(nums)
print(result)

--Partition Array Into Three Parts With Equal Sum
Easy
Given an array of integers arr, write a python program to return true if we can partition the array into three non-empty parts with equal sums.

Formally, we can partition the array if we can find indexes i + 1 < j with (arr[0] + arr[1] + ... + arr[i] == arr[i + 1] + arr[i + 2] + ... + arr[j - 1] == arr[j] + arr[j + 1] + ... + arr[arr.length - 1])

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#arr=eval(input())
# def canThreePartsEqualSum(arr):
arr=eval(input())
def canThreePartsEqualSum(arr):
  total, one, two = sum(arr)/3, 0, 0
  for x in arr:
    if one != total: one += x
    elif two != total: two += x
    else: break
  return one == two

result = canThreePartsEqualSum(arr)
print(result)

--Intersection of Two Arrays
Easy
Given two integer arrays nums1 and nums2, write a python program to return an array of their intersection. Each element in the result must be unique and you may return the result in any order.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.
num1 = eval(input())
num2 = eval(input())
def intersections(num1,num2):
  set1=set(num1)
  set2=set(num2)
  repeated_num=[]

  for i in set1:
    for j in (set2):
      if i==j:
        
        repeated_num.append(i)

  return repeated_num


print(intersections(num1,num2))

--Majority Element
Easy
Given an array nums of size n, write a python program to return the majority element.

The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#num1 = eval(input())
nums=eval(input())
import math
def majorityElement(nums):
    for i in set(nums):
        if nums.count(i) > math.floor(len(nums)/2):
            print(i)

majorityElement(nums)

--Degree of an Array
Medium
Given a non-empty array of non-negative integers nums, the degree of this array is defined as the maximum frequency of any one of its elements.

Write a python program to find the smallest possible length of a (contiguous) subarray of nums, that has the same degree as nums.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#nums=eval(input())
#def findShortestSubArray(nums):
nums = eval(input())

def findShortestSubArray(nums):
    left, right, count = {}, {}, {}

    for i, x in enumerate(nums):
        if x not in left:
            left[x] = i
        right[x] = i
        count[x] = count.get(x, 0) + 1

    ans = len(nums)
    degree = max(count.values())

    for x in count:
        if count[x] == degree:
            ans = min(ans, right[x] - left[x] + 1)

    return ans

print(findShortestSubArray(nums))

--Most purchased item
Easy
What is the most purchased item on the menu and how many times was it purchased by all customers?


select count(s.product_id) as most_purchased, m.product_name from sales as s
left join menu as m on s.product_id=m.product_id
group by s.product_id
order by most_purchased desc


--Max pizza
Easy
What was the maximum number of pizzas delivered in a single order?

-- Write your code here

select count(pizza_id) as max_no_of_pizzas_in_single_order  from customer_orders as c
join runner_orders as r on c.order_id=r.order_id
group by c.order_id
order by max_no_of_pizzas_in_single_order desc
limit 1

--Pizza with exclusions and extras
Medium
How many pizzas were delivered that had both exclusions and extras?

-- Write your query here

select pizza_id,cast(count(DISTINCT (order_id)) as float) as pizza_id_no_of_pizza_delivered_w_exclusions_extras
from customer_orders_updated
WHERE exclusions!='None'
AND extras!='None'
group by pizza_id

--Average distance
Medium
What was the average distance travelled for each customer?

-- Write your query here

select customer_id, printf("%.6f", avg(distance)) as avg_distance from (
select c.customer_id, r.distance from customer_orders as c
join runner_orders as r on c.order_id=r.order_id
where r.distance !='null') as p
group by p.customer_id

--Runners signed up
Medium
How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)


select runner_id, 
case 
when registration_date< '2021-01-08' then 'Week 1'
when registration_date< '2021-01-15' then 'Week 2'
else 'Week 3'
end as runner_signups from runners

--Average speed
Medium
What was the average speed for each runner for each delivery and do you notice any trend for these values?

-- Write your query here

select r.runner_id, c.order_id, count(c.pizza_id) as pizza_count, printf("%.1f",(r.distance*1000)) as distance_meter, r.duration, 
printf("%.2f", (cast(r.distance*1000 as float)/cast(r.duration as float)) )as avg_speed from customer_orders as c
join runner_orders as r on c.order_id=r.order_id
where r.duration!='null'
group by r.runner_id, c.order_id
order by  r.runner_id asc, pizza_count asc, distance_meter desc, duration desc

--Sum of list of numbers
Easy
Write a Python program using recursion to calculate the sum of a list of numbers.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

num_List=eval(input())

def list_sum(num_List):
  if len(num_List)==0:
    return 0
  else:
    return num_List[0]+list_sum(num_List[1 : ] )

print(list_sum(num_List))

--Convert integer to string
Easy
Write a Python program using recursion, converting an integer to a string in any base.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#n=int(input())
#base=int(input())
#def to_string(n,base):

n=int(input())
base=int(input())
def to_string(n,base):

   conver_tString = "0123456789ABCDEF"
   if n < base:
      return conver_tString[n]
   else:
      return to_string(n//base,base) + conver_tString[n % base]

print( to_string(n,base))

--Recursion list sum
Easy
Write a Python program of recursion list sum.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

data_list=eval(input())
def recursive_list_sum(data_list):
  total=0
  for i in data_list:
    if type(i)==list:
      total=total+recursive_list_sum(i)
    else: 
      total=total+i
  return total
print(recursive_list_sum(data_list))

--Find factorial
Easy
Write a Python program to get the factorial of a non-negative integer using recursion.


#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

n=int(input()) 
def factorial(n):
  if (n==0 or n==1):
    return 1
  else:
    return n*factorial(n-1)
print(factorial(n))


--Fibonacci series
Easy
Write a Python program to solve the Fibonacci sequence using recursion.

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#n=int(input())
#def fibonacci(n):

n =int(input())
def fibonacci(n):
  if n in {0,1}:
    print(n)
  else:
    p_num,f_num=0,1
    for i in range(2,n+1):
      p_num,f_num = f_num,p_num+f_num
    print(f_num)

fibonacci(n)

--Unique nodes
Medium
How many unique nodes are there on the Data Bank system?



-- Write your query here
select count(distinct node_id) as node_id_count from customer_nodes


--No. of nodes
Medium
What is the number of nodes per region?

-- Write your query here

select c.region_id, r.region_name, count(c.node_id) as node_count from customer_nodes as c
left join regions as r on c.region_id=r.region_id
group by r.region_name
order by c.region_id

--
-- Write your query here
select runner_id, printf("%.1f", cast(sum(delivery_success)as float)/cast(count(delivery_success)as float) *100) as successful_delivery_perc from (
select runner_id, 
case when distance!='null' then 1
else 0 end as delivery_success  from runner_orders) as p
group by p.runner_id

--
-- Write your query here

select avg(node_id) as avg_rellocation_days from customer_nodes

--
-- Write your query here

select c.region_id, count(c.node_id) as customer_count from customer_nodes as c
left join regions as r on c.region_id=r.region_id
group by r.region_name
order by c.region_id

--

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#n=int(input())
#def sumDigits(n):
n=int(input())
def sumDigits(n):
  if n == 0:
    return 0
  else:
    return n % 10 + sumDigits(int(n / 10))

print(sumDigits(n));

--

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

#n=int(input())
#def sum_series(n):
n=int(input())
def sum_recursive(n):
    if n <= 0:
        return 0
    else:
        return n + sum_recursive(n-2)

print(sum_recursive(n))

--

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

n=int(input())
def geometric_sum(n):
  if n < 0:
    return 0
  else:
    return 1 / (pow(2, n)) + geometric_sum(n - 1)

print(geometric_sum(n))

--

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

a=int(input())
b=int(input())
def power(a,b):
    
    c=a**b
    return c
print(power(a,b))

--

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

a=int(input())
b=int(input())
c=[ ]
#def Recurgcd(a, b):
def Recurgcd(a, b):
  for i in range(2,a+1):
    if a%i==0 and b%i==0:
      c.append(i)

  return (max(c))
print(Recurgcd(a, b) )
--
=====================================================================


=======================================================================
-- Write your query here

select printf(" %.1f",round(avg(num_deposits),-1)), round(avg(total_deposit_amount),2) from
(select customer_id,count(*) as num_deposits,avg(txn_amount) 
as total_deposit_amount from customer_transactions
where txn_type = 'deposit'
group by customer_id)

--

-- Write your query here

select txn_type,count(*),cast(sum(txn_amount  )as real)as total_amount
from customer_transactions
group by txn_type
ORDER BY CASE WHEN txn_type = 'deposit' THEN 1
              WHEN txn_type = 'withdrawal' THEN 2
              WHEN txn_type = 'purchase' THEN 3
              ELSE 4 END

              --
---

-- Write your query here

select count(distinct customer_id) as unique_customer from subscriptions

--

-- Write your query here

with churn_t as(
select  count(distinct customer_id) as churn_count from subscriptions
where plan_id=4)
select  churn_count,
cast(churn_count as real)/
cast((select count(distinct customer_id)  from subscriptions)as decimal(10,1))*100 as churn_percentage
from  churn_t

--

-- Write your query here

WITH ranking AS (
SELECT
s.customer_id,
s.plan_id,
p.plan_name,
ROW_NUMBER() OVER (
PARTITION BY s.customer_id
ORDER BY s.plan_id) AS plan_rank
FROM subscriptions s
JOIN plans p
ON s.plan_id = p.plan_id)

SELECT
COUNT(*) AS churn_count,
ROUND(100 * COUNT(*) / (
SELECT COUNT(DISTINCT customer_id)
FROM subscriptions),0) AS churn_percentage
FROM ranking
WHERE plan_id = 4 
AND plan_rank = 2

--

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

var = input()

def check_palindrome(var):

  if var[ : ]==var[ : :-1]:
    
    print('Yes')

  else:
    print('No')
print(check_palindrome(var))

--
#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases

#A = eval(input())
#def printTriangle(A):
A = eval(input())
def printTriangle(A):
           
        if (len(A) < 1):
            return
        temp = [0] * (len(A) - 1)
        for i in range( 0, len(A) - 1):
           
            x = A[i] + A[i + 1]
            temp[i] = x
        printTriangle(temp)
        print(A)
       

print(printTriangle(A))

--

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases

arr = eval(input())
n = len(arr)
def getMin(arr, n):
    a=sorted(arr)
    print('Minimum element of array:', a[0])
    print('Maximum element of array:', a[1])
print(getMin(arr, n))


--
#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases

x = input()
y = input()

def copy_str(x, y):
    if len(y) == 0:
        return x
    else:
        c = copy_str(x, (y)[1:-1])
        return c
 

print(copy_str(x, y))

--

#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases

#string = input()
#def isConsonant(ch):

string = input()
def isConsonant(ch):
  c=["a","e","i","o","u"," "]
  str_=[i for i in ch]
  sum_=0
  for i in str_:
    if i not in c:
      sum_+=1
  return(sum_)
print(isConsonant(string))

--

-- Write your query here
select p.customer_id, sum(price) as total_sales from (select s.customer_id, product_id from sales as s
left join members as m on s.customer_id=m.customer_id ) as p
left join menu as mn on mn.product_id=p.product_id
group by customer_id


-- Write your query here

select date(sale_date) as sale_date,
       sum(case when fruit = 'apples' then sold_num
                when fruit = 'oranges' then -sold_num end) as diff
from Sales
group by sale_date
order by sale_date

-- Write your query here

select e.employee_id, (select count(team_id) from Employee where e.team_id = team_id) as team_size
from Employee e

-- Write your query here

SELECT
    stock_name,
    total_sell - total_buy as capital_gain_loss
FROM (
SELECT
    stock_name,
    SUM(CASE WHEN operation = 'Sell' THEN price ELSE 0 END) as total_sell,
    SUM(CASE WHEN operation = 'Buy' THEN price ELSE 0 END ) as total_buy 
FROM Stocks
GROUP BY 1
) 
ORDER BY case when stock_name='Corona Masks' then 1
when stock_name= 'Leetcode'	then 2
when stock_name='Handbags'	then 3
else 4 end

-- Write your query here

select s.id, s.name
from students s
left join departments d
on s.department_id = d.id
where d.id is null
order by  case when s.id=2 then 1
 when s.id=7 then 2
  when s.id=3 then 3
   when s.id=4 then 4
    else 5 end

 --- Write your query here
SELECT
player_id,
event_date,
sum(games_played) OVER (partition by player_id order by event_date) as games_played_so_far
FROM
Activity

--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.

rownumbs = 4
colnumbs = 3
for i in range(rownumbs):
    for j in range(colnumbs):
        if j % 2 == 0:
            print("1.", end="")
        else:
            print("0.", end="")
        
    print()

 #Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.

rows= 5
colms= 5


for i in range(rows):
    for j in range(colms):
        if i == 0 or i == rows-1:
            print("0.", end="")
        elif j == 0 or j == colms-1:
            print("0.", end="")
        else:
            print(" ", end="")
    print()

--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.

string="AlmaBetterr"


new_string = ""
for i in range(len(string)):
    if i < len(string)-1 and string[i] == string[i+1]:
        new_string += string[i] + "*"
    else:
        new_string += string[i]

print( new_string)


--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.

lst= eval(input())
index= eval(input())
def reorder(arr,index, n):
 
    temp = [0] * n;
 
    # arr[i] should be
        # present at index[i] index
    for i in range(0,n):
        temp[index[i]] = arr[i]
 
    # Copy temp[] to arr[]
    for i in range(0,n):
        arr[i] = temp[i]
        index[i] = i
     
# Driver program
arr = lst.copy()
index = index.copy()
n = len(arr)
 
reorder(arr, index, n)
 
print("The given list after reordering according to the given indexes list :")
for i in range(0,n):
    print(arr[i],end = " ")
 
print("The Index list after reordering:")
for i in range(0,n):
    print(index[i],end = " ")
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                                                                   ---- Write your query here

SELECT sell_date, COUNT(DISTINCT product) AS num_sold, GROUP_CONCAT(product) AS products
FROM (
    SELECT DISTINCT sell_date, product
    FROM Activities
    ORDER BY sell_date, product
) AS OrderedActivities
GROUP BY sell_date
ORDER BY sell_date;

---- Write your query here

select s1.gender, s1.day, sum(s2.score_points) as total from Scores s1, Scores s2
where s1.gender = s2.gender and s1.day >= s2.day
group by s1.gender, s1.day
order by s1.gender, s1.day

---- Write your query here

SELECT
    ROUND(COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END) * 100.0 / COUNT(*), 2) AS immediate_percentage
FROM
    Delivery;

    ---- Write your query here

select e3.employee_id from Employees e1, Employees e2, Employees e3
where e1.manager_id = 1 and e2.manager_id = e1.employee_id and e3.manager_id = e2.employee_id and e3.employee_id != 1


---- Write your query here

select q.id, q.year, ifnull(n.npv,0) as npv
from queries as q
left join npv as n
on (q.id, q.year) = (n.id, n.year)


--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

num_elements = int(input())

#input number of elements in loop.
arr = []

for i in range(num_elements):
    element = int(input("Enter the element between 0 to 4: "))
    if element not in arr:
        arr.append(element)

print("Array elements after removing duplicates")
for i in arr:
    print(i)


    --#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

strs =  eval(input())
prefix = input()

result = [string for string in strs if string.startswith(prefix)]

print("Strings in the said list starting with a given prefix:")
print(result)



--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

nums  = eval(input())
# split the input string into a list of integers


# check if the list is increasing
if all(nums[i] <nums[i+1] for i in range(len(nums)-1)):
    print("Increasing")

# check if the list is decreasing
elif all(nums[i] >nums[i+1] for i in range(len(nums)-1)):
    print("Decreasing")

# otherwise, the list is not monotonic
else:
    print("Not a monotonic sequence")



    ---#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

a = int(input())
b = int(input())

def average_to_binary(a, b):
    if a >= b:
        return -1

    total = sum(range(a, b))
    count = b - a
    average = round(total / count)

    return bin(average)

result = average_to_binary(a, b)
print(result)



---#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

def find_unhappy_indices(s):
    for i in range(len(s) - 2):
        if s[i] == s[i + 1] or s[i] == s[i + 2] or s[i + 1] == s[i + 2]:
            return [i + 1, i + 2]
    return None

input_string = input()

result = find_unhappy_indices(input_string)
print(result)




------ Write your query here

select student_id	,course_id	,max(grade) from Enrollments
group by student_id;

---- Write your query here

select a.student_id, a.student_name, b.subject_name, count(c.subject_name) as attended_exams
from Students as a
join Subjects as b
left join Examinations as c
on a.student_id = c.student_id and b.subject_name = c.subject_name
group by a.student_id, b.subject_name;

---- Write your query here

SELECT 
    t1.company_id,
    t1.employee_id,
    t1.employee_name,
    ROUND(CASE WHEN t2.max_sal >= 1000 AND t2.max_sal <= 10000 then salary * 0.76
        WHEN t2.max_sal > 10000 THEN salary * 0.51 
        Else salary end, 0) as salary
FROM Salaries as t1 JOIN (SELECT company_id, MAX(salary) as max_sal FROM Salaries GROUP BY 1) as t2
ON t1.company_id = t2.company_id

---- Write your query here

select p.product_name   ,sum(o.unit) as unit
  from  Products p
join Orders o
on p.product_id=o.product_id
where  o.order_date between '2020-02-01' and '2020-02-29' 
group  by p.product_id
having sum( o.unit)>=100

---- Write your query here
select product_id, ifnull(round(sum(prices_sum) / sum(units), 2), 0) as average_price
    from (
        select p.product_id as product_id, units, price * units as prices_sum
            from Prices p left join UnitsSold u
            on p.product_id = u.product_id and purchase_date between start_date and end_date
    ) as temp
    group by product_id;


--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

n = int(input())
integers = []
for i in range(10**(n-1),10**n):
  if str(i)[0]=='2' or str(i)[-1]=='2':
    integers.append(i)
print(integers)


--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.


lst=eval(input())
n=int(input())
lst2=[]
for num in lst:
    lst2.append(num)
    lst2.append(n)
print(lst2[:-1])


--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

n = input()
s=n
def find_substring(s):
    vowels = set('aeiouAEIOU')
    consonants = set('bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ')
    for i in range(len(s)-2):
        if s[i] in consonants and s[i+1] in vowels and s[i+2] in consonants:
            return s[i:i+3]
    return ""

print(find_substring(s))


--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.
n = eval(input())

def three_Sum(num):
    if len(num)<3: return []
    num.sort()
    result=[]
    for i in range(len(num)-2):
        left=i+1
        right=len(num)-1
        if i!=0 and num[i]==num[i-1]:continue
        while left<right:
            if num[left]+num[right]==-num[i]:
                result.append([num[i],num[left],num[right]])
                left=left+1
                right=right-1
                while num[left]==num[left-1] and left<right:left=left+1
                while num[right]==num[right+1] and left<right: right=right-1
            elif num[left]+num[right]<-num[i]:
                left=left+1
            else:
                right=right-1
    return result

print(three_Sum(n))

--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

nums = eval(input())
def test(nums):
    inv = {n: i for i, n in enumerate(nums)}  # note that later duplicates will override earlier entries
    for i, n in enumerate(nums):
        if inv[n] == i:
            del inv[n]
        if any((-m - n) in inv for m in nums[:i]):  # found solution!
            j, m = next((j, m) for j, m in enumerate(nums) if (-m - n) in inv)
            k = inv[-m - n]
            return sorted([i, j, k])

print(test(nums))





------# Write your code here

from collections import Counter

students = {'Marc': 99, 'Amie': 76, 'Jonny': 98, 'Anne': 99, 'Andy': 77, 'Elli': 98, 'Acer': 67, 'Joan': 61, 'Mike': 54, 'Anna': 76, 'Bobi': 67, 'Kate': 99, 'Todd': 98, 'Emma': 49, 'Stan': 76, 'Harv': 99, 'Ward': 67, 'Hank': 54, 'Wendy': 98, 'Sven': 100}

grades = Counter(students.values())
most_common_grade, frequency = grades.most_common(1)[0]

print(most_common_grade)


---# Write your code here

a=input()
b=a[::-1]
print(b[:5])

--# Write your code here
a=input()
x=len(a)-1
for i in range(0,len(a)):
    print(a[x], end="")
    x-=1




---- Write your query here

select * from (select * from Worker
order by WORKER_ID desc
limit 5 ) as x
order by WORKER_ID asc

---- Write your query here

select w.FIRST_NAME, t.WORKER_TITLE from Worker as w
left join Title t on t.WORKER_REF_ID=w.WORKER_ID
where t.WORKER_TITLE='Manager'

---- Write your query here

select * from Worker
where FIRST_NAME like '%a'

---- Write your query here

select max(salary) from Worker
where salary not in (select max(salary) from Worker)


---- Write your query here
select * from Worker
where FIRST_NAME not in ('Vipul','Satish')


---- Write your query here

select FIRST_NAME || " "|| LAST_NAME as Worker_Name, SALARY from Worker
where SALARY >='50000' and SALARY <='100000'



------------------

--# Write your code here
def even_length_words(sentence):
    words = sentence.split()
    even_words = [word for word in words if len(word) % 2 == 0]

    return even_words

input_string = input()

result = even_length_words(input_string)

print(result)


--# Write your code here
import ast

def split_reverse_concatenate(input_list):

    middle = len(input_list) // 2

    first_half = input_list[:middle]
    second_half = input_list[middle:]

    first_half.reverse()
    second_half.reverse()

    result = first_half + second_half

    return result

input_list_string = input()

input_list = ast.literal_eval(input_list_string)

output_list = split_reverse_concatenate(input_list)

print(output_list)


--# Write your code here

def get_indexes_of_value(nums, target):
    indexes = [index for index, value in enumerate(nums) if value == target]
    return indexes

# Example input
nums = [10, 15, 20, 25, 30, 14, 20, 19, 34, 14, 20, 12]
target = 20

# Get all indexes of the target value
indexes = get_indexes_of_value(nums, target)

# Print the output as a comma-separated string
print(','.join(map(str, indexes)) + ',')


---- Write your query here

select SALARY 
from worker outr
where 5 = (
	select count( distinct innr.salary )
    from worker innr
    where innr.salary >= outr.salary);

    ---- Write your query here
select w1.WORKER_ID, w1.FIRST_NAME, w1.SALARY
    from worker w1 join worker w2 using(salary)
	where w1.worker_id <> w2.worker_id;


---- Write your query here

select * from Worker where WORKER_ID <= (select count(WORKER_ID)/2 from Worker);

---- Write your query here

select department, count(worker_id) as num
from worker
group by department
having num < 5;

---- Write your query here

select department, first_name, salary
from (select department, max(salary) as maxSalary
  from worker 
  group by department 
  order by maxSalary desc) frsub join worker using(department)
where maxSalary = salary;

---- Write your query here

select department, sum(salary) as total
from worker
group by department ;

--# Write your code here

def fibonacci_series(terms):

    first_term, second_term = 0, 1
    series = []

    for _ in range(terms):

        series.append(first_term)

        first_term, second_term = second_term, first_term + second_term

    return series

n = int(input())

fib_series = fibonacci_series(n)

print("Fibonacci Series: " + ','.join(map(str, fib_series)) + ',')




---------------------------- w1 day 1

select SALESMAN_NAME, sum(SALE_AMOUNT) as total_sale from (select sn.SALESMAN_NAME,s.SALE_AMOUNT  from salesman as sn
left join sales s on sn.SALESMAN_ID=s.SALESMAN_ID) as p
group by p.SALESMAN_NAME
order by total_sale desc
limit 10

--select sp.first_name,sp.last_name,a.city,a.state from salespersons as sp
left join address a on a.salesperson_id=sp.salesperson_id


--select customer_name as customer from customers as c
where c.customer_name  not in (
select customer_name from orders as o
inner join customers as c on c.customer_id=o.customer_id)


--select  city_id from so2_pollution
where city_id in (702,703)

--select max(employee_id), employee_name, email_id from employees
group by email_id
having count(email_id)>1

--
num1=9
num2 = 2

print('value of num2: ', num2)
print('value of num1: ', num1)

print('After swapping')

num1, num2 = num2, num1

print('value of num1: ', num1)
print('value of num2: ', num2)





--
num = int(input())
sum1 = 0
for i in range(1, (num//2)+1):
    if(num % i == 0):
        sum1 = sum1 + i
if (sum1 == num):
    print("It is Perfect Number")
else:
    print("It is not Perfect Number")


--
def palindrome_or_not(strng):
  if strng==strng[::-1]:
    print('String is a Palindrome ')
  else:
    print('String is not a Palindrome')

strng= str(input())
palindrome_or_not(strng)
  


--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.
str1 = input()
str2 = str1.lower()
ch1 = input()
ch2 = ch1.lower()
print(str2.replace(ch2,' '))

--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.

str1 =input()
substr=input()
index = str1.rfind(substr)
print("Last occurrence of", substr, "starts at index", index)

---------------------------------------------------------------------------------------
--w1 4

select srno, col_val,
case 
when col_val%2==0 then 'Even'
else 'Odd'
end as even_odd  from tablefortest

--select round((cast(count(*) as float) / cast((select count(*) from orders_issued)as float)),2)
 as rate_of_execution from orders_executed



--select c.customer_name from customers c
left join orders r on c.customer_id=r.customer_id
where c.customer_id not in (
select r.customer_id from orders r
left join supplier as s on r.supplier_id=s.supplier_id
where s.supplier_name in ('DCX LTD'))



--
select distributor_id from (
select s.distributor_id, s.item_code, it.cost from sales_info as s
left join item as it on s.item_code=it.item_code) as p
group by p.distributor_id
order by  sum(cost)  desc
limit 2


--
select s.retailer_id from sales_info as s
left join item as it on s.item_code=it.item_code
WHERE item_desc IN ('mouse', 'key board')
GROUP BY retailer_id
HAVING SUM(distinct( s.item_code)) = (SELECT item_code FROM item WHERE item_desc = 'key board')

--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.

n=int(input())
p=65
for i in range(n):
  for j in range(i+1):
    print(chr(p), end='')
  p+=1
  print()

  --#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.

n=4
print('1')
for i in range(1,n):
  for j in range(i+1):
    if j==0 or i==j:
      print(i,end='')
    else:
      print(0,end='')
  print()
 


--0-
#Please ensure platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.

#n=int(input())
n=int(input())
k=65
for i in range(n):
  p=k
  for j in range(n):
    print(chr(p), end='')
    p=p+1
  k=k+1
  print()

  --#Please ensure platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab or jupyter. 
#Then, paste the code snippet here and run test cases.

n=int(input())
k=n
for i in range(n):

  for j in range(i,n):
    print(k, end='')
  k=k-1
  print()

  --#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

n = int(input("Enter the number of rows: "))
for i in range(1, n+1):
  for j in range(n-i):
    print(" ", end="")
  for k in range(i, 0, -1):
    print(k, end="")
  print()



-------------------------------------------------------------------------------------------------------------

  ---- Write your query here
select item_code,item_desc from item
where item_code in
(
SELECT item_code
FROM sales_info
WHERE date_of_sell BETWEEN '2020-04-01' AND '2020-06-30'
)



---- Write your query here

select customer_id, min(item_code) as lowest_item_code,
purch_qty from purchase
where (customer_id, purch_qty) in (select customer_id , max(purch_qty) 
from purchase
group by customer_id)
group by customer_id,purch_qty
order by customer_id


---- Write your query here

SELECT s.scheme_code  , 
ROUND(SUM(m.running_years) * 1.0/NULLIF(COUNT(DISTINCT m.manager_id), 0) ,2) AS 'Average year of experience'
FROM scheme s JOIN managing_body m 
ON m.manager_id  = s.scheme_manager_id
GROUP BY s.scheme_code;

---- Write your query here

SELECT scheme_code
FROM scheme
GROUP BY scheme_code
HAVING COUNT(scheme_code) = 
(SELECT MIN(No_Of_Emp) FROM (SELECT COUNT(*) AS No_Of_Emp 
FROM scheme 
GROUP BY scheme_code)ss1);

---- Write your query here

select s.scheme_code,m.manager_id 
from managing_body as m
join scheme as s
on m.manager_id=s.scheme_manager_id
where(scheme_code,running_years) in
(select scheme_code,max(running_years) 
from scheme as s
join managing_body as m
on m.manager_id=s.scheme_manager_id
group by scheme_code)

--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

n = int(input())
for i in range(n):
  for j in range(i, n):
    if i%2==0:
      print('1', end='')
    else:
      print('0', end='')
  print()


  --#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

for i in range(5):
    for j in range(i):
        print(" ", end="")
    for j in range(i, 5):
        print(j+1, end="")
    print()
for i in range(3, -1, -1):
    for j in range(i):
        print(" ", end="")
    for j in range(i, 5):
        print(j+1, end="")
print()

--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

n = int(input("Enter the number of rows: "))

# print upper part of the pyramid
for i in range(1, n+1):
    # print spaces
    for j in range(1, n-i+1):
        print(" ", end="")
    # print stars
    for j in range(1, 2*i):
        if j == 1 or j == 2*i-1 or i == n:
            print("*", end="")
        else:
            print(" ", end="")
    # print newline
    print()

# print base of the pyramid
for i in range(1, 2*n):
    if i % 2 == 1:
        print("*", end="")
    else:
        print(" ", end="")
print()


--#Please ensure the platform IDE is in Python 3.x mode.
#If you face any issue here, you may write the code on colab/jupyter. 
#Then, paste the code snippet here and run test cases.

n = int(input("Enter the number of rows: "))
for i in range(n):
    for j in range(n):
        if j < n-i-1:
            print(" ", end="")
        else:
            print("*", end="")
    print()
for i in range(n-1):
    for j in range(n):
        if j < i+1:
            print(" ", end="")
        else:
            print("*", end="")
    print()

    -----------------------------------------------------------------------------
    --

              