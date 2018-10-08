class Account

attr_reader :balance

  def initialize
    @balance = 0
  end

  def show_balance
    "You have £#{@balance} in your account"
  end

  def deposit(amount, date)
    @balance += amount
    Transaction.new(date, amount, "", @balance)
  end

  def withdraw(amount, date)
    @balance -= amount
    Transaction.new(date, "", amount, @balance)
  end

end
