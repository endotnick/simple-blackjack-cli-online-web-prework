def welcome
  puts 'Welcome to the Blackjack Table'
end

def deal_card
  rand(1..11)
end

def display_card_total(i)
  puts "Your cards add up to #{i}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end


def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"

end

def initial_round
  total = 0
  2.times do
    total += deal_card
  end
  display_card_total(total)
  total
end

def hit?(total)
  prompt_user
  input = get_user_input
  if input == 'h'
    total += deal_card
  elsif total >= 17
    puts 'Congrats!'
  else
    puts 'Sorry!'
  end
  if input != 'h'
    end_game(total)
  end
  total
end

def invalid_command
  puts 'Please enter a valid command'
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  total = initial_round
  until total > 21 do
    total = hit?(total)
    display_card_total(total)
  end
  end_game(total)
end
