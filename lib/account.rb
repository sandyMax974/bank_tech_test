# frozen_string_literal: true

require_relative 'transaction'

class Account
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def current_balance
    total_credit - total_debit
  end

  def deposit(amount)
    store_transaction(balance_after_transaction(amount), nil, amount)
  end

  def withdrawal(amount)
    store_transaction(balance_after_transaction(-amount), amount, nil)
  end

  def print_statement
    statement_header
    @transactions.reverse.each(&:print_transaction)
  end

  private

  def store_transaction(balance, debit, credit)
    @transactions << Transaction.new(balance, debit, credit)
  end

  def statement_header
    header = 'date || credit || debit || balance'
    puts header
  end

  def total_credit
    total_credit = 0
    @transactions.each do |transaction|
      total_credit += transaction.credit unless transaction.credit.nil?
    end
    total_credit
  end

  def total_debit
    total_debit = 0
    @transactions.each do |transaction|
      total_debit += transaction.debit unless transaction.debit.nil?
    end
    total_debit
  end

  def balance_after_transaction(amount)
    current_balance + amount
  end
end
