require './bankocr'

describe "BankOCR" do

	it "detects a 0" do
		analize = "
 _  _  _  _  _  _  _  _  _ 
| || || || || || || || || |
|_||_||_||_||_||_||_||_||_|
                           "
    expect(BankOCR.new.reader(analize)).to eq "Detects a Zero"		
	end

end