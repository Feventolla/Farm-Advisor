import 'package:farmadvisor/screens/Onboarding/widgets/termtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  State<TermsPage> createState() => _TermsPageState();
}


class _TermsPageState extends State<TermsPage> {
  @override

  
final list = List.generate((40), (val) => "val $val");
          final ScrollController _controller = new ScrollController();
          var reachEnd = false;

          _listener() {
            final maxScroll = _controller.position.maxScrollExtent;
            final minScroll = _controller.position.minScrollExtent;
            if (_controller.offset >= maxScroll) {
              setState(() {
                reachEnd = true;
              });
            }

            if (_controller.offset <= minScroll) {
              setState(() {
                reachEnd = false;
              });
            }
          }

          @override
          void initState() {
            _controller.addListener(_listener);
            super.initState();
          }

          @override
          void dispose() {
            _controller.removeListener(_listener);
            _controller.dispose();
            super.dispose();
          }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TERMS & CONDITIONS",
          style: TextStyle(
            color: Color.fromARGB(95, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
      icon: Icon(
        Icons.close,
        color: Color.fromARGB(255, 165, 176, 172),
      ),
      onPressed: () {
        // do something
      },),
    ),
    body: 
          Column(

            children: [

              Expanded(
                child: SingleChildScrollView(
                  controller: _controller,
                scrollDirection: Axis.vertical,
                child: TermsText(),
              ),
              ),
              SizedBox(height: 20),
             RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color:reachEnd? Color(0xFF275342): Color.fromARGB(255, 106, 196, 160),
              child: Text(
                "AGREE TO TERMS AND CONDITIONS",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              textColor: Colors.white,
              highlightColor: Color.fromARGB(255, 119, 72, 72),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
              onPressed: reachEnd? ( ) {} : null),

              SizedBox(height: 10) 
        ]
            
           
          ),
        );
  }
}
