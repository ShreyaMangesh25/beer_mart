import 'dart:ffi';

import 'package:beer_mart/models/content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPg extends StatefulWidget {
  List<Bottles> data;

   CartPg({super.key,required this.data});

  @override
  State<CartPg> createState() => _CartPgState();
}

class _CartPgState extends State<CartPg> {
  // Data data = Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('CART'),

      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.56),
          physics: ScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children:[ Container(
                        height: 140,
                        width: 200,
                        color: Colors.yellow,
                        child: Center(child: Image(image: NetworkImage('${widget.data[index].imageUrl}'),height: 90,width: 90,)),
                      ),
                        // TextButton(onPressed: () {},style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black26),shape: MaterialStatePropertyAll(BeveledRectangleBorder())),
                        // child: Text('First Brewed:${data[index].firstBrewed}',style: TextStyle(color: Colors.white,fontSize: 10),)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Container(
                              height: 15,
                              width: 110,

                              color: Colors.black87,
                              child: Center(child: Text('First Brewed:${widget.data[index].firstBrewed}',style: TextStyle(color: Colors.white,fontSize: 10),)),
                            ),
                          ),
                        ),

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.data[index].name}',maxLines:1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                          SizedBox(height: 5,),
                          Text('${widget.data[index].description}\n',maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Column(

                                children: [
                                  Text('ABV     IBU',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                  Text('${widget.data[index].abv}       ${widget.data[index].ebc}',style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              Spacer(),
                              IconButton(onPressed: () {
                                widget.data.remove(widget.data[index]);
                                final snackBar = SnackBar(
                                  content: const Text('Removed from cart!'),
                                );
                                setState(() {
                                  Text('${widget.data.length}');
                                });

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }, icon: Icon(Icons.remove_circle)),
                            ],
                          ),

                        ],
                      ),
                    ),


                  ],),),
            );
          },

          shrinkWrap: true,


        ),

      ),
      );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class Cart{
  String name;
  String abv;
  String ibu;
  String firstbrew;
  String image;
  Cart({required this.name,required this.abv,required this.ibu,required this.firstbrew,required this.image});
}
// class Data{
//   List<Map<String, dynamic>> data = [
//     {
//       'image': 'https://images.punkapi.com/v2/keg.png',
//       'name':  'Buzz',
//
//     },
//     {
//       'image': 'https://images.punkapi.com/v2/keg.pn',
//       'name':  'Trashy',
//     }
//   ];
// }