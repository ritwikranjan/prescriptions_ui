import 'package:dotted_border/dotted_border.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: PaymentSuccessfulPage(),
      ),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with FlareController {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0, right: 30, left: 30),
            alignment: Alignment.center,
            color: Colors.white,
            child: CircleAvatar(
              radius: 125,
              backgroundImage: NetworkImage(
                  'https://www.vhv.rs/dpng/d/246-2462095_clip-art-baby-loading-clipart-baby-loading-hd.png'),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            child: FlareActor(
              "assets/loading.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: 'activate',
              controller: this,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Please Wait\n',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6B7588),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: 'while',
                        style: TextStyle(
                          color: Color(0xFF6B7588),
                        )),
                    TextSpan(
                        text: ' curer ',
                        style: TextStyle(
                          color: Color(0xFFDF546B),
                        )),
                    TextSpan(
                        text: 'is finding best doctor for you',
                        style: TextStyle(
                          color: Color(0xFF6B7588),
                        )),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    return false;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {}

  @override
  void setViewTransform(Mat2D viewTransform) {}
}

List<String> imageList = [
  'https://cdn.mos.cms.futurecdn.net/VRv8ab66tAfezxvXdXVpfe-1200-80.jpg',
  'https://blog.universalmedicalinc.com/wp-content/uploads/sites/264/gallery/postimages/cache/photodune-2618118-hands-xray-l.JPG-nggid042182-ngg0dyn-0x0x100-00f0w010c010r110f110r010t010.JPG'
];

class FeverReceipts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
          crossAxisCount: 3,
          children: imageList
              .map((e) => FeverReceiptsChildren(
                    imgUrl: e,
                  ))
              .toList()),
    );
  }
}

class FeverReceiptsChildren extends StatelessWidget {
  final String imgUrl;

  const FeverReceiptsChildren({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(5),
      child: Image.network(imgUrl),
    );
  }
}

class PaymentSuccessfulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 30.0, right: 30, left: 30),
              alignment: Alignment.center,
              color: Colors.white,
              child: Image.network(
                  'https://dustisolutions.com/wp-content/uploads/2017/10/payment-success.png'),
            ),
          ),
          Container(
            child: Text(
              'Your Payment was Successful',
              style: TextStyle(fontSize: 35),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.fromLTRB(35, 10, 35, 40),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {},
              child: Text('Back to Home'),
            ),
          )
        ],
      ),
    );
  }
}

class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(30.0),
              alignment: Alignment.center,
              color: Colors.white,
              child: Image.network(
                  'https://library.kissclipart.com/20180829/cbq/kissclipart-feedback-png-clipart-computer-icons-clip-art-ada4d68f22aba3e2.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(25),
            alignment: Alignment.center,
            color: Colors.white,
            child: RatingBar(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            color: Colors.grey[300],
            child: TextField(
              minLines: 5,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: 'Write Something',
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 10, 25, 40),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {},
              child: Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Image.network(
                'https://www.slideteam.net/media/catalog/product/cache/960x720/3/d/3d_man_with_thank_you_text_board_stock_photo_Slide01.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Your Appointment is Scheduled',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Payment options will be valid for 30 min',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: RaisedButton(
              onPressed: () {},
              child: Text('Pay Now'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class PrescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        PrescriptionTile(),
      ],
    );
  }
}

class PrescriptionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    'https://image.shutterstock.com/image-photo/doctor-wearing-medical-mask-gloves-260nw-1675175770.jpg'),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('dfiuhaduif'),
                          Text('jhvhj'),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey[400],
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('gsdiua | time'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentFailure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 30.0, right: 30, left: 30),
              alignment: Alignment.center,
              color: Colors.white,
              child: Image.asset('images/failed.png'),
            ),
          ),
          Container(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Payment ',
                  style: TextStyle(fontSize: 35, color: Colors.blueGrey[900]),
                  children: [
                    TextSpan(
                        text: 'Failed',
                        style: TextStyle(
                          color: Colors.red,
                        ))
                  ]),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.fromLTRB(35, 10, 35, 40),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {},
              child: Text('Retry Payment'),
            ),
          )
        ],
      ),
    );
  }
}
