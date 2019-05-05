require 'pry'

class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name,type)
  end

  def self.find(id, db)
    choice = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
    Pokemon.new(id: choice[0], name: choice[1], type: choice[2], db: choice[3])
  end

  def alter_hp(hp, db)
   #db.execute('update pokemon set hp = ? where id = ?;', hp, self.id)
   db.execute("UPDATE pokemon
 end
end
