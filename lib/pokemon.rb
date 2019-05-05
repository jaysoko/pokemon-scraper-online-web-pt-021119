require 'pry'

class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db

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

  def alter_hp(id, hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp,id)
  end

end
