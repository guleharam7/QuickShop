import 'package:material_ui/material_ui.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter',
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

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 36,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: const Color(0xFFE7E4EB),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14AAA4E8),
                blurRadius: 24,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Your Counter',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4D536B),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Tap + or - to change the number.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF85899B),
                ),
              ),

              const SizedBox(height: 28),

              Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E5F8),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4D536B),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: decrement,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF7DDE3),
                      foregroundColor: const Color(0xFF4D536B),
                      elevation: 0,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                      Icons.remove,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 24),

                  ElevatedButton(
                    onPressed: increment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAAA4E8),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
