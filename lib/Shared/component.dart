
import 'package:flutter/material.dart';
import 'package:napp/Modules/WebViewScreen.dart';

double width(context,size)=>MediaQuery.of(context).size.width*size;
double height(context,size)=>MediaQuery.of(context).size.height*size;

Widget BuildRowItem(articles,context)=>InkWell(
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        articles['urlToImage']!=null? Container(

          height: 120,

          width:120,

          decoration:BoxDecoration(

              image:DecorationImage(

                image: NetworkImage('${articles['urlToImage']}'),

                fit: BoxFit.fill,



              )

          ),

        ):Container(
          height: 120,
          width:120,
          color: Colors.grey[300],
          child: Icon(Icons.image,size: 50,),

        ),
        SizedBox(

          width:20,

        ),
        Expanded(
          child: Container(
            height: 150,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Expanded(
                  child: Text(
                    '${articles['title']}',
                    maxLines: 4,
                    overflow:TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                           textAlign: TextAlign.right,
                  ),

                ),
                SizedBox(height: 10,),
                Text(
                    '${articles['publishedAt']}',

                  style: Theme.of(context).textTheme.bodyText2

                )

              ],

            ),

          ),

        )

      ],

    ),

  ),
  onTap: (){
    navigateTo(context, WebViewScreen(articles['url']));
  }
);

Widget DefaultTextField(
    {
      required TextInputType? type,
      required TextEditingController? controller,
      required String label,
      required IconData prefix,
      IconData? suffix,
      required  function,
      bool secure = false,
      SuffixPressed,
      Function? onSubmit,
      OnTap,
      Function? onchange,
    }
    )=>TextFormField(
  onTap: OnTap,
  keyboardType: type,
  obscureText: secure,
  controller:controller ,
  validator:function,
  onFieldSubmitted:(s) {
    onSubmit!(s);
  },
  onChanged: (n){
    onchange!(n);
  },

  decoration:InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      prefixIcon: Icon(
          prefix
      ),
      suffixIcon: TextButton(
        onPressed: SuffixPressed,
        child: Icon(
            suffix
        ),
      )

  ) ,
);
void navigateTo(
    context,
    Widget
    )=>Navigator.push(context,
    MaterialPageRoute(builder: (context)=>Widget));