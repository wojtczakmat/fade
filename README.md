# fade ## 1.0.0
A Widget that animates its `visible` property with fade and size (height) transitions made on `child` widget. It allows declarative UI without code smell like animation controller for each widget that should fade away. The Widget works on bounded and unbounded constraints, so height doesn't need to be explicitly provided to the `child` widget.

The library provides one widget `Fade` and depends only on Flutter framework.

## Example

  * [Simple example with containers](https://github.com/wojtczakmat/fade/tree/master/example) - Simple example with a few containers in a tappable column.

## Usage

Let's see a basic demo:

```dart
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState_ extends State<MyPage> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => setState(() => visible = !visible),
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                color: Colors.blue,
              ),
              Fade(
                visible: visible,
                // duration is optional
                duration: Duration(milliseconds: 400),
                child: Container(
                  height: 200,
                  color: Colors.green,
                ),
              ),
              Container(
                height: 200,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Contributors

  * [Mateusz Wojtczak](https://github.com/wojtczakmat)