class BankOCR

  def self.read(scan)
    zero =  " _ "+
            "| |"+
            "|_|"+
            "   "
    return 0 if scan.include? zero
  end

end