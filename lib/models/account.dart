class Account {
  final String name;
  final double amount;

  Account({
    this.name,
    this.amount,
  });

  @override
  String toString() {
    return 'Account{name: $name, amount: $amount}';
  }
}
