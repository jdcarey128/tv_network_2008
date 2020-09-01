class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    main_characters = @shows.map do |show|
      show.characters.find_all do |character|
        character.name == character.name.upcase && character.salary > 500_000
      end
    end
    main_characters.flatten
  end

  def actors_by_show
    hash = {}
    @shows.each do |show|
      hash[show] = show.actors
    end
    hash
  end


end
