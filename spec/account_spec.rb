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

  describe "#withdrawal" do
    it "creates a new transaction" do
      expect(Transaction).to receive(:new)
      subject.withdrawal(5.00)
    end
    it "removes the amount to the account balance" do
      subject.deposit(20.00)
      subject.withdrawal(5.00)
      expect(subject.current_balance).to eq(15.00)
    end
    it "adds the transaction to the account transactions collection" do
      expect{ subject.withdrawal(5.00) }.to change{ subject.transactions.count }.by(1)
    end
  end

  describe "#print_statement" do
    it "outputs all the transaction line by line" do
      message = "date || credit || debit || balance\n06-04-2021||0.00||5.00||20.00\n"
      transaction = Transaction.new("06-04-2021", 20.00, 5.00, 0.00)
      subject.transactions << transaction
      expect{ subject.print_statement }.to output(message).to_stdout
    end
  end

  describe "#store_transaction" do
    it "add the new transaction to the account transactions collection" do
      expect{ subject.store_transaction("06-04-2021", 20.00, 5.00, 0.00) }.to change{ subject.transactions.count }.by(1)
    end
  end
end