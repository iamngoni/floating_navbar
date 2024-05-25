# floating_navbar

### Simple customisable floating bottom navigation bar.


## Usage
### Add dependency
```yaml
  floating_navbar: ^2.0.2
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
      title: 'FloatingNavBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FloatingNavBar(
        resizeToAvoidBottomInset: false,
        color: Colors.green,
        selectedIconColor: Colors.white,
        unselectedIconColor: Colors.white.withOpacity(0.6),
        items: [
          FloatingNavBarItem(iconData: Icons.home_outlined, page: Home(), title: 'Home'),
          FloatingNavBarItem(iconData: Icons.local_hospital_outlined, page: Doctors(), title: 'Doctors'),
          FloatingNavBarItem(iconData: Icons.alarm, page: Reminders(), title: 'Reminders'),
          FloatingNavBarItem(iconData: Icons.pending_actions_outlined, page: Records(), title: 'Records'),
        ],
        horizontalPadding: 10.0,
        hapticFeedback: true,
        showTitle: true,
      ),
    );
  }
}
```

> Thanks to [Darshan Aswath](https://github.com/xanf-code)

### Screenshot
[![Floating Navbar](https://raw.githubusercontent.com/iamngoni/floating_navbar/master/screenshots/Screenshot_1617377389.png)](https://www.iamngoni.co.zw)
