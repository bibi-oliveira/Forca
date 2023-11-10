require 'csv'


acsv = CSV.open('historico.csv', headers: true, header_converters: :symbol)

#percorrendo o CSV
acsv.each do |linha|
  id = linha[0]
  vida = linha[:vida]
  letras_corretas = linha[:letras_corretas]
  letras_erradas = linha[:letras_erradas]
  @novo_id = id.to_i + 1
end


#criando uma nova linha no arquivo csv
new_data = [@novo_id, 'lúcio', 2, 3, 1]

CSV.open('historico.csv', 'a', headers: true, header_converters: :symbol) do |csv|
  csv << new_data
end
