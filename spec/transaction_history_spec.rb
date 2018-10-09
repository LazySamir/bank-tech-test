require "./lib/transaction_history.rb"

describe "transaction_history" do
  subject(:history) { TransactionHistory.new }
  let(:mock_transaction1) { double('transaction', date: "06/10/2018", credit: 100, debit: "", balance: 100) }
  let(:mock_transaction2) { double('transaction', date: "07/10/2018", credit: 200, debit: "", balance: 300) }
  let(:mock_transaction3) { double('transaction', date: "08/10/2018", credit: "", debit: 150, balance: 150) }

  describe "#new" do
    it "starts empty history" do
      expect(history.all_transactions).to eq([])
    end
  end

  describe "#record_transaction" do
    it "creates a transaction object" do
      subject.record_transaction(100, "", 100)
      expect(history.all_transactions[0]).to be_instance_of(Transaction)
    end
    it "logs transactions" do
      subject.record_transaction(100, "", 100)
      expect(history.all_transactions).to have_attributes(length: 1)
    end
  end

  context "with a deposit transaction of £100" do
    describe "#show_statement" do
      it "displays a header" do
        expect { history.show_statement }.to output("date || credit || debit || balance \n").to_stdout
      end
      it "displays a single transaction" do
        history.all_transactions << mock_transaction1

        expect { history.show_statement }.to output("date || credit || debit || balance \n06/10/2018 || 100.00 ||  || 100.00\n").to_stdout
      end
      it "displays multiple transactions" do
        history.all_transactions << mock_transaction1
        history.all_transactions << mock_transaction2
        history.all_transactions << mock_transaction3

        expect { history.show_statement }.to output(
        "date || credit || debit || balance \n06/10/2018 || 100.00 ||  || 100.00\n07/10/2018 || 200.00 ||  || 300.00\n08/10/2018 ||  || 150.00 || 150.00\n").to_stdout
      end
    end
  end
end
