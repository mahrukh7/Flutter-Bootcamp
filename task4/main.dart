import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    BmiCal(),
  );
}

class BmiCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: InputPage(),
    );
  }
}

class ReusableCard extends StatelessWidget {
  @override
  ReusableCard({@required this.clor, this.childcard,this.onPress});
  final Color clor;
  final Widget childcard;
  final Function onPress;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childcard,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: clor,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
class MyButton extends StatelessWidget {
  // ignore: non_constant_identifier_names
  MyButton({@required this.icn,@required this.Onpressing});
  final Icon icn;
  // ignore: non_constant_identifier_names
  final Function Onpressing;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onpressing,
      child: CircleAvatar(
          backgroundColor: Colors.white24,
          radius: 27,
          child: icn
      ),
    );
  }
}
class Calculations
{
  int hight;
  int weght;
  // ignore: non_constant_identifier_names
  int Ag;
  double _bmi;
  // ignore: non_constant_identifier_names
  Calculations({this.hight,this.weght,this.Ag});
  // ignore: non_constant_identifier_names
  double Ans() {
    _bmi = ((weght * 2.20462) / pow(hight, 2)) * 703;
    return _bmi;
  }
  String info()
  {
    if(_bmi>=25)
    {
      return 'overweight';
    }
    else if(_bmi>=18.5 && _bmi<25)
    {
      return 'normal';
    }
    else
    {
      return 'lightweight';
    }
  }
  String suggest()
  {
    if(_bmi>=25)
    {
      return 'You Have Body Weight More Than Normal, Eat Less and Try To Exercise More';
    }
    else if(_bmi>=18.5 && _bmi<25)
    {
      return 'You Are A Normal Body Weight, Good Job!';
    }
    else
    {
      return 'You have Body Weight Less Than Normal, Try To Eat More!';
    }
  }
  double givebmi()
  {
    return _bmi;
  }
}

enum Gender { male, female }
int height = 12;
int weight = 45;
int age = 25;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor = kcardcolor;
  Color femalecardcolor = kinactive;
  Gender selectedgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(children: [
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedgender = Gender.male;
                  });
                },
                clor: selectedgender == Gender.male ? kcardcolor : kinactive,
                childcard: TwoContents(
                  iecon: kmalegender,
                  gender: Text(
                    'Male',
                    style: kstylo,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedgender = Gender.female;
                  });
                },
                clor: selectedgender == Gender.female ? kcardcolor : kinactive,
                childcard: TwoContents(
                  iecon: kfemalegender,
                  gender: Text(
                    'Female',
                    style: kstylo,
                  ),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          child: ReusableCard(
            clor: kcardcolor,
            childcard: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: kstylo,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kbigstylo),
                      Text(
                        'inch',
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
                Slider(
                  activeColor: kbotomcardcolor,
                  inactiveColor: Colors.white70,
                  value: height.toDouble(),
                  min: 12.0,
                  max: 120.0,
                  onChanged: (double newvalue) {
                    setState(() {
                      height = newvalue.round();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(children: [
            Expanded(
              child: ReusableCard(
                clor: kcardcolor,
                childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: kstylo,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kbigstylo,
                          ),
                          Text(
                            'kg',
                            style: TextStyle(fontSize: 15),
                          ),
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      MyButton(
                        icn: Icon(
                          Icons.remove,
                          size: 35,
                          color: Colors.white70,
                        ),
                        Onpressing: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      MyButton(
                        icn: Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.white70,
                        ),
                        Onpressing: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                clor: kcardcolor,
                childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: kstylo,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: kbigstylo,
                          ),
                          Text(
                            'yr',
                            style: TextStyle(fontSize: 15),
                          ),
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      MyButton(
                        icn: Icon(
                          Icons.remove,
                          size: 35,
                          color: Colors.white70,
                        ),
                        Onpressing: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      MyButton(
                        icn: Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.white70,
                        ),
                        Onpressing: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ]),
        ),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(bottom: 15),
            color: kbotomcardcolor,
            width: double.infinity,
            height: kbotomcardheight,
            margin: EdgeInsets.only(top: 8),
            child: Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          onTap: ()
          {
            Calculations calc= Calculations(hight: height,weght: weight,Ag: age);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> OutputPager(
              Bmi: calc.Ans(),Info:calc.info(),Suggest:calc.suggest(),
            )));
          },
        ),
      ]),
    );
  }
}
const kcardcolor = Color(0xFF1D1E33);
const kinactive =Colors.black38;
const kbotomcardcolor = Colors.purple;
const double kbotomcardheight = 70;
const Icon kmalegender = Icon(Icons.assignment_ind_outlined, size: 90);
const Icon kfemalegender = Icon(Icons.assignment_ind, size: 90);
const TextStyle kstylo = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
const TextStyle kbigstylo = TextStyle(fontSize: 60, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic);

class OutputPager extends StatelessWidget {
  OutputPager({@required this.Bmi,@required this.Info,@required this.Suggest});
  final double Bmi;
  final String Info;
  final String Suggest;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Center(
          child: Column(children: [
            Text(
              'Your Result',
              style: kbigstylo,
            ),
            Expanded(
              child: ReusableCard(
                clor: kcardcolor,
                childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      Info.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.purple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      Bmi.toStringAsFixed(1),
                      style: kbigstylo,
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.save_alt_rounded,
                      size: 100,
                    ),
                    Text(
                      Suggest,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.purple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 15),
                color: kbotomcardcolor,
                width: double.infinity,
                height: kbotomcardheight,
                margin: EdgeInsets.only(top: 8),
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> InputPage()));
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class TwoContents extends StatelessWidget {
  TwoContents({@required this.iecon, @required this.gender});
  final Icon iecon;
  final Text gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iecon,
        SizedBox(
          height: 10,
        ),
        gender,
      ],
    );
  }
}
