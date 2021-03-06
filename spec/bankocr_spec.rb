require './bankocr'

describe "BankOCR scanner" do

	account1= [" _  _  _  _  _  _  _  _  _ ",
						 "| || || || || || || || || |",
						 "|_||_||_||_||_||_||_||_||_|",
						 "                           "]
	account3= [" _  _  _  _  _  _  _  _  _ "+
						 "|_ |_ |_ |_ |_ |_ |_ |_ |_ "+
						 "|_||_||_||_||_||_||_||_||_|"+
						 "                           "]
	account2= ["    _  _  _  _  _  _     _ ",
						 "|_||_|| || ||_   |  |  ||_ ",
						 "  | _||_||_||_|  |  |  | _|",
						 "                           "]
	bad_checksum=	["    _  _  _     _  _     _ ",
						 		 "|_|| || || ||_   |  |  ||_ ",
						 		 "  | _||_||_|| |  |  |  | _|",
						 		 "                           "]
	bad_account= ["    _  _  _  _  _  _     _ ",
						 		"|_||_|| || || |  |  |  ||_ ",
						 		"  | _||_||_||_|  |  |  | _|",
						 		"                           "]

	it "detects a 0" do
		zero =	[" _ ","| |","|_|","   "]
    expect(BankOCR.read_number(zero)).to eq 0
	end

	it "detects a 1" do
		one = ["   "+
					"  |"+
					"  |"+
					"   "]
		expect(BankOCR.read_number(one)).to eq 1
	end

	it "detects a 2" do
		two = [" _ "+
					 " _|"+
					 "|_ "+
					 "   "]
		expect(BankOCR.read_number(two)).to eq 2
	end

	it "detects a 3" do
		three = [" _ "+
						 " _|"+
						 " _|"+
						 "   "]
		expect(BankOCR.read_number(three)).to eq 3
	end

	it "detects a 4" do
		four = ["   "+
						"|_|"+
						"  |"+
						"   "]
		expect(BankOCR.read_number(four)).to eq 4
	end
	
	it "detects a 5" do
		five = [" _ "+
						"|_ "+
						" _|"+
						"   "]
		expect(BankOCR.read_number(five)).to eq 5
	end
	
	it "detects a 6" do
		six = 	[" _ "+
						 "|_ "+
						 "|_|"+
						 "   "]
		expect(BankOCR.read_number(six)).to eq 6
	end
	
	it "detects a 7" do
		seven = [" _ "+
						 "  |"+
						 "  |"+
						 "   "]
		expect(BankOCR.read_number(seven)).to eq 7
	end
	
	it "detects a 8" do
		eight = [" _ "+
						 "|_|"+
						 "|_|"+
						 "   "]
		expect(BankOCR.read_number(eight)).to eq 8
	end

	it "detects a 9" do
		nine = [" _ "+
						"|_|"+
						" _|"+
						"   "]
		expect(BankOCR.read_number(nine)).to eq 9
	end

	it "detects different account numbers" do
		expect(BankOCR.read_line(account1)).to eq "000000000"
		expect(BankOCR.read_line(account2)).to eq "490067715"
		expect(BankOCR.read_line(account3)).to eq "666666666"
	end

	it "detects an invalid checksum" do
		expect(CheckSum.checksum?(account2)).to eq false
	end

	it "creates a file with results and displays it" do
		expect(BankOCR.check_and_create(account2)).to eq "490067715   ILL\n"
	end

	it "detects invalid accounts numbers" do
		expect(BankOCR.check(bad_checksum)).to eq "CheckSum Error"
		# expect(BankOCR.check(bad_account)).to eq "Invalid Account"
	end
end