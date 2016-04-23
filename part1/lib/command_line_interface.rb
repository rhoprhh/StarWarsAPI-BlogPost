def welcome
  puts ="Welcome!"
end

def get_character_from_user
  puts "please enter a character name or episode number"
  word = gets.chomp
  input = word.to_i
  if input == 0
    word.downcase
  elsif input > 0 && input < 8
    input
  else
    puts "please enter a valid command"
  end
end
