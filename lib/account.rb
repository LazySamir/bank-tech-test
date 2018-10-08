require "./lib/account.rb"

describe "#show_balance" do

  before :each do
    account = Account.new
  end

  it "shows balance string when account is empty" do
    expect(account.balance).to eq("You have £0 in your account")
  end
  it "shows balance corrent balance string when money has been deposited" do
    account.balance += 100
    expect(account.balance).to eq("You have £100 in your account")
  end
end
