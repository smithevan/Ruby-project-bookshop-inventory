require_relative( "../models/book.rb" )
require_relative( "../models/publisher.rb" )
require 'pry'

Publisher.delete_all()

publisher1 = Publisher.new({
  "name" => "Penguin"
  })

publisher2 = Publisher.new({
  "name" => "Oxford University Press"
  })

publisher1.save()
publisher2.save()

book1 = Book.new({
  "name" => "Dracula",
  "description" => "Classic gothic horror novel.",
  "quantity" => 3,
  "price" => 8.99,
  "cost" => 3.00,
  "publisher_id" => publisher1.id
  })


binding.pry
nil
