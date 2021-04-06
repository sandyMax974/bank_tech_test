class Transaction
  attr_reader :date, :balance, :debit, :credit
  
  def initialize(date = nil, balance = nil, debit = nil, credit = nil)
    @date = date
    @balance = balance
    @debit = debit
    @credit = credit
  end

end
