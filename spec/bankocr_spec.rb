require './bankocr'

describe "BankOCR scanner" do

	it "detects a 0" do
		scan = " _  _  _  _  _  _  _  _  _ "+
					 "| || || || || || || || || |"+
					 "|_||_||_||_||_||_||_||_||_|"+
					 "                           "
    expect(BankOCR.read(scan)).to eq 0
	end

end