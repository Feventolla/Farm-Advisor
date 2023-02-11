import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TermsText extends StatelessWidget {
  const TermsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        SizedBox(height: 25),
        Row(
        children: [
        SizedBox(width: 23,),
        Text("Terms and Conditions",textAlign: TextAlign.left ,style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 55, 81, 68))),
        ],
        ),
      Center(   
        child: Container(
        margin: const EdgeInsets.only(top:10.0,left: 15,right: 15),
        padding: const EdgeInsets.only(top:5.0,left: 10,right: 10),
        child:
        Text("Lorem ipsum dolor sit amet, consectetur erat mollis. nec tincidunt. per conubia nostra, per inceptos himenaeos. Ut commodo, nisl quis efficitur tristique, lorem metus commodo erat, a porta massa magna ut risus. Ut congue quam odio, ut tempus nibh maximus at. Integer laoreet sem neque, vel lobortis sapien aliquam eget. Phasellus non magna et elit porttitor vehicula sit amet at nisl. Quisque facilisis placerat commodo. Maecenas interdum, libero pharetra blandit pharetra, urna mauris fermentum lorem, eget mollis velit felis id dolor. Donec eu laoreet diam. Aliquam sed purus id urna convallis mollis non vestibulum libero. Fusce aliquet, turpis eu ultricies bibendum, enim mi mattis enim, eu laoreet nunc tellus quis enim. Ut faucibus convallis tortor sed viverra. Aenean facilisis, sem a convallis blandit, massa ante volutpat velit, sit amet consequat ante leo et leo. Vivamus consectetur bibendum metus nec iaculis. Vivamus eget nibh nunc",
              style: 
              
              TextStyle(
                color: Color.fromARGB(255, 124, 132, 128),
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                wordSpacing: 0,
                letterSpacing: 0.5,
                overflow: TextOverflow.fade,
                
           ),
          ) 
        ), 
       ),


       Center(   
        child: Container(
        margin: const EdgeInsets.only(top:10.0,left: 15,right: 15),
        padding: const EdgeInsets.only(top:5.0,left: 10,right: 10),
        child:
        Text("Lorem ipsum dolor sit amet, consectetur erat mollis. nec tincidunt. Fusce urna sapien, semper vel nulla sed, viverra imperdiet sapien.Phasellus rhoncus dolor vel blandit eleifend. Integer et rutrum ipsum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Lorem ipsum dolor sit amet, consectetur erat mollis. nec tincidunt. Fusce urna sapien, semper vel nulla sed, viverra imperdiet sapien.Phasellus rhoncus dolor vel blandit eleifend. Integer et rutrum ipsum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
              style: 
              
              TextStyle(
                color: Color.fromARGB(255, 124, 132, 128),
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                wordSpacing: 0,
                letterSpacing: 0.5,
                overflow: TextOverflow.fade,
                
           ),
          ) 
        ), 
       ),


       Center(   
        child: Container(
        margin: const EdgeInsets.only(top:15.0,left: 15,right: 15),
        padding: const EdgeInsets.only(top:10.0,left: 10,right: 10),
        child:
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id pellentesque nulla. Donec porta pretium risus vitae ultrices. Proin a eros id neque placerat feugiat tincidunt et ipsum. Praesent ut nisi ipsum. Praesent sed lectus mauris. Integer ullamcorper enim ac odio placerat mollis. Donec eu justo fermentum, varius erat a, accumsan dui. Praesent iaculis blandit neque vitae fermentum. Vivamus elit turpis, tincidunt vel justo semper, rutrum luctus ipsum. Ut a massa eu lorem malesuada aliquam ut id sem. Duis eu mollis eros. Mauris in ante vel magna eleifend scelerisque. Proin posuere ex eu porttitor ornare. Donec congue et nulla nec tincidunt. Fusce urna sapien, semper vel nulla sed, viverra imperdiet sapien.Phasellus rhoncus dolor vel blandit eleifend. Integer et rutrum ipsum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut commodo, nisl quis efficitur tristique, lorem metus commodo erat, a porta massa magna ut risus. Ut congue quam odio, ut tempus nibh maximus at. Integer laoreet sem neque, vel lobortis sapien aliquam eget. Phasellus non magna et elit porttitor vehicula sit amet at nisl. Quisque facilisis placerat commodo. Maecenas interdum, libero pharetra blandit pharetra, urna mauris fermentum lorem, eget mollis velit felis id dolor. Donec eu laoreet diam. Aliquam sed purus id urna convallis mollis non vestibulum libero. Fusce aliquet, turpis eu ultricies bibendum, enim mi mattis enim, eu laoreet nunc tellus quis enim. Ut faucibus convallis tortor sed viverra. Aenean facilisis, sem a convallis blandit, massa ante volutpat velit, sit amet consequat ante leo et leo. Vivamus consectetur bibendum metus nec iaculis. Vivamus eget nibh nunc",
              style: 
              
              TextStyle(
                color: Color.fromARGB(255, 124, 132, 128),
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                wordSpacing: 0,
                letterSpacing: 0.5,
                overflow: TextOverflow.fade,

                
           ),
          ) 
        ), 
       ), 

      ]
    );
  }
}
