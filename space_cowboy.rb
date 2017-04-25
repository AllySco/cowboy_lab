require ('pg')

class Bounty

  attr_accessor :name, :species, :bounty_value, :danger_level, :last_known_location, :home_world, :favourite_weapon
  attr_reader :id

  def initialize(params)
    @name = params["name"]
    @species = params["species"]
    @bounty_value  = params["bounty_value"].to_i
    @danger_level = params["danger_level"].to_i
    @last_known_location  = params["last_known_location"]
    @homeworld = params["home_world"]
    @favourite_weapon  = params["favourite_weapon"]
    @id = params['id'].to_i if params['id']
  end

  def save()
    db = PG.connect({ dbname: 'bounties', host: 'localhost'})
    sql = 
    "INSERT INTO bounties
    (name, species, bounty_value, danger_level, last_known_location, home_world, favourite_weapon)
    VALUES
    ('#{@name}', '#{@species}', #{@bounty_value}, #{@danger_level}, '#{@last_known_location}', '#{home_world}', '#{@favourite_weapon}')
    RETURNING *;"
    @id = db.exec(sql).first()['id'].to_i
    db.close()
  end

  def Bounty.all()
    db = PG.connect({ dbname: 'bounties', host: 'localhost'})
    sql = "SELECT * FROM bounties;"
    result = db.exec(sql)
    db.close()
    return result.map {
      |turd| Bounty.new(turd) }
    end

    def Bounty.delete_all()
      db = PG.connect({ dbname: 'bounties', host: 'localhost'})
      sql = "DELETE from bounties;"
      db.exec(sql)
      db.close
    end

    def delete()
      db = PG.connect({ dbname: 'bounties', host: 'localhost'})
      sql = "DELETE FROM bounties WHERE id = #{id};"  
      db.exec(sql)
      db.close()
    end

    def update()
      db = PG.connect({ dbname: 'bounties', host: 'localhost'})
      sql = "UPDATE bounties SET (name, species, bounty_value, danger_level, last_known_location, home_world, favourite_weapon) = ('#{@name}', '#{@species}', #{@bounty_value}, #{@danger_level}, '#{@last_known_location}', '#{home_world}', '#{@favourite_weapon}') WHERE id = #{id};"
      db.exec(sql)
      db.close()
    end

    def Bounty.find_weapon(name)
      db = PG.connect({ dbname: 'bounties', host: 'localhost'})
      sql = "SELECT favourite_weapon FROM bounties WHERE name = '#{name}'"
      result = db.exec(sql)
      db.close()
      return result.find {
        |turd| Bounty.new(turd) }
    end
  end