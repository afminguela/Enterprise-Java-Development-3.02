use Airline;

-- In the Airline database write the SQL script to get the total number of flights in the database.

select count(*)from Airline.planes_flights pf  ;

-- In the Airline database write the SQL script to get the average flight distance.

select AVG(flight_Mileage) from Airline.Flights f ;

-- In the Airline database write the SQL script to get the average number of seats.

select AVG(total_seats)from Airline.planes p;

-- In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.

select  c.customer_status as status, AVG(c.Customer_Total_Mileage)AS Average from Airline.Customers c group by c.customer_status;

-- In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.

select  c.customer_status as status, max(c.Customer_Total_Mileage)AS Average from Airline.Customers c group by c.customer_status;

-- In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.

 select COUNT(*) FROM Airline.planes p where Aircraft like '%Boeing%';

-- In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
 
 select * from Airline.Flights F where F.Flight_mileage BETWEEN 300 and 2000;
 
-- In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
 
 select c.customer_status as status, AVG(f.Flight_mileage) 
 from Airline.customer_flights cf
 join Airline.Customers c on c.id_customer = cf.id_customer
 join Airline.Flights f on f.Flight_number = cf.flight_number 
 group by c.customer_status;
 
--  In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).



SELECT p.Aircraft as plane, count(*) as most_booked
FROM Airline.planes_flights pf
JOIN Airline.customer_flights cf ON cf.flight_number = pf.flight
JOIN Airline.Customers c ON c.id_customer = cf.id_customer
JOIN Airline.planes p ON p.Aircraft = pf.Aircraft
WHERE c.customer_status LIKE '%Gold%'
GROUP BY p.Aircraft
order by most_booked DESC;

