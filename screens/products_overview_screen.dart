import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widget/products_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _isInit = true;

  var _isLoading = false;

 
  // @override
  // void initState() {
  //   // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
  //   // Future.delayed(Duration.zero).then((_) {
  //   //   Provider.of<Products>(context).fetchAndSetProducts();
  //   // });
  //   super.initState();
  // }

  //   @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     print(Provider.of<Products>(context).fetchAndSetProducts());
  //     Provider.of<Products>(context).fetchAndSetProducts().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Ricky And Morty'),
        ),
      //  body: _isLoading
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     :
      body: ProductsGrid(),
    );
    }
  }
