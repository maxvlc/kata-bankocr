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

  def self.look_line(scan)
    string_result = ""
    # Convierto la el array que me pasan a un string
    string_result = scan.map { |i| i.to_s}.join
    #lo comparo con lo que tengo en los CHARACTERS
    CHARACTERS.select { |key,value| return key if value==string_result }

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