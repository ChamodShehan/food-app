import 'dart:async';

import 'package:delivery_app/components/constant.dart';
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({ Key? key }) : super(key: key);

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {

  Completer<GoogleMapController> _controller = Completer();

   static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(kGooglePlex: _kGooglePlex, controller: _controller),
          FooterSection(size: size)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }
   Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height/2,
        child:Stack(
          children: [
            Image.asset(
               Constant.imgAsset("tracking-footer.png"),
               width: size.width,
               fit: BoxFit.fill,
               ),
               Positioned(
                 top: 87,
                 left: 32,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     CustomeText(text: "Delivery time",fontSize: 14,fontWeight: FontWeight.w400,),
                     Row(
                       children: [
                         Icon(Icons.timer),
                         CustomeText(text: "20 min",fontWeight: FontWeight.w600,fontSize: 20,),
                        
                       ],
                     ),
                      SizedBox(height: 20,),
                       OrderStatusItem(status: "Order confirmed" ,statusText:"Your order has been Confirmed" ,),
                       SizedBox(height: 30,),
                       OrderStatusItem(status: "Order prepared" ,statusText:"Your order has been prepared" ,),
                       SizedBox(height: 30,),
                       OrderStatusItem(status: "Delivery in progress" ,statusText:"Hang on! Your food is on the way " ,isCompled: false,)
                   ],
                 ))
          ],
        )
           
           ),
    );
  }
}

class OrderStatusItem extends StatelessWidget {
  const OrderStatusItem({
    Key? key, this.isCompled=true, required this.status, required this.statusText,
  }) : super(key: key);

  final bool isCompled;
  final String status;
  final String statusText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvg(svgName:isCompled? "check":"uncheck"),
        SizedBox(
          width: 24,
        ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             CustomeText(text:status,fontSize: 14,fontWeight: FontWeight.w600,),
             CustomeText(text:statusText,fontSize: 12,fontWeight: FontWeight.w400,),
           ],
         ),
      ],
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({
    Key? key,
    required CameraPosition kGooglePlex,
    required Completer<GoogleMapController> controller,
  }) : _kGooglePlex = kGooglePlex, _controller = controller, super(key: key);

  final CameraPosition _kGooglePlex;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 529,
      child: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ),
    );
  }
}