import 'package:material_ui/material_ui.dart';
import '../models/product.dart';
import 'product_details_screen.dart';

class GesturesScreen extends StatefulWidget {
  const GesturesScreen({super.key});

  @override
  State<GesturesScreen> createState() => _GesturesScreenState();
}

class _GesturesScreenState extends State<GesturesScreen> {
  bool isFavourite = false;
  bool isExpanded = false;

  double horizontalPosition = 0;
  double verticalPosition = 0;

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget sectionCard({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFE7E4EB),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14AAA4E8),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4D536B),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF85899B),
            ),
          ),

          const SizedBox(height: 16),

          child,
        ],
      ),
    );
  }

  Widget hintChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF4D536B),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Product product = productList[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gestures & Animation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4D536B),
          ),
        ),
        backgroundColor: const Color(0xFFFBF9FC),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF4D536B)),
        shape: const Border(
          bottom: BorderSide(color: Color(0xFFE7E4EB)),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Gestures',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4D536B),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Try different gestures on the product below.',
              style: TextStyle(
                color: Color(0xFF85899B),
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 20),

            sectionCard(
              title: 'Tap Gestures',
              subtitle: 'Interact with the product card.',
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(product: product),
                        ),
                      );
                    },

                    onDoubleTap: () {
                      setState(() {
                        isFavourite = !isFavourite;
                      });

                      showMessage(
                        isFavourite
                            ? 'Added to favourites!'
                            : 'Removed from favourites!',
                      );
                    },

                    onLongPress: () {
                      showMessage(
                        'You pressed and held the product!',
                      );
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFBF9FC),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFFE7E4EB),
                        ),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.vertical(
                                  top: Radius.circular(17),
                                ),
                                child: Image.network(
                                  product.imageUrl,
                                  height: 190,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return Container(
                                      height: 190,
                                      width: double.infinity,
                                      color: const Color(0xFFE8E5F8),
                                      child: const Icon(
                                        Icons.shopping_bag_outlined,
                                        size: 50,
                                        color: Color(0xFFAAA4E8),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              Positioned(
                                top: 10,
                                right: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: const Color(0xFFDB8FA5),
                                    size: 26,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4D536B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      hintChip(
                        'Tap: open details',
                        const Color(0xFFE8E5F8),
                      ),
                      hintChip(
                        'Double tap: favourite',
                        const Color(0xFFF7DDE3),
                      ),
                      hintChip(
                        'Hold: message',
                        const Color(0xFFE0F0E8),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            sectionCard(
              title: 'Drag Gestures',
              subtitle: 'Drag the box horizontally or vertically.',
              child: Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E5F8),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      horizontalPosition += details.delta.dx;
                      horizontalPosition =
                          horizontalPosition.clamp(-100.0, 100.0);
                    });
                  },

                  onVerticalDragUpdate: (details) {
                    setState(() {
                      verticalPosition += details.delta.dy;
                      verticalPosition =
                          verticalPosition.clamp(-75.0, 75.0);
                    });
                  },

                  child: Center(
                    child: Transform.translate(
                      offset: Offset(
                        horizontalPosition,
                        verticalPosition,
                      ),
                      child: Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          color: const Color(0xFFAAA4E8),
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x40AAA4E8),
                              blurRadius: 14,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.open_with,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 22),

            sectionCard(
              title: 'Animation',
              subtitle: 'Tap the button to change the box size and color.',
              child: Column(
                children: [
                  SizedBox(
                    height: 170,
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        width: isExpanded ? 200 : 120,
                        height: isExpanded ? 150 : 100,
                        decoration: BoxDecoration(
                          color: isExpanded
                              ? const Color(0xFFF7DDE3)
                              : const Color(0xFFAAA4E8),
                          borderRadius: BorderRadius.circular(
                            isExpanded ? 30 : 15,
                          ),
                        ),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          size: 45,
                          color: isExpanded
                              ? const Color(0xFF4D536B)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      icon: const Icon(Icons.play_arrow_rounded),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFAAA4E8),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      label: const Text(
                        'Animate',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
