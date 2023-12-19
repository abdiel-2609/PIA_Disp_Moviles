import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pia_disp_moviles/ui/utils/model_recetas.dart';
import 'package:pia_disp_moviles/ui/widgets/widget_menu.dart';
import 'data/recetas_data.dart';
import 'mostrar_receta.dart';

class Carousel extends StatefulWidget {
  final Receta? carruselImages;
  const Carousel({
    Key? key,
    this.carruselImages,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  // List<Receta> carrusel = [];

  // @override
  // void initState() {
  //   super.initState();
  //   carrusel = carruselImages;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 223, 228),
      drawer: const MenuLateral(),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Recomendaciones de Rutinas"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          CarouselSlider.builder(
            itemCount: carruselImages.length,
            itemBuilder: (context, index, realIndex) {
              // ignore: unused_local_variable
              final carruselImage = carruselImages[index];
              return CardImages(carruselImages: carruselImages[index],);
            },
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class CardImages extends StatelessWidget {
  final Receta carruselImages;
  const CardImages({Key? key, required this.carruselImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            carruselImages.copy();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MostrarReceta(
                      carruselImages: carruselImages,
                    )));
          },
          child: FadeInImage(
            placeholder: const AssetImage("assets/loading1.gif"),
            image: AssetImage(carruselImages.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
