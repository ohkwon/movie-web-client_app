class Movie

  attr_accessor :id, :name, :length, :year, :description

  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @length = hash['length']
    @year = hash['year']
    @description = hash['description']
  end

  def self.find(id)

    movie_hash = Unirest.get("#{ENV['DOMAIN']}/movies/#{id}.json").body
    return Movie.new(movie_hash)

  end

  def self.all

    movies_array = Unirest.get("#{ENV['DOMAIN']}/movies.json").body
    @movies = []
    movies_array.each do |hash|
      @movies << Movie.new(hash)
    end

    return @movies

  end

  def self.destroy(id)

    movie_hash = Unirest.delete("#{ENV['DOMAIN']}/movies/#{id}.json").body

  end

  def update(hash)

    @movie = Unirest.patch("#{ENV['DOMAIN']}/movies/#{hash["id"]}.json",
      headers: {Accept: "application/json"},
      parameters: {
        name: hash[:name],
        length: hash[:length],
        year: hash[:year],
        description: hash[:description]
      }
    )

    return @movie

  end

  def self.create(hash)

    @movie = Unirest.post("#{ENV['DOMAIN']}/movies.json",
      headers: {Accept: "application/json"},
      parameters: {
        name: hash[:name],
        length: hash[:length],
        year: hash[:year],
        description: hash[:description]
      }
    )

    return @movie

  end

end