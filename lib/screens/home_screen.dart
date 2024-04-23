import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0)),
              leading: Image.network(
                "https://i.pinimg.com/originals/b4/82/e8/b482e8d9178debd58e1d10b656397319.png",
              ),
              title: const Text(
                'Candidate Name',
                style: TextStyle(fontSize: 14),
              ),
              trailing: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: Colors.indigo.shade900,
                child: const Text(
                  'Vote',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
