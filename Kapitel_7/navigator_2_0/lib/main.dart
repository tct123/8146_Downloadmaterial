import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyPizzaApp());
}

class MyPizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _RouteInformationParser(),
      routerDelegate: _RouterDelegate(),
    );
  }
}

class PizzaRoute {
  PizzaRoute.home()
    : flow = PizzaPage.homeLocation,
      category = null,
      flavor = null,
      size = 0;

  PizzaRoute.fromUri({Uri uri})
    : assert(uri.pathSegments.isNotEmpty),
      flow = uri.pathSegments.elementAt(0),
      category =
          uri.pathSegments.length > 1 ? uri.pathSegments.elementAt(1) : null,
      flavor =
          uri.pathSegments.length > 2 ? uri.pathSegments.elementAt(2) : null,
      size = int.parse(
        uri.pathSegments.length > 3 ? uri.pathSegments.elementAt(3) : '0',
      );

  // Use Case der App
  String flow;

  // pizza
  String category;

  // salami
  String flavor;

  // 26 cm
  int size;
}

abstract class PizzaPage {
  static const String homeLocation = '/';
  static const String listLocation = 'list';
  static const String detailsLocation = 'details';

  static MaterialPage get homePage => MaterialPage(child: _HomePageWidget());

  static MaterialPage detailPage(PizzaRoute pizzaRoute) =>
      MaterialPage(child: _DetailPageWidget(pizzaRoute: pizzaRoute));

  static MaterialPage get listPage => MaterialPage(child: _ListPageWidget());
}

class _ListPageWidget extends StatelessWidget {
  const _ListPageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:
            ['Salami', 'Thunfisch', 'Schinken']
                .map(
                  (x) => ElevatedButton(
                    onPressed: () {
                      final pizzaRoute = PizzaRoute.fromUri(
                        uri: Uri(path: '/details/pizza/salami/26'),
                      );

                      Navigator.of(context).pushNamed(
                        PizzaPage.detailsLocation,
                        arguments: pizzaRoute,
                      );
                    },
                    child: Text(x),
                  ),
                )
                .toList()
              // den Zurück-Button hinzufügen
              ..add(
                ElevatedButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text('Zurück'),
                ),
              ),
      ),
    );
  }
}

class _DetailPageWidget extends StatelessWidget {
  const _DetailPageWidget({Key key, this.pizzaRoute}) : super(key: key);

  final PizzaRoute pizzaRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Art: ${pizzaRoute.category}'),
            Text('Sorte: ${pizzaRoute.flavor}'),
            Text('Größe: ${pizzaRoute.size}'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Zurück'),
            ),
          ],
        ),
      ),
    );
  }
}

// In eigenes Widget auslagern, damit der aktuelle BuildContext über
// die build-Methode zugeführt wird. Dann kann der Router aufgelöst werden,
// um eine neue RouteInformation einzutragen.
class _HomePageWidget extends StatelessWidget {
  const _HomePageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Willkommen'),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final pizzaRoute = PizzaRoute.fromUri(
                  uri: Uri(path: '/details/pizza/salami/26'),
                );
                Router.of(context).routerDelegate.setNewRoutePath(pizzaRoute);
              },
              child: Text('Zum Detail'),
            ),
          ],
        ),
      ),
    );
  }
}

class _RouteInformationParser extends RouteInformationParser<PizzaRoute> {
  @override
  Future<PizzaRoute> parseRouteInformation(RouteInformation routeInformation) {
    final uri = Uri(path: routeInformation.location);
    final pizzaRoute =
        uri.pathSegments.isEmpty
            ? PizzaRoute.home()
            : PizzaRoute.fromUri(uri: uri);

    // Die Methodensignatur fordert eine Future
    return SynchronousFuture(pizzaRoute);
  }
}

class _RouterDelegate extends RouterDelegate<PizzaRoute> {
  ValueNotifier<List<Page>> _navigationHistory = ValueNotifier<List<Page>>([
    PizzaPage.homePage,
  ]);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Page>>(
      valueListenable: _navigationHistory,
      builder: (context, history, child) {
        return Navigator(
          key: UniqueKey(),
          pages: history,
          onGenerateRoute: (routeSettings) {
            switch (routeSettings.name) {
              case PizzaPage.detailsLocation:
                return MaterialPageRoute(
                  builder:
                      (context) => _DetailPageWidget(
                        pizzaRoute: routeSettings.arguments as PizzaRoute,
                      ),
                );
              default:
                return MaterialPageRoute(
                  builder: (context) => _HomePageWidget(),
                );
            }
          },
          onPopPage: (route, result) => route.didPop(result),
        );
      },
    );
  }

  @override
  Future<bool> popRoute() {
    if (_navigationHistory.value.length > 1) {
      _navigationHistory.value.removeLast();
    }

    // Mit true signalisiert der Delegate, dass er
    // das Ereignis verarbeiten wird.
    return SynchronousFuture(true);
  }

  @override
  Future<void> setNewRoutePath(PizzaRoute configuration) {
    // Der Parser hat eine neue Konfiguration (PizzaRoute) erzeugt.
    // Hier kann der Delegate darauf reagieren.
    switch (configuration.flow) {
      case PizzaPage.detailsLocation:
        _navigationHistory.value = [
          PizzaPage.homePage,
          PizzaPage.listPage,
          PizzaPage.detailPage(configuration),
        ];
        break;
      default:
        _navigationHistory.value = [PizzaPage.homePage];
        break;
    }

    return SynchronousFuture(null);
  }

  // RouterDelegate erweitert Listenable, das
  // wiederum fordert addListener und removeListener
  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}
}
