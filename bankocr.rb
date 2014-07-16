class BankOCR

  def self.read(scan)
    zero =  " _ "+
            "| |"+
            "|_|"+
            "   "
    one = "   "+
          "  |"+
          "  |"+
          "   "
    return 0 if scan.include? zero
    return 1 if scan.include? one
  end

end