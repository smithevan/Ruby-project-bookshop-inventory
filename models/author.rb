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

  def save()
    sql = "INSERT INTO authors (
    first_name,
    last_name,
    publisher_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@first_name, @last_name, @publisher_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM authors"
    results = SqlRunner.run( sql )
    return results.map { |author| Author.new( author ) }
  end

  def self.delete_all()
    sql = "DELETE FROM authors"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM authors WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE authors SET (
    first_name,
    last_name,
    publisher_id) = ($1, $2, $3) WHERE id = $4"
    values = [@first_name, @last_name, @publisher_id, @id]
    SqlRunner.run(sql, values)
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  def self.find( id )
    sql = "SELECT * FROM authors
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values ).first
    return Author.new(results)
  end



end
