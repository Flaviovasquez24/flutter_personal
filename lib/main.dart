import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';



void main() => runApp(MyApp());
  List<String> fotos =[
    "https://depor.com/resizer/LA5Xq1zVmryy-C4RKhLN2zTfBNE=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/EQMF6Y5DRBCZ7LWCREX3QVWKNY.jpg",
    "https://depor.com/resizer/Ufn_RqF93HG20bnzblK1M5KYUDE=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/RDTYP3KJGBDZ7GTWLWAQDUVHQQ.jpg",
    "https://depor.com/resizer/oDYwJaJnTohgWCIFuB82b_YH5ao=/648x374/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/7K4B4BWGHBBMLNCL3VTAVVOKLU.jpg",
    "https://depor.com/resizer/fiNH36cshPaRYQKdDICJ7Y6PJCc=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/W2DEZEBFC5ACJHGGJHSSTRGFA4.jpeg",

  ];

class MyApp extends StatelessWidget {


  const MyApp({key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY APP',
      initialRoute: '/',
      routes: {
        '/': (context) => Inicio(),
        '/detalle': (context) => Detalle(),
        '/configuracion': (context) => Configuracion(),
        '/galeria': (context) => Galeria(),
        },
    );
    }
    }




    class Inicio extends StatelessWidget {
Inicio({key}) : super(key : key);
@override
Widget build (BuildContext context) {
  return Scaffold(
              backgroundColor: Color.fromARGB(255, 187, 248, 198),

    appBar: AppBar(
      title: Text ("MI PRIMERA APP"),
    ),
    
    body: Align(
      alignment: Alignment.topCenter,
      child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

        children: [
          
          Text("ESCOGE ALGUN BOTON", style: TextStyle(fontSize: 24),),
          SizedBox(height: 28),
          ElevatedButton(
            
            onPressed: () => Navigator.pushNamed(context, '/detalle'),
            child: Text("ver detalles"),
          
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed:() => Navigator.pushNamed(context, '/configuracion'),
            child: Text('configuracion')
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed:() => Navigator.pushNamed(context, '/galeria') , child: Text('galeria'))
        ],
      )
    )
  );
}
}






class Detalle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 187, 248, 198),
      appBar: AppBar(
        
        title: Text("Detalle"),
      ),
      body: Align(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [Text('Este Texto sera de un color amarillo y tamaño de letra 20',  style: TextStyle(color: Colors.yellow, fontSize: 20,),  ),
        Text('Este texto sera de un color celeste y tendra un tamaño de letra 40 ',style: TextStyle(color: Color.fromARGB(255, 59, 232, 255), fontSize: 40,)),
        Text('Este texto sera de color rojo y tendra un tamaño de letra de 60', style: TextStyle(color: Color.fromARGB(255, 255, 59, 59), fontSize: 60,) ),
        
        ],)
        
      ),
    );
  }
}







class Configuracion extends StatefulWidget {
  @override
  _configuracion createState() => _configuracion();
}

  class _configuracion extends State<Configuracion> {
    double _currentValue = 0;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
              backgroundColor: Color.fromARGB(166, 187, 248, 198),

        appBar: AppBar(
          title: Text("Tamaño de letra"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(_currentValue.toString(), style: TextStyle(fontSize: 40),),
        Slider(value: _currentValue,
        min:0,
        max:28,
        divisions: 14,
        onChanged: (value) {
          setState(() {
            _currentValue = value;
          });
        }),
        ],
      ),
      );
    }
  }



class Galeria extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Equipos de futbol "),
    ),
    body: Align(
      
      child: 
      _fotos(),
      )
  );
}
}
Widget _fotos(){
  return Container(
    width: double.infinity,
    height: 250.0,
    child: new Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context,int index){
          return new Image.network(fotos[index], fit: BoxFit.fill,);
        },
        itemCount: fotos.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),

  );
}