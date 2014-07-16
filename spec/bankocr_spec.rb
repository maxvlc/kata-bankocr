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

end