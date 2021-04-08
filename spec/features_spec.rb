
describe "#print_statement" do
  it 'outputs all the transaction line by line' do
    message = "date || credit || debit || balance\n08-04-2021 || || 250.00 || 1208.90\n08-04-2021 || 1458.90 || || 1458.90\n" 
    my_account = Account.new
    my_account.deposit(1458.90)
    my_account.withdrawal(250)
    expect{ my_account.print_statement }.to output(message).to_stdout
  end
end 
