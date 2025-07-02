import 'dart:math';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  String _weatherResult = '';

  final List<String> _funnyWeathers = [
    "Hujan rindu dari mantan 💔🌧",
    "Angin gosip tetangga 💨💬",
    "Gerimis tipis kayak harapan kamu ☔️",
    "Panasnya kayak deadline! 🔥",
    "Cuaca galau, bawa tisu 😢",
    "Mendung bawa kenangan 🫠☁️",
    "Badai cinta tak berbalas 🌪❤️",
    "Langit cerah seperti masa depanmu 🌞✨",
  ];

  void _generateWeather() {
    if (_formKey.currentState!.validate()) {
      final random = Random();
      final selected = _funnyWeathers[random.nextInt(_funnyWeathers.length)];
      setState(() {
        _weatherResult = 'Cuaca di ${_cityController.text}: $selected';
      });
    }
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ramalan Cuaca'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(Icons.cloud, size: 80, color: Colors.deepPurple),
              const SizedBox(height: 16),
              const Text(
                'Masukkan Nama Kota',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contoh: Malang',
                  prefixIcon: Icon(Icons.location_city),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kota tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _generateWeather,
                icon: const Icon(Icons.wb_incandescent),
                label: const Text('Lihat Ramalan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (_weatherResult.isNotEmpty)
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.purple.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      _weatherResult,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
