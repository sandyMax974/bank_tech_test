require 'account'

describe Account do
  
  describe "#current_balance" do
    it "display the current account balance" do
      expect(subject.current_balance).to eq(0)
    end
  end

  describe "deposit" do
    it "adds the amount to the account balance" do
      subject.deposit(20.00)
      expect(subject.current_balance).to eq(20.00)
    end
  end
end