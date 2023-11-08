import 'package:crud/pages/home_page.dart';
import 'package:flutter/material.dart';

class PreHomePage extends StatelessWidget {
  const PreHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Inicio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de Navegación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text(
                'Crear Notas',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Navega a la pantalla HomePage al hacer clic en "Crear Notas"
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
              },
            ),
            // Puedes agregar más elementos de navegación aquí
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://i.pinimg.com/originals/b5/da/8e/b5da8e9670122bfa5a18f20de59f0456.jpg',
              width: 100,
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                'Creadores de esta app:\nRodoni Matias\nMartín Rojas',
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
