# Bank tech test
An app that simulates a bank account. Users can deposit, withdraw money to/from an account and print a bank statement.

## How to run

#### Download the test
```
$ git clone git@github.com:LazySamir/bank-test.git
$ cd bank-test
$ bundle
```

#### Use the application
<!-- add info on how to use application features in IRB -->

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

#### Approach
1. Starting with user story 3: ability to see how much money is in the user's account. This will allow me to more easily create withdrawal and deposit feature tests as the user will be able to run a command to see if the transactions were successful. 
