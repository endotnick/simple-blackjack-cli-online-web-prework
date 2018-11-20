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
  prompt_user
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

def hit?(total, input)
  total += input == 'h' ? deal_card : 0
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
  input = get_user_input
  while input == 'h' do
    total = hit?(total, input)    
    break if total > 20
    display_card_total(total)
    input = get_user_input
  end
  end_game(total)
end
