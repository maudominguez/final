# Final project - Book review app

### Overview

Basic app where users can see books (authors, summary, genre, etc.) and write reviews.

Models:
* Book - Represents a book of real life. (Title, description, image, year). It can have many authors.
* Author - Represents an author. They can be associated with many books.
* User - They review books. It can write many reviews.
* Review - A review of a book by a user (it has a rate and a comment). A book can have many reviews.
* Genre - To classify books based on the type of content. A book can be associated with only one genre.
