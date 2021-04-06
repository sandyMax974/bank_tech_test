require 'account'

describe Account do
  
  describe "#current_balance" do
    it "display the current account balance" do
      expect(subject.current_balance).to eq(0)
    end
  end

  describe "#deposit" do
    it "creates a new transaction" do
      expect(Transaction).to receive(:new)
      subject.deposit(20.00)
    end
    it "adds the amount to the account balance" do
      subject.deposit(20.00)
      expect(subject.current_balance).to eq(20.00)
    end
    it "adds the transaction to the account transactions collection" do
      expect { subject.deposit(20.00) }.to change{ subject.transactions.count }.by(1)
    end
  end
end