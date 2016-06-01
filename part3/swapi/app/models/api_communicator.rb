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
    @chars_array = pull_all_pages_data
    @chars_array.each do |x|
      new_character = Character.new(
        id: x["url"].split('/').last.to_i,
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
    @films_array = pull_all_pages_data
    @films_array.each do |x|
      new_film = Film.new(
        id: x["url"].split('/').last.to_i,
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
    @planets_array = pull_all_pages_data
    @planets_array.each do |x|
      new_planet = Planet.new(
        id: x["url"].split('/').last.to_i,
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
    @species_array = pull_all_pages_data
    @species_array.each do |x|
      new_specie = Specie.new(
        id: x["url"].split('/').last.to_i,
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
    @vehicles_array = pull_all_pages_data
    @vehicles_array.each do |x|
      new_vehicle = Vehicle.new(
        id: x["url"].split('/').last.to_i,
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
    @starships_array = pull_all_pages_data
    @starships_array.each do |x|
      new_starship = Starship.new(
        id: x["url"].split('/').last.to_i,
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

  def pull_characters_relations
    @chars_array.each do |x|
      current_char = Character.find(x["url"].split('/').last.to_i)
      x["films"].each do |film|
        current_char.films << Film.find(film.split('/').last.to_i)
      end
      if x["species"].empty?
      else
        x["species"].each do |specie|
          current_char.species << Specie.find(specie.split('/').last.to_i)
        end
      end
      if x["vehicles"].empty?
      else
        x["vehicles"].each do |vehicle|
          current_char.vehicles << Vehicle.find(vehicle.split('/').last.to_i)
        end
      end
      if x["starships"].empty?
      else
        x["starships"].each do |starship|
          current_char.starships << Starship.find(starship.split('/').last.to_i)
        end
      end
      current_char.planet = Planet.find(x["homeworld"].split('/').last.to_i)
      current_char.save
    end
  end

  def pull_films_relations
    @films_array.each do |x|
      current_film = Film.find(x["url"].split('/').last.to_i)
      x["planets"].each do |planet|
        current_film.planets << Planet.find(planet.split('/').last.to_i)
      end
      x["starships"].each do |starship|
        current_film.starships << Starship.find(starship.split('/').last.to_i)
      end
      x["vehicles"].each do |vehicle|
        current_film.vehicles << Vehicle.find(vehicle.split('/').last.to_i)
      end
      x["species"].each do |specie|
        current_film.species << Specie.find(specie.split('/').last.to_i)
      end
    end
  end
  #
  # def pull_species_relations
  #   @species_array.each do |x|
  #     current_specie = Specie.find(x["url"].split('/').last.to_i)
  #   end
  # end
  #
  # def pull_planets_relations
  #   @planets_array.each do |x|
  #     current_planet = Planet.find(x["url"].split('/').last.to_i)
  #   end
  # end
  #
  # def pull_vehicles_relations
  #   @vehicles_array.each do |x|
  #     current_vehicle = Vehicle.find(x["url"].split('/').last.to_i)
  #   end
  # end
  #
  # def pull_starships_relations
  #   @starships_array.each do |x|
  #     current_starship = Starship.find(x["url"].split('/').last.to_i)
  #   end
  # end
end
