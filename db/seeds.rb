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

publisher3 = Publisher.new({
  "name" => "Harper Collins"
  })

publisher4 = Publisher.new({
  "name" => "Random House"
  })

publisher5 = Publisher.new({
  "name" => "Gollancz"
  })

publisher1.save()
publisher2.save()
publisher3.save()
publisher4.save()
publisher5.save()

author1 = Author.new({
  "first_name" => "Charlotte",
  "last_name" => "Bronte",
  "publisher_id" => publisher1.id
  })

author2 = Author.new({
  "first_name" => "Bram",
  "last_name" => "Stoker",
  "publisher_id" => publisher4.id
  })

author3 = Author.new({
  "first_name" => "Neil",
  "last_name" => "Gaiman",
  "publisher_id" => publisher4.id
  })

author4 = Author.new({
  "first_name" => "Terry",
  "last_name" => "Pratchett",
  "publisher_id" => publisher4.id
  })

author1.save()
author2.save()
author3.save()
author4.save()

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

book3 = Book.new({
  "name" => "Good Omens",
  "description" => "Science Fiction",
  "quantity" => 5,
  "price" => 9.99,
  "cost" => 4.99
  })

book1.save()
book2.save()
book3.save()

authors_books1 = Authors_books.new({
  "author_id" => author1.id,
  "book_id" => book1.id
  })

authors_books2 = Authors_books.new({
  "author_id" => author2.id,
  "book_id" => book2.id
  })

authors_books3 = Authors_books.new({
  "author_id" => author3.id,
  "book_id" => book3.id
  })

authors_books4 = Authors_books.new({
  "author_id" => author4.id,
  "book_id" => book3.id
  })

authors_books1.save()
authors_books2.save()
authors_books3.save()
authors_books4.save()





binding.pry
nil
