import 'package:doubleScroll/main.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  var mQ;
  @override
  Widget build(BuildContext context) {
    mQ = MediaQuery.of(context).size;
    return Container(
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12),
            child: Text(
              'Feed',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
            ),
          ),
            getModelList(),
            getModelList(),
            getModelList()
          
        ],
      ),
    );
  }
  getModelList(){

    return Column(
      children: <Widget>[
        ListTile(
            trailing: Icon(Icons.view_list, color: Colors.white,),
            title: Text('Nello Blue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
            subtitle: Text('Yesterday at 8:50 PM',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white30),),
            leading: CircleAvatar(
              
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),

          SizedBox(
            height: mQ.height*0.5,
            width:mQ.width,
            child: Image(image:NetworkImage( modelImage), fit: BoxFit.fill,),
          ),

      ],
    );
  }
}



var modelImage ="https://modelstalk.ng/wp-content/uploads/2019/05/IMG-20190509-WA0009.jpg";