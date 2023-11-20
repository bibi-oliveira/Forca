require "colorize"

class Config
  def achar_palavra
    @arquivo = File.open('dicionario.txt')
    palavras = []
    @arquivo.each do |palavra|
      palavras.push((palavra.downcase).split)
    end
    numero_palavra = rand(0..palavras.size)
    palavra = palavras[numero_palavra]
    return palavra[0]
  end

  def display
    puts "\nJogador: #{@nome}"
    puts "\nVidas: #{@vidas}".red
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
    puts "Palavra final: #{@palavra_secreta} \nVOCE GANHOU PARABÉNS!!!".blue

  end

  def perdedor
    puts "VOCÊ PERDEU, A PALAVRA CORRETA ERA #{@palavra_secreta}".red
  end

  def remover_acentos(texto)
    texto
      .tr('áàãâéèêíìóòõôúùûçÁÀÃÂÉÈÊÍÌÓÒÕÔÚÙÛÇ', 'aaaaeeeiiooouuucAAAAEEEIIOOOUUUC')
      .gsub(/[^a-zA-Z0-9_]/, '_')
  end

  def schema
    puts 'Informe seu nome: '
    @nome = gets.chomp
    @palavra_secreta = achar_palavra
    @palavra_secreta = remover_acentos(@palavra_secreta)
    while true
      sleep(0.5)
      system("cls")
      display
      print "Digite uma letra: "
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
        "ERRO LETRA INVÁLIDA"
      end
    end
  end


end
