import 'package:flutter/material.dart';

import 'package:proyecto_practica/src/services/crypto_service.dart';

// 2. Convertimos la pantalla a StatefulWidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 3. Declaramos nuestras variables de estado.
  // "late final" significa que la inicializaremos en initState y nunca cambiará.
  late final CryptoService cryptoService;
  // Esta variable guardará la "promesa" (el Future)
  late Future<List<dynamic>> _cryptoDataFuture;

  // 4. initState() se ejecuta UNA SOLA VEZ cuando la pantalla se crea.
  // Es el lugar perfecto para hacer la llamada a la API.
  @override
  void initState() {
    super.initState();
    // 5. Creamos la instancia de nuestro servicio
    cryptoService = CryptoService();
    // 6. ¡Llamamos a la función! Y guardamos la "promesa" en nuestra variable
    _cryptoDataFuture = cryptoService.fetchCryptoData(15);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cripto Precios (en Vivo)'),
        backgroundColor: Colors.indigo, // Cambiemos el color
      ),
      // 7. Usamos el widget MÁGICO: FutureBuilder
      body: FutureBuilder<List<dynamic>>(
        // 8. Le pasamos la "promesa" que guardamos en initState
        future: _cryptoDataFuture,

        // 9. El "builder" es una función que se llama CADA VEZ que
        // el estado del Future cambia (Cargando, Error, Éxito)
        builder: (context, snapshot) {
          
          // 10. ESTADO DE CARGA: Aún estamos esperando los datos
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mostramos un círculo de carga en el centro
            return const Center(child: CircularProgressIndicator());
          }

          // 11. ESTADO DE ERROR: El Future falló (no hay internet, etc.)
          if (snapshot.hasError) {
            // Mostramos el mensaje de error
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // 12. ESTADO DE ÉXITO: ¡Los datos llegaron!
          if (snapshot.hasData) {
            // 13. Extraemos la lista de datos del "snapshot"
            final data = snapshot.data!;

            // 14. ¡Construimos nuestra lista!
            // Usamos ListView.builder para crear una lista eficiente
            // que solo dibuja los items que se ven en pantalla.
            return ListView.builder(
              itemCount: data.length, // Cuántos items hay en la lista
              itemBuilder: (context, index) {
                // 15. Obtenemos la moneda individual para este "index"
                final coin = data[index];

                // 16. Usamos "ListTile", un widget perfecto para listas
                return ListTile(
                  // 17. leading: El widget que va a la izquierda
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(coin['image']),
                  ),
                  
                  // 18. title: El texto principal
                  title: Text(
                    coin['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  
                  // 19. subtitle: El texto secundario
                  subtitle: Text(coin['symbol'].toUpperCase()),
                  
                  // 20. trailing: El widget que va a la derecha
                  trailing: Text(
                    '\$${coin['current_price']}', // Mostramos el precio
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
            );
          }

          // 21. Estado por defecto (no debería llegar aquí, pero es bueno tenerlo)
          return const Center(child: Text('Iniciando...'));
        },
      ),
    );
  }
}

