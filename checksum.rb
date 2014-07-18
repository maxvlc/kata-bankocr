require './bankocr'

class CheckSum

def self.checksum? account_number
    result = 0
    checksum = false
    account_as_array_of_chars = (BankOCR.read_line(account_number)).to_s.chars
    (0..8).each { |num| result += ((num+1)*account_as_array_of_chars[num].to_i) }
    checksum = (result % 11 == 0)
  end
end