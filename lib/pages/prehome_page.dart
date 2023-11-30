import 'package:crud/pages/home_page.dart';
import 'package:flutter/material.dart';

class PreHomePage extends StatelessWidget {
  const PreHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      backgroundColor: Colors.green[700],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent[400],
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
              leading: Icon(
                Icons.edit,
                color: Colors.green[700],
              ),
              title: Text(
                'Crear Notas',
                style: TextStyle(
                  color: Colors.green[700],
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
              'https://static.vecteezy.com/system/resources/previews/011/288/616/original/a-light-green-paper-note-attached-to-a-map-pin-suitable-for-writing-study-notes-at-home-or-at-work-free-png.png',
              width: 150,
              height: 150,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                'Aplicacion para crear notas',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.green[700],
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
