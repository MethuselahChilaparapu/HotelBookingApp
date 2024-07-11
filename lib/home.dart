import 'package:flutter/material.dart';
import 'hotelbooking.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Hotel Booking"),
      ),

      body: ListView(
        children: const [
          Image(
            image: NetworkImage('https://cf.bstatic.com/xdata/images/hotel/max1024x768/370564672.jpg?k=4f37af06c05a6f5dfc7db5e8e71d2eb66cae6eec36af7a4a4cd7a25d65ceb941&o=&hp=1')
          ),
          SizedBox(height: 10),
          Center(
            child: Text('Hotel Chennai : Rs3000/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
          ),
          
          Image(
            image: NetworkImage('https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg')
          ),

          SizedBox(height: 10),
          Center(
            child: Text('Hotel Kolkata : Rs10000/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
          ),

          Image(
            image: NetworkImage('https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=')
          ),

          SizedBox(height: 10),
          Center(
            child: Text('Hotel Bangalore : Rs7000/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
          ),

          Image(
            image: NetworkImage('https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/900/450/75/dam/wdpro-assets/dlr/places-to-stay/disneyland-hotel/resort-overview/disneyland-hotel-06.jpg?1719924985224')
          ),

          SizedBox(height: 10),
          Center(
            child: Text('Hotel Delhi : Rs11000/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
          ),
         
          Image(
            image: NetworkImage('https://www.ohotelsindia.com/goa/images/bccadd6018a0421487734769d7014e73.jpg')
          ),

          SizedBox(height: 10),
          Center(
            child: Text('Hotel Goa : Rs15000/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
          ),

          Image(
            image: NetworkImage('https://www.tripsavvy.com/thmb/gL2xz31e3naA03VzGR3mwp1ksBc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Signature-from-pool-37748a3a59b44a3c8fe88b7e9ef3983e.jpeg')
          ),

          SizedBox(height: 10),
          Center(
            child: Text('Hotel Hyderabad : Rs17000/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
          ),

          Image(
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNWMPreXboMoHMjXm_FoynvJKtpquk45kvnw&s')
          ),

          SizedBox(height: 10),
          Center(
            child: Text('Hotel Kerala : Rs20000/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
          ),
      ],
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1018497974.
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HotelBookingPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
     );
  }
}
