class Account

attr_reader :balance, :transaction_history

  def initialize(history = TransactionHistory.new)
    @transaction_history = history
    @balance = 0
  end

  def show_balance
    "You have £#{balance} in your account"
  end

  def deposit(amount)
    @balance += amount
    transaction_history.record_transaction(amount, "", balance)
  end

  def withdraw(amount)
    raise "Insufficient funds" if balance < amount
    @balance -= amount
    transaction_history.record_transaction("", amount, balance)
  end

end
