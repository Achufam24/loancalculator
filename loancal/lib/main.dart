import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loancal/widgets/result.dart';
import 'package:loancal/widgets/input.dart';
import 'package:loancal/pages/first.dart';
import 'package:loancal/pages/second.dart';

void main() => runApp(MaterialApp(
    home: Homepage(),
    routes: {
      //'/' :(context) => Homepage(),
      '/first': (context) => FirstPage(),
      '/second' : (context) => SecondPage(),
    },
    debugShowCheckedModeBanner: false,
  ));


  class Homepage extends StatefulWidget {
    const Homepage({Key? key}) : super(key: key);



    @override
    State<Homepage> createState() => _HomepageState();
  }

  class _HomepageState extends State<Homepage> {

    TextEditingController _controller1 = new TextEditingController();
    TextEditingController _controller2 = new TextEditingController();
    TextEditingController _controller3 = new TextEditingController();
    String? selected;
    double? totalInterest;
    double? monthlyInterest;
    double? monthlyInstallment;

    void loancalculation() {
      final amount = int.parse(_controller1.text) -
          int.parse(_controller2.text);
      final tInterest = amount * (double.parse(_controller3.text) / 100) *
          int.parse(selected!);
      final minterest = tInterest / (int.parse(selected!) * 12);
      final minstall = (amount + tInterest) / (int.parse(selected!) * 12);
      setState(() {
        totalInterest = tInterest;
        monthlyInterest = minterest;
        monthlyInstallment = minstall;
      });
    }

    //localization of currency
    void currency() {
      Locale locale = Localizations.localeOf(context);
      var format = NumberFormat.simpleCurrency(locale: locale.toString());
      print("Currency symbol ${format.currencySymbol}");
      print("Currency symbol ${format.currencyName}");
    }

    void _showSettingsPanel() {
      showModalBottomSheet(
        //isDismissible: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          context: (context),
          builder: (context) {
            return Container(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Result',
                      style: GoogleFonts.robotoMono(fontSize: 20),
                    ),
                    SizedBox(
                        height: 15
                    ),
                    result(
                        'Total Interest',
                        totalInterest
                    ),
                    result(
                        'Monthly Interest',
                        monthlyInterest
                    ),
                    result(
                        'Monthly Installment',
                        monthlyInstallment
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        currency();
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(child: Text('Re-Calculate',
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.notes,
              size: 30,
              color: Colors.white,
            ),
            toolbarHeight: 30,
            backgroundColor: Colors.indigo.shade700,
            elevation: 0,
            bottomOpacity: 0,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.info,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              PopupMenuButton(
                 icon: Icon(Icons.person),
                  onSelected: (value) {
                    if (value == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    }else if(value == 1){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstPage()),
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("First"),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text("Second"),
                      value: 1,
                    )
                  ]
              )
            ],
          ),
          body: ListView(
            children: [
              body(),
            ],
          )
      );
    }

    Widget body() {
      return Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.indigo.shade700,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Klump Loan',
                        style: GoogleFonts.robotoMono(
                            fontSize: 35, color: Colors.white),
                      ),
                      Text('Calculator',
                        style: GoogleFonts.robotoMono(
                            fontSize: 35, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 40, 0),
              child: Column(
                children: [
                  //inputForm(title:"Car Price", hintText:"e.g 90000"),
                  inputForm("Item Amount", "e.g 90000", _controller1),
                  inputForm("Down Payment", "e.g 9000", _controller2),
                  inputForm("Interest Payment", "e.g 3.5%", _controller3),
                  Text(
                    'Loan Period',
                    style: GoogleFonts.robotoMono(fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      loanPeriod('1'),
                      loanPeriod('2'),
                      loanPeriod('3'),
                      loanPeriod('4'),
                      loanPeriod('5'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      loanPeriod('6'),
                      loanPeriod('7'),
                      loanPeriod('8'),
                      loanPeriod('9'),
                      loanPeriod('10'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      loancalculation();
                      //Future.delayed(Duration.zero);
                      _showSettingsPanel();
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade700,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(child: Text('Calculate',
                        style: GoogleFonts.robotoMono(
                            fontSize: 20, color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }


    //Loan Widget
    Widget loanPeriod(String title) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selected = title;
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 20, 0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: title == selected ? Border.all(
                  color: Colors.yellow, width: 2) : null,
              color: Colors.indigo.shade700,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Center(child: Text(title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      );
    }
  }






