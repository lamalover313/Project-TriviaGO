import 'package:flutter/material.dart';
import 'package:myapp/classes/providerArte.dart';
import 'package:myapp/classes/models.dart';
//import 'package:myapp/widgets/custom/custom_elevated_button.dart';
//import 'package:myapp/widgets/custom/custom_background_overlay.dart';
import 'package:myapp/widgets/custom/custom_app_bar.dart';

class GeografiaPage extends StatelessWidget {
  final geprovider = GEProvider();
  final gmprovider = GMProvider();
  final ghprovider = GHProvider();

  GeografiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Geografía'),
        body: FutureBuilder(
            future: GEProvider().getProductsAsync(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error al obtener los productos'),
                );
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: Text('No hay productos'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final api apppi = snapshot.data![index];
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(apppi.question),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(apppi.correctanswer)),
                            TextButton(
                                onPressed: () {},
                                child: Text(apppi.incorrectanswer1)),
                            TextButton(
                                onPressed: () {},
                                child: Text(apppi.incorrectanswer2)),
                            TextButton(
                                onPressed: () {},
                                child: Text(apppi.incorrectanswer3)),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }));
  }
}
