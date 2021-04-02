# floating_navbar

### Simple customiable floating bottom navigation bar.


## Usage
### Add dependency
```yaml
  floating_navbar: ^1.1.1
```

### Import package
```dart
  import 'package:floating_navbar/floating_navbar.dart';
```

### Use in code as follows
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Nav Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FloatingNavBar(
        color: Colors.purple,
        pages: <Widget>[HomePage(), MyPage()],
        icons: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.white,
          )
        ],
        iconColor: Colors.red,
        hapticFeedback: true,
        horizontalPadding: 40,
      ),
    );
  }
}
```

> Thanks to [Darshan Aswath](https://github.com/xanf-code)

### Screenshot
[![Floating Navbar](./screenshots/Screenshot_1617377389.png)](https://www.iamngoni.co.zw)