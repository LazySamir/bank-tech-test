require "./lib/account.rb"

describe "user can see their balance" do
  it "shows balance string" do
    account = Account.new
    expect(account.balance).to eq(0)
  end
end
