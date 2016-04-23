#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
input = get_character_from_user
if input.is_a? String
  show_character_movies(input)
elsif input.is_a? Integer
  show_list_of_chars_in_ep(input)
end
