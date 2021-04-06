require 'account'

describe Account do
  
  describe "#show_balance" do
    it "display the current account balance" do
      expect(subject.show_balance).to eq(0)
    end
  end
end