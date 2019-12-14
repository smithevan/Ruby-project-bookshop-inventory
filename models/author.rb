require_relative( '../db/sql_runner' )

class Author

  attr_reader :id
  attr_accessor :first_name, :last_name, :publisher_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @publisher_id = options['publisher_id'].to_i
  end

end 
