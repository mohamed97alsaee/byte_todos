



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}








class _MyHomePageState extends State<MyHomePage> {


List tasks = [
  {'title' : 'Todo App',
   'subtitle': "Hello this is subtitle !",
   'isDone' : false},
  {'title' : 'Todo App', 'subtitle': "Hello this is subtitle !" ,'isDone' : false},
  {'title' : 'Todo App', 'subtitle': "Hello this is subtitle !" ,'isDone' : false},
  {'title' : 'Todo App', 'subtitle': "Hello this is subtitle !" ,'isDone' : false},
  {'title' : 'Todo App', 'subtitle': "Hello this is subtitle !" ,'isDone' : false},
  {'title' : 'Todo App', 'subtitle': "Hello this is subtitle !" ,'isDone' : false},
  {'title' : 'Todo App', 'subtitle': "Hello this is subtitle !" ,'isDone' : false},


];

@override
  void initState() {
if (kDebugMode) {
  print('HELLO FROM HOME INIT')   ;
} super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:
  DefaultTabController(
    length: 2,
    child: Column(
      children: [
        const TabBar(
        labelColor: Colors.black,
        tabs:  [
          Tab(
            text: 'Waiting',
            
          ),
           Tab(
            text: 'Done',
            
          ),
        ]
        
      
        ),
  
  Expanded(child: TabBarView(children:  [       ListView.builder(
        itemCount:  tasks.length,
        shrinkWrap: true,
  
         itemBuilder: (context , index){
        return ListTile(
        title: Text(tasks[index]['title'] , ),
        subtitle:  Text(tasks[index]['subtitle'] , style:  TextStyle( color: Colors.black38 , decoration: tasks[index]['isDone']  ? TextDecoration.lineThrough : TextDecoration.none ), ),
        trailing: Checkbox(value: tasks[index]['isDone'] ,
        onChanged: (value){
   setState(() {
        tasks[index]['isDone'] = !tasks[index]['isDone']  ;
        });
        }, ),);
  
         },
         ),
     const Center(child: Text('DONE'),)] ))
    ],


    ),

  
  )
    );
  }
}
