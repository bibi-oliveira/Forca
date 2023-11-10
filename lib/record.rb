require 'csv'

class Save_Load
  def initialize(arquivo_csv)
    @arquivo_csv = arquivo_csv
  end


  private

  def salvar_progresso(nome, vidas, acertos, erros)
    progresso = [nome, vidas, acertos, erros]
    CSV.open(@arquivo_csv, 'a', headers: true, header_converters: :symbol) do |csv|
      csv << progresso
    end
  end

  def mostrar_jogos
    @arquivo_csv.each do |linha|
      id = linha[0]
      nome = linha[:nome]
      vida = linha[:vida]
      acertos = linha[:letras_corretas]
      erros = linha[:letras_erradas]
      puts "ID: #{id} Nome: #{nome} vidas restantes #{vida} letras corretas: #{acertos} letras erradas: #{erros}"
    end
  end
end
