Create Database Ola;
Use Ola;

#Retrieve all successful bookings:
Create view Successful_bookings As
select * from bookings
where Booking_Status = 'Success';

#Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle As
select Vehicle_Type, AVG(Ride_Distance)
as avg_diastance from bookings
group by Vehicle_Type;

#Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customer As
select count(*) from bookings 
where Booking_Status = 'Canceled by customer';

#List the top 5 customers who booked the highest number of rides:
create view top_five_customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings 
GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5;

#Get the number of rides cancelled by drivers due to personal and car-related issues:
create view canceled_rides_by_driver As
SELECT COUNT(*) FROM bookings 
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

#Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_and_min_rated_by_driver_for_primesedan As
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating 
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

#Retrieve all rides where payment was made using UPI:
create view upi_payment as
SELECT * FROM bookings WHERE Payment_Method = 'UPI';

#Find the average customer rating per vehicle type:
create view avg_customer_rating as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings
GROUP BY Vehicle_Type;

#Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings 
WHERE Booking_Status = 'Success';

#List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings 
WHERE Incomplete_Rides = 'Yes';


select * from Successful_bookings;
select * from ride_distance_for_each_vehicle;
select * from cancelled_rides_by_customer;
select * from top_five_customers;
select * from canceled_rides_by_driver;
select * from max_and_min_rated_by_driver_for_primesedan;
select * from upi_payment;
select * from avg_customer_rating;
select * from total_successful_ride_value;
select * from Incomplete_Rides_Reason;





























