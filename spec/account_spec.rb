require 'account'

describe Account do
  
  describe "#current_balance" do
    it "display the current account balance" do
      expect(subject.current_balance).to eq(0)
    end
  end

  describe "deposit" do
    xit "create a new transaction" do
      transaction = class_double("Transaction")
      expect(transaction).to receive(:new)
      subject.deposit(20.50)
    end
  end
end