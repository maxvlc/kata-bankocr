class BankOCR

  def self.read(scan)
    zero =  " _ "+
            "| |"+
            "|_|"+
            "   "
    one =   "   "+
            "  |"+
            "  |"+
            "   "
    two =   " _ "+
            " _|"+
            "|_ "+
            "   "
    return 0 if scan.include? zero
    return 1 if scan.include? one
    return 2 if scan.include? two
  end

end