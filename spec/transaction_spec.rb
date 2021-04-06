require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new }

  it "knows its creation date/time" do
    expect(transaction.timestamp).not_to be nil
  end
  


end