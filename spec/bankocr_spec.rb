require './bankocr'

describe "BankOCR scanner" do

	it "detects a 0" do
		zero =	" _ "+
						"| |"+
						"|_|"+
						"   "
    expect(BankOCR.read(zero)).to eq 0
	end

	it "detects a 1" do
		one = "   "+
					"  |"+
					"  |"+
					"   "
		expect(BankOCR.read(one)).to eq 1
	end

	it "detects a 2" do
		two = " _ "+
					" _|"+
					"|_ "+
					"   "
		expect(BankOCR.read(two)).to eq 2
	end

	it "detects a 3" do
		two = " _ "+
					" _|"+
					" _|"+
					"   "
		expect(BankOCR.read(two)).to eq 3
	end

	it "detects a 4" do
		two = "   "+
					"|_|"+
					"  |"+
					"   "
		expect(BankOCR.read(two)).to eq 4
	end
	
	it "detects a 5" do
		two = " _ "+
					"|_ "+
					" _|"+
					"   "
		expect(BankOCR.read(two)).to eq 5
	end
	
	it "detects a 6" do
		two = " _ "+
					"|_ "+
					"|_|"+
					"   "
		expect(BankOCR.read(two)).to eq 6
	end
	
	it "detects a 7" do
		two = " _ "+
					"  |"+
					"  |"+
					"   "
		expect(BankOCR.read(two)).to eq 7
	end
	
	it "detects a 8" do
		two = " _ "+
					"|_|"+
					"|_|"+
					"   "
		expect(BankOCR.read(two)).to eq 8
	end

end