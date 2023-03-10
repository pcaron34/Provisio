<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Insert Records</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html">
</head>
<body>
	<a href="setup.html">Setup</a>
	<hr>
    <h1>Insert Records</h1>
        
    <%
    
  		//used init param from XML file
  		String dbName = application.getInitParameter("dbName");
  		String dbUser = application.getInitParameter("dbUser");
  		String dbPass = application.getInitParameter("dbPass");
  		String dbURL = application.getInitParameter("dbURL");
  		String dbURLandName = application.getInitParameter("dbURLandName");
  		
 		
    	// Tries to insert data into the table 
    	Connection con = null;
        Statement stmt = null;
            
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = dbURLandName + "?";
                
            con = DriverManager.getConnection(url + "user=" + dbUser + "&" + "password=" + dbPass);             
            stmt = con.createStatement();  
        }
        catch(Exception e){
            out.println("<h1>Error connection to database.</h1>");
        }
        
        //Attempt to populate amenities table with data
        try{
            stmt.executeUpdate("INSERT INTO Amenities(AmenityId, Name, Cost, ChargeRecurrence) VALUES (1, 'WI-FI', 12.99, 'Flat')"); 
            stmt.executeUpdate("INSERT INTO Amenities(AmenityId, Name, Cost, ChargeRecurrence) VALUES (2, 'Breakfast', 8.99, 'Nightly')"); 
            stmt.executeUpdate("INSERT INTO Amenities(AmenityId, Name, Cost, ChargeRecurrence) VALUES (3, 'Parking', 19.99, 'Nightly')"); 
            out.println("<b>Amenities Data Inserted</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Error inserting Amenities data</b><br />");
        }
        
      //Attempt to populate hotel table with data
        try{
            stmt.executeUpdate("INSERT INTO Hotels(HotelId, HotelName, Address, NumberOfRooms, PhoneNumber) VALUES (1, 'Hotel One', '123 4th St Springfield, ORE 97229', 1, '458-123-4567')"); 
            stmt.executeUpdate("INSERT INTO Hotels(HotelId, HotelName, Address, NumberOfRooms, PhoneNumber) VALUES (2, 'Hotel Two', '456 7th St Dever, CO 80014', 1, '303-789-1011')"); 
            stmt.executeUpdate("INSERT INTO Hotels(HotelId, HotelName, Address, NumberOfRooms, PhoneNumber) VALUES (3, 'Hotel Three', '891 2nd St San Francisco, CA 91016', 1, '628-121-3141')"); 
            out.println("<b>Hotels Data Inserted</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Error inserting Hotels data</b><br />");
        }
        
      	//Attempt to populate room table with data
        //try{
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (1, 'Queen Room', 1, 115.00, 1)"); 
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (2, 'Double full room', 3, 150.00, 1)"); 
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (3, 'King Room', 2, 115.00, 1)"); 
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (4, 'Double Queen Room', 4, 150.00, 1)");
            
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (5, 'Queen Room', 1, 115.00, 2)"); 
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (6, 'Double Full Room', 3, 150.00, 2)"); 
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (7, 'King Room', 2, 115.00, 2)"); 
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (8, 'Double Queen Room', 4, 150.00, 2)"); 
            
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (9, 'Queen Room', 1, 115.00, 3)"); 
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (10, 'Double Full Room', 3, 150.00, 3)"); 
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (11, 'King Room', 2, 115.00, 3)"); 
            stmt.executeUpdate("INSERT INTO Rooms(RoomId, Size, NumberOfGuests, Price, HotelId) VALUES (12, 'Double Queen Room', 4, 150.00, 3)"); 
            out.println("<b>Room Data Inserted</b><br />");
        //}
        //catch(SQLException e){
            //out.println("<b>Error inserting Rooms data</b><br />");
        //}
        
      	//Attempt to populate user table with data
        try{
            stmt.executeUpdate("INSERT INTO Users(Email, FirstName, LastName, Password, LoyaltyPoints) VALUES ('Celine.Layn@gmail.com', 'Celine', 'Layn', 'Winter23', 0)"); 
            stmt.executeUpdate("INSERT INTO Users(Email, FirstName, LastName, Password, LoyaltyPoints) VALUES ('Steve.Jenkin@gmail.com', 'Steve', 'Jenkin', 'Winter2023', 0)");
            stmt.executeUpdate("INSERT INTO Users(Email, FirstName, LastName, Password, LoyaltyPoints) VALUES ('Tracy.Ross@gmail.com', 'Tracy', 'Ross', 'Winter2023!', 0)"); 
            out.println("<b>Users Data Inserted</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Error inserting Users data</b><br />");
        }
            
        try{
            stmt.close();
            con.close();
            out.println("<b>Database connections closed</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Connection close failed</b><br />");
        }
    %>          
</body>
</html>