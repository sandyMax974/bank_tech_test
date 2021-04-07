require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def current_balance
    @balance
  end

  def deposit(amount)
    balance_update(amount)

    date = timestamp
    credit = amount
    debit = " " # or nil
    balance = current_balance

    store_transaction(date, balance, debit, credit)
  end

  def withdrawal(amount)
    balance_update(-amount)

    date = timestamp
    credit = " " # or nil
    debit = amount
    balance = current_balance

    store_transaction(date, balance, debit, credit)
  end

  def print_statement
    statement_header
    @transactions.each { |transaction| transaction.print_transaction }
  end

  private

  def timestamp
    Time.now.strftime("%d-%m-%Y")
  end

  def store_transaction(date, balance, debit, credit)
    @transactions << Transaction.new(date, balance, debit, credit)
  end

  def statement_header
    header = "date || credit || debit || balance"
    puts header
  end

  def balance_update(amount)
    @balance += amount
  end
end