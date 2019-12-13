require_relative( "../models/book.rb" )
require_relative( "../models/publisher.rb" )
require 'pry'

publisher1 = Publisher.new({
  "name" => "Penguin"
  })

publisher2 = Publisher.new({
  "name" => "Oxford University Press"
  })

publisher1.save()
publisher2.save()


binding.pry
nil
