require_relative( "../models/book.rb" )
require_relative( "../models/publisher.rb" )
require_relative( "../models/author.rb")
require_relative( "../models/authors_books.rb")

require 'pry'

Authors_books.delete_all()
Author.delete_all()
Publisher.delete_all()
Book.delete_all()

publisher1 = Publisher.new({
  "name" => "Penguin"
  })

publisher2 = Publisher.new({
  "name" => "Oxford University Press"
  })

publisher1.save()
publisher2.save()

book1 = Book.new({
    "name" => "Jane Eyre",
    "description" => "Victorian novel",
    "quantity" => 3,
    "price" => 7.99,
    "cost" => 3.00
    })

book2 = Book.new({
    "name" => "Dracula",
    "description" => "Classic gothic horror novel",
    "quantity" => 3,
    "price" => 8.99,
    "cost" => 3.00
    })

book1.save()
book2.save()

author1 = Author.new({
  "first_name" => "Charlotte",
  "last_name" => "Bronte",
  "publisher_id" => publisher1.id
  })

author1.save()

author_books1 = Authors_books.new({
  "author_id" => author1.id,
  "book_id" => book1.id
  })

author_books1.save()





binding.pry
nil
