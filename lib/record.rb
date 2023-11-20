require 'csv'
require 'colorize'

module Save_Load
  # Método que salva os dados no arquivo csv
  def create_data(nome, vida, l_c, l_e, p_s)
    id = 0
    csv = CSV.open('historico.csv', headers: true, header_converters: :symbol)
    csv.each do |linha|
      id = linha[:slot]
      vidas = linha[:vida]
      letras_corretas = linha[:letras_corretas]
      letras_erradas = linha[:letras_erradas]
      palavra_secreta = linha[:palavra_secreta]
      @novo_id = id.to_i + 1
    end


    #criando uma nova linha no arquivo csv
    new_data_line = [@novo_id, nome, vida, l_c, l_e, p_s]
    CSV.open('historico.csv', 'a', headers: true, header_converters: :symbol) do |csv|
      csv << new_data_line
    end
  end

  def show_data
    csv = CSV.open('historico.csv', headers: true, header_converters: :symbol)
    csv.shift
    csv.each do |linha|
      id = linha[:slot]
      nome = linha[:nome]
      vida = linha[:vida]
      acertos = linha[:letras_corretas]
      erros = linha[:letras_erradas]
      puts "ID: #{id.red} Nome: #{nome.blue} vidas restantes #{vida.red} letras corretas: #{acertos.blue} letras erradas: #{erros.red}"
    end
  end

  def load_data
    #acessando arquivo csv
    csv = CSV.open('historico.csv', headers: true, header_converters: :symbol)
    csv.shift

    puts "Deseja carregar um jogo já existente ?[s/n]"
    opcao = gets.chomp.downcase!
    case opcao
    in 's'
      show_data
      puts "\nEscolha o slot para jogar:"
      slot = gets.chomp.to_i

    in 'n'
    end
  end
end

class A
include Save_Load
end

a = A.new
a.show_data
