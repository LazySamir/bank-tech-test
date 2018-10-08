require "./lib/account.rb"

describe "user can make deposits" do
  it "increases balance" do
    @account = Account.new
    @account.deposit(100)
    expect(@account.show_balance).to eq("You have £100 in your account")
  end
end
