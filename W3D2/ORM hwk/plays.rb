require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  #HWK
  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
  SQL

  #okay, so return nil if data.length is empty...
  return nil if data.length > 0 == false

  #okay. why are we creating a new instance of Play???
  Play.new(data.first)

  end

  def self.find_by_playwright(name)
    # data = PlayDBConnection.instance.execute("SELECT name FROM plays WHERE name = #{name}")
  end

end

#so is Playwright class represents another table
class Playwright
  
  attr_reader :name, :birth_year
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    #so right now, the query above returns us like a query table. 
    #the goal is turn the query table rows into each instance of class Playwright
    data.map { |datum| Playwright.new(datum)}

  end

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    return nil if data.length == 0
    
    #theoretically, the query above should only return one record. 
    #ah, so .first keys into the first and only record.
    Playwright.new(data.first)
  end

  #how we now the argument options aka datum is a hash?
  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']

  end

  def create #the same as insert??
    raise "#{self} already in DB" if self.id != nil
    #I guess we don't need id b/c SQL automatically creates id due to primary key status?
      PlayDBConnection.instance.execute(<<-SQL, name, birth_year)
        INSERT INTO
          playwrights (name, birth_year)
        values
          (?, ?)
      SQL

      #why are we setting id to the last insert row id???
      #  self.id = PlayDBConnection.instance.last_insert_row_id


  end

  def update
    raise "#{self} not in DB" if self.id != nil
      #ah! the table naming convention is pluralized
      PlayDBConnection.instance.execute(<<-SQL, name, birth_year)
        UPDATE
          playwrights (name, birth_year)
        SET  
          name = ?, birth_year = ?
      SQL

    #     PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
    #   UPDATE
    #     plays
    #   SET
    #     title = ?, year = ?, playwright_id = ?
    #   WHERE
    #     id = ?
    # SQL
  end

  def get_plays
    raise "#{self} not in DB" if self.id != nil
  data = PlayDBConnection.instance.execute(<<-SQL, self.id)
    SELECT
      *
    FROM
      plays
    WHERE
      playwright_id = ?
  SQL

  #Wait, huh? we are returning a table that is filtering on id???

  #so this creates a new array, and creates new play instances.
  #somehow play argument is a hash k & val pair.
  data.map {|play| Play.new(play)}


  end

end
