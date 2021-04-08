# Tech Test: Bank 
![laguage-ruby](https://img.shields.io/badge/Language-ruby%202.6.5-red)
![current-coverage](https://img.shields.io/badge/Current%20coverage-97.87%25-brightgreen)
![status-working](https://img.shields.io/badge/Status-working-green)

- [Tech Test: Bank](#tech-test-bank)
  - [Specifications](#specifications)
    - [Requirements](#requirements)
    - [Acceptance criteria](#acceptance-criteria)
    - [User Stories](#user-stories)
  - [Modelling](#modelling)
    - [Edge cases and questions](#edge-cases-and-questions)
  - [Process](#process)
  - [Difficulties](#difficulties)
  - [How to run](#how-to-run)
    - [Install](#install)
    - [Usage](#usage)
    - [How to test](#how-to-test)
  - [Feedbacks](#feedbacks)

## Specifications

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

* Given a client makes a deposit of 1000 on 10-01-2012
* And a deposit of 2000 on 13-01-2012
* And a withdrawal of 500 on 14-01-2012
* When she prints her bank statement
* Then she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### User Stories

```
As a user
I want to be able to withdraw money from my account  √

As a user
I want to be able to deposit money on my account √

As a user
I want to be able to see the time and date for all transactions √

As a user
I want to be able to see statement for my account with date, amount, balance √

As a user
I want my account data to persist in my computer memory
```

## Modelling 

| Object     | Account          | Notes               |
| ---------- | ---------------- | ------------------- |
| Attributes | @balance         |                     | √
|            | @transactions    |                     | √
| Methods    | #show_balance    | getter              | √
|            | #print_statement | list of transaction | √
|            | #deposit         | create transaction  | √
|            | #withdrawal      | create transaction  | √

| Object     | Transaction              | Notes |
| ---------- | ------------------------ | ----- |
| Attributes | @credit_amount           |       | √
|            | @debit_amount            |       | √
|            | @timestamp               |       | √
|            | @post_tansaction_balance |       | √
| Method     | #print_transaction       | format transaction | √

### Edge cases and questions
* Can the account go into overdraft? How much?
* Is the user ever going to input something else than Intg or Float?
* Is there a maximum amount on the account?

## Process

* Decided to build the program from the inside-out, starting with smallest object, Transaction
* Got blocked by this approach so decided to change tactics and approach it from Account object
* Now that we have a code base I have a clearer idea of potential edge case and refinement needs
* Now that we have a working program, I can go back and see if I can refactor - at the moment every part of the program is accessible
* I was able to extract 4 methods from account: `balance_update`, `store_transaction`, `timestamp` and `statement_header`

## Difficulties

* Use private methods - user should only be able to run `#deposit`, `#withdrawal` and `#print_statement`

I'm finding this difficult, as I can't test private methods... what would be the best way to go here? I found article talking about using the `send` method, but I also found aticles saying: 
> There is a mantra in software engineering that says you should not write test coverage for private methods (or functions).

* I would like to not have that many attr_readers but the raises the same problem as the above...

## How to run

### Install
```
$ git clone git@github.com:sandyMax974/bank_tech_test.git
$ cd bank_tech_test
$ bundle install
$ pry
[1] pry(main)> require './lib/account.rb'
```

### Usage
```
# Creates a new account
[1] pry(main)> my_account = Account.new

# Deposit an amount onto the account (take float or integer)
[2] pry(main)> my_account.deposit(1489.50)

# Withdraw an amount from the account (take float or integer)
[3] pry(main)> my_account.withdrawal(50.00)

# Print an account statement containing all transaction for the current session 
[4] pry(main)> my_account.print_statement

date || credit || debit || balance
07-04-2021||1489.50|| ||1489.50
07-04-2021|| ||50.00||1439.50

# Check the current account balance (not requested)
[5] pry(main)> my_account.current_balance
=> 1439.5
```

![programm](https://github.com/sandyMax974/bank_tech_test/blob/main/images/Screenshot%202021-04-07%20at%2014.56.28.png)

### How to test
```
$ cd bank_tech_test
$ bundle install
$ rspec
```

## Feedbacks

> We define an accessor function called current_balance, but we already have an attr_reader for @balance, this function is redundant
* I've decided to keep the accessor function and remove the attr_reader - **would that be a better choice?**

> We store a non empty string in our transaction. Is there another value we could set this to to be more clear?
* I've amended `deposit` and `withdrawal` to pass nil if there was no value, which definitely makes more sense

> We are actually changing the value of debit and credit when we print that transaction
* I've changed `debit_formatting` and `credit_formatting` to create a new variable to print, that way I don't have to mess around with the actual credit/debit value

> Balance is simply a sum of all deposits and transactions. Is there a way we can surface the balance when needed without explicitly keeping track of it?
* I've removed the @balance attribute and created function that iterate through all existing transactions and calculate the current account balance

> When you look at the acceptance criteria, how do you think you could change your output to look more like that? Is there a way we could find the lengths of dates and currencies and use that to format the table?