require_relative( '../db/sql_runner' )

class Book

  attr_reader :id
  attr_accessor :name, :description, :quantity, :price, :cost, :publisher_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity'].to_i
    @price = options['price'].to_f
    @cost = options['cost'].to_f
    @publisher_id = options['publisher_id'].to_i
  end

  def save()
    sql = "INSERT INTO books (
    name,
    description,
    quantity,
    price,
    cost,
    publisher_id) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;"
    values = [@name, @description, @quantity, @price, @cost, @publisher_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM books"
    results = SqlRunner.run( sql )
    return results.map { |book| Book.new( book ) }
  end

  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM books WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE books SET (
    name,
    description,
    quantity,
    price,
    cost,
    publisher_id) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @description, @quantity, @price, @cost, @publisher_id, @id]
    SqlRunner.run(sql, values)
  end





end
