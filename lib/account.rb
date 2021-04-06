class Account

  def initialize
    @balance = 0
  end

  def current_balance
    @balance
  end

  def deposit(amount)
    Transaction.new(amount)
  end
end