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
    character=""
    account_readed = ""
    number_readed = 0
    #show readed line as String
    (0..3).each { |line_readed| account_readed+=original_array[line_readed].to_s}
    puts "*"*3+account_readed+"*"*3
    
    #select three characters to recover the first number
    initial_position = 0
    number_size = initial_position+2
    next_position_character = 27
    CHARACTERS.select { 
      |key,value| character = account_readed[initial_position..number_size]+
                              account_readed[27+initial_position..27+number_size]+
                              account_readed[54+initial_position..54+number_size]+
                              account_readed[81+initial_position..81+number_size]
      puts number_readed = key if value==character }
    #puts number_readed
  end

  def self.look_line(scan)
    string_result = ""
    puts string_result = scan.map { |i| i.to_s}.join
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