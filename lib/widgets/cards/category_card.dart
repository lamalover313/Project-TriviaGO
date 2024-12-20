import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final Color color;
  final String imagePath;
  final bool isExpanded;
  final VoidCallback toggleExpansion;

  const CategoryCard({
    super.key,
    required this.text,
    required this.color,
    required this.imagePath,
    required this.isExpanded,
    required this.toggleExpansion,
  });

  void _navigateToPage(BuildContext context) {
    String route = '';
    
    switch (text) {
      case 'Arte':
        route = '/arte';
        break;
      case 'Ciencia':
        route = '/ciencia';
        break;
      case 'Deportes':
        route = '/deporte';
        break;
      case 'Geografía':
        route = '/geografia';
        break;
      case 'Historia':
        route = '/historia';
        break;
      default:
        route = '/';
    }

    context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: toggleExpansion,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    title: Center(
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                if (isExpanded)
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              _navigateToPage(context);
                            },
                            style: TextButton.styleFrom(
                                fixedSize: const Size.fromWidth(500)),
                            child: const Text("Facil"),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          color: Colors.grey.shade300,
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              _navigateToPage(context);
                            },
                            style: TextButton.styleFrom(
                                fixedSize: const Size.fromWidth(500)),
                            child: const Text("Medio"),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          color: Colors.grey.shade700,
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              _navigateToPage(context);
                            },
                            style: TextButton.styleFrom(
                                fixedSize: const Size.fromWidth(500)),
                            child: const Text(
                              "Dificil",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}