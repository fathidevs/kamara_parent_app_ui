import 'package:jiffy/jiffy.dart';
import 'package:kamara_parent_app_ui/dummy_backend/models/accounts_model.dart';

class Accounts {
  final int id;
  const Accounts({
    required this.id,
  });

  static const double _tuitionFee = 250.0;

  static final String _currentMonth = Jiffy(DateTime.now()).MMM.toLowerCase();
  Map<int, Map<String, double>> _buildStatement() {
    return {
      0: {
        "jan": 0,
        "feb": _tuitionFee,
        "mar": 0.00,
        "apr": 0.00,
        "may": 0.00,
        "jun": 0.00,
        "jul": 0.00,
        "aug": 0.00,
        "sep": 0.00,
        "oct": 0.00,
        "nov": 0.00,
        "dec": 0.00,
      },
      1: {
        "jan": _tuitionFee,
        "feb": _tuitionFee,
        "mar": 0.00,
        "apr": 0.00,
        "may": 0.00,
        "jun": 0.00,
        "jul": 0.00,
        "aug": 0.00,
        "sep": 0.00,
        "oct": 0.00,
        "nov": 0.00,
        "dec": 0.00,
      },
      2: {
        "jan": 0.00,
        "feb": 0.00,
        "mar": 0.00,
        "apr": 0.00,
        "may": 0.00,
        "jun": 0.00,
        "jul": 0.00,
        "aug": 0.00,
        "sep": 0.00,
        "oct": 0.00,
        "nov": 0.00,
        "dec": 0.00,
      },
    };
  }

  // tuition fee per month x 12 (a year)
  double _totalRequiredTuitionFee() => _tuitionFee * 12;

  // total tuition fee paid
  double _totalPaidTuitionFees() => _buildStatement()[id]!
      .entries
      .map((e) => e.value)
      .reduce((value, element) => value + element);

  // total tuition fee - paid tuition fee
  double _balance() {
    return _totalRequiredTuitionFee() - _totalPaidTuitionFees();
  }

  // current month statement
  AccountsModel currentMonth() => AccountsModel(
      month: _currentMonth,
      due: _tuitionFee,
      paid: _totalPaidTuitionFees(),
      balance: _balance());

  // account overview
  List<AccountsModel> overview() {
    List<double> payments =
        _buildStatement()[id]!.entries.map((e) => e.value).toList();
    double balance = _totalRequiredTuitionFee();

    return List.generate(
        DateTime.now().month,
        (index) => AccountsModel(
              month: Jiffy(index + 1).MMM.toLowerCase(),
              due: _tuitionFee,
              paid: payments[index],
              balance: balance -= payments[index],
            ));
  }

  // underpaid warning
  bool underpaid() =>
      _totalPaidTuitionFees() < _tuitionFee * DateTime.now().month;
  double requiredPayment() =>
      _tuitionFee * DateTime.now().month - _totalPaidTuitionFees();
}
