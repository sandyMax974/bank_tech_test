# frozen_string_literal: true

class Transaction
  attr_accessor :date, :balance, :debit, :credit

  def initialize(date = nil, balance = nil, debit = nil, credit = nil)
    @date = date
    @balance = balance
    @debit = debit
    @credit = credit
  end

  def print_transaction
    debit_formatting
    credit_formatting
    row_formatting
  end

  private

  def row_formatting
    puts "#{@date}||#{@credit}||#{@debit}||#{format('%.2f', @balance)}"
  end

  def debit_formatting
    @debit = format('%.2f', @debit).to_s if @debit.is_a?(Float) || @debit.is_a?(Integer)
  end

  def credit_formatting
    @credit = format('%.2f', @credit).to_s if @credit.is_a?(Float) || @credit.is_a?(Integer)
  end
end
