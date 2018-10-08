require "./lib/account.rb"

describe "user can see their balance" do
  it "shows balance string" do
    @account = Account.new
    expect(@account.show_balance).to eq("You have £0 in your account")
  end
end
