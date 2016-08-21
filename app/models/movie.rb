class Movie

  attr_accessor :id, :name, :length, :year, :description

  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @length = hash['length']
    @year = hash['year']
    @description = hash['description']
  end

end