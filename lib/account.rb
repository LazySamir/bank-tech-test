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
    raise non_integer_error unless amount.is_a? Integer
    raise non_positive_error unless amount.positive?
  end

  def non_integer_error
    "Non-integer detected: please enter positive integer"
  end

  def non_positive_error
    "Negative integer detected: please enter a positive integer"
  end
end
