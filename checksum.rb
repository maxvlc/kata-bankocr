require './bankocr'

class CheckSum

	ZERO = 0
	ONE = 1
	LENGTH_OF_ACCOUNT = 8
	MODULE = 11

def self.checksum? account_number
    result = 0
    checksum = false
    account_as_array_of_chars = (BankOCR.read_line(account_number)).to_s.chars
    (ZERO..LENGTH_OF_ACCOUNT).each { |num| result += ((num + ONE) * account_as_array_of_chars[num].to_i) }
    checksum = (result % MODULE == ZERO)
  end
end