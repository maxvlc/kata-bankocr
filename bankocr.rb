require './checksum'
require './workingfile'

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

  def self.check_and_create check_account
    # account_to_save = read_line(check_account)
    WorkingFile.create_file("numbers.txt", check_account)
  end

  def self.read_line account_number
    final_account = ""
    account_as_string = convert_array_to_string (account_number)
   
    (0..9).each {|position| 
      pointer = (position*3)
      digit = ""
      (0..3).each { |line|
        start = pointer+(line*27)
        final = start+2
        digit += account_as_string[start..final]
      }
      final_account += extract_account_number(digit)
    }
    final_account
  end

  def self.convert_array_to_string original_array
    final_string = ""
    (0..3).each { |line_readed| final_string += original_array[line_readed].to_s}
    final_string
  end

  def self.extract_account_number digit
    result = ""
    CHARACTERS.select { |key,value| result << key.to_s if value == digit }
    result
  end

  def self.read_number scan
    string_result = scan.map { |number_as_string| number_as_string.to_s}.join
    CHARACTERS.select { |key,value| return key if value==string_result }
  end
end