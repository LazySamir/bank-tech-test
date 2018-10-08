class Account

attr_reader :balance, :transaction_history

  def initialize(history = TransactionHistory.new)
    @transaction_history = history
    @balance = 0
  end

  def show_balance
    "You have £#{@balance} in your account"
  end

  def deposit(amount, date)
    @balance += amount
    @transaction_history.all_transactions << Transaction.new(date, amount, "", @balance)
  end

  def withdraw(amount, date)
    @balance -= amount
    @transaction_history.all_transactions << Transaction.new(date, "", amount, @balance)
  end

end
