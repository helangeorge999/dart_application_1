// 1️⃣ Abstract Base Class
abstract class BankAccount {
  String _accountNumber;
  String _accountHolderName;
  double _balance;

  // Constructor
  BankAccount(this._accountNumber, this._accountHolderName, this._balance);

  // Getters and Setters (Encapsulation)
  String get accountNumber => _accountNumber;
  String get accountHolderName => _accountHolderName;
  double get balance => _balance;

  set balance(double amount) {
    if (amount >= 0) {
      _balance = amount;
    } else {
      print("Invalid balance amount!");
    }
  }

  // Abstract methods
  void deposit(double amount);
  void withdraw(double amount);

  // Common method to display info
  void displayInfo() {
    print("\nAccount Number: $_accountNumber");
    print("Holder Name: $_accountHolderName");
    print("Balance: \$${_balance.toStringAsFixed(2)}");
  }
}

// 2️⃣ Interface for Interest-Bearing Accounts
abstract class InterestBearing {
  void calculateInterest();
}

// 3️⃣ SavingsAccount class
class SavingsAccount extends BankAccount implements InterestBearing {
  static const double minBalance = 500.0;
  static const double interestRate = 0.02;
  static const int withdrawalLimit = 3;

  int _withdrawalCount = 0;

  SavingsAccount(String number, String holder, double balance)
    : super(number, holder, balance);

  @override
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposited \$${amount.toStringAsFixed(2)} successfully.");
    } else {
      print("Invalid deposit amount.");
    }
  }

  @override
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdrawal amount.");
      return;
    }
    if (_withdrawalCount >= withdrawalLimit) {
      print("Withdrawal limit of $withdrawalLimit reached for this month.");
      return;
    }
    if (balance - amount < minBalance) {
      print(
        "Cannot withdraw: Minimum balance of \$${minBalance.toStringAsFixed(2)} required.",
      );
      return;
    }

    balance -= amount;
    _withdrawalCount++;
    print("Withdrew \$${amount.toStringAsFixed(2)} successfully.");
  }

  @override
  void calculateInterest() {
    double interest = balance * interestRate;
    balance += interest;
    print("Interest added: \$${interest.toStringAsFixed(2)}");
  }
}

// 4️⃣ CheckingAccount class
class CheckingAccount extends BankAccount {
  static const double overdraftFee = 35.0;

  CheckingAccount(String number, String holder, double balance)
    : super(number, holder, balance);

  @override
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposited \$${amount.toStringAsFixed(2)} successfully.");
    }
  }

  @override
  void withdraw(double amount) {
    balance -= amount;
    if (balance < 0) {
      balance -= overdraftFee;
      print("Overdraft fee of \$${overdraftFee.toStringAsFixed(2)} applied.");
    } else {
      print("Withdrew \$${amount.toStringAsFixed(2)} successfully.");
    }
  }
}

// 5️⃣ PremiumAccount class
class PremiumAccount extends BankAccount implements InterestBearing {
  static const double minBalance = 10000.0;
  static const double interestRate = 0.05;

  PremiumAccount(String number, String holder, double balance)
    : super(number, holder, balance);

  @override
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposited \$${amount.toStringAsFixed(2)} successfully.");
    }
  }

  @override
  void withdraw(double amount) {
    if (balance - amount < minBalance) {
      print(
        "Cannot withdraw: Minimum balance of \$${minBalance.toStringAsFixed(2)} required.",
      );
    } else {
      balance -= amount;
      print("Withdrew \$${amount.toStringAsFixed(2)} successfully.");
    }
  }

  @override
  void calculateInterest() {
    double interest = balance * interestRate;
    balance += interest;
    print("Interest added: \$${interest.toStringAsFixed(2)}");
  }
}

// 6️⃣ Bank class
class Bank {
  List<BankAccount> _accounts = [];

  void createAccount(BankAccount account) {
    _accounts.add(account);
    print("Account created successfully for ${account.accountHolderName}!");
  }

  BankAccount? findAccount(String accountNumber) {
    for (var acc in _accounts) {
      if (acc.accountNumber == accountNumber) return acc;
    }
    print("Account not found.");
    return null;
  }

  void transfer(String fromAcc, String toAcc, double amount) {
    BankAccount? sender = findAccount(fromAcc);
    BankAccount? receiver = findAccount(toAcc);

    if (sender == null || receiver == null) return;
    if (sender.balance < amount) {
      print("Transfer failed: Insufficient balance.");
      return;
    }

    sender.withdraw(amount);
    receiver.deposit(amount);
    print(
      "Transferred \$${amount.toStringAsFixed(2)} from ${sender.accountHolderName} to ${receiver.accountHolderName}.",
    );
  }

  void generateReport() {
    print("\n====== Bank Account Report ======");
    for (var acc in _accounts) {
      acc.displayInfo();
    }
    print("=================================");
  }
}

// 7️⃣ Main method to test everything
void main() {
  Bank bank = Bank();

  var acc1 = SavingsAccount("BA74788", "AAYUSH", 9000);
  var acc2 = CheckingAccount("HH43474", "SAGAR", 19000);
  var acc3 = PremiumAccount("S247626", "AAYAM", 5000);

  bank.createAccount(acc1);
  bank.createAccount(acc2);
  bank.createAccount(acc3);

  acc1.deposit(200);
  acc1.withdraw(100);
  acc1.calculateInterest();

  acc2.withdraw(400);
  acc3.withdraw(2000);
  acc3.calculateInterest();

  bank.transfer("P001", "S001", 500);

  bank.generateReport();
}
