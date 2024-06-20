// import 'dart:convert';
import 'package:beer_mart/cart_pg.dart';
import 'package:beer_mart/product_page.dart';
import 'package:flutter/material.dart';
import 'models/content.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart' as badges;
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Bottles>> futureBeer;
  List<Bottles>cart=[];
  void initState() {
    super.initState();
    futureBeer = fetchbeer();
  }
  var good;
// bool quan=false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Bottles>>(
        future: futureBeer,
      builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: Colors.orange,));
          }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {}
          if (snapshot.hasData) {
            var data = snapshot.data as List<Bottles>;

            print(data.length);
            int indexing=0;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,

              ),
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_box_rounded, color: Colors.white,
                            size: 40,),
                          Spacer(),
                          badges.Badge(
                            badgeContent: Text('${cart.length}'),
                            onTap: (){
                              setState(() {
                                Text('${cart.length}');
                              });
                            },
                            child: IconButton(onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                       CartPg(data: cart)));
                              setState(() {
                                Text('${cart.length}');
                              });

                            }, icon: Icon(Icons.shopping_cart_outlined,color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text('Time to Cheers! Choose your beer...',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.56),
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          ProductPage(data: data[index])));
                                },
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
                                      child: Center(child: Image(image: NetworkImage('${data[index].imageUrl}'),height: 90,width: 90,)),
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
                                            child: Center(child: Text('First Brewed:${data[index].firstBrewed}',style: TextStyle(color: Colors.white,fontSize: 10),)),
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
                                        Text('${data[index].name}',maxLines:1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                        SizedBox(height: 5,),
                                        Text('${data[index].description}\n',maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // Column(
                                            //
                                            //   children: [
                                            //     Text('ABV     IBU',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                            //     Text('${data[index].abv}       ${data[index].ebc}',style: TextStyle(fontSize: 12)),
                                            //   ],
                                            // ),
                                            // Spacer(),
                                            Center(
                                              child: TextButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black87),fixedSize: MaterialStatePropertyAll(Size.fromHeight(5.0))),
                                                  onPressed: () {
                                                if(data[index].quantity==0){
                                                  cart.add(data[index]);
                                                }

                                                    // final snackBar = SnackBar(
                                                    //   content: const Text('Added to cart!'),
                                                    // );
                                                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                    // setState(() {
                                                    //   Text('${cart.length}');
                                                    // });
                                                    print(data[index].quantity);
                                                    setState(() {
                                                      data[index].quantity++;
                                                    });

                                                    print(data[index].quantity);


                                                    // if (data[index].quantity>0){
                                                    //   setState(() {
                                                    //     quan = true;
                                                    //   });
                                                    // }



                                                  },

                                              child: data[index].quantity >= 1 ? Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  IconButton(
                                                      onPressed: (){
                                                        cart.remove(data[index]);
                                                        data[index].quantity--;
                                                        final snackBar = SnackBar(
                                                          content: const Text('Removed from cart!'),
                                                        );
                                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                        setState(() {
                                                          Text('${cart.length}');
                                                        });
                                                      }, icon: Icon(Icons.remove,size: 10,)),
                                                  Text('${data[index].quantity}',style: TextStyle(fontSize: 12),),
                                                  IconButton(
                                                      onPressed: (){
                                                        cart.add(data[index]);
                                                        data[index].quantity++;
                                                        final snackBar = SnackBar(
                                                          content: const Text('Added to cart!'),
                                                        );
                                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                        setState(() {
                                                          Text('${cart.length}');
                                                        });
                                                      }, icon: Icon(Icons.add,size: 11,)),

                                                ],
                                              ) : Text('Added To Cart',style: TextStyle(color: Colors.white),),

                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),


                                ],),),
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),

            );
          }

        }
        return Center(child: CircularProgressIndicator());
      }
    );
  }
  Future<List<Bottles>> fetchbeer() async {
    try {
      const url = 'https://api.punkapi.com/v2/beers';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print("response ${response.statusCode}");
        final body = response.body;
        var json = bottlesFromJson(body);

        return json;
        // return Bottles.fromJson(jsonDecode(response.body));
      }
      throw Exception();
    } catch (e) {
      throw Exception(e);
    }
  }
}
