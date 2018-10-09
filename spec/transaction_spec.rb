require "./lib/transaction.rb"

describe "transaction" do
  let(:mock_account) { double('account', balance: 100) }

  describe "#new" do
    context "when a transaction has been made" do
      before(:each) do
        @deposit_transaction = Transaction.new(200, "", mock_account.balance)
        @withdrawal_transaction = Transaction.new("", 100, mock_account.balance)
      end
      describe "state" do
        it "knows the date" do
          expect(@deposit_transaction.date).to eq(time_now)
        end
        it "knows how much is creditted" do
          expect(@deposit_transaction.credit).to eq(200)
          expect(@withdrawal_transaction.credit).to eq("")
        end
        it "knows how much is debitted" do
          expect(@deposit_transaction.debit).to eq("")
          expect(@withdrawal_transaction.debit).to eq(100)
        end
        it "knows the remaining account balance" do
          expect(@deposit_transaction.balance).to eq(100)
        end
      end
    end
  end
end
