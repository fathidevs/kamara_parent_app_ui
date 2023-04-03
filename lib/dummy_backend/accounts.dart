import 'package:jiffy/jiffy.dart';
import 'package:kamara_parent_app_ui/dummy_backend/models/accounts_model.dart';
import 'package:kamara_parent_app_ui/dummy_backend/students.dart';

class Accounts {
  final int id;
  const Accounts({
    required this.id,
  });

  static const double _tuitionFee = 250.0;

  static final String _currentMonth = Jiffy(DateTime.now()).MMM.toLowerCase();

  double _totalRequiredTuitionFee() => _tuitionFee * DateTime.now().month;

  double _totalPaidTuitionFees() => Students(id: id)
      .account(_tuitionFee)
      .entries
      .map((e) => e.value)
      .reduce((value, element) => value + element);

  double _balance() {
    return _totalRequiredTuitionFee() - _totalPaidTuitionFees();
  }

  // current month statement
  AccountsModel currentMonth() => AccountsModel(
      month: _currentMonth,
      due: _tuitionFee,
      paid: _totalPaidTuitionFees(),
      balance: _balance());

  // Jan to current month statements
  List<AccountsModel> overview() {
    Map<String, double> payments = Students(id: id).account(_tuitionFee);

    return List.generate(DateTime.now().month, (index) {
      String month = Jiffy(index + 1).MMM.toLowerCase();
      return AccountsModel(
        month: month,
        due: _tuitionFee,
        paid: payments[month]!,
        balance: _tuitionFee - payments[month]!,
      );
    });
  }

  // underpaid warning
  bool underpaid() => _totalPaidTuitionFees() < _totalRequiredTuitionFee();
  double requiredPayment() =>
      _totalRequiredTuitionFee() - _totalPaidTuitionFees();
}
