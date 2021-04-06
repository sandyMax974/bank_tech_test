require_relative 'transaction'

class Account
  attr_accessor :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def current_balance
    @balance
  end

  def deposit(amount)
    @balance = @balance + amount

    date = Time.now.to_s[0...10]
    credit = amount
    debit = 0 # or nil
    balance = current_balance

    @transactions << Transaction.new(date, balance, debit, credit)
  end

  def withdrawal(amount)
    @balance = @balance - amount

    date = Time.now.to_s[0...10]
    credit = 0 # or nil
    debit = amount
    balance = current_balance

    @transactions << Transaction.new(date, balance, debit, credit)
  end
end