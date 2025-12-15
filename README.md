# 🚀 CryptoTracker: Monitor de Criptomonedas en Tiempo Real

Una aplicación móvil desarrollada en **Flutter** que permite visualizar el estado actual del mercado de criptomonedas. Este proyecto demuestra el consumo eficiente de **APIs RESTful**, manejo de estados asíncronos y una arquitectura limpia y escalable.

<img src="https://github.com/FelixMGZ/API---List-of-Cryptocurrencies/blob/main/imagen/Screenshot_1765822874.png" alt="Captura de pantalla de la aplicación" width="400"/>

## ✨ Características Principales

* **Conexión API en Tiempo Real:** Consumo de datos en vivo desde la API pública de CoinGecko.
* **Manejo de Estados Asíncronos:** Implementación robusta de `FutureBuilder` para gestionar estados de carga (loading), error y éxito.
* **Arquitectura Limpia:** Estructura de carpetas profesional separando la lógica de negocio (`services`), la interfaz de usuario (`features`) y los modelos de datos (`models`).
* **Diseño Responsivo:** Uso de `ListView.builder` para un renderizado eficiente de listas extensas.

## 🛠️ Tecnologías Utilizadas

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **Networking:** Paquete `http` para peticiones GET.
* **JSON Parsing:** Serialización y deserialización manual de datos complejos.

## 🧠 Lo que aprendí construyendo esto

Este proyecto fue diseñado para dominar los fundamentos de la comunicación Cliente-Servidor en aplicaciones móviles:
1.  Cómo realizar peticiones HTTP asíncronas (`async`/`await`).
2.  Cómo transformar respuestas JSON crudas en objetos Dart tipados.
3.  Cómo separar la capa de servicio (la lógica que pide los datos) de la capa de presentación (los widgets).

## 🔧 Cómo ejecutar este proyecto

1.  Clona el repositorio:
    ```bash
    git clone [https://github.com/FelixMGZ/NOMBRE_DE_TU_REPO.git](https://github.com/FelixMGZ/NOMBRE_DE_TU_REPO.git)
    ```
2.  Instala las dependencias:
    ```bash
    flutter pub get
    ```
3.  Ejecuta la aplicación:
    ```bash
    flutter run
    ```

---
**Desarrollado por [FelixMGZ](https://github.com/FelixMGZ)** - *Desarrollador Flutter Junior disponible para proyectos freelance.*
