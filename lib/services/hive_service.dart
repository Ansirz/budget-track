//import 'package:expense_tracker/controllers/text_controllers.dart';
import 'package:expense_tracker/hive_boxes/expenses.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future<void> upload(String name, int amount)async{
     final box = await Hive.openBox(expenses);
 
     box.put(name, amount);

  }
 int? getValue(String name){
  final box = Hive.box(expenses);
  return box.get(name) as int?;
  }
  
  Future<void>  delete(String name)async{
    final box = await Hive.openBox(expenses);
    box.delete(name);
  }
  Future<void> uploadBalance(int amount) async{
    final box = Hive.box(balance);
    box.put("userBalance", amount);
  }
  Future<void> uploadName(String name)async {
    final box = Hive.box(userName);
    box.put("Name", name);
  }
  String getUserName() {
    final box =  Hive.box(userName);
    return box.get("Name") as String;  
  }
   int getuserBalance() {
    final box = Hive.box(balance);
    return box.get("userBalance") as int;
  }
  void updateBalance(int value){
    final box = Hive.box(balance);
    int currentValue = box.get("userBalance");
    currentValue += value;
    box.put("userBalance", currentValue);
  
  }
}
