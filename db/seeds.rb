Book.delete_all
Author.delete_all
Role.delete_all
User.delete_all
Review.delete_all
Genre.delete_all

PASSWORD = 'password'

#this also creates a new user for each review
def create_y_reviews_for_book y, book
  y.times do
    user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: PASSWORD, password_confirmation: PASSWORD)
    Review.create(rating: Faker::Number.between(1, 5), comment: Faker::Lorem.paragraph,
                  book_id: book.id, user_id: user.id)
  end
end

def create_n_authors_for_book n, book
  n.times do
    name = Faker::Book.author
    image = fake_author_image_url name
    author = Author.create(name: name, image_url: image)
    Role.create(author_id: author.id, book_id: book.id)
  end
end

def create_book_with_n_authors_and_y_reviews(n, y, genre)
  title = Faker::Book.title
  image = fake_image_url title
  book = Book.create(title: title, description: Faker::Lorem.paragraph, image_url: image,
                      year: Faker::Number.between(1400, 2016), genre_id: genre.id)

  create_n_authors_for_book n, book
  create_y_reviews_for_book y, book
end

def fake_image_url title
  background_color = Faker::Number.hexadecimal(6)
  foreground_color = Faker::Number.hexadecimal(6)
  image = "http://dummyimage.com/600x400/#{background_color}/#{foreground_color}&text=#{title}"
end

def fake_author_image_url name
  image = "http://flathash.com/#{name}"
end

def create_author_with_n_books_of_genre n, genre
  name = Faker::Book.author
  image = fake_author_image_url name
  author = Author.create(name: name, image_url: image)
  n.times do
    title = Faker::Book.title
    image = fake_image_url title
    book = Book.create(title: title, description: Faker::Lorem.paragraph, image_url: image, #Faker::Avatar.image,
                        year: Faker::Number.between(1400, 2016), genre_id: genre.id)
    Role.create(author_id: author.id, book_id: book.id)
  end
end

def create_admin_user
  admin = User.create(name: 'Administrator', email: 'admin@example.org', admin: true, password: PASSWORD, password_confirmation: PASSWORD)
end

create_admin_user
7.times do
  genre = Genre.create(name: Faker::Book.genre, description: Faker::Lorem.paragraph)
  create_book_with_n_authors_and_y_reviews 4, 4, genre
  create_author_with_n_books_of_genre 4, genre
end

5.times do
  genre = Genre.create(name: Faker::Book.genre, description: Faker::Lorem.paragraph)
end
