class Account

attr_accessor :balance

  def initialize
    @balance = 0
  end

  def show_balance
    "You have £#{@balance} in your account"
  end

  def deposit(amount)
    @balance += amount
  end
end
