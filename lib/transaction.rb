class Transaction
  attr_reader :date, :balance, :debit, :credit
  
  def initialize(date = nil, balance = nil, debit = nil, credit = nil)
    @date = date 
    @balance = balance
    @debit = debit 
    @credit = credit 
  end

  def print_transaction
    puts "#{@date}||#{'%.2f' % @credit}||#{'%.2f' % @debit}||#{'%.2f' % @balance}"
  end

end
