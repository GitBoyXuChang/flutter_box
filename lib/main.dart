import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Box',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Box'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("PaddingDemo"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new PaddingDemo();
                    }));
              },
            ),
            FlatButton(
              child: Text("ConstrainedBoxAndSizeBoxDemo"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new ConstrainedBoxAndSizeBoxDemo();
                    }));
              },
            ),
            FlatButton(
              child: Text("DecoratedBoxDemo"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new DecoratedBoxDemo();
                    }));
              },
            ),
            FlatButton(
              child: Text("TransformDemo"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new TransformDemo();
                    }));
              },
            ),
            FlatButton(
              child: Text("ContainerDemo"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new ContainerDemo();
                    }));
              },
            ),
          ],
        ),
      ),
    );
  }
}


/*Padding
Padding可以给其子节点添加补白（填充），我们在前面很多示例中都已经使用过它了，现在来看看它的定义：

Padding({
  ...
  EdgeInsetsGeometry padding,
  Widget child,
})
EdgeInsetsGeometry是一个抽象类，开发中，我们一般都使用EdgeInsets，它是EdgeInsetsGeometry的一个子类，定义了一些设置补白的便捷方法。

EdgeInsets
我们看看EdgeInsets提供的便捷方法：

fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的补白。
all(double value) : 所有方向均使用相同数值的补白。
only({left, top, right ,bottom })：可以设置具体某个方向的补白(可以同时指定多个方向)。
symmetric({ vertical, horizontal })：用于设置对称方向的补白，vertical指top和bottom，horizontal指left和right。*/
class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaddingDemo"),
      ),
      body:
      Padding(
        //上下左右各添加16像素补白
        padding: EdgeInsets.all(16.0),
        child: Column(
          //显式指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              //左边添加8像素补白
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Hello world"),
            ),
            Padding(
              //上下各添加8像素补白
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("I am Jack"),
            ),
            Padding(
              // 分别指定四个方向的补白
              padding: const EdgeInsets.fromLTRB(20.0,.0,20.0,20.0),
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}


/*
* ConstrainedBox和SizedBox
ConstrainedBox和SizedBox都是通过RenderConstrainedBox来渲染的。SizedBox只是ConstrainedBox一个定制，本节把他们放在一起讨论。

ConstrainedBox
ConstrainedBox用于对齐子widget添加额外的约束。例如，如果你想让子widget的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子widget的约束。
*
*
* BoxConstraints
BoxConstraints用于设置限制条件，它的定义如下：

const BoxConstraints({
  this.minWidth = 0.0, //最小宽度
  this.maxWidth = double.infinity, //最大宽度
  this.minHeight = 0.0, //最小高度
  this.maxHeight = double.infinity //最大高度
})
BoxConstraints还定义了一些便捷的构造函数，用于快速生成特定限制规则的BoxConstraints，如BoxConstraints.tight(Size size)，它可以生成给定大小的限制；const BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的BoxConstraints。除此之外还有一些其它的便捷函数，读者可以查看API文档。

SizedBox
SizedBox用于给子widget指定固定的宽高，如：

SizedBox(
  width: 80.0,
  height: 80.0,
  child: redBox
)


实际上SizedBox和只是ConstrainedBox一个定制，上面代码等价于：

ConstrainedBox(
  constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
  child: redBox,
)
而BoxConstraints.tightFor(width: 80.0,height: 80.0)等价于：

BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
*
* */

class ConstrainedBoxAndSizeBoxDemo extends StatelessWidget {
  Widget redBox=DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaddingDemo"),
      ),
      body:

      ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: double.infinity, //宽度尽可能大
            minHeight: 50.0 //最小高度为50像素
        ),
        child: Container(
            height: 5.0,
            child: redBox
        ),
      )
    );
  }
}

class DecoratedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PaddingDemo"),
        ),
        body:
        DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                borderRadius: BorderRadius.circular(3.0), //3像素圆角
                boxShadow: [ //阴影
                  BoxShadow(
                      color:Colors.black54,
                      offset: Offset(2.0,2.0),
                      blurRadius: 4.0
                  )
                ]
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
              child: Text("Login", style: TextStyle(color: Colors.white),),
            )
        )
    );
  }
}

class TransformDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PaddingDemo"),
        ),
        body:Center( child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.black,
            child: new Transform(
              alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
              transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),

          DecoratedBox(
            decoration:BoxDecoration(color: Colors.red),
            //默认原点为左上角，左移20像素，向上平移5像素
            child: Transform.translate(offset: Offset(-20.0, -5.0),
              child: Text("Hello world"),
            ),
          ),
          DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              child: Transform.scale(
                  scale: 1.5, //放大到1.5倍
                  child: Text("Hello world")
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                  decoration:BoxDecoration(color: Colors.red),
                  child: Transform.scale(scale: 1.5,
                      child: Text("Hello world")
                  )
              ),
              Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                //将Transform.rotate换成RotatedBox
                child: RotatedBox(
                  quarterTurns: 1, //旋转90度(1/4圈)
                  child: Text("Hello world"),
                ),
              ),
              Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
            ],
          ),

          ],
         ),
        ),
    );
  }
}

/*
* Container
Container是我们要介绍的最后一个容器类widget，它本身不对应具体的RenderObject，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等widget的一个组合widget。所以我们只需通过一个Container可以实现同时需要装饰、变换、限制的场景。下面是Container的定义：

Container({
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
})
大多说属性在介绍其它容器时都已经介绍过了，不再赘述，但有两点需要说明：

容器的大小可以通过width、height属性来指定，也可以通过constraints来指定，如果同时存在时，width、height优先。实际上Container内部会根据width、height来生成一个constraints。
color和decoration是互斥的，实际上，当指定color时，Container内会自动创建一个decoration。*/

class ContainerDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaddingDemo"),
      ),
      body:/*Center( child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[


        ],
      ),
      ),*/
      Container(
        margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外补白
        constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
        decoration: BoxDecoration(//背景装饰
            gradient: RadialGradient( //背景径向渐变
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98
            ),
            boxShadow: [ //卡片阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
              )
            ]
        ),
        transform: Matrix4.rotationZ(.2), //卡片倾斜变换
        alignment: Alignment.center, //卡片内文字居中
        child: Text( //卡片文字
          "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      )

    );
  }
}