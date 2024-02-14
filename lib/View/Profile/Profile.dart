import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../../Utility/Environment.dart';
import '../Dashboard/Home.dart';
import 'package:permission_handler/permission_handler.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  var documentImageName;
  File? downloadedFile;
  String downloadMessage = "Press download";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          var provider = Provider.of<YopeeProvider>(context, listen: false);
          provider.getProfileViewApi(context);

          documentImageName = provider
              .objProfileViewResponse.data.documentImageUrl
              .toString()
              .split('/')
              .last;
          print("documentImageName:$documentImageName");

          //provider.setlogoutEnableButton();

          provider.profileNameController.text =
              provider.objProfileViewResponse.data!.name == ""
                  ? ""
                  : provider.objProfileViewResponse.data!.name.toString();
          provider.profileEmailAddressController.text =
              provider.objProfileViewResponse.data!.name == ""
                  ? ""
                  : provider.objProfileViewResponse.data!.email.toString();
          provider.profilePhoneNumberController.text =
              Environment.loginMobileNumber;

          provider.profileAddressController.text =
              provider.objProfileViewResponse.data!.address == "0" ||
                      provider.objProfileViewResponse.data!.address == null
                  ? ""
                  : provider.objProfileViewResponse.data!.address.toString();
        }));

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //
    // });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }

    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0xff00000029),
                offset: Offset(0, 0.0),
                blurRadius: 6.0,
              )
            ]),
            child: AppBar(
              elevation: 4,
              shadowColor: Color(0xff00000029),
              toolbarHeight: 53,
              leading: IconButton(
                iconSize: 25,
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MyHomePage()));
                  // Navigator.of(context).push(PageRouteBuilder(
                  //     transitionDuration: const Duration(milliseconds: 400),
                  //     pageBuilder: (context, animation, secondaryAnimation) =>
                  //         MyHomePage(),
                  //     transitionsBuilder: (BuildContext context,
                  //         Animation<double> animation,
                  //         Animation<double> secondaryAnimation,
                  //         Widget child) {
                  //       return SlideTransition(
                  //         position: Tween<Offset>(
                  //           //Left to right
                  //           begin: const Offset(-1.0, 0.0),
                  //           end: Offset.zero,
                  //
                  //           //Right to left
                  //           // begin: const Offset(1.0, 0.0),
                  //           // end: Offset.zero,
                  //
                  //           //top to bottom
                  //           // begin: const Offset(0.0, -1.0),
                  //           // end: Offset.zero,
                  //
                  //           //   bottom to top
                  //           // begin: Offset(0.0, 1.0),
                  //           // end: Offset.zero,
                  //         ).animate(animation),
                  //         child: child,
                  //       );
                  //     }
                  //     // transitionsBuilder: (context, animation, secondaryAnimation, page) {
                  //     //   var begin = 0.0;
                  //     //   var end = 1.0;
                  //     //   var curve = Curves.ease;
                  //     //
                  //     //   var tween =
                  //     //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  //     //   return ScaleTransition(
                  //     //     scale: animation.drive(tween),
                  //     //     child: page,
                  //     //   );
                  //     // },
                  //     ));
                },
              ),
              centerTitle: true,
              title: Text(
                "My Account",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SemiBold",
                    color: Color(0xff313131)),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    showLogoutDialog(context, provider);
                  },
                  child: Container(
                    height: 18,
                    width: 18,
                    child: SvgPicture.asset("assets/images/logout.svg"),
                  ),
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
        ),
        body: provider.isLoading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ColorTheme.themeCircularColor,
                  backgroundColor: ColorTheme.themeLightGrayColor,
                ))
            : SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Stack(
                    children: [
                      provider.image != null
                          ? Container(
                              margin: EdgeInsets.only(left: 150, right: 150),
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: Image.file(
                                  //to show image, you type like this.
                                  File(provider.image!.path),
                                  fit: BoxFit.cover,
                                ).image,
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(left: 150, right: 150),
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(50),
                              // ),
                              child: provider.isProfileEdit == true
                                  ? CircleAvatar(
                                      radius: 40,
                                      backgroundImage: Image.network(provider
                                              .objProfileViewResponse
                                              .data!
                                              .profileImageUrl
                                              .toString())
                                          .image,
                                    )
                                  : Image.asset(
                                      "assets/images/menu/profile.png"),
                            ),
                      Positioned(
                        left: 200,
                        right: 130,
                        top: 43,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: IconButton(
                            icon: SvgPicture.asset(
                              "assets/images/edit.svg",
                              color: Colors.white,
                              height: 60,
                              width: 60,
                            ),
                            onPressed: () {
                              // provider.pickImages();

                              imageDialog(provider, context);
                              //Navigator.of(context).pushNamed('/profile');
                            },
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff0072C6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Medium"),
                              ),
                            ),
                            provider.isProfileEdit == true
                                // ? Container(
                                //     height: 50,
                                //     width: 374,
                                //     padding: EdgeInsets.only(
                                //         left: 16, top: 15, bottom: 16),
                                //     decoration: BoxDecoration(
                                //         border: Border.all(
                                //             color: Color(0xff707070), width: 1),
                                //         borderRadius: BorderRadius.circular(6)),
                                //     margin: EdgeInsets.only(left: 20, right: 20),
                                //     child: TextFormField(
                                //       controller: provider.profileNameController,
                                //       keyboardType: TextInputType.text,
                                //       textInputAction: TextInputAction.next,
                                //       validator: (value) {
                                //         if (value!.length < 2) {
                                //           return 'Name not long enough';
                                //         }
                                //       },
                                //       decoration: const InputDecoration(
                                //           border: InputBorder.none,
                                //           hintText: "Enter Your Name",
                                //           contentPadding: EdgeInsets.all(10.0),
                                //           hintStyle: TextStyle(
                                //               fontSize: 15,
                                //               fontFamily: "Medium",
                                //               color: ColorTheme.themeGrayColor)),
                                //       style: TextStyle(
                                //           fontSize: 15, fontFamily: "Medium"),
                                //     ),
                                //   )
                                ? TextFormField(
                                    controller: provider.profileNameController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.length < 2) {
                                        return 'Name  is not long enough';
                                      }
                                    },
                                    inputFormatters: <TextInputFormatter>[
                                      LengthLimitingTextInputFormatter(30),
                                    ],
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                              color: Color(0xff707070),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                              color: ColorTheme.themeGreenColor,
                                              width: 1),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                              color: Color(0xff707070),
                                              width: 1),
                                        ),
                                        hintText: "Enter Your Name",
                                        contentPadding: EdgeInsets.all(10.0),
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Medium",
                                            color: ColorTheme.themeGrayColor)),
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: "Medium"),
                                  )
                                : Container(
                                    height: 50,
                                    width: 374,
                                    padding: EdgeInsets.only(
                                        left: 16, top: 15, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xff707070), width: 1),
                                        borderRadius: BorderRadius.circular(6)),
                                    // margin:
                                    //     EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      "${provider.objProfileViewResponse.data?.name}",
                                      style: TextStyle(
                                          fontSize: 15, fontFamily: "Medium"),
                                    ),
                                  ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Email Address",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Medium"),
                              ),
                            ),
                            provider.isProfileEdit == true
                                ? TextFormField(
                                    controller:
                                        provider.profileEmailAddressController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9@a-zA-Z.]")),
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: validateEmail,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                              color: Color(0xff707070),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                              color: ColorTheme.themeGreenColor,
                                              width: 1),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                              color: Color(0xff707070),
                                              width: 1),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                        hintText: "Enter email address",
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Medium",
                                            color: ColorTheme.themeGrayColor)),
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: "Medium"),
                                  )
                                : Container(
                                    height: 50,
                                    width: 374,
                                    padding: EdgeInsets.only(
                                        left: 16, top: 15, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xff707070), width: 1),
                                        borderRadius: BorderRadius.circular(6)),
                                    // margin:
                                    //     EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      provider
                                          .objProfileViewResponse.data!.email
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 15, fontFamily: "Medium"),
                                    ),
                                  ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Phone No.",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Medium"),
                              ),
                            ),
                            // provider.isProfileEdit == true
                            //     ? TextFormField(
                            //         controller:
                            //             provider.profilePhoneNumberController,
                            //         keyboardType: TextInputType.phone,
                            //         inputFormatters: <TextInputFormatter>[
                            //           LengthLimitingTextInputFormatter(10),
                            //         ],
                            //         validator: (value) {
                            //           if (value!.isEmpty) {
                            //             return "Please Enter a Phone Number";
                            //           } else if (!RegExp(
                            //                   r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                            //               .hasMatch(value)) {
                            //             return "Please Enter a Valid Phone Number";
                            //           }
                            //         },
                            //         decoration: InputDecoration(
                            //             enabledBorder: OutlineInputBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(6.0),
                            //               borderSide: BorderSide(
                            //                   color: Color(0xff707070),
                            //                   width: 1),
                            //             ),
                            //             focusedBorder: OutlineInputBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(6.0),
                            //               borderSide: BorderSide(
                            //                   color: ColorTheme.themeGreenColor,
                            //                   width: 1),
                            //             ),
                            //             border: OutlineInputBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(6.0),
                            //               borderSide: BorderSide(
                            //                   color: Color(0xff707070),
                            //                   width: 1),
                            //             ),
                            //             contentPadding: EdgeInsets.all(10.0),
                            //             hintText: "Enter Phone Number",
                            //             hintStyle: TextStyle(
                            //                 fontSize: 15,
                            //                 fontFamily: "Medium",
                            //                 color: ColorTheme.themeGrayColor)),
                            //         textInputAction: TextInputAction.done,
                            //         style: TextStyle(
                            //             fontSize: 15, fontFamily: "Medium"),
                            //       )
                            //     :
                            Container(
                              height: 50,
                              width: 374,
                              padding: EdgeInsets.only(
                                  left: 16, top: 15, bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff707070), width: 1),
                                  borderRadius: BorderRadius.circular(6)),
                              // margin:
                              //     EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                provider.objProfileViewResponse.data!.mobile
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 15, fontFamily: "Medium"),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Address",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Medium"),
                              ),
                            ),
                            provider.isProfileEdit == true
                                ? TextFormField(
                                    controller:
                                        provider.profileAddressController,
                                    keyboardType: TextInputType.multiline,
                                    minLines: 1,
                                    maxLines: 10,
                                    // inputFormatters: <TextInputFormatter>[
                                    //   LengthLimitingTextInputFormatter(10),
                                    // ],
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return "Please Enter a Phone Number";
                                    //   } else if (!RegExp(
                                    //       r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                    //       .hasMatch(value)) {
                                    //     return "Please Enter a Valid Phone Number";
                                    //   }
                                    // },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                              color: Color(0xff707070),
                                              width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                              color: ColorTheme.themeGreenColor,
                                              width: 1),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          borderSide: BorderSide(
                                              color: Color(0xff707070),
                                              width: 1),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                        hintText: "Enter Address",
                                        hintStyle: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Medium",
                                            color: ColorTheme.themeGrayColor)),
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: "Medium"),
                                  )
                                : provider.objProfileViewResponse.data!
                                            .address ==
                                        " 0"
                                    ? Container(
                                        constraints: BoxConstraints(
                                            maxHeight: double.infinity),
                                        width: 374,
                                        padding: EdgeInsets.only(
                                            left: 16, top: 15, bottom: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff707070),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        // margin:
                                        //     EdgeInsets.only(left: 20, right: 20),
                                        child: Text(
                                          " ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "Medium"),
                                        ),
                                      )
                                    : Container(
                                        constraints: BoxConstraints(
                                            maxHeight: double.infinity),
                                        width: 374,
                                        padding: EdgeInsets.only(
                                            left: 16, top: 15, bottom: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff707070),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        // margin:
                                        //     EdgeInsets.only(left: 20, right: 20),
                                        child: Text(
                                          provider.objProfileViewResponse.data!
                                              .address
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "Medium"),
                                        ),
                                      ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Upload Aadhar Card",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Medium"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // imageDialog(provider, context);
                                //provider.pickFile(context);
                                provider.pickDocumentImage();
                              },
                              child: Container(
                                height: 50,
                                width: 374,
                                // padding: EdgeInsets.only(left: 16, top: 15, bottom: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xff707070), width: 1),
                                    borderRadius: BorderRadius.circular(6)),
                                // margin: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 260,
                                      child: TextFormField(
                                        readOnly: true,
                                        //  controller: provider.profileAddressController,
                                        //   keyboardType: TextInputType.text,
                                        //    inputFormatters: <TextInputFormatter>[
                                        //      LengthLimitingTextInputFormatter(10),
                                        //    ],
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                            hintText: "Choose File",
                                            hintStyle: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Medium",
                                                color:
                                                    ColorTheme.themeGrayColor)),
                                        textInputAction: TextInputAction.done,
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: "Medium"),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxHeight: double.infinity,
                                          maxWidth: double.infinity),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color(0xffDADADA),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          "Upload",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "Medium",
                                              color: Color(0xff343434)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  provider.documentImage != null
                      ? GestureDetector(
                          onTap: () async {
                            Map<Permission, PermissionStatus> statuses = await [
                              Permission.storage,
                              //add more permission to request here.
                            ].request();

                            if (statuses[Permission.storage]!.isGranted) {
                              var dir = await DownloadsPathProvider
                                  .downloadsDirectory;
                              if (dir != null) {
                                String savename = "file.pdf";
                                String savePath = dir.path + "/$savename";
                                print(savePath);
                                //output:  /storage/emulated/0/Download/banner.png

                                try {
                                  await Dio().download(
                                      provider.objProfileViewResponse.data
                                          .documentImageUrl
                                          .toString(),
                                      savePath,
                                      onReceiveProgress: (received, total) {
                                    if (total != -1) {
                                      print((received / total * 100)
                                              .toStringAsFixed(0) +
                                          "%");
                                      //you can build progressbar feature too
                                    }
                                  });
                                  print("File is saved to download folder.");
                                } on DioError catch (e) {
                                  print(e.message);
                                }
                              }
                            } else {
                              print("No permission to read and write.");
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 200,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 20, top: 10),
                            decoration: BoxDecoration(
                                color: Color(0xffFFF6F6),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Color(0xffE32222), width: 1)),
                            child: Center(
                              child: Text(
                                " ${provider.uploadedProfileName}",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: "Regular",
                                    color: Color(0xffE32222)),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 30,
                          width: 200,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(left: 20, top: 10),
                          decoration: BoxDecoration(
                              color: Color(0xffFFF6F6),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Color(0xffE32222), width: 1)),
                          child: Center(
                            child: Text(
                              " ${documentImageName}",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Regular",
                                  color: Color(0xffE32222)),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 40,
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15, top: 17),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                // provider.profileUpdateClicked
                                //   ?
                                ColorTheme.themeGreenColor,
                            // : ColorTheme.themeDarkGrayColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: Size(374, 56),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Navigator.of(context).pushNamed('/addVehicle');
                              if (provider.profileNameController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter your name!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (provider
                                  .profileEmailAddressController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter email address!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              // else if (provider
                              //     .profilePhoneNumberController
                              //     .text
                              //     .isEmpty) {
                              //   Fluttertoast.showToast(
                              //       msg: "Please enter phone number!",
                              //       toastLength: Toast.LENGTH_SHORT,
                              //       gravity: ToastGravity.CENTER,
                              //       timeInSecForIosWeb: 1,
                              //       backgroundColor: Colors.red,
                              //       textColor: Colors.white,
                              //       fontSize: 16.0);
                              // }
                              else {
                                // provider.getProfileUpdateApi(
                                //     provider.profileNameController.text,
                                //     provider.profileEmailAddressController.text,
                                //     provider.profilePhoneNumberController.text,
                                //     provider.profileAddressController.text,
                                //     context);
                                //  if (provider.profileUpdateClicked) {
                                //  provider.profileUpdateClicked = true;
                                provider.profileUpdateApi(
                                    provider.profileNameController.text,
                                    provider.profileEmailAddressController.text,
                                    provider.objProfileViewResponse.data!.mobile
                                        .toString(),
                                    provider.profileAddressController.text,
                                    // provider.uploadedFileName,
                                    context);
                                //  }

                                //
                              }
                            }
                          },
                          child: const Text(
                            'Save Changes',
                            style: TextStyle(
                                color: ColorTheme.themeBlackColor,
                                fontSize: 16,
                                fontFamily: "SemiBold"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
      );
    });
  }

  void imageDialog(YopeeProvider provider, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Please choose media to select',
              style: TextStyle(
                  fontSize: 15, fontFamily: "SemiBold", color: Colors.black),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      provider.pickImages(ImageSource.gallery);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      provider.pickImages(ImageSource.camera);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Camera',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: ColorTheme.themeLightGrayColor,
                    //   // shape: RoundedRectangleBorder(
                    //   //     borderRadius: BorderRadius.circular(6.0)),
                    //   // minimumSize: Size(374, 56),
                    // ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cancel),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  showLogoutDialog(BuildContext context, YopeeProvider provider) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 220,
              width: 374,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xff707070), width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SemiBold",
                          color: Color(0xff313131)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Do you Really want to logout?",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Medium",
                          color: Color(0xff111111)),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15, top: 17),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorTheme.themeLightGrayColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: Size(80, 50),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                            // Navigator.of(context).pushNamed('/addVehicle');
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                color: ColorTheme.themeWhiteColor,
                                fontSize: 16,
                                fontFamily: "SemiBold"),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, bottom: 15, top: 17),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: provider.logoutClicked
                                ? ColorTheme.themeLightGrayColor
                                : Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: Size(80, 50),
                          ),
                          onPressed: () {
                            //provider.setlogoutDisableButton();
                            if (!provider.logoutClicked) {
                              provider.logoutClicked = true;
                              provider.getLogoutApi(
                                  Environment.loginMobileNumber, context);
                            }
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                                color: ColorTheme.themeWhiteColor,
                                fontSize: 16,
                                fontFamily: "SemiBold"),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
