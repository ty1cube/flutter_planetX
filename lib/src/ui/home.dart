import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int radiovalue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  final TextEditingController _weightController = new TextEditingController();

  void handleradiovaluechanged(int value){
    setState(() {

     radiovalue=value;

     switch (radiovalue) {
       case 0:
        _finalResult = calculateWeight(_weightController.text,  0.06);
        _formattedText = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
        break;
       
       case 1:
          _finalResult = calculateWeight(_weightController.text,  0.38);
          _formattedText = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
        break;

        case 2:
          _finalResult = calculateWeight(_weightController.text,  0.91);
          _formattedText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;

        case 3:
          _finalResult = calculateWeight(_weightController.text,  2.34);
          _formattedText = "Your weight on Jupyter is ${_finalResult.toStringAsFixed(1)}";
          break;

          default:
           print("Nothing selected!");
             } 
            });
          }
        
        
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: new AppBar(
                title: Text("Weight on Planet X"),
                centerTitle: true,
                backgroundColor: Colors.black38,
              ),
        
              backgroundColor: Colors.blueGrey,
        
              body: new Container(
                alignment: Alignment.topCenter,
                child: new ListView(
                  padding: const EdgeInsets.all(3.0),
                  children: <Widget>[
                    new Image.asset('assets/images/planet.png',
                    height: 140.0,
                    width: 200.0,
                    ),
        
                    new Container(
                      margin: EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      child: new Column(
                        children: <Widget>[
        
                          TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Your weight on Earth",
                              hintText: 'In Kilogram',
                              icon: Icon(Icons.person_outline),
                            ),
                          ),
        
                          Padding(padding: EdgeInsets.all(5.0),),
        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio<int>(
                                activeColor: Colors.orange,
                                value: 0, groupValue: radiovalue, onChanged: handleradiovaluechanged),
        
                                Text("Pluto",
                                style: TextStyle(color: Colors.white),),
        
                              Radio<int>(
                                activeColor: Colors.green,
                                value: 1, groupValue: radiovalue, onChanged: handleradiovaluechanged),
                                Text("Mars",
                                style: TextStyle(color: Colors.white),),
        
        
                              Radio<int>(
                                activeColor: Colors.amberAccent,
                                value: 2, groupValue: radiovalue, onChanged: handleradiovaluechanged),
                                 Text("Venus",
                                style: TextStyle(color: Colors.white),),
        
                              Radio<int>(
                                value: 3, groupValue: radiovalue, onChanged: handleradiovaluechanged),
                                 Text("Jupyter",
                                style: TextStyle(color: Colors.white),
                                ),
                            ],
                          ),
        
                          
                          Padding(padding: EdgeInsets.all(6.0),),
        
                          Text(
                            //_weightController.text.isEmpty ? "Please enter your weight":"$_formattedText kg" ,
                            _weightController.text.isEmpty ? "Please enter your weight": _formattedText + " kilogram",
                            // "$_formattedText KG",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),)
                        ],
                      ),
        
                    )
                  ],
                ),
              ),
              
            );
          }
        
          double calculateWeight(String weight, double multiplier) {
                if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
                  return int.parse(weight)* multiplier;
                }
                else{
                    print("Wrong");
                    return int.parse("180") * 0.36;
                }
          }
}