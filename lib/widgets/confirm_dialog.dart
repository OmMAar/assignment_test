import 'package:flutter/material.dart';


class ConfirmDialog extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => ConfirmDialogState();
}

class ConfirmDialogState extends State<ConfirmDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
//    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutBack);

    controller.addListener(() {
      if(mounted)
        setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),

              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text(
                    'AlertDialog Title',
                    style: TextStyle(color: Colors.black,fontSize: 25),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                    top: 4.0),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('AlertDialog description',
                    style: TextStyle(color: Colors.black,fontSize: 20),),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                  Container(
                      child: TextButton(
                        child: Text("Cancel", style: TextStyle(color: Colors.blue,fontSize: 20),),
                        onPressed: (){},
                      )),
                  Container(
                      child: TextButton(
                        child: Text("Ok" ,style: TextStyle(color: Colors.blue,fontSize: 20),),
                        onPressed: (){},
                      )),

                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              )),
        ),
      ),
    );
  }
}
