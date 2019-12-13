require_relative( '../db/sql_runner' )

class Publisher

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO publishers (name) VALUES ($1) RETURNING id;"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM publishers"
    results = SqlRunner.run( sql )
    return results.map { |publisher| Publisher.new( publisher ) }
  end

  def self.delete_all()
    sql = "DELETE FROM publishers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM publishers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE publishers SET name = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end



end
