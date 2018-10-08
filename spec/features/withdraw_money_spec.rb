require "./lib/account.rb"

describe "user can withdraw money" do
  it "decreases balance" do
    @account = Account.new
    @account.deposit(100, "06/10/2018")
    @account.withdraw(50, "06/10/2018")
    
    expect(@account.show_balance).to eq("You have £50 in your account")
  end
end
