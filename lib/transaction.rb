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
    row_formatting(debit_formatting, credit_formatting)
  end

  private

  def row_formatting(debit_format, credit_format)
    puts "#{@date}||#{credit_format}||#{debit_format}||#{format('%.2f', @balance)}"
  end

  def debit_formatting
    if @debit.is_a?(Float) || @debit.is_a?(Integer)
      format('%.2f', @debit).to_s
    else
      @debit
    end
  end

  def credit_formatting
    if @credit.is_a?(Float) || @credit.is_a?(Integer)
      format('%.2f', @credit).to_s
    else
      @credit
    end
  end
end
