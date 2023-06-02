class Mastermind
    COLORS = %w[red blue green yellow purple orange]
  
    def initialize
      @secret_code = generate_secret_code
      @turns = 12
    end
  
    def play
      puts "Welcome to Mastermind!"
      puts "Guess the secret code consisting of colors."
      puts "Colors: #{COLORS.join(', ')}"
      puts "You have #{@turns} turns to guess the code."
  
      while @turns > 0
        guess = get_player_guess
        if correct_guess?(guess)
          puts "Congratulations! You guessed the secret code."
          return
        else
          feedback = generate_feedback(guess)
          display_feedback(feedback)
          @turns -= 1
        end
      end
  
      puts "Game over! You ran out of turns."
      puts "The secret code was: #{@secret_code.join(' ')}"
    end
  
    private
  
    def generate_secret_code
      secret_code = []
      4.times { secret_code << COLORS.sample }
      secret_code
    end
  
    def get_player_guess
      puts "Enter your guess (e.g., red blue green yellow):"
      gets.chomp.split
    end
  
    def correct_guess?(guess)
      guess == @secret_code
    end
  
    def generate_feedback(guess)
      feedback = []
      temp_secret_code = @secret_code.dup
      guess.each_with_index do |color, index|
        if color == temp_secret_code[index]
          feedback << 'Black'
          temp_secret_code[index] = nil
        elsif temp_secret_code.include?(color)
          feedback << 'White'
          temp_secret_code[temp_secret_code.index(color)] = nil
        end
      end
      feedback.sort
    end
  
    def display_feedback(feedback)
      if feedback.empty?
        puts "No correct colors."
      else
        puts "Feedback: #{feedback.join(', ')}"
      end
      puts "Turns remaining: #{@turns}"
    end
end
  
# Start the game
game = Mastermind.new
game.play
  