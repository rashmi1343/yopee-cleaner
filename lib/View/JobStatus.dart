import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yopee_cleaner/Widgets/bottom_bar.dart';

import '../../Presenter/YopeeProvider.dart';
import '../../Utility/ColorTheme.dart';
import 'Profile/Profile.dart';

class JobStatus extends StatefulWidget {
  JobStatusState createState() => JobStatusState();
  String? id;
  String? brandImage;
  String? brandName;
  String? registrationName;
  String? modelName;
  String? vehicleName;
  String? flatHouseNo;
  String? areaSector;
  String? nearby;

  String? name;

  JobStatus({
    required this.id,
    required this.brandImage,
    required this.brandName,
    required this.registrationName,
    required this.modelName,
    required this.vehicleName,
    required this.flatHouseNo,
    required this.areaSector,
    required this.nearby,
    required this.name,
  });
}

class JobStatusState extends State<JobStatus> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<YopeeProvider>(context, listen: false);
      provider.getDashboardApi(context);
      provider.messageOwnerController.text = "";
      provider.selectedWashImages = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YopeeProvider>(context, listen: false);
    return Consumer<YopeeProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0xff00000029),
                offset: Offset(0, 0.0),
                blurRadius: 6.0,
              )
            ]),
            child: AppBar(
              backgroundColor: Color(0xff0072C6),
              automaticallyImplyLeading: false,
              elevation: 4,
              shadowColor: Color(0xff00000029),
              toolbarHeight: 53,
              centerTitle: false,
              title: const Text(
                "Job Status",
                style: TextStyle(
                    fontSize: 18, fontFamily: "SemiBold", color: Colors.white),
              ),
              actions: [
                Container(
                  height: 15,
                  width: 28,
                  margin: EdgeInsets.only(right: 5),
                  child: Image.asset(
                    "assets/images/toggle.png",
                    color: Color(0xff00FF00),
                  ),
                ),
                provider.objDashboardResponse.data.userProfile
                                ?.profileImageUrl ==
                            "" ||
                        provider.objDashboardResponse.data.userProfile
                                ?.profileImageUrl ==
                            null
                    ? Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(right: 5),
                        child: IconButton(
                          icon: Image.asset(
                            "assets/images/menu/profile.png",
                          ),
                          onPressed: () {
                            provider.isProfileEdit = true;
                            Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 400),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Profile(),
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return new SlideTransition(
                                    position: new Tween<Offset>(
                                      //Left to right
                                      // begin: const Offset(-1.0, 0.0),
                                      // end: Offset.zero,

                                      //Right to left
                                      begin: const Offset(1.0, 0.0),
                                      end: Offset.zero,

                                      //top to bottom
                                      // begin: const Offset(0.0, -1.0),
                                      // end: Offset.zero,

                                      //   bottom to top
                                      // begin: Offset(0.0, 1.0),
                                      // end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                }
                                // transitionsBuilder: (context, animation, secondaryAnimation, page) {
                                //   var begin = 0.0;
                                //   var end = 1.0;
                                //   var curve = Curves.ease;
                                //
                                //   var tween =
                                //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                //   return ScaleTransition(
                                //     scale: animation.drive(tween),
                                //     child: page,
                                //   );
                                // },
                                ));
                          },
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          provider.isProfileEdit = true;
                          Navigator.of(context).push(PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      Profile(),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return new SlideTransition(
                                  position: new Tween<Offset>(
                                    //Left to right
                                    // begin: const Offset(-1.0, 0.0),
                                    // end: Offset.zero,

                                    //Right to left
                                    begin: const Offset(1.0, 0.0),
                                    end: Offset.zero,

                                    //top to bottom
                                    // begin: const Offset(0.0, -1.0),
                                    // end: Offset.zero,

                                    //   bottom to top
                                    // begin: Offset(0.0, 1.0),
                                    // end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              }
                              // transitionsBuilder: (context, animation, secondaryAnimation, page) {
                              //   var begin = 0.0;
                              //   var end = 1.0;
                              //   var curve = Curves.ease;
                              //
                              //   var tween =
                              //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                              //   return ScaleTransition(
                              //     scale: animation.drive(tween),
                              //     child: page,
                              //   );
                              // },
                              ));
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.only(left: 5, right: 15),
                          // decoration: BoxDecoration(
                          //   borderRadius:
                          //       BorderRadius.circular(50),
                          //   image: DecorationImage(
                          //     image: NetworkImage(
                          //         "${provider.objProfileViewResponse.data?.profileImageUrl}"),
                          //     //whatever image you can put here
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                "${provider.objProfileViewResponse.data?.profileImageUrl}"),
                          ),
                          // child: Image.network(
                          //     // "https://binarymetrix-staging.com/yopee/storage/app/public/257/download.jpg"),
                          //     provider.objProfileViewResponse
                          //         .profileViewData.profileImageUrl),
                        ),
                      ),
              ],
            ),
          ),
        ),
        body: provider.isLoading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ColorTheme.themeGreenColor,
                  backgroundColor: ColorTheme.themeLightGrayColor,
                ))
            : SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 1,
                    color: Colors.white,
                    margin: EdgeInsets.only(right: 20, top: 10, left: 20),
                    child: Container(
                      constraints: BoxConstraints(
                          maxHeight: double.infinity, maxWidth: 374),
                      // height: 150,
                      // width: 374,

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 48,
                            width: 64,
                            margin:
                                EdgeInsets.only(left: 10, bottom: 11, top: 13),
                            child: Image.network(widget.brandImage.toString()),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 19,
                                margin: EdgeInsets.only(
                                    left: 31, top: 13, bottom: 10),
                                child: Text(
                                  widget.name.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "SemiBold",
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                height: 19,
                                margin: EdgeInsets.only(left: 31, bottom: 10),
                                child: Text(
                                  "${widget.brandName} ${widget.modelName}",
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: "Medium"),
                                ),
                              ),
                              Container(
                                height: 19,
                                margin: EdgeInsets.only(left: 31),
                                child: Text(
                                  "${widget.registrationName} | ${widget.vehicleName}",
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: "Medium"),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 31,
                                    ),
                                    height: 20,
                                    width: 17.06,
                                    child: SvgPicture.asset(
                                      "assets/images/map-marker.svg",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  widget.nearby!.isEmpty ||
                                          widget.nearby == null
                                      ? Container(
                                          constraints: BoxConstraints(
                                              maxHeight: double.infinity,
                                              maxWidth: 200),
                                          child: Text(
                                            "${widget.flatHouseNo}, ${widget.areaSector}",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: "Medium",
                                                color: Color(0xff464646)),
                                          ),
                                        )
                                      : Container(
                                          constraints: BoxConstraints(
                                              maxHeight: double.infinity,
                                              maxWidth: 200),
                                          child: Text(
                                            "${widget.flatHouseNo}, ${widget.areaSector}, ${widget.nearby}",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: "Medium",
                                                color: Color(0xff464646)),
                                          ),
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 10, left: 20),
                    height: 2,
                    width: 374,
                    color: Color(0xffF6F6FE),
                  ),
                  Container(
                    //   height: 19,
                    margin: EdgeInsets.only(left: 31, top: 20.5, bottom: 10),
                    child: Text(
                      "Upload Images",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Medium",
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 103,
                    margin: EdgeInsets.only(left: 21, right: 21, top: 10),
                    decoration: BoxDecoration(
                        color: Color(0xffF6F6FE),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            //height: 300.0,
                            child: provider.selectedWashImages.isEmpty
                                ? Container()
                                // Container(
                                //         margin: EdgeInsets.only(left: 21),
                                //         alignment: Alignment.centerLeft,
                                //         height: 64.81,
                                //         width: 68,
                                //         // decoration: BoxDecoration(
                                //         //   borderRadius: BorderRadius.circular(50),
                                //         // ),
                                //         child: Image.asset(
                                //             "assets/images/menu/profile.png"),
                                //       )
                                : ListView.builder(
                                    itemCount:
                                        provider.selectedWashImages.length,
                                    scrollDirection: Axis.horizontal,
                                    // gridDelegate:
                                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                                    //         crossAxisCount: 3),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Center(
                                          child: kIsWeb
                                              ? Image.network(provider
                                                  .selectedWashImages[index]
                                                  .path)
                                              : Row(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                            left: 15,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          height: 64.81,
                                                          width: 68,
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: Image.file(
                                                                      provider.selectedWashImages[
                                                                          index])
                                                                  .image,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 68,
                                                          bottom: 48,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                provider
                                                                    .selectedWashImages
                                                                    .removeAt(
                                                                        index);
                                                              });
                                                            },
                                                            child: Container(
                                                              height: 15,
                                                              width: 15,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .black26),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Icon(
                                                                    Icons.clear,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 12),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ));
                                    },
                                  ),
                          ),
                        ),
                        // provider.image != null
                        //     ? Container(
                        //         margin: EdgeInsets.only(
                        //           left: 21,
                        //         ),
                        //         alignment: Alignment.center,
                        //         height: 64.81,
                        //         width: 68,
                        //         decoration: BoxDecoration(
                        //           image: DecorationImage(
                        //             image: Image.file(
                        //               //to show image, you type like this.
                        //               File(provider.image!.path),
                        //               fit: BoxFit.cover,
                        //             ).image,
                        //           ),
                        //         ),
                        //       )
                        //     : Container(
                        //         margin: EdgeInsets.only(left: 21),
                        //         alignment: Alignment.center,
                        //         height: 64.81,
                        //         width: 68,
                        //         // decoration: BoxDecoration(
                        //         //   borderRadius: BorderRadius.circular(50),
                        //         // ),
                        //         child: Image.asset(
                        //             "assets/images/menu/profile.png"),
                        //       ),
                        GestureDetector(
                          onTap: () {
                            imageDialog(provider, context);
                          },
                          child: Container(
                            width: 68,
                            height: 64.41,
                            margin: EdgeInsets.only(left: 11, right: 11),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff0000001A), //New
                                  blurRadius: 10.0,
                                )
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.all(18),
                              child: SvgPicture.asset(
                                "assets/images/add-plus.svg",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // height: 19,
                    margin: EdgeInsets.only(left: 31, bottom: 10, top: 10),
                    child: Text(
                      "Message for owner",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Medium",
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 129,
                    width: 374,
                    margin: EdgeInsets.only(left: 31, right: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff707070), width: 1),
                        color: Color(0xffFFFFFF)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your concern here...",
                          hintStyle: TextStyle(
                              fontFamily: "Medium",
                              fontSize: 15,
                              color: Color(0xff555555))),
                      controller: provider.messageOwnerController,
                      style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 12,
                          color: Colors.black),
                      maxLines: 200,
                      keyboardType: TextInputType.text,
                      scrollPhysics: const ScrollPhysics(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 15, top: 17),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.themeGreenColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        minimumSize: Size(374, 56),
                      ),
                      onPressed: () {
                        // Navigator.of(context).pushNamed('/addVehicle');
                        // provider.getRateWashApi(
                        //     widget.bookingId,
                        //     imageDataList[provider.selectedRateWash].name,
                        //     provider.rating.toString(),
                        //     provider.feedbackController.text,
                        //     context);
                        // if (!provider.isJobStatusDoneSubmit) {
                        //   provider.isJobStatusDoneSubmit = true;
                        if (provider.selectedWashImages.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please upload images.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (provider
                            .messageOwnerController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Message is required for owner.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          provider.jobStatusDoneApi(
                              widget.id.toString(),
                              "Done",
                              provider.messageOwnerController.text,
                              context);
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            color: ColorTheme.themeBlackColor,
                            fontSize: 18,
                            fontFamily: "SemiBold"),
                      ),
                    ),
                  ),
                ],
              )),
        bottomNavigationBar: bottomBar(context, provider),
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
                      provider.getWashImages(ImageSource.gallery);
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
                      provider.getWashImages(ImageSource.camera);
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
}
