require './bankocr'

class WorkingFile

	INVALID_CHECKSUM = "   ILL"

	def self.create_file (file,args)
		args_to_s = (BankOCR.read_line(args)).to_s
    my_file = File.new(file, "w+")
    my_file.puts(args_to_s + INVALID_CHECKSUM) unless CheckSum.checksum?(args)
    my_file.close

    last_line = ""

    File.open(file, "r") do |f|
    	f.each_line do |line|
    		last_line = line
    	end
    end
 		last_line
  end
end