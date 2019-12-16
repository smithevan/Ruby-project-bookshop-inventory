require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/publisher.rb' )
require_relative( '../models/author.rb' )
require_relative( '../models/book.rb' )
also_reload( '../models/*' )

get '/publishers' do
  @publishers = Publisher.all()
  erb ( :"publishers/index" )
end

get '/publishers/:id' do
  @publishers = Publisher.find(params['id'].to_i)
  erb(:"publishers/show")
end

post '/publishers/:id' do
  Publisher.new(params).update
  redirect to '/publishers'
end
