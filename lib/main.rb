require 'csv'
require_relative 'settings.rb'
require_relative 'record.rb'

class Jogo < Config
include Save_Load
  def initialize
    @vidas = 6
    @letras_corretas = []
    @letras_erradas = []
    @dicionario = File.open('dicionario.txt')
  end

  def jogar
    schema
  end
end

a = Jogo.new
a.jogar
