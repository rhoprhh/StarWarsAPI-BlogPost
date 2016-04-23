require 'rest-client'
require 'JSON'
require 'pry'


def import_starwars_data(url)
  all_characters = RestClient.get(url)
  character_hash = JSON.parse(all_characters)
end





def get_character_movies_from_api(character)
  pagenum = 0
  movie_urls = []
  url = "http://www.swapi.co/api/people/?page=1"
  until movie_urls.any?
    character_hash = import_starwars_data(url)
    character_hash["results"].each do |chars|
      if chars["name"].downcase == character
        movie_urls = chars["films"]
      end
    end
    url = character_hash["next"]
    if url == ""
      puts "That person is not in the database."
      break
    end
  end
  movie_urls
end


def parse_character_movies(films_hash)
  movie_hashes = []
  films_hash.each do |url|
    movie1 = RestClient.get(url)
    movie_hashes << JSON.parse(movie1)
  end
  movie_title = []
  movie_hashes.each do |movie|
    movie_title << movie["title"]
  end
  movie_title
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  puts parse_character_movies(films_hash)
end



def get_char_list_from_ep(ep_num)
  char_urls = []
  url = "http://www.swapi.co/api/films/"
  character_hash = import_starwars_data(url)
  character_hash["results"].each do |chars|
    if chars["episode_id"] == ep_num
      char_urls = chars["characters"]
    end
  end
  char_urls
end


def parse_char_data(char_arr)
  char_hash_arr = []
  char_arr.each do |url|
    name = RestClient.get(url)
    char_hash_arr << JSON.parse(name)
  end
  name_arr = []
  char_hash_arr.each do |char|
    name_arr << char["name"]
  end
  name_arr
end



def show_list_of_chars_in_ep(ep_num)
  char_arr = get_char_list_from_ep(ep_num)
  puts parse_char_data(char_arr)
end
