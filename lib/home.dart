import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage=0;
  int _personCounter=1;
  double _billAmount=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: new Text("Tip Calculator",style: TextStyle(color:Colors.black,)),backgroundColor: Colors.yellow,centerTitle: true,
    ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
        alignment: Alignment.topCenter,
        color:Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children: <Widget>[
            Container(
              height: 100,width: 100,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(12)

              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total per Person",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20
                    ),),
                    Text("${(_billAmount+(_billAmount*_tipPercentage/100))/_personCounter}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 30))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10),
              padding: EdgeInsets.all(12),
              height: 300,width: 100,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(15)

              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(hintText: "Bill",
                     // prefixText: "bill amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged:(String value){
                      try{

                        _billAmount = double.parse(value);
                      }
                      catch(exception){
                        _billAmount=0.0;
                      }
                    } ,
                  ),
                  Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Split",style:TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17
                      ),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(_personCounter>1){
                                  _personCounter--;
                                }else{//nothing
                                }
                              });
                            },
                            child: Container(
                              height: 40,width: 40,margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.purpleAccent.withOpacity(0.1)
                              ),
                              child: Center(
                                child: Text(
                                  "-",style: TextStyle(
                                    color: Colors.black,
                                fontSize: 32),),
                              ),
                            ),
                          ),
                          Text("$_personCounter",style: TextStyle(color: Colors.black,fontSize:20),),
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(_personCounter>=1){
                                  _personCounter++;
                                }else{
                                  //nothing
                                }
                              });
                            },
                            child: Container(
                              height: 40,width: 40,margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.purpleAccent.withOpacity(0.1)
                              ),
                              child: Center(
                                child: Text(
                                  "+",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25),),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Tip",
                        style:TextStyle(
                          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("${_billAmount*_tipPercentage/100}",
                            style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),
                          ),
                      ),

                      //slider



                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage %",style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),),
                      Slider(
                          min: 0,max: 100,
                          activeColor: Colors.black,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newvalue){
                            setState(() {
                              _tipPercentage = newvalue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
            Center(
            child:Text("Made by Ankush",
              style: TextStyle(
                color: Colors.black,
                  fontStyle: FontStyle.italic,fontSize: 20
              ),),),
          ],
        ),
      ),
    );
  }
}
