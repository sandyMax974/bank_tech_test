# frozen_string_literal: true

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
    store_transaction(timestamp, current_balance, ' ', amount)
  end

  def withdrawal(amount)
    balance_update(-amount)
    store_transaction(timestamp, current_balance, amount, ' ')
  end

  def print_statement
    statement_header
    @transactions.reverse.each(&:print_transaction)
  end

  private

  def timestamp
    Time.now.strftime('%d-%m-%Y')
  end

  def store_transaction(date, balance, debit, credit)
    @transactions << Transaction.new(date, balance, debit, credit)
  end

  def statement_header
    header = 'date || credit || debit || balance'
    puts header
  end

  def balance_update(amount)
    @balance += amount
  end
end
