
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
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
    _productTitleController.text = widget.product.productTitle;
    _descriptionController.text = widget.product.description;
    _categoryController.text = widget.product.category;
  }


  // Future<void> pickImage() async {
  //   try {
  //     final XFile? pickedFile = await _picker.pickImage(
  //       source: ImageSource.gallery,
  //     );
  //     setState(() {
  //       file = pickedFile!;
  //       filepath = pickedFile!.path;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       // _pickImageError = e;
  //     });
  //   }
  //  }

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
  void addProductHandler(Product product) async {

    FirebaseFirestore.instance.collection(CONFIG.product_collection)
        .add(product.toMap())
        .then((docRef) {
      FirebaseFirestore.instance.collection(CONFIG.product_collection).doc(docRef.id).update(
          {"productId": docRef.id});
      print("${product.toMap()} product added..");
    }).catchError((e) {
      print("$e this error appears...");
    });

  }
  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        file = pickedFile!;
        filepath = pickedFile!.path;
      });
    } catch (e) {
      setState(() {
        // _pickImageError = e;
      });
    }
  }
}

