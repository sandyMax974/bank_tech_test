class Transaction
  attr_reader :timestamp
  
  def initialize(timestamp = Time.now)
    @timestamp = timestamp
  end
end
