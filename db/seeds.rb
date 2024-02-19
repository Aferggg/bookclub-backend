
user1 = User.create(name: "John Doe", email: "test1@email.com", password: "password")
user2 = User.create(name: "Jack Doe", email: "test2@email.com", password: "password")

shelf1 = Shelf.create(name: "Fiction", user_id: user1.id)
shelf2 = Shelf.create(name: "Non-Fiction", user_id: user2.id)

book1 = Book.create(
  title: "Throne of Glass",
  author: "Sarah J. Maas",
  shelf_id: shelf1.id
)

book2 = Book.create(
  title: "A Court of Thorns and Roses",
  author: "Sarah J. Maas",
  shelf_id: shelf1.id
)

user_data = [
  { name: 'User 3', email: 'test3@email.com', password: 'password' },
  { name: 'User 4', email: 'test4@email.com', password: 'password' },
]

shelf_names = ['Shelf 3', 'Shelf 4']

book_data = [
  { title: 'Book 3', author: 'Author 3' },
  { title: 'Book 4', author: 'Author 4' },
]

user_data.each do |data|
  user = User.create!(data)

  shelf_names.each do |name|
    shelf = Shelf.create!(name: name, user_id: user.id)

    book_data.each do |book|
      Book.create!(book.merge(shelf_id: shelf.id))
    end
  end
end
