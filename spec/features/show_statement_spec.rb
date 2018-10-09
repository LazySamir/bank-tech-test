require "./lib/account.rb"
require "./lib/transaction.rb"
require "./lib/transaction_history.rb"

describe "user can see their statement" do
  it "shows a formatted statement" do
    allow_any_instance_of(Transaction).to receive(:date).and_return("06/10/2018")

    @account = Account.new
    @account.deposit(100)
    @account.withdraw(50)

    expect { @account.transaction_history.show_statement }.to output("date || credit || debit || balance \n06/10/2018 || 100.00 ||  || 100.00\n06/10/2018 ||  || 50.00 || 50.00\n").to_stdout
  end
end
