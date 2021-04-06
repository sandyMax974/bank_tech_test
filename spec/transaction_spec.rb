require 'transaction'

describe Transaction do

  it "has a transaction date" do
    expect(subject).to respond_to(:date)
  end
  it "has the current account balance after transaction" do
    expect(subject).to respond_to(:balance)
  end
  it "has a debit amount" do
    expect(subject).to respond_to(:debit)
  end
  it "has a credit amount" do
    expect(subject).to respond_to(:credit)
  end

  describe "#print_transaction" do
    it "print the transaction details in the correct format" do
      message = "06-04-2021||0.00||5.00||20.00\n"
      transaction = Transaction.new("06-04-2021", 20.00, 5.00, 0.00)
      expect{ transaction.print_transaction }.to output(message).to_stdout
    end
  end
end