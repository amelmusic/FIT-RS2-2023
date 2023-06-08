// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:eprodaja_admin/models/jedinice_mjere.dart';
import 'package:eprodaja_admin/models/product.dart';
import 'package:eprodaja_admin/models/vrste_proizvoda.dart';
import 'package:eprodaja_admin/providers/jedinice_mjere.dart';
import 'package:eprodaja_admin/providers/product_provider.dart';
import 'package:eprodaja_admin/providers/vrste_proizvoda.dart';
import 'package:eprodaja_admin/widgets/master_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../models/search_result.dart';

class ProductDetailScreen extends StatefulWidget {
  Product? product;
  ProductDetailScreen({Key? key, this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> _initialValue = {};
  late JediniceMjereProvider _jediniceMjereProvider;
  late VrsteProizvodaProvider _vrsteProizvodaProvider;
  late ProductProvider _productProvider;

  SearchResult<JediniceMjere>? jediniceMjereResult;
  SearchResult<VrsteProizvoda>? vrsteProizvodaResult;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialValue = {
      'sifra': widget.product?.sifra,
      'naziv': widget.product?.naziv,
      'cijena': widget.product?.cijena?.toString(),
      'vrstaId': widget.product?.vrstaId?.toString(),
      'jedinicaMjereId': widget.product?.jedinicaMjereId?.toString()
    };

    _jediniceMjereProvider = context.read<JediniceMjereProvider>();
    _vrsteProizvodaProvider = context.read<VrsteProizvodaProvider>();
    _productProvider = context.read<ProductProvider>();

    initForm();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // if (widget.product != null) {
    //   setState(() {
    //     _formKey.currentState?.patchValue({'sifra': widget.product?.sifra});
    //   });
    // }
  }

  Future initForm() async {
    jediniceMjereResult = await _jediniceMjereProvider.get();
    print(jediniceMjereResult);

    vrsteProizvodaResult = await _vrsteProizvodaProvider.get();
    print(vrsteProizvodaResult);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      // ignore: sort_child_properties_last
      child: Column(
        children: [
          isLoading ? Container() : _buildForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () async {
                      _formKey.currentState?.saveAndValidate();

                      print(_formKey.currentState?.value);
                      print(_formKey.currentState?.value['naziv']);

                      var request = new Map.from(_formKey.currentState!.value);

                      request['slika'] = _base64Image;

                      print(request['slika']);
                      
                      try {
                        if (widget.product == null) {
                          await _productProvider
                              .insert(request);
                        } else {
                          await _productProvider.update(
                              widget.product!.proizvodId!,
                              request);
                        }
                      } on Exception catch (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text("Error"),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("OK"))
                                  ],
                                ));
                      }
                    },
                    child: Text("Sačuvaj")),
              )
            ],
          )
        ],
      ),
      title: this.widget.product?.naziv ?? "Product details",
    );
  }

  FormBuilder _buildForm() {
    return FormBuilder(
      key: _formKey,
      initialValue: _initialValue,
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                decoration: InputDecoration(labelText: "Šifra"),
                name: "sifra",
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                decoration: InputDecoration(labelText: "Naziv"),
                name: "naziv",
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: FormBuilderDropdown<String>(
              name: 'vrstaId',
              decoration: InputDecoration(
                labelText: 'Vrsta proizvoda',
                suffix: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _formKey.currentState!.fields['vrstaId']?.reset();
                  },
                ),
                hintText: 'Select Gender',
              ),
              items: vrsteProizvodaResult?.result
                      .map((item) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: item.vrstaId.toString(),
                            child: Text(item.naziv ?? ""),
                          ))
                      .toList() ??
                  [],
            )),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: FormBuilderDropdown<String>(
              name: 'jedinicaMjereId',
              decoration: InputDecoration(
                labelText: 'Jedinica mjere',
                suffix: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _formKey.currentState!.fields['jedinicaMjereId']?.reset();
                  },
                ),
                hintText: 'Jedinica mjere',
              ),
              items: jediniceMjereResult?.result
                      .map((item) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: item.jedinicaMjereId.toString(),
                            child: Text(item.naziv ?? ""),
                          ))
                      .toList() ??
                  [],
            )),
            Expanded(
              child: FormBuilderTextField(
                decoration: InputDecoration(labelText: "Cijena"),
                name: "cijena",
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: FormBuilderField(
              name: 'imageId',
              builder: ((field) {
                return InputDecorator(
                  decoration: InputDecoration(
                      label: Text('Odaberite sliku'),
                      errorText: field.errorText),
                  child: ListTile(
                    leading: Icon(Icons.photo),
                    title: Text("Select image"),
                    trailing: Icon(Icons.file_upload),
                    onTap: getImage,
                  ),
                );
              }),
            ))
          ],
        )
      ]),
    );
  }
  
  File? _image;
  String? _base64Image;

  Future getImage()  async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);

    if(result != null && result.files.single.path != null) {
      _image = File(result.files.single.path!);
      _base64Image = base64Encode(_image!.readAsBytesSync());
    }

  }
}
