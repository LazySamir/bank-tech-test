require "./lib/account.rb"

describe "account" do
  let(:mock_transaction) { class_double('Transaction') }
  let(:mock_transaction_history) { double('transaction_history', all_transactions: [mock_transaction]) }

  before(:each) do
    @account = Account.new(mock_transaction_history)
  end
  describe "#new" do
    it "starts with an empty balance" do
      expect(@account.balance).to eq(0)
    end
  end
  describe "#show_balance" do
    it "shows current balance message" do
      expect(@account.show_balance).to eq("You have £0 in your account")
    end
  end

  context "with £100 deposited" do
    before(:each) do
      @account.deposit(100)
    end
    describe "#deposit" do
      it "increases balance" do
        expect(@account.balance).to eq(100)
      end
    end
    describe "#withdraw" do
      it "decreases balance" do
        @account.withdraw(50)

        expect(@account.balance).to eq(50)
      end
    end
  end
end
