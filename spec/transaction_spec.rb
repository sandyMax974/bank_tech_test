# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:today) { Time.now.strftime('%d-%m-%Y') }
  let(:message) { "#{today}||178.50||||1500.00\n" }

  subject { Transaction.new(today, 1500.00, nil , 178.50) }

  it 'has a transaction date' do
    expect(subject.date).to eq(today)
  end
  it 'has the current account balance after transaction' do
    expect(subject.balance).to eq(1500.00)
  end
  it 'has a debit amount' do
    expect(subject.debit).to eq(nil)
  end
  it 'has a credit amount' do
    expect(subject.credit).to eq(178.50)
  end

  describe '#print_transaction' do
    it 'print the transaction details in the correct format' do
      expect { subject.print_transaction }.to output(message).to_stdout
    end
  end
end
