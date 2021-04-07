# Tech Test: Bank

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
date       || credit  || debit  || balance
14/01/2012 ||         || 500.00 || 2500.00
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00
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

* use private methods - user should only be able to run `#deposit`, `#withdrawal` and `#print_statement`

I'm finding this diffucult, as I can't test private methods... what would be the best way to go here? I found article talking about using the `send` method, but I also found aticles saying: 
> There is a mantra in software engineering that says you should not write test coverage for private methods (or functions).

