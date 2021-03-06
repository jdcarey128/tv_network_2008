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

  def shows_by_actor
    show_actors = actors_by_show
    network_actors = show_actors.values.flatten.uniq
    actor_shows = {}
    network_actors.each do |actor|
      actor_shows[actor] = find_shows(actor)
    end
    actor_shows
  end

  def find_shows(actor)
    @shows.find_all do |show|
      show.actors.include?(actor)
    end
  end

  def prolific_actors
    #this is sloppy and not dynamic - would need refactoring
    actors = shows_by_actor.find_all do |show|
      show.last.count > 1
    end
    actors = actors.flatten.first
    [actors]
  end


end
