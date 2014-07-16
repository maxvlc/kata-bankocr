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
              }

  def self.read(scan)
    CHARACTERS.select {|key,value| return key if value==scan}
  
  end

end