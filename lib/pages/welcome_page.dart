import 'package:expense_tracker/controllers/text_controllers.dart';
import 'package:expense_tracker/custom_models/input_field.dart';
import 'package:expense_tracker/services/hive_service.dart';
import 'package:flutter/material.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void dispose() {
    userController.dispose();
    userFundsController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/money_2.jpg"),
          fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Stellar",
                style: TextStyle(
                  fontSize: 32.0,
                   color: Colors.white,
                   fontWeight: FontWeight.w500,
                   letterSpacing: 1.5
                   ),
                
                ),
                SizedBox(height: 48.0,),
                InputField(label: "Name", suffixIcon: Icon(null),
                keyboardType: TextInputType.name,
                 controller: userController,),
                SizedBox(height: 16.0,),
                
                InputField(label: "Current Funds",
                controller: userFundsController,
                keyboardType: TextInputType.number,
                 suffixIcon: Icon(Icons.currency_yen, 
                  color: Colors.white,),),
                SizedBox(height: 16.0,),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.all(16.0)
                    ),
                    onPressed: () async{
                  await  HiveService().uploadName(userController.text.trim());
                   await HiveService().uploadBalance(int.tryParse(userFundsController.text)?? 0 );
                    Navigator.popAndPushNamed(context, "/homePage");
                    setState(() {
                      
                    });
                  }, child: Text("Submit", style: TextStyle(color: Colors.white),)),
                )


            ],
          ),
        ),
      ),
    );
  }
}