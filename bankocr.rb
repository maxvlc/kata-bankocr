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

  def self.decode_array(original_array)
    account =""
    character=""
    account_readed = ""
    number_readed = 0
    #show readed line as String
    (0..3).each { |line_readed| account_readed+=original_array[line_readed].to_s}
    # puts "*"*3+account_readed+"*"*3
    
    (0..9).each {|position| 
      pointer = (position*3)
      digit = ""
      (0..3).each { |line|
        start = pointer+(line*27)
        final = start+2
        digit += account_readed[start..final]
        }
        # puts digit
        account += reconocer_character(digit)
      }
      account.to_i
  end

  def self.reconocer_character (identify_number)
    result = ""
    CHARACTERS.select { |key,value| result += key.to_s if value == identify_number }
    result.to_s
  end

  def self.look_line(scan)
    string_result = ""
    string_result = scan.map { |i| i.to_s}.join
    CHARACTERS.select { |key,value| return key if value==string_result }
    #Necesito encontrar los valores cada 3 caracteres

    # puts CHARACTERS
    # CHARACTERS.select { |key,value| 
    #   puts "*"+scan.to_s+"*"
    #   puts "*"+value.to_s+"*"
    #   return key if value==scan }
    #CHARACTERS.each { |key,value| puts key(value) if value==char }
  end

  # def self.read(scan)
  #   CHARACTERS.select { |key,value| return key if value==scan }
  # end

end