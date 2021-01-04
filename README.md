# AbodenB

We will create a web application that allows users to list spaces they have available, and to hire spaces for the night.

## Specification

Any signed-up user can list a new space.
Users can list multiple spaces.
Users should be able to name their space, provide a short description of the space, and a price per night.
Users should be able to offer a range of dates where their space is available.
Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
Nights for which a space has already been booked should not be available for users to book that space.
Until a user has confirmed a booking request, that space can still be booked for that night.

## User Stories

```
As a user
So that I can join AbodenB
I would like to sign-up
```
```
As a user
So that only I can take actions in my name
I would like to log-in
```
```
As a user
So that only I can take actions in my name
I would like to log-out
```
```
As an abode owner
So that I can advertise my abode
I would like to list a new space
```
```
As an abode owner
So that I can advertise my property portfolio empire
I would like to be able to list multiple spaces
```
```
As an abode owner
So that I can give customers information regarding my abode
I would like to add name, description and price upon listing
```
```
As an abode owner
So that I can record the availability of my property
I would like to add available dates upon listing
```
```
As a customer
So that I can see my accommodation options
I would like to see the list of properties and its description
```
```
As a customer
So that I can stay in an available abode
I would like to request to book an abode from the list for a specific date
```
```
As a user
So I can see requests that I have received
I would like to see a list of requests I have received
```
```
As an abode owner
So that I can respond to my requests
I would like to be able to approve or deny each request
```
```
As a user
So that I can see requests that I have made
I would like to see the list of requests I have made
```
```
As a user
So that I know whether my requests has been confirmed
I would like to see the status of my requests
```
```
As a user
So that I am not disappointed
I can only request a booking for an available date
```
```
As a user
So that I can't double-book a property
I cannot make a request for a day with a confirmed booking
```
```
As a user
So that I can get in on the game
I can make a request for a day with a 'pending' request
```

## Database Tables
### Users
| id (serial primary key) | email (varchar)  | password (varchar)   | username (varchar)  |
| ----------------------- | ---------------- | -------------------- | ------------------- |
| 1                       | test@gmail.com.  | secretword           | best_user           |

### listings
| id (serial primary key) | title (varchar)  | description (varchar) | price per night    | foreign key user_id   |
| ----------------------- | ---------------- | --------------------  | ------------------- | --------------------- |
| 1                       | lovely house     | sample description    | 100                 | 1                     |

### bookings
| id (serial primary key) | foreign key listing_id   | foreign key user_id   | date       |
| ----------------------- | ------------------------ | --------------------  | -----------|
| 1                       | 1                        | 2                     | 10/01/2020 |
