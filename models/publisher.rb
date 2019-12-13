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



end
