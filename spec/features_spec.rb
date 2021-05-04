
describe "print_statement" do
  it 'outputs all the transaction line by line' do
    date = Time.now.strftime('%d-%m-%Y')
    message_header = "date || credit || debit || balance\n"
    message_line_1 = "#{date} || || 250.00 || 1208.90\n"
    message_line_2 = "#{date} || 1458.90 || || 1458.90\n" 
    
    my_account = Account.new
    my_account.deposit(1458.90)
    my_account.withdrawal(250)
    expect{ my_account.print_statement }.to output(message_header + message_line_1 + message_line_2).to_stdout
  end
end 
