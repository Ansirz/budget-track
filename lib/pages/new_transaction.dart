import 'package:expense_tracker/controllers/text_controllers.dart';
import 'package:expense_tracker/providers/user_provider.dart';
import 'package:expense_tracker/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class NewTransaction extends ConsumerStatefulWidget {
  const NewTransaction({super.key});

  @override
  ConsumerState<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends ConsumerState<NewTransaction> {
  @override
  void initState() {
   nameController.text = "";
   priceController.text = "";
    super.initState();
  }
  // @override
  // void dispose() {
  //  nameController.dispose();
  //  priceController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    List<String> transactionType = ["Income", "Expense"];
    String? selectedTransaction = ref.watch(transactionProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Navigator.popAndPushNamed(context, "/homePage"), icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: nameController,
                  )),
                SizedBox(height: 16,),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                  )),
                  SizedBox(height: 16,),
                  ElevatedButton(
                    onPressed: (){ HiveService().upload(nameController.text.trim(), int.tryParse(priceController.text) ?? 0);
                    
                    },
                     child: Text("Upload")),
              SizedBox(height: 16,),
              DropdownButtonFormField(
            initialValue: selectedTransaction,
            hint: Text(
              "Select the transacttion type:"
            ),
              items: transactionType.map(
                (String transactionType){
                  return DropdownMenuItem(
                    value: transactionType,
                    child: Text(transactionType));
                }
              ).toList(),
               onChanged: (String? newValue){
                setState(() {
                 ref.read(transactionProvider.notifier).state = newValue;
                });
               })
      ])));
  }
}