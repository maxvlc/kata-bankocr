require './bankocr'

describe "BankOCR scanner" do

	it "detects a 0" do
		zero =	[" _ ","| |","|_|","   "]
    expect(BankOCR.look_line(zero)).to eq 0
	end

	it "detects a 1" do
		one = ["   "+
					"  |"+
					"  |"+
					"   "]
		expect(BankOCR.look_line(one)).to eq 1
	end

	it "detects a 2" do
		two = [" _ "+
					 " _|"+
					 "|_ "+
					 "   "]
		expect(BankOCR.look_line(two)).to eq 2
	end

	it "detects a 3" do
		three = [" _ "+
						 " _|"+
						 " _|"+
						 "   "]
		expect(BankOCR.look_line(three)).to eq 3
	end

	it "detects a 4" do
		four = ["   "+
						"|_|"+
						"  |"+
						"   "]
		expect(BankOCR.look_line(four)).to eq 4
	end
	
	it "detects a 5" do
		five = [" _ "+
						"|_ "+
						" _|"+
						"   "]
		expect(BankOCR.look_line(five)).to eq 5
	end
	
	it "detects a 6" do
		six = 	[" _ "+
						 "|_ "+
						 "|_|"+
						 "   "]
		expect(BankOCR.look_line(six)).to eq 6
	end
	
	it "detects a 7" do
		seven = [" _ "+
						 "  |"+
						 "  |"+
						 "   "]
		expect(BankOCR.look_line(seven)).to eq 7
	end
	
	it "detects a 8" do
		eight = [" _ "+
						 "|_|"+
						 "|_|"+
						 "   "]
		expect(BankOCR.look_line(eight)).to eq 8
	end

	it "detects a 9" do
		nine = [" _ "+
						"|_|"+
						" _|"+
						"   "]
		expect(BankOCR.look_line(nine)).to eq 9
	end

	it "detects an 000000000 account" do
		account = [" _  _  _  _  _  _  _  _  _ ",
							 "| || || || || || || || || |",
							 "|_||_||_||_||_||_||_||_||_|",
							 "                           "]
		account2= ["    _  _  _  _  _  _     _ ",
							 "|_||_|| || ||_   |  |  ||_ ",
							 "  | _||_||_||_|  |  |  | _|",
							 "                           "]

		account3= [" _  _  _  _  _  _  _  _  _ "+
							 "|_ |_ |_ |_ |_ |_ |_ |_ |_ "+
							 "|_||_||_||_||_||_||_||_||_|"+
							 "                           "]

		expect(BankOCR.decode_array(account2)).to eq 000000000
		# 490067715
	end



                           

end