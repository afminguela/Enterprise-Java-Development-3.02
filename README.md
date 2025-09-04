# Enterprise Java Development 3.02 - SQL Database Exercises

## 📋 Overview
This repository contains SQL database exercises for the Enterprise Java Development course 3.02 at Ironhack. The project includes two comprehensive exercises focusing on database design, data manipulation, and advanced query operations.

## 🎯 Learning Objectives
- Database schema design and implementation
- SQL data manipulation (INSERT, SELECT)
- Advanced SQL queries with JOINs and aggregations
- Database relationship management
- Query optimization and analysis

## 📚 Exercises

### Exercise 1: Blog Database 📝
**File:** `Script ejercicio 1 blog.sql`

This exercise demonstrates the creation of a blog content management system database.

#### Database Schema:
- **Author Table:** Stores blog authors information
  - `id_author` (Primary Key, Auto Increment)
  - `name` (VARCHAR(50), NOT NULL)

- **Blog-Posts Table:** Stores blog posts information
  - `id_post` (Primary Key, Auto Increment)
  - `title` (VARCHAR(200))
  - `word_count` (INT)
  - `views` (INT)
  - `author` (Foreign Key referencing Author.id_author)

#### Sample Data:
- **Authors:** Maria Charlotte, Juan Pérez, Gemma Alcocer
- **Posts:** Various blog posts with topics like paint colors, decorating tips, accessories, etc.

### Exercise 2: Airline Database Analysis ✈️
**File:** `Ejercicio2 Airplane Script-1.sql.sql`

This exercise focuses on complex SQL queries for airline data analysis.

#### Queries Implemented:
1. **Total Flight Count:** Get the total number of flights in the database
2. **Average Flight Distance:** Calculate average flight mileage
3. **Average Seat Capacity:** Calculate average number of seats across all planes
4. **Customer Mileage by Status:** Average and maximum miles flown grouped by customer status
5. **Boeing Aircraft Count:** Count aircraft containing "Boeing" in their name
6. **Distance-Based Flight Search:** Find flights between 300-2000 miles
7. **Customer Status Analysis:** Average flight distance by customer status (with JOINs)
8. **Popular Aircraft Analysis:** Most frequently booked aircraft by Gold status members

#### Database Schema (Airline):
- **Customers:** Customer information and status levels
- **Flights:** Flight details including mileage
- **Planes:** Aircraft information and seating capacity
- **Customer_Flights:** Junction table linking customers to their flights
- **Planes_Flights:** Junction table linking planes to flights

## 🗂️ Files Description

| File | Description |
|------|-------------|
| `Script ejercicio 1 blog.sql` | Complete Blog database creation and population script |
| `Ejercicio2 Airplane Script-1.sql.sql` | Airline database analysis queries |
| `dump-Airline-202507281437.sql` | Complete Airline database dump with structure and data |
| `Airline UML.png` | Entity Relationship Diagram for the Airline database |
| `README.md` | This documentation file |

## 🚀 Setup Instructions

### Prerequisites
- MySQL Server (8.0 or higher recommended)
- MySQL Workbench or command-line MySQL client

### Exercise 1 - Blog Database
1. Open your MySQL client
2. Execute the script: `Script ejercicio 1 blog.sql`
3. The script will:
   - Create the `Blog` schema
   - Create `Author` and `Blog-Posts` tables
   - Insert sample data

```sql
-- Run in MySQL
SOURCE /path/to/Script ejercicio 1 blog.sql;
```

### Exercise 2 - Airline Database
1. Import the database dump:
```bash
mysql -u username -p < dump-Airline-202507281437.sql
```

2. Execute the analysis queries:
```sql
-- Run in MySQL
USE Airline;
SOURCE /path/to/Ejercicio2 Airplane Script-1.sql.sql;
```

## 📊 Database Relationships

### Blog Database ERD
```
Author (1) ----< (N) Blog-Posts
```

### Airline Database ERD
Refer to `Airline UML.png` for the complete entity relationship diagram showing:
- Customer-Flight relationships
- Plane-Flight associations
- Customer status hierarchies

## 🔍 Query Examples

### Most Popular Blog Author
```sql
SELECT a.name, COUNT(bp.id_post) as post_count
FROM Author a
JOIN `Blog-Posts` bp ON a.id_author = bp.author
GROUP BY a.id_author, a.name
ORDER BY post_count DESC;
```

### Gold Status Customer Flight Analysis
```sql
SELECT c.customer_status, AVG(f.Flight_mileage) as avg_distance
FROM Customers c
JOIN customer_flights cf ON c.id_customer = cf.id_customer
JOIN Flights f ON cf.flight_number = f.Flight_number
WHERE c.customer_status = 'Gold'
GROUP BY c.customer_status;
```

## 📝 Notes
- All SQL scripts are compatible with MySQL 8.0+
- Foreign key constraints are properly implemented
- Sample data is included for testing queries
- Follow proper SQL naming conventions as demonstrated

## 🎓 Course Information
**Course:** Enterprise Java Development 3.02  
**Institution:** Ironhack  
**Focus:** SQL Database Design and Analysis
