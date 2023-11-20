require 'csv'
require 'colorize'

#percorrendo o CSV
def criar(nome, vida, l_c, l_e, p_s)
  acsv = CSV.open('historico.csv', headers: true, header_converters: :symbol)

  id = 0
  acsv.each do |linha|
    id = linha[:slot]
    vidas = linha[:vida]
    letras_corretas = linha[:letras_corretas]
    letras_erradas = linha[:letras_erradas]
    palavra_secreta = linha[:palavra_secreta]
    @novo_id = id.to_i + 1
  end


  #criando uma nova linha no arquivo csv
  new_data = [@novo_id, nome, vida, l_c, l_e, p_s]
  CSV.open('historico.csv', 'a', headers: true, header_converters: :symbol) do |csv|
    csv << new_data
  end
end


def retornar
  acsv = CSV.open('historico.csv', headers: true, header_converters: :symbol)
  acsv.shift
  acsv.each do |linha|
    id = linha[:slot]
    nome = linha[:nome]
    vida = linha[:vida]
    acertos = linha[:letras_corretas]
    erros = linha[:letras_erradas]
    cripto = linha[:palavra_criptografada]
    puts "ID: #{id.red} Nome: #{nome.blue} vidas restantes #{vida.red} letras corretas: #{acertos.blue} letras erradas: #{erros.red}"
  end
end

case opcao
in 's'
  show_data
  puts "\nEscolha o slot para jogar:"
  slot = gets.chomp.to_i
  csv.each do |line|
    id = line[:slot]
    nome = line[:nome]
    vida = line[:vida]
    acertos = line[:letras_corretas]
    erros = line[:letras_erradas]
    cripto = line[:palavra_criptografada]
    if slot == id
      data_array = [id, nome, vida, acertos, erros, cripto]
    end
  end
end
