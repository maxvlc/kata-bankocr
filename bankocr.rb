class BankOCR

  CHARACTERS = {0=> " _ "+
                    "| |"+
                    "|_|"+
                    "   ",
                1=> "   "+
                    "  |"+
                    "  |"+
                    "   ",
                2=> " _ "+
                    " _|"+
                    "|_ "+
                    "   ",
                3=> " _ "+
                    " _|"+
                    " _|"+
                    "   ",
                4=> "   "+
                    "|_|"+
                    "  |"+
                    "   ",
                5=> " _ "+
                    "|_ "+
                    " _|"+
                    "   ",
                6=> " _ "+
                    "|_ "+
                    "|_|"+
                    "   ",
                7=> " _ "+
                    "  |"+
                    "  |"+
                    "   ",
                8=> " _ "+
                    "|_|"+
                    "|_|"+
                    "   ",
                9=> " _ "+
                    "|_|"+
                    " _|"+
                    "   "
              }

  def self.read_line original_array
    account =""
    character=""
    transform_account_to_string = ""
    number_readed = 0

    #Convierte el array de string que me pasan a una cadena
    (0..3).each { |line_readed| transform_account_to_string+=original_array[line_readed].to_s}
    
    #Recorro las nueve posiciones que forman la cuenta y las cuatro lineas para sacar cada uno de los num.
    (0..9).each {|position| 
      pointer = (position*3)
      digit = ""
      (0..3).each { |line|
        start = pointer+(line*27)
        final = start+2
        digit += transform_account_to_string[start..final]
        }
        #Leo cada digito por linea y lo paso para decodificarlo y lo añado a la cuenta total
        account += identify_number(digit)
      }
      account.to_i
  end

  def self.identify_number digit
    result = ""
    #Busca el numero en mi hash y lo devuelve para añadir a la cuenta
    CHARACTERS.select { |key,value| result << key.to_s if value == digit }
    result
  end

  def self.read_number scan
    #Convierto el array de texto que me envian a una cadena de texto
    string_result = scan.map { |number_as_string| number_as_string.to_s}.join
    #Busca el numero en mi hash y lo devuelve
    CHARACTERS.select { |key,value| return key if value==string_result }
  end
end