import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: <Widget>[
          ListTile(
            leading: Hero(
                tag: product.id,
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/thumbnail.png'),
                  image: NetworkImage(product.image),
                  width: 300,
                  height: 400,
                )),
            trailing: Padding(
              
              padding: EdgeInsets.all(10),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        DotsIndicator(
                          dotsCount: 1,
                          decorator:product.status=='Dead'? DotsDecorator(color: Colors.red):
                           DotsDecorator(color: Colors.green),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 2, right: 4),
                          child: Text(
                            product.status,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                       Container(
                          margin: EdgeInsets.only( right: 4),
                          child: Text(
                            '\-${product.species}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    
                    child: Column(
                      children: <Widget>[
                        Text('Last Known Location'),
                        Text(product.origin[0].url,
                        style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),)
                      ],
                    ),
                  ),
                    Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        Text('First Seen in'),
                        Text(product.location[0].url,
                        style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: Card(
    //       child: GestureDetector(
    // onTap: () {
    //   Navigator.of(context).pushNamed(
    //     ProductDetailScreen.routeName,
    //     arguments: product.id,
    //   );
    // },
    // child: Hero(
    //   tag: product.id,
    //             child: FadeInImage(
    //     placeholder: AssetImage('assets/images/thumbnail.png'),
    //     image: NetworkImage(product.image),
    //     width: 300,
    //     height: 400,
    //   ),
    // ),
    // ),

    //   ),
    // );
  }
}
