import 'package:expense_tracker/hive_boxes/expenses.dart';
import 'package:expense_tracker/providers/user_provider.dart';
import 'package:expense_tracker/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
@override
void initState() {
  super.initState();

}
  @override
  Widget build(BuildContext context)  {
    int? expenseTracker;
  final activeBalance = ref.watch(currentBalanceProvider);
    final transactionWatcher = ref.read(transactionProvider);
  
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Navigator.popAndPushNamed(context, "/welcomePage"),
         icon: Icon(Icons.arrow_back)),
      ),
      body:
           
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                       Text(
                        "Hello, ${HiveService().getUserName()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0
                        ),
                        ),
                     
                      SizedBox(height: 24.0,),
                      Text(expenseTracker.toString()),
                    ValueListenableBuilder(
                      valueListenable: Hive.box(expenses).listenable(),
                      builder: (context, box, child) {
                        int? initialValue = HiveService().getuserBalance();
                   //    activeBalance = initialValue;
                          int remainingBalance;
                        for (int i = 0; i < box.length; i++){
                          var value = box.getAt(i);
                          if (value is int){
                         //   ref.read(currentBalanceProvider.notifier).update((state) => state + value);
                              if (transactionWatcher != "Income"){
                                value *=-1;
              
                        
                       }

                          else {
                         value *=1;
                       }
                   
                          }
                       
                        }
               //  HiveService().updateBalance(dynamicBalance);
            
                      
                     
                  
                        return Row(
                          children: [
                            Icon(
                              Icons.currency_yen
                            ),
                           Text(activeBalance.toString())
                          ],
                        );
                      }
                    ),
                      SizedBox(height: 56,),
                      Expanded(child: 
                      ValueListenableBuilder(
                        valueListenable:Hive.box(expenses).listenable() , 
                        builder: (context, box, widget){
                          if (box.isEmpty){
                            return  Center(child: Text("Nothing yet"));
                          }
                        return ListView.builder(
                          itemCount: box.length,
                          itemBuilder: (context, index){
                            final key = box.keyAt(index);
                            final int expense = box.get(key);
                         expenseTracker = expense;
                          return ListTile(
                            title: Text(key),
                            trailing: Text("$expense"),
                          );
                          });
                        })
                         ),
                    ],
                  ),
                ),
                   floatingActionButton: FloatingActionButton(
                    
                    onPressed: ()=> Navigator.popAndPushNamed(context, "/newTransaction"),
                    child: Icon(Icons.add),
                    ),
                   );
              
            
  
        }
    
  }
