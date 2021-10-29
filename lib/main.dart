import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/pantalla1': (context) => pantalla1()
      },
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
            itemCount: 200,
            itemBuilder: (context,index){
              return
                ListTile(
                  title: Text("$index", textAlign: TextAlign.center,style:  TextStyle(fontSize: 30),),
                  onTap: ()=>{
                    Navigator.pushNamed(context, '/pantalla1',arguments: index)
                  },
                );
            },
            separatorBuilder: (context,index){
                return const Divider(
                    height: 1,
                    thickness: 3,
                    color: Colors.green);
            }

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class pantalla1 extends StatefulWidget {


  @override
  _pantalla1State createState() => _pantalla1State();
}

class _pantalla1State extends State<pantalla1> {
  @override
  Widget build(BuildContext context) {
    int number=ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(

        title: Text("Pantalla 1"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("$number", style:  const TextStyle(fontSize: 100),),
            TextButton(onPressed: () {Navigator.pop(context);},
              child: const Text("Ir inicio", style:  TextStyle(fontSize: 60),),
            ),

          ],
        ),
      ),
    );
  }
}

