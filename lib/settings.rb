
class Config
private
  def achar_palavra
    palavras = []
    for palavra in @arquivo do
      palavras.push((palavra.downcase).split)
    end
    numero_palavra = rand(0..palavras.size)
    palavra = palavras[numero_palavra]
    return palavra[0]
  end

  def mostrar_jogo
    puts "\nVidas: #{@vidas}"
    puts "\nPalavra: #{palavra_escondida}"
    puts "\nLetras erradas: #{@letras_erradas}"
  end

  def palavra_escondida
    @palavra_secreta.chars.map { |letra| @letras_corretas.include?(letra) ? letra : '_' }.join(' ')
  end

  def palavra_revelada?
    @palavra_secreta.chars.all? { |letra| @letras_corretas.include?(letra) }
  end

  def ganhador
    puts "VOCE GANHOU PARABÉNS!!!"
  end

  def perdedor
    puts "VOCÊ PERDEU ;-; Q PENA, A PALAVRA ERA #{@palavra_secreta}"
  end

  def remover_acentos(texto)
    texto
      .tr('áàãâéèêíìóòõôúùûçÁÀÃÂÉÈÊÍÌÓÒÕÔÚÙÛÇ', 'aaaaeeeiiooouuucAAAAEEEIIOOOUUUC')
      .gsub(/[^a-zA-Z0-9_]/, '_')
  end
end
