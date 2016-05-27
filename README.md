# Final project - Book review app

### Overview

Basic app where users can see books (authors, summary, genre, etc.) and write reviews.
The idea is to emulate a very basic version of goodreads.com

Models:
* Book - Represents a book of real life. (Title, description, image, year). It can have many authors.
* Author - Represents an author. They can be associated with many books.
* User - They review books. They can write many reviews.
* Review - A review of a book by a user (it has a rating and a comment). A book can be associated with many reviews.
* Genre - To classify books based on the type of content. A book can be associated with only one genre.


### Some Users from the seeds file
In general, if you don't sign in you will have read-only privileges.
You need to sign-in to be able to create and edit books, etc..

You can use these users from the seeds file:
- Admin user: They can destroy other user accounts.
  email: admin@example.org
  password: password

- Normal user
  email: user@example.org
  password: password
