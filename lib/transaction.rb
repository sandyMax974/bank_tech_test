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
    puts "#{@date}||#{@credit}||#{@debit}||#{'%.2f' % @balance}"
  end

  def debit_formatting
     @debit = "#{'%.2f' %  @debit}" if @debit.is_a?(Float)
  end

  def credit_formatting
    @credit = "#{'%.2f' %  @credit}" if @credit.is_a?(Float)
 end

end
