require_relative( '../db/sql_runner' )

class Authors_books

  attr_reader :id
  attr_accessor :author_id, :book_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @author_id = options['author_id'].to_i
    @book_id = options['book_id'].to_i
  end

  def save()
    sql = "INSERT INTO authors_books (
    author_id,
    book_id) VALUES ($1, $2) RETURNING id;"
    values = [@author_id, @book_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM authors_books"
    results = SqlRunner.run( sql )
    return results.map { |author_books| Authors_books.new( author_books ) }
  end

  def self.delete_all()
    sql = "DELETE FROM authors_books"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM authors_books WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE authors_books SET (
    author_id,
    book_id) = ($1, $2) WHERE id = $3"
    values = [@author_id, @book_id]
    SqlRunner.run(sql, values)
  end

end
