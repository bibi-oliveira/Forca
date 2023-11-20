require 'colorize'

module Game

  private
  def secret
    dict = File.open('Dicionario.txt')
    words = []
    dict.each do |word|
      words.push((word.downcase).split)
    end
    num_word = rand(0..words.size)
    word = words[num_word]
    @secret_word = word[0]
  end

  def display
    sleep(0.5)
    system("cls")
    puts "Name: #{@name}"
    puts "Lives: #{@lives}".red
    puts "Word: #{hidden_word}"
    puts "wrong_letters: #{@wrong_letters}"
  end

  def hidden_word
    @secret_word.chars.map { |letter| @right_letters.include?(letter) ? letter : '_' }.join(' ')
  end

  def reveal_word?
    @secret_word.chars.all? { |letter| @right_letters.include?(letter) }
  end

  def win
    puts "YOU WIN. Congratulations !".yellow
  end

  def loss
    puts "YOU LOSE. The correct word is: #{secret_word}".red
  end
  
  public
  def play_game
    secret
    puts 'Whats your name: '
    @name = gets.chomp
    while true
      display
      print "type a letter: "
      letter = gets.chomp
      if letter.length == 1 and letter =~ /[a-z]/
        letter.downcase!
        if @secret_word.include?(letter)
          @right_letters.push(letter)
          if reveal_word?
            win
            break
          end
        else
          @wrong_letters.push(letter)
          @lives -= 1
          if @lives < 1
            loss
            break
          end
        end
      else
        "Error. Try again."
      end
    end
  end
end
