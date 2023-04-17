import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pluto/screens/store_page.dart';
import '../components/Btns/customBtn.dart';
import '../components/scroll_behaviour.dart';
import '../components/slider_menu.dart';
import '../components/topbar.dart';
import '../models/product.dart';
import '../repository/product_repository.dart';
import 'business_profile.dart';
import 'package:pluto/config/config.dart'as CONFIG;


class ProductForm extends StatefulWidget {
  final Product product;

  ProductForm({required this.product});



  @override
  ProductFormState createState() => ProductFormState();
}

class ProductFormState extends State<ProductForm> {

  TextEditingController _productTitleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _categoryController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();

  ProductRepo _repo = new ProductRepo();
  String productImage = "";
  XFile file = XFile("");
  String filepath = "";
  final ImagePicker _picker = ImagePicker();
  late UploadTask uploadTask;
  bool saving = false;
  String message = "";


  get io => null;


  @override
  void initState() {
    productImage = widget.product.productImage;
    _productTitleController.text = widget.product.productTitle;
    _descriptionController.text = widget.product.description;
    _categoryController.text = widget.product.category;
  }


Future<void> loadPhoto() async {
  String ref = await FirebaseStorage.instance.ref(
      widget.product.productImage)
      .getDownloadURL();
  setState(() {
    productImage = ref.toString();
  });
}

  double xOffset = 0;
  double yOffset = 0;
  double scalefactor = 1;
  bool isDrawerOpen = false;

  void toggleMenu() {
    bool tmpStatus = !isDrawerOpen;
    setState(() {
      xOffset = tmpStatus ? 250 : 0;
      yOffset = tmpStatus ? 50 : 0;
      scalefactor = tmpStatus ? 0.91 : 1;
      isDrawerOpen = tmpStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Slider_menu(),
            AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scalefactor)
                ..rotateY(isDrawerOpen ? -0.5 : 0),
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
              child: Column(children: [
                TopBar(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 6, right: 220, left: 5),
                    child: Text("Add Product", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  ),
                  isDrawerOpen: isDrawerOpen,
                  isMainPage: false,
                  onTap:()=> Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => StoreInfo())),
                  background: Colors.transparent,
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: buildContent(),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () => pickImage(),
            child: Container(
              width: 600,
              height: 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100]!,
              ),
              child: Center(
                child: productImage!= "" && filepath == "" ? Image(
                    image: NetworkImage(productImage)) : filepath != ""
                    ? kIsWeb
                    ? Image.network(file.path)
                    : Image.file(io.file(file.path))
                    : Icon(Icons.photo, size: 100, color: Colors.grey,),

              ),
            ),
          ),
          SizedBox(height: 15,),
          Align(alignment: Alignment.centerLeft,
              child: TextFormField(controller: _productTitleController, style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: "Product Title",
              hintText: 'Dog Shampoo',
          ),
              ),
          ),
          SizedBox(height: 10,),
          Align(alignment: Alignment.centerLeft,
              child: TextFormField(controller: _descriptionController, style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: "Description",
              hintText: '--------',
            ),
              ),
          ),
          SizedBox(height: 10,),
          Align(alignment: Alignment.centerLeft,
            child: TextFormField(controller: _categoryController, style: TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                labelText: "Category",
                hintText: '--------',
              ),
            ),
          ),


          SizedBox(height: 10,),
          Align(alignment: Alignment.centerLeft,
              child: TextFormField(controller: _priceController, style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              labelText: "Price",
              hintText: 'Rs.200',
            ),
              ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: EdgeInsets.only(left: 100, right: 50, top: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Business_Profile()),)},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: CONFIG.primaryColor,
                      //borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomBtn(
                        height: 40,
                        width: 155,
                        buttonTitle: "Add Product",
                        color: CONFIG.primaryColor),
                  ),
                ),
    ],
              ),
          ),
        ],
      ),
    );

  }
  Future<String?> uploadImage() async {
    setState(() {
      message = "Uploading Image...";
      productImage = "product-images/" + file.name;
    });
    Reference ref = FirebaseStorage.instance
        .ref('product-images/' + file.name);

    final metadata = SettableMetadata(
      contentType: file.mimeType,
    );
    Uint8List bytes = await file.readAsBytes();
    if (kIsWeb) {
      try {
        final uploadTask =  ref.putData(bytes,metadata);

        uploadTask.snapshotEvents.listen((event) async {
          double progress = (event.bytesTransferred.toDouble()/event.totalBytes.toDouble())*100;

          setState(() {
            message="Uploading Image...${progress.floor().toString()}%";
          });
          if(event.state==TaskState.success){
            print("we got success");
          }
        });
        await uploadTask.whenComplete((){
          print("now completed");
          return productImage;
        });
      } on FirebaseException catch (e) {
        setState(() {
          message="Error: "+e.toString();
        });
        print(e.message);
      }
      if(productImage!=""){
        print("now return photo");
        String tmp_path = await ref.getDownloadURL();
        setState(() {
          message="Image Uploaded! Preparing data to save";
          productImage =  tmp_path;
        });
        return productImage;
      }
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }
  }

  save() async {
    if (file.path != '') {
      var v = await uploadImage();
      print("this is ... " + v.toString());
    }
    setState(() {
      message = "Getting Product details...";
    });
    Product data = Product(
        product_id: widget.product.product_id!= ""
            ? widget.product.product_id
            : "",
        productTitle: _productTitleController.text,
        description: _descriptionController.text,
        productImage: productImage,
        created_at: widget.product.created_at ?? "",
        created_by: widget.product.created_by ?? "",
        created_by_name: widget.product.created_by_name ?? ""
    );
    setState(() {
      message = 'Saving data....';
    });
    await  _repo.save(data);

    setState(() {
      if (widget.product.product_id == "") {
        _productTitleController.text = "";
        _descriptionController.text = "";
        productImage = "";
        file = XFile("");
        filepath = "";
      }
      message = "Product Saved!";
      saving = false;
    });
  }
  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,);
      setState(() {
        file = pickedFile!;
        filepath = pickedFile!.path;
      });
    } catch (e) {
      setState(() {});
    }
  }
}

