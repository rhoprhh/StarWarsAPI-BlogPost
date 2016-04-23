require 'pry'
class ApiCommunicator

  attr_accessor :page_url

  #this will pull our complete hashes which will be processed by the individual classes
  def import_page_data
    page_json = RestClient.get(@page_url)
    hash = JSON.parse(page_json)
    hash
  end

  def pull_all_pages_data
    output = []
    until @page_url == nil
      page_data = import_page_data
      page_data["results"].each do |x|
        output << x
      end
      @page_url = page_data["next"]
    end
    output
  end

  def pull_characters
    #this pulls the characters and saved them to the DB.
    #this does not include relational data
    #since we need everthing in the DB before we can
    #start relating them all to each other
    #this pattern repeats for the next 5 classes
    @page_url = "http://swapi.co/api/people/"
    chars = pull_all_pages_data
    chars.each do |x|
      new_character = Character.new(
        name: x["name"],
        height: x["height"],
        mass: x["mass"],
        hair_color: x["hair_color"],
        skin_color: x["skin_color"],
        eye_color: x["eye_color"],
        birth_year: x["birth_year"],
        gender: x["gender"],
        created: x["created"],
        edited: x["edited"],
        url: x["url"])
      new_character.save
    end

  end

  def pull_films
    @page_url = "http://swapi.co/api/films/"
    films = pull_all_pages_data
    films.each do |x|
      new_film = Film.new(
        title: x["title"],
        episode_id: x["episode_id"],
        opening_crawl: x["opening_crawl"],
        director: x["director"],
        producer: x["producer"],
        release_date: x["release_date"],
        created: x["created"],
        edited: x["edited"],
        url: x["url"])
      new_film.save
    end
  end

  def pull_planets
    @page_url = "http://swapi.co/api/planets/"
    planets = pull_all_pages_data
    planets.each do |x|
      new_planet = Planet.new(
        name: x["name"],
        rotation_period: x["rotation_period"],
        orbital_period: x["orbital_period"],
        diameter: x["diameter"],
        climate: x["climate"],
        gravity: x["gravity"],
        terrain: x["terrain"],
        surface_water: x["surface_water"],
        population: x["population"],
        created: x["created"],
        edited: x["edited"],
        url: x["url"])
      new_planet.save
    end
  end

  def pull_species
    @page_url = "http://swapi.co/api/species/"
    species = pull_all_pages_data
    species.each do |x|
      new_specie = Specie.new(
        name: x["name"],
        classification: x["classification"],
        designation: x["designation"],
        average_height: x["average_height"],
        skin_colors: x["skin_colors"],
        hair_colors: x["hair_colors"],
        eye_colors: x["eye_colors"],
        average_lifespan: x["average_lifespan"],
        language: x["language"],
        created: x["created"],
        edited: x["edited"],
        url: x["url"])
      new_specie.save
    end
  end

  def pull_vehicles
    @page_url = "http://swapi.co/api/vehicles/"
    vechicles = pull_all_pages_data
    vechicles.each do |x|
      new_vehicle = Vehicle.new(
        name: x["name"],
        model: x["model"],
        manufacturer: x["manufacturer"],
        cost_in_credits: x["cost_in_credits"],
        length: x["length"],
        max_atmoshpering_speed: x["max_atmoshpering_speed"],
        crew: x["crew"],
        passengers: x["passengers"],
        cargo_capacity: x["cargo_capacity"],
        consumables: x["consumables"],
        vehicle_class: x["vehicle_class"],
        created: x["created"],
        edited: x["edited"],
        url: x["url"])
      new_vehicle.save
    end
  end

  def pull_starships
    @page_url = "http://swapi.co/api/starships/"
    starships = pull_all_pages_data
    starships.each do |x|
      new_starship = Starship.new(
        name: x["name"],
        model: x["model"],
        manufacturer: x["manufacturer"],
        cost_in_credits: x["cost_in_credits"],
        length: x["length"],
        max_atmoshpering_speed: x["max_atmoshpering_speed"],
        crew: x["crew"],
        passengers: x["passengers"],
        cargo_capacity: x["cargo_capacity"],
        consumables: x["consumables"],
        hyperdrive_rating: x["hyperdrive_rating"],
        MGLT: x["MGLT"],
        starship_class: x["starship_class"],
        created: x["created"],
        edited: x["edited"],
        url: x["url"])
      new_starship.save
    end

  end



end
