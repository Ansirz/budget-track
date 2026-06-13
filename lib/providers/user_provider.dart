import 'package:flutter_riverpod/legacy.dart';

final transactionProvider = StateProvider<String?>((ref){
  return null;
});
final currentBalanceProvider= StateProvider((ref){
  return 0;
});