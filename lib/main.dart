import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcnt=TextEditingController();
  var ftcnt=TextEditingController();
  var incnt=TextEditingController();
  var res="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text('BMI')),
      ),
      body:Column(
        children: [ Text('BMI',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w600),),

          TextField(
            controller: wtcnt,
            decoration: InputDecoration(
              label: Text('Enter weight in kg'),
              prefixIcon: Icon(Icons.line_weight),

            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: ftcnt,
            decoration: InputDecoration(
              label: Text('Enter height ft'),
              prefixIcon: Icon(Icons.height),
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: incnt,
            decoration: InputDecoration(
              label: Text('Enter inches'),
              prefixIcon: Icon(Icons.height),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height:20),
          ElevatedButton(onPressed: (){
            var wt=wtcnt.text.toString();
            var ft=ftcnt.text.toString();
            var inn=incnt.text.toString();
            if(wt!=""&&ft!=""&&inn!="")
              {var wt1=int.parse(wt);
              var ft1=int.parse(ft);
              var in1=int.parse(inn);
              double th=(ft1*12.0)+in1;
              th=(th*0.0254);


              double rr=wt1/(th*th);
              setState(() {
                res="Your BMI is ${rr.toStringAsFixed(2)}";
              });

              }
            else
              {setState(() {
                res="Please fill all the required blanks";
              });}


          }, child: Text('Calculate')),

          Text(res,style:TextStyle(fontSize: 15),),



        ],
      )
    );
  }
}
