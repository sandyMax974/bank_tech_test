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

    date = timestamp
    credit = amount
    debit = 0 # or nil
    balance = current_balance

    store_transaction(date, balance, debit, credit)
  end

  def withdrawal(amount)
    @balance = @balance - amount

    date = timestamp
    credit = 0 # or nil
    debit = amount
    balance = current_balance

    store_transaction(date, balance, debit, credit)
  end

  def print_statement
    header = "date || credit || debit || balance"
    puts header
    @transactions.each { |transaction| transaction.print_transaction }
  end

  def store_transaction(date, balance, debit, credit)
    @transactions << Transaction.new(date, balance, debit, credit)
  end

  private
  def timestamp
    Time.now.strftime("%d-%m-%Y")
  end



end