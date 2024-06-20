import 'package:beer_mart/models/content.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  Bottles data;
   ProductPage({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children:[ Container(

                height: 300,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0)),
                      child: Container(
                        color: Colors.black,
                        height: 250,
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('${data.name}\n\n${data.tagline}',style: TextStyle(color: Colors.white),),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(height: 200,width: 140,
                      color: Colors.grey[350],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network('${data.imageUrl}',height: 30,width: 30,),
                      )),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description\n',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${data.description}\n',style: TextStyle(fontSize: 12),),
                  Text('First Brewed\n',style: TextStyle(fontWeight: FontWeight.bold)),Text('${data.firstBrewed}\n',style: TextStyle(fontSize: 12)),
                  Text('Getting know your beer better\n',style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Container(height: 30,width: 30,color: Colors.black,child: Center(child: Image.network('https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),)),
                        SizedBox(width: 5.0,),
                        Text('ABV\n${data.abv}',),
                        SizedBox(width: 100.0,),
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Container(height: 30,width: 30,color: Colors.black,child: Center(child: Image.network('https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),)),
                        SizedBox(width: 5.0,),
                        Text('IBU\n${data.ibu}'),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Container(height: 30,width: 30,color: Colors.black,child: Center(child: Image.network('https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),)),
                        SizedBox(width: 5.0,),
                        Text('Target FG\n${data.targetFg}'),
                        SizedBox(width: 66.0,),
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Container(height: 30,width: 30,color: Colors.black,child: Center(child: Image.network('https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),)),
                        SizedBox(width: 5.0,),
                        Text('Target OG\n${data.targetOg}'),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Container(height: 30,width: 30,color: Colors.black,child: Center(child: Image.network('https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),)),
                        SizedBox(width: 5.0,),
                        Text('EBC\n${data.ebc}'),
                        SizedBox(width: 101.0,),
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Container(height: 30,width: 30,color: Colors.black,child: Center(child: Image.network('https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),)),
                        SizedBox(width: 5.0,),
                        Text('SRM\n${data.srm}'),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Container(height: 30,width: 30,color: Colors.black,child: Center(child: Image.network('https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),)),
                        SizedBox(width: 5.0,),
                        Text('PH\n${data.ph}'),
                        SizedBox(width: 107.0,),
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Container(height: 30,width: 30,color: Colors.black,child: Center(child: Image.network('https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),)),
                        SizedBox(width: 5.0,),
                        Text('ATTENUATION\nLEVEL\n${data.attenuationLevel}'),

                      ],
                    ),
                  ),


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
