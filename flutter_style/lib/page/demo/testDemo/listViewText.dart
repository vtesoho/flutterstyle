import 'package:flutter/material.dart';




class ListViewTextDemo extends StatefulWidget {
  ListViewTextDemo({Key key}) : super(key: key);

  @override
  _ListViewTextDemoState createState() => _ListViewTextDemoState();
}

class _ListViewTextDemoState extends State<ListViewTextDemo> {
  List list = [
    'http://content.cdn.shuachi.com/food-new/e0b4fe29b70f0d1246cea359e6d608c2?imageView2/0/w/120&sign=8c2eb4590a3b76a24e4ac0368a65a366&t=5db98eb0',
    'http://content.cdn.shuachi.com/food-new/32f388241840d1289a2c153982e242b4?imageView2/0/w/120&sign=7ad385de4205fcf231380dee962f5eb6&t=5db98eb0',
    'http://content.cdn.shuachi.com/food-new/cb57c8b76e34a84451cf80b7d79cf5e3?imageView2/0/w/120&sign=e437717c577a59df5534b4d98a19dff2&t=5db98eb0',
    'http://content.cdn.shuachi.com/food-new/1hk4ecvmk28xnte8.jpg?imageView2/0/w/120&sign=dbba55be5e7ab394a8666c0e16015911&t=5db98b91',
    'http://content.cdn.shuachi.com/food-new/dt842ni6bwogu6t2.jpg?imageView2/0/w/120&sign=b7407831ab5441b2d07d65c7e70c66a2&t=5db98eb0',
    'http://content.cdn.shuachi.com/food-new/dkdsodh3xlq0o7oe.jpg?imageView2/0/w/120&sign=55559ae40ab5109bd291ae4c421ccda3&t=5db98ec3',
    'http://content.cdn.shuachi.com/food-new/1109a44adba3d8aaf120f904fa93927e?imageView2/0/w/120&sign=e71889eeacf8cb2ddcc6b748e444de91&t=5db98ec3',
    'http://content.cdn.shuachi.com/food-new/1bbd8665d52c0c54772c7af7f650a61f?imageView2/0/w/120&sign=5582836408144c2b4f42164d5782dff2&t=5db98ec3',
    'http://content.cdn.shuachi.com/food-new/vwf0stq5discw9fa.jpg?imageView2/0/w/120&sign=018f13ca79fa5f1ac4381911221f279e&t=5db98ec3',
    'http://content.cdn.shuachi.com/food-new/96e246726118ed90ff044084c136f649?imageView2/0/w/120&sign=d1818b70c49f0cae5d426fab48e8dada&t=5db99344',
    'http://content.cdn.shuachi.com/food-new/zq5yguciaafjty5b.jpg?imageView2/0/w/120&sign=252b1725d68d2899cec27a35ca54ad0a&t=5db98b92',
    'http://content.cdn.shuachi.com/food-new/6atf1xvo4yrhziqp.jpg?imageView2/0/w/120&sign=4840aa89f321e16294c4b1fffd24e420&t=5db98a87',
    'http://content.cdn.shuachi.com/food-new/19869561322e4e295c081e4b26782752?imageView2/0/w/120&sign=5ae92ba176fa5395bb85ceee8a84248d&t=5db98a87',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context,index){
          return Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              '${list[index]}',
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
