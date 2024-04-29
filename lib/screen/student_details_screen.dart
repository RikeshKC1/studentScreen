import 'dart:ffi';

import 'package:app/model/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'dart:math';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  String ? _firstName;
  String ? _lastName;
  String ? _address;
  Random random = Random();

  List<Student> _students = [];
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Student Details Screen"),
     ),
      body:  SingleChildScrollView(
        child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
               children: [
                 SizedBox(height: 10,),
                 TextFormField(
                   decoration: InputDecoration(
                     labelText: "firstName",
                     border: OutlineInputBorder(),
          
                   ),
                   validator: (value){
                       if(value!.isEmpty){
                         return "firstName required.";
                       }
                       return null;
                   },
                   onChanged: (value){
                     setState(() {
                       _firstName=value!;
                     });
                   },
          
                 ),
                 SizedBox( height:10,),
                 TextFormField(
                   decoration: InputDecoration(
                       labelText: "lastName",
                       border: OutlineInputBorder()
                   ),
                   validator: (value){
                     if(value!.isEmpty){
                       return "lastName required";
                     }
                     return null;
                   },
                   onChanged: (value){
                     setState(() {
                       _lastName=value!;
                     });
                   },
          
                 ),
                 SizedBox(height: 10,),
                 TextFormField(
                   decoration: InputDecoration(
                       labelText: "address",
                       border: OutlineInputBorder()
                   ),
                   validator: (value){
                     if(value!.isEmpty){
                       return "address required.";
                     }
                     return null;
                   },
                   onChanged: (value){
                    setState(() {
                      _address=value!;
                    });
                   },
          
                 ),
                 SizedBox(height: 10,),
                 SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){
                   if(formkey.currentState!.validate()) {
                     setState(() {
                       Student student=new Student(id: (100+random.nextInt(900)).toString(), firstName: _firstName!, lastName: _lastName!, address: _address!);
                       _students.add(student);
                     });
                   }
                 }, child: Text("Add Student",style: TextStyle(fontSize: 20),))),
                 SizedBox(height: 8,),
                 Text("Student Details", style: TextStyle(fontSize: 20,color: Colors.blueAccent),),
                 SizedBox(height: 8,),
                 Container(
                     decoration: BoxDecoration(
                       // color: Colors.green[50],
                       // border: Border.all(color: Colors.black),
                       borderRadius: BorderRadius.circular(8.0),
                     ),
                     child: Column(
                       children: [
                         for(Student stu in _students)...{
                           Container(
                             decoration: BoxDecoration(
                               border: Border.all(color: Colors.grey),
                               color: Colors.green[50],
                             ),
                             child:ListTile(

                             leading: ClipRRect(child: Text("${stu.id}",style: TextStyle(fontSize: 18,color: Colors.pink),)),
                             title: Text("${stu.firstName} ${stu.lastName}",style: TextStyle(fontSize: 18,color: Colors.black87),),
                             subtitle: Text("${stu.address}",style: TextStyle(color: Colors.brown),),
                             trailing: IconButton(icon: Icon(Icons.delete),onPressed: (){},color: Colors.red,),
                           ),
                           ),
                           SizedBox(height: 5,),
                         }
        
                       ],
                     ),
                           
                   ),
                 
               ],
              ),
            ),
          ),
      ),


    );
  }
}
