require_relative( '../db/sql_runner' )

class Book

  attr_reader( :id, :name, :description, :quantity, :price, :cost, :publisher_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['name']
    @quantity = options['quantity'].to_i
    @price = options['price'].to_f
    @cost = options['cost'].to_f
    @publisher_id = options['publisher_id'].to_i
  end

  # def save()
  #   sql = "INSERT INTO book (
  #   name,
  #   description,
  #   quantity,
  #   price,
  #   cost,
  #   publisher_id) VALUES ($1, $2) RETURNING id;"
  #   values = [@name, @funds]
  #   @id = SqlRunner.run(sql, values)[0]["id"].to_i
  # end



end
