require "./lib/transaction_history.rb"

describe "transaction_history" do
  let(:mock_transaction1) { double('transaction', date: "06/10/2018", credit: 100, debit: "", balance: 100) }
  let(:mock_transaction2) { double('transaction', date: "07/10/2018", credit: 200, debit: "", balance: 300) }
  let(:mock_transaction3) { double('transaction', date: "08/10/2018", credit: "", debit: 150, balance: 150) }

  before(:each) do
    @transaction_history = TransactionHistory.new
  end

  describe "#new" do
    it "starts empty history" do
      expect(@transaction_history.all_transactions).to eq([])
    end
  end

  context "with a deposit transaction of £100" do
    before(:each) do
      @transaction_history.all_transactions << mock_transaction1
    end

    describe "#show_statement" do
      it "displays a header" do
        expect(@transaction_history.show_statement).to include(
          "date || credit || debit || balance")
      end
      it "displays a single transaction" do
        expect(@transaction_history.show_statement).to include(
          "06/10/2018 || 100.00 ||  || 100.00"
        )

      end
      it "displays multiple transactions" do
        @transaction_history.all_transactions << mock_transaction2
        @transaction_history.all_transactions << mock_transaction3

        expect(@transaction_history.show_statement).to include(
          "06/10/2018 || 100.00 ||  || 100.00\n07/10/2018 || 200.00 ||  || 300.00\n08/10/2018 ||  || 150.00 || 150.00"
        )
      end
    end
  end
end
