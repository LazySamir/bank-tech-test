# Bank tech test
An app that simulates a bank account. Users can deposit, withdraw money to/from an account and print a bank statement.

## How to run

#### Download the test
```
$ git clone git@github.com:LazySamir/bank-test.git
$ cd bank-test
$ bundle
```

### Use the application
1. Open the bank-test directory and run 'irb'

`$ irb`

2. Require the classes

```
$ require "./lib/account.rb"
$ require "./lib/transaction.rb"
$ require "./lib/transaction_history.rb"
```

3. Create an account

`$ account = Account.new`

4. Make deposits and withdrawals

```
$ account.deposit(300)
$ account.withdrawal(200)
```

5. See current balance

`$ account.show_balance`

6. See full statement

`$ account.transaction_history.show_statement`

### Test the application
```
$ cd bank-test
$ rspec
$ rubocop
```

Test coverage is: 100%
All tests are passing

## Specification

### Requirements

* Interactable via a REPL like IRB.
* Handles deposit and withdrawal.
* Handles account statements that prints "date", "amount" and "balance".
* Holds data in memory.

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
### User stories

```
As a user
So I can save money
I want to be able to deposit money into my account

As a user
So I can access money when I need it
I want to be able to withdraw money from my account

As a user
So I can see how much money is in my account
I want to be able to see my balance

As a user
So I can easily see a detailed history of my transactions
I want my statement to show the date, amount and remaining balance from each transaction
```

### Domain model

![Imgur](https://i.imgur.com/C9ahfRr.jpg)

#### Approach
1. Turned spec into user stories

2. Drew out domain model of how I wanted classes and methods to interact

3. Completed first three user stories with in a single class "Account"

4. Class extraction: deposit and withdraw to create Transaction objects.

5. Class extraction: TransactionHistory class to have responsibility for storing and displaying transactions.
  - Initially I stored transactions in the Account class however this did not cohere with SRP.


6. Added edge cases and refactored code as they became apparent.


#### How I would improve the app
1. Deposits and withdrawals only deal with whole integers. Consequently, .00 is added as a string to the end output. I would like them be able to handle pennies.

2. Add a method for Transaction History that allows the user to select the dates or month that they would like to see the statement for.
