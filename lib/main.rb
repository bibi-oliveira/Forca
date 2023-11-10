require 'csv'
require_relative 'settings.rb'
require_relative 'record.rb'

class Jogo < Config
  def initialize
    @vidas = 6
    @letras_corretas = []
    @letras_erradas = []
    @dicionario = File.open('dicionario.txt')
  end

  def jogar
    @palavra_secreta = achar_palavra
    @palavra_secreta = remover_acentos(@palavra_secreta)
    while true
      mostrar_jogo
      puts "Digite uma letra: "
      letra = gets.chomp
      if letra.length == 1 and letra =~ /[a-z]/
        letra.downcase!
        if @palavra_secreta.include?(letra)
          @letras_corretas.push(letra)
          if palavra_revelada?
            ganhador
            break
          end
        else
          @letras_erradas.push(letra)
          @vidas -= 1
          if @vidas < 1
            perdedor
            break
          end
        end
      else
        puts "ERRO LETRA INVÁLIDA"
      end
    end
  end

private
  def salvar
    save = [@vidas, @letras_corretas, @letras_erradas]
  end

  def carregar

  end
end

a = Jogo.new
a.jogar
