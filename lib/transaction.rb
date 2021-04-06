class Transaction
  attr_reader :timestamp, :balance, :debit, :credit
  
  def initialize(balance = nil, debit = nil, credit = nil)
    @timestamp = Time.now.to_s
    @balance = balance
    @debit = debit
    @credit = credit
  end
end
