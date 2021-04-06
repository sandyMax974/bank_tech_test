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

end