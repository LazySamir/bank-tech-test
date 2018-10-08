require "./lib/account.rb"
require "./lib/transaction.rb"
require "./lib/transaction_history.rb"

describe "user can see their statement" do
  it "shows a formatted statement" do
    @account = Account.new
    @account.deposit(100, "06/10/2018")

    expect(@account.transaction_history.show_statement).to eq(
      "date || credit || debit || balance \n06/10/2018 || 100.00 ||  || 100.00\n"
    )
  end
end
