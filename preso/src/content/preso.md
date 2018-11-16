## Building cross-platform mobile apps with Flutter.io

---

<!-- .slide: data-background="#5eafe1" -->

# Holla, I'm Ari

---

<!-- .slide:  -->

## Building mobile apps

---

<!-- .slide: -->

The world is increasingly mobile...

---

<!-- .slide: -->

my barber doesn't even have a computer!

(do you remember what it's like not to have a computer?) <!-- .element: class="fragment" data-fragment-index="1" -->

(me either) <!-- .element: class="fragment" data-fragment-index="2" -->

---

<!-- .slide: -->

Mobile accessibility is crucial for any tech business today.

---

<!-- .slide: -->

## Options

---

<!-- .slide: -->

* Mobile-accessible web apps
* Webviews wrapped in a native app <!-- .element: class="fragment" data-fragment-index="1" -->
* Pure native applications <!-- .element: class="fragment" data-fragment-index="2" -->
* Wrappers around native applications <!-- .element: class="fragment" data-fragment-index="3" -->
* React Native, et. all. <!-- .element: class="fragment" data-fragment-index="4" -->
* Flutter <!-- .element: class="fragment" data-fragment-index="5" -->

---

<!-- .slide: -->

## Mobile-accessible web apps

---

<!-- .slide: -->

I'd argue everyone needs responsive web applications

---

## Webviews wrapped in a native app

So 2008 and it feels like it too <!-- .element: class="fragment" -->

---

## Pure native applications

---

Easily the most popular choice, but then hiring and maintaining two different languages and code-bases is such a pain

---

## React Native

---

Awesome choice, but requires a bridge between native and JavaScript and gets especially difficult when building custom views

---

## Flutter

---

Well... that's what I'm here to talk about!

---

## <a href="http://flutter.io">Flutter.io</a>

<iframe width="600" height="480" data-src="http://flutter.io"></iframe>

---

## What is it?

---

Flutter is a native mobile application framework for building cross-platform applications

---

Have you heard of <a href="https://unity3d.com/">unity3d</a>?

---

It's kinda like that, where flutter applications take over the entire screen and render components that are mobile rendered.

---

Without going into too much detail...
## The holy grail <!-- .element: class="fragment" -->

---

<!-- .slide: -->

### iOS

![](content/images/ios.png) <!-- .element: height="30%" width="50%" -->

---

<!-- .slide: -->

### Android

![](content/images/android.png) <!-- .element: height="30%" width="50%" -->

---

<!-- .slide: -->

## The same code-base

And the same fancy interface <!-- .element: class="fragment" -->

---

This entire app, including the backend took me <code><</code> 1.5 hours to build, from start to finish

---

## Dart

Isn't that dead? <!-- .element: class="fragment" -->

---

## Nope, not dead...

In fact, Dart 2 was just released

---

## The hidden cost: learning a new language?

---

## Dart is intended on being familiar

Think of it like a combination of Java and JavaScript. It's a typed object-oriented language with a lot of nice features, including futures and streams.

---

## Quick Dart primer

---

### Functions

JavaScript

```javascript
function main() {}
```

---

### Functions

Dart

```dart
void main() => {};
```

---

### Variables

JavaScript

```javascript
var title = "Hello world";
```

---

### Variables

Dart

```dart
final String title = "Hello world";
```

---

### Classes

JavaScript

```javascript
class Homepage extends Page {}
```

---

### Classes

Dart

```dart
class Homepage extends Page {}
```

---

## Flutter intro

---

Everything in Flutter is a <b>Widget</b>

---

## What are Widgets?

---

Widgets describe what a view looks like given current configuration from state.

Sounds familiar if you're coming from Angular/React <!-- .element: class="fragment" -->

---

When a widget's state changes the widget rebuilds and the render tree transitions to the next one.

---

### Simple app

---

![](content/images/first-app.png)

---

![](content/images/first-app-2.png)

---

![](content/images/init-dart.png)

---

![](content/images/first-app-run.png) <!-- .element: height="30%" width="50%" -->

---

![](content/images/app-with-widgets.png)

---

## Starting simple

---

<code>lib/main.dart</code>

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Center(
          child: Text("Hello world"),
        ));
  }
}
```

---

<!-- .slide: -->
![](content/images/first-app-run-1.png) <!-- .element: height="30%" width="50%" -->

---

<!-- .slide: -->

We have 2 widgets here:

* <code>Center</code>
* <code>Text</code>

---

By design, widgets are intentionally single-function focused.

(Most of the time they do what you think) <!-- .element: class="fragment" -->

---

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Example app"),
          ),
          body: Center(
            child: Text("Hello world"),
          ),
        ));
  }
}
```

---

![](content/images/first-app-run-2.png) <!-- .element: height="30%" width="50%" -->

---


```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Example app"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () => print("Clicked on actions"),
              )
            ],
          ),
          body: Center(
            child: Text("Hello world"),
          ),
        ));
  }
}
```

---

![](content/images/first-app-run-3.png) <!-- .element: height="30%" width="50%" -->

---

## Quick right?

---

Notice as we change the application code, the app _hot-reloads_.

No more recompiling to check every pixel, no more navigating to screens, etc.

---

Let's get a little more complex and show a list!

---

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // ...
          body: Center(
            child: ListView(
              children: <Widget>[
                Text("one"),
                Text("two"),
                Text("three")],
            ),
          ),
        ));
  }
}
```

---

![](content/images/list-app-run-1.png) <!-- .element: height="30%" width="50%" -->

---

## Kinda ugly, right?

---

Let's build a Widget for each item

---

```dart
class ItemWidget extends StatelessWidget {
  ItemWidget(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
    );
  }
}
```

---

Now to use our `Stateless` widget

```dart
// ...
  child: ListView(
    children: <Widget>[
      ItemWidget("one"),
      ItemWidget("two"),
      ItemWidget("three")
    ],
  ),
  // ...
```

---

![](content/images/list-app-run-2.png) <!-- .element: height="30%" width="50%" -->

---

Now we have a single-focused widget for each list item.

---

## Widgets, widgets, widgets

Flutter comes with _tons_ of widgets out of the box.

---

### `Text`

Displays text (styled or unstyled)

---

### `Row`/`Column`

Flexible layout widgets for horizontal and vertical directions (based upon the flexbox layout model).

---

### `Stack`

A widget that allows us to stack widgets atop each other or relative to each other (based on the web positioning layout model).

---

## StatelessWidget vs. StatefulWidget

---

### StatelessWidget

`Stateless` widgets are those that do not requre any mutable state. It can accept parameters that change and is pretty fast.

---

### StatefulWidget

`Stateful` widgets have mutable state.

State is information read into the widget when it's built and rebuilt. It can tell the app to rebuild/rerender by calling `setState()`.

---

## How does this all work?

---

The flutter framework compiles all our widgets into lower-level widgets which ends in a `RenderObject` which computes and gets rendered onto the canvas.

---

## Integrations

---

* Redux

---

## Testing
