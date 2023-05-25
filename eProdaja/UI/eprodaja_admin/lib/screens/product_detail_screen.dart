import 'package:eprodaja_admin/models/product.dart';
import 'package:eprodaja_admin/widgets/master_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailScreen extends StatefulWidget {
  Product? product;
  ProductDetailScreen({Key? key, this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      child: Text("Details!"),
      title: this.widget.product?.naziv ?? "Product details",
    );
  }
}