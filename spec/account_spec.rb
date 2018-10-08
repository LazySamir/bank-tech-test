require "./lib/account.rb"

describe "account" do

  before(:each) do
    @account = Account.new
  end
  describe "#new" do
    it "starts with an empty balance" do
      expect(@account.balance).to eq(0)
    end
  end
  describe "#show_balance" do
    it "shows current balance message" do
      expect(@account.show_balance).to eq("You have £0 in your account")
    end
  end
  describe "#deposit" do
    it "increases balance" do
      @account.deposit(100, "06/10/2018")

      expect(@account.balance).to eq(100)
    end
  end
  describe "#withdraw" do
    it "decreases balance" do
      @account.deposit(100, "06/10/2018")
      @account.withdraw(50, "06/10/2018")

      expect(@account.balance).to eq(50)
    end
  end
end
