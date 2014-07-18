require './bankocr'

class WorkingFile
	def self.create_file (file,args)
		args_to_s = (BankOCR.read_line(args)).to_s
    my_file = File.new(file, "w+")
    my_file.puts(args_to_s + "   ILL") unless CheckSum.checksum?(args)
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