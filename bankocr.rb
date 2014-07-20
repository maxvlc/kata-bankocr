require './checksum'
require './workingfile'

class BankOCR

  CHARACTERS = {0=> " _ | ||_|   ",
                1=> "     |  |   ",
                2=> " _  _||_    ",
                3=> " _  _| _|   ",
                4=> "   |_|  |   ",
                5=> " _ |_  _|   ",
                6=> " _ |_ |_|   ",
                7=> " _   |  |   ",
                8=> " _ |_||_|   ",
                9=> " _ |_| _|   "
              }
  CHARS_PER_LINE = 27
  CHARS_BETWEEN_NUMBER = 2
  RESULT_FILE = "numbers.txt"
  ZERO = 0
  LINE_LENGTH = 9
  CHAR_PARTIAL = 3
  LAST_LINE = 3

  def self.read_line account_number
    final_account = ""
    account_as_string = convert_array_to_string (account_number)
   
    (ZERO..LINE_LENGTH).each { |position| 
      pointer = (position * CHAR_PARTIAL)
      digit = ""
      (ZERO..CHAR_PARTIAL).each { |line|
        start = pointer + (line * CHARS_PER_LINE)
        final = start + CHARS_BETWEEN_NUMBER
        digit += account_as_string[start..final]
      }
      final_account += extract_account_number(digit)
    }
    final_account
  end

  def self.convert_array_to_string original_array
    final_string = ""
    (ZERO..LAST_LINE).each { |line_readed| final_string += original_array[line_readed].to_s }
    final_string
  end

  def self.extract_account_number digit
    result = ""
    CHARACTERS.select { |key,value| result << key.to_s if value == digit }
    result
  end

  def self.read_number scan
    string_result = scan.map { |number_as_string| number_as_string.to_s}.join
    CHARACTERS.select { |key,value| return key if value == string_result }
  end

  def self.check_and_create account
    WorkingFile.create_file(RESULT_FILE, account)
  end

  def invalid_account? account
    valid = false

  end

  def self.check account
    result = ""
    result = "CheckSum Error" if read_line(account).size < LINE_LENGTH
    # result = "Invalid Account" if read_line(account).size < LINE_LENGTH
  end
end