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

def end_game(card_total, dealer_total)
  if card_total > 21
    puts "You hit #{card_total}, busted!"
  elsif dealer_total > 21
    puts "You hit #{card_total}, dealer busts with #{dealer_total}, you win!"
  elsif card_total > dealer_total
    puts "You hit #{card_total}, dealer hit #{dealer_total}. You won!"
  else
    puts "You hit #{card_total}, dealer hit #{dealer_total}. Thanks for playing!"
  end
end

def initial_round(player = true)
  total = 0
  2.times do
    total += deal_card
  end
  if player
    display_card_total(total)
  end
  total
end

def hit(total)
  total += deal_card
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
  dealer = initial_round(false)
  input = get_user_input

  while dealer < 17 do
    puts "Dealer has #{dealer}"
    dealer += hit(dealer)
  end

  while input == 'h' do
    total = hit(total)
    break if total > 20
    display_card_total(total)
    input = get_user_input
  end

  end_game(total, dealer)
end
