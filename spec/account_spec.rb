# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction) { double :transaction, :date => '06-04-2021', :balance => 20.00, :debit => 5.00, :credit => " " }
  let(:message) { "date || credit || debit || balance\n" }

  describe '#current_balance' do
    it 'display the current account balance' do
      expect(subject.current_balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'creates a new transaction' do
      expect(Transaction).to receive(:new)
      subject.deposit(20.00)
    end
    it 'adds the amount to the account balance' do
      subject.deposit(20.00)
      expect(subject.current_balance).to eq(20.00)
    end
    it 'adds the transaction to the account transactions collection' do
      expect { subject.deposit(20.00) }.to change { subject.transactions.count }.by(1)
    end
  end

  describe '#withdrawal' do
    it 'creates a new transaction' do
      expect(Transaction).to receive(:new)
      subject.withdrawal(5.00)
    end
    it 'removes the amount to the account balance' do
      subject.withdrawal(5.00)
      expect(subject.current_balance).to eq(-5.00)
    end
    it 'adds the transaction to the account transactions collection' do
      expect { subject.withdrawal(5.00) }.to change { subject.transactions.count }.by(1)
    end
  end

  describe '#print_statement' do
    it 'outputs all the transaction line by line' do
      subject.transactions << transaction
      expect(transaction).to receive(:print_transaction)
      expect { subject.print_statement }.to output(message).to_stdout
    end
  end

  xdescribe '#store_transaction' do
    it 'add the new transaction to the account transactions collection' do
      expect { subject.store_transaction('06-04-2021', 20.00, 5.00, 0.00) }.to change {
                                                                                 subject.transactions.count
                                                                               }.by(1)
    end
  end
end
