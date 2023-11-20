require_relative 'Game.rb'

class Forca
include Game
  def initialize
    @lives = 10
    @wrong_letters = []
    @right_letters = []
  end

  def play
    play_game
  end
end

a = Forca.new
a.play
