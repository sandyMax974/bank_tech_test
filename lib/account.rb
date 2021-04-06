class Account

  def initialize
    @balance = 0
  end

  def current_balance
    @balance
  end

  def deposit(amount)
    # take the current time
    date = Time.now.to_s[0...10]
    # take the credit amount from param
    credit = amount.to_f
    # mark 0 as the debit amount
    debit = 0 # or nil
    # take the current account balance
    balance = current_balance
    # instantiate a new transaction
    Transaction.new(date, credit, debit, balance)

    # modify the account balance
    @balance += amount
  end
end