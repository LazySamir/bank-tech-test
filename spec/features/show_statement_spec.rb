require "./lib/account.rb"
require "./lib/transaction.rb"
require "./lib/transaction_history.rb"

describe "user can see their statement" do
  it "shows a formatted statement" do
    @account = Account.new
    @account.deposit(100)

    expect(@account.transaction_history.show_statement).to eq(
      "date || credit || debit || balance \n#{time_now} || 100.00 ||  || 100.00\n"
    )
  end
end
