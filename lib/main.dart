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
      onGenerateRoute:(settings) {

        var uri = Uri.parse(settings.name ??'/');//si es nulo asigna la por defecto
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'navegate') {

          var index = int.parse(uri.pathSegments[1]);

          if(index % 2==0){//pantalla 1
            return MaterialPageRoute(builder: (context) => pantalla1(id: index,));

          }else{//pantalla2
            return MaterialPageRoute(builder: (context) => pantalla2(id: index,));
          }

        }
        return MaterialPageRoute(builder: (context) => const MyHomePage(title: ''));

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
                    Navigator.pushNamed(context, '/navegate/$index',arguments: index)
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
  int id;

  pantalla1({
    required this.id,
  });
  @override
  _pantalla1State createState() => _pantalla1State( id: this.id);
}

class _pantalla1State extends State<pantalla1> {
  int id;
  _pantalla1State({
    required this.id
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Pantalla 1"),
      ),
      body: Container(
        color: Colors.orange,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$id", style:  const TextStyle(fontSize: 100),),
              TextButton(onPressed: () {Navigator.pop(context);},
                child: const Text("Ir inicio", style:  TextStyle(fontSize: 60),),
              ),

            ],
          ),
        ]),
      ),
    );
  }
}


class pantalla2 extends StatefulWidget {
  int id;
  pantalla2({
    required this.id
  });

  @override
  _pantalla2State createState() => _pantalla2State(id: this.id);
}

class _pantalla2State extends State<pantalla2> {
  int id;
  _pantalla2State({
    required this.id
  });
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Pantalla 2"),
      ),
      body: Container(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("$id", style:  const TextStyle(fontSize: 100),),
              TextButton(onPressed: () {Navigator.pop(context);},
                child: const Text("Ir inicio", style:  TextStyle(fontSize: 60),),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
