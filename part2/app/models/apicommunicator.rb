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
    @page_url = "http://swapi.co/api/people/"
    pull_all_pages_data
  end

  def pull_films
    @page_url = "http://swapi.co/api/films/"
    pull_all_pages_data
  end

  def pull_planets
    @page_url = "http://swapi.co/api/planets/"
    pull_all_pages_data
  end

  def pull_species
    @page_url = "http://swapi.co/api/species/"
    pull_all_pages_data
  end

  def pull_vehicles
    @page_url = "http://swapi.co/api/vehicles/"
    pull_all_pages_data
  end

  def pull_starships
    @page_url = "http://swapi.co/api/starships/"
    pull_all_pages_data
  end

  fi = x.pull_films
  pe = x.pull_characters
  sp = x.pull_species
  ve = x.pull_vehicles
  st = x.pull_starships
  pl = x.pull_planets
  lengths = [fi.count, pe.count, sp.count, ve.count, st.count, pl.count]


end
