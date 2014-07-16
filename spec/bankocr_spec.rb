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

end