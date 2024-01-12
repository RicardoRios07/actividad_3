import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador App',
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int contador = 1;

  void actualizarContador(int nuevoContador) {
    setState(() {
      contador = nuevoContador;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $contador'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PantallaA(contador, actualizarContador),
                  ),
                );
              },
              child: Text('Ir a Pantalla A'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PantallaB(contador, actualizarContador),
                  ),
                );
              },
              child: Text('Ir a Pantalla B'),
            ),
          ],
        ),
      ),
    );
  }
}

class PantallaA extends StatelessWidget {
  final int contador;
  final Function(int) actualizarContador;

  PantallaA(this.contador, this.actualizarContador);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador en Pantalla A: $contador'),
            ElevatedButton(
              onPressed: () {
                actualizarContador(contador + 1);
              },
              child: Text('Incrementar Contador en A'),
            ),
          ],
        ),
      ),
    );
  }
}

class PantallaB extends StatelessWidget {
  final int contador;
  final Function(int) actualizarContador;

  PantallaB(this.contador, this.actualizarContador);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador en Pantalla B: $contador'),
            ElevatedButton(
              onPressed: () {
                actualizarContador(contador + 1);
              },
              child: Text('Incrementar Contador en B'),
            ),
          ],
        ),
      ),
    );
  }
}