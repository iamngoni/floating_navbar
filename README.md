# floating_navbar

This package allows developers to add a simpler custom navigation bar that floats at the bottom to their flutter applications.

> Developed by Ngonidzashe Mangudya

## Usage
### Add dependency
> floating_navbar: ^1.0.0

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
      title: 'Flutter Demo',
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
      ),
    );
  }
}
```

### Screenshot
#### Page1
[![IAMNGONI](https://storage.googleapis.com/file-in.appspot.com/files/Pqb4OH8A1z.png =250x)](https://github.com/iamngoni)
#### Page 2
[![IAMNGONI](https://storage.googleapis.com/file-in.appspot.com/files/yBC2kuJI_h.png =250x)](https://github.com/iamngoni)