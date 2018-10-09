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
    error_if_invalid(amount)
    @balance += amount
    transaction_history.record_transaction(amount, "", balance)
  end

  def withdraw(amount)
    error_if_invalid(amount)
    raise "Insufficient funds" if balance < amount

    @balance -= amount
    transaction_history.record_transaction("", amount, balance)
  end

  private

  def error_if_invalid(amount)
    raise "Non-integer detected: please enter positive integer" unless amount.is_a? Integer
    raise "Negative integer detected: please enter a positive integer" unless amount.positive?
  end

end
