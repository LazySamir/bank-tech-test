class TransactionHistory

attr_reader :all_transactions

  def initialize
    @all_transactions = []
  end

  def show_statement
    statement = header
    all_transactions.each do |trans|
      statement += "#{trans.date} || #{trans.credit}.00 || #{trans.debit} || #{trans.balance}.00\n" if trans.debit == ""
      statement += "#{trans.date} || #{trans.credit} || #{trans.debit}.00 || #{trans.balance}.00\n" if trans.credit == ""
    end
    statement
  end

  private

  def header
    "date || credit || debit || balance \n"
  end

end
