<h1><strong>Library Room Booking Application</strong></h1>
<p><strong>Deployed at&nbsp;<a href="https://ooddlibroombooking.herokuapp.com/">https://ooddlibroombooking.herokuapp.com/</a></strong></p>
<p>Credentials of the SuperAdmin are :</p>
<p><strong>Email:&nbsp;</strong><em>admin@ncsu.edu</em></p>
<p><strong>Password:</strong> <em>123</em></p>

<h2>2.0 Release Notes</h2>
The following modifications were made after the first review:
<ol>
<li>Disabled deleting SuperAdmin</li>
<li>Admins can create new library members (before only new admins could be created).</li>
<li>Admins can book rooms on behalf of other library members</li>
<li>Users can view own Booking History</li>
<li>Email Notifications on Signup and on booking a room.</li>
<li>Members can invite friends through email while booking a room.</li>
<li>On deleting an user, all corresponding booking history is deleted</li>
<li>On deleting a room, all corresponding booking history is deleted</li>
</ol>

<h2>Library Members</h2>
<p>Libarary Members can either sign up through the link on the login page or can be created by an admin.<br>
The following are the functions a libaray member can perform</p>
<ul>
<li>View Profile (Home --> View Profile)</li>
<li>Update profile (Home --> Edit Profile)</li>
<li>Search Rooms based on room number, buildingname, capacity(Home --> Search/Book Rooms)</li>
<li>Book available rooms upto 1 week in advance (Home --> Search/Book Rooms --> Details(for any room) --> Booking section(bottom of page))</li>
<li>Release bookings (Home --> Search/Book Rooms --> Details(for any room) --> Release Booking(for corresponding reservation))</li>
</ul>

<h2>Admins</h2>
<p>Admins can do everything a user can do. In addition he/she can also do the following:</p>
<ul>
<li>Create other Admins (Home --> Create New User --> select "yes" for admin attribute)</li>
<li>Create Library Member (Home --> Create New User --> select "no" for admin attribute)</li>
<li>View list of all users, admins, members (Home --> List Users/Admins/Members)</li>
<li>Edit/Delete profiles of users (Home --> List Users --> Edit/Destroy)/li>
<li>Create New Rooms (Home --> Manage Rooms --> Create New Room)</li>
<li>Book on behalf of other members (select username for "On behalf of") </li>
</ul>

<h2>Room</h2>
<p>The following are the characteristics of room</p>
<ul>
<li>A room can be booked for a minimum of 2 hrs</li>
<li>A day is divided into two hour slots starting from 0-2hrs, 2-4hrs ... 22-24hrs</li>
<li>Buildingnames include <strong>hunt</strong> and <strong>hill</strong>&nbsp;</li>
<li>Room capacities currently available are <strong>small, meduim</strong> and <strong>large</strong></li>
</ul>

<h2>Future Releases</h2>
The following functions can be added in the future:
<ul>
<li>Currently, the booking slots are very rigid i.e only allows 0-2, 2-4 etc. Users should be allowed to book arbitrary two hour slots</li>
<li>Allow users to book multiple slots in single booking</li>
</ul>