import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency-card.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xFF181818),
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Hey, Geony",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text('Welcome back',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                  )),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      const Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '\$5 194 482',
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            text: 'Transfer',
                            bgcolor: Color(0xFFF1B33B),
                            textColor: Colors.black,
                          ),
                          Button(
                              text: "Request",
                              bgcolor: Color(0xFF1F2123),
                              textColor: Colors.white),
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wallets',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'View All',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CurrencyCard(
                        name: 'Euro',
                        code: 'EUR',
                        amount: '6 428',
                        icon: Icons.euro_rounded,
                        isInverted: false,
                      ),
                      Transform.translate(
                        offset: const Offset(0, -20),
                        child: const CurrencyCard(
                          name: 'Bitcoin',
                          code: 'BTC',
                          amount: '9 658',
                          icon: Icons.currency_bitcoin_rounded,
                          isInverted: true,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -40),
                        child: const CurrencyCard(
                          name: 'Dollar',
                          code: 'USD',
                          amount: '1 234',
                          icon: Icons.attach_money_rounded,
                          isInverted: false,
                        ),
                      ),
                    ],
                  )),
            )));
  }
}
