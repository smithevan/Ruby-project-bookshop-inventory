require_relative( '../db/sql_runner' )

class Book

  attr_reader :id
  attr_accessor :name, :description, :quantity, :price, :cost

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity'].to_i
    @price = options['price'].to_f
    @cost = options['cost'].to_f
  end

  def save()
    sql = "INSERT INTO books (
    name,
    description,
    quantity,
    price,
    cost) VALUES ($1, $2, $3, $4, $5) RETURNING id;"
    values = [@name, @description, @quantity, @price, @cost]
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
    cost) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@name, @description, @quantity, @price, @cost, @id]
    SqlRunner.run(sql, values)
  end

  def authors()
    sql = "SELECT authors.* FROM authors
          INNER JOIN authors_books ON authors_books.author_id = authors.id
          WHERE book_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|author_hash| Author.new(author_hash)}
  end

  def join_authors()
    array = authors()
    authors_name_array= array.map { |author|  author.full_name}
    return authors_name_array.join(", ")
  end

  def publishers()
    sql = "SELECT publishers.* FROM publishers
          INNER JOIN authors ON authors.publisher_id = publishers.id
          INNER JOIN authors_books ON authors_books.author_id = authors.id
          WHERE book_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|publisher_hash| Publisher.new(publisher_hash)}
  end

  def self.find( id )
    sql = "SELECT * FROM books
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Book.new( results.first )
  end







end
