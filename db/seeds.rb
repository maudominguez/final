Book.delete_all
Author.delete_all
Role.delete_all
User.delete_all
Review.delete_all
Genre.delete_all

#this also creates a new user for each review
def create_y_reviews_for_book y, book
  y.times do
    user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'apollo', password_confirmation: 'apollo')
    Review.create(rating: Faker::Number.between(1, 5), comment: Faker::Lorem.paragraph,
                  book_id: book.id, user_id: user.id)
  end
end

def create_n_authors_for_book n, book
  n.times do
    author = Author.create(name: Faker::Book.author)
    Role.create(author_id: author.id, book_id: book.id)
  end
end

def create_book_with_n_authors_and_y_reviews(n, y, genre)
  book = Book.create(title: Faker::Book.title, description: Faker::Lorem.paragraph,
                      year: Faker::Number.between(1400, 2016), genre_id: genre.id)

  create_n_authors_for_book n, book
  create_y_reviews_for_book y, book
end

def create_author_with_n_books_of_genre n, genre
  author = Author.create(name: Faker::Book.author)
  n.times do
    book = Book.create(title: Faker::Book.title, description: Faker::Lorem.paragraph,
                        year: Faker::Number.between(1400, 2016), genre_id: genre.id)
    Role.create(author_id: author.id, book_id: book.id)
  end
end

def create_admin_user
  admin = User.create(name: 'Administrator', email: 'admin@example.org', admin: true, password: 'apollo', password_confirmation: 'apollo')
end

create_admin_user
4.times do
  genre = Genre.create(name: Faker::Book.genre, description: Faker::Lorem.paragraph)
  #create_book_with_n_authors_and_y_reviews 1, 1, genre
  #create_book_with_n_authors_and_y_reviews 2, 2, genre
  #create_book_with_n_authors_and_y_reviews 3, 3, genre
  create_book_with_n_authors_and_y_reviews 4, 4, genre

  #create_author_with_n_books_of_genre 3, genre
  create_author_with_n_books_of_genre 4, genre
end


=begin
10.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

end
=end
