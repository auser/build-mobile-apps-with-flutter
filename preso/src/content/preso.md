## Building cross-platform mobile apps with Flutter.io

---

<!-- .slide: -->

## Holla all!

I'm Ari

[@auser](https://twitter.com/auser)

---

<!-- .slide: class="centered" -->

![](content/images/ginger.png) <!-- .element: width="80%" height="80%" -->

---

<!-- .slide: -->

## Business of this talk

* Focused on <span class="pop">actionable</span> outcomes
* Look at ways to make your work on mobile faster and enjoyable <!-- .element: class="fragment" -->
* Introduce Flutter framework <!-- .element: class="fragment" -->

---

<!-- .slide:  -->

## Building mobile apps

---

<!-- .slide: -->

The world is becoming increasingly mobile.

---

### Time for some charts

---

<!-- .slide: data-background-color="#fff" -->

![](content/images/mobile.vs.computer.jpg)

---

<!-- .slide: data-background-color="#fff" -->

![](content/images/mobile-consumers.png)

---

<!-- .slide: data-background-color="#fff" -->

![](content/images/Share-of-mobile-app-time-in-different-countries-700x394.png)

---

<!-- .slide: -->

My barber doesn't even have a computer!

(do you remember what it's like not to have a computer?) <!-- .element: class="fragment" data-fragment-index="1" -->

(me either) <!-- .element: class="fragment" data-fragment-index="2" -->

---

<!-- .slide: -->

Mobile accessibility is a key component of successful businesses today, not tomorrow.

So unfortunately we'll have to build mobile into our business strategies <!-- .element: class="fragment white on-dark" -->

---

<!-- .slide: -->

## So what options do we have?

---

<!-- .slide: class="on-dark" data-background="#ce4ad0" -->

* Mobile-accessible (responsive) web apps
* Webviews wrapped in a native app <!-- .element: class="fragment" data-fragment-index="1" -->
* Pure native applications <!-- .element: class="fragment" data-fragment-index="2" -->
* Wrappers around native applications <!-- .element: class="fragment" data-fragment-index="3" -->
* React Native, et. al. <!-- .element: class="fragment" data-fragment-index="4" -->
* Flutter <!-- .element: class="fragment" data-fragment-index="5" -->

---

<!-- .slide: -->

## Mobile-accessible web apps

---

<!-- .slide: -->

I'd argue everyone needs responsive web applications, but it's no substitute for a native application.

---

## Webviews wrapped in a native app

So 2008 and it feels like it too <!-- .element: class="fragment" -->

---

* Easy to maintain, one code-base
* Slow, requires internet connection
* The web is getting better with native APIs, but it's still not native access (cameras, geolocation, accelerometer)

---

## Pure native applications

---

Easily the most popular choice, but then hiring and maintaining two different languages and code-bases is such a pain.

---

<!-- .slide: class="on-dark" data-background-image="https://media.giphy.com/media/e37RbTLYjfc1q/giphy.gif" -->

## Java developers and Objective-C developers

---

## Wrappers around native applications

---

Mostly not open-source... gotta learn custom DSL for building mobile applications.

---

## React Native

---

<!-- .slide: data-background-image="https://media.giphy.com/media/12LnrobNhlcHbq/giphy.gif" class="on-dark" -->

Awesome choice, but requires a bridge between native and JavaScript and gets especially difficult when building custom views

---

## Flutter

---

Well... that's what I'm here to talk about!

---

## <a href="http://flutter.io">Flutter.io</a>

<iframe width="800" height="600" data-src="http://flutter.io"></iframe>

---

## What is it?

---

Flutter is a native mobile application framework for building cross-platform applications

---

Have you heard of <a href="https://unity3d.com/">unity3d</a>?

![](content/images/unity.png)

---

It's kinda like that, where flutter applications take over the entire screen and render components that are mobile rendered.

---

Without too much praise...
## Flutter: the mobile holy grail <!-- .element: class="fragment" -->

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

This entire app, including the backend took me <code><</code> 1.5 hours to build, from start to finish.

---

## How, you ask?

---

## Flutter
of course <!-- .element: class="fragment" -->

---

## Dart

Isn't that dead? <!-- .element: class="fragment" -->

---

## Nope, not dead...

In fact, Dart 2 was just released

---

## The hidden cost: learning a new language?

---

## Well...

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
void main() {};
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
// ES6
class Homepage extends Page {
  // constructor
  constructor(name) {
    this.name = name;
  }

  title() {
    return this.name;
  }
}
```

---

### Classes

Dart

```dart
class Homepage extends Page {
  final String name;

  // Constructor
  Homepage(this.name);

  String title() {
    return this.name;
  }
}
```

---

### Packages

```dart
import 'dart:async';
import 'dart:math' as math;
```

---

### Mixins

```dart
implements SomeMixinProvider
```

---

Quick concepts:

* Everything is an object and every object is an instance of a class (everything inherits from the Object class) <!-- .element: class="fragment" -->
* Dart is strongly-typed, but annotations are optional (inferred types). <!-- .element: class="fragment" -->
* Dart supports generics <!-- .element: class="fragment" -->
* Dart allows top-level functions and class-level functions <!-- .element: class="fragment" -->
* Dart allows top-level variables and instance variables <!-- .element: class="fragment" -->
* Private identifiers start with _. <!-- .element: class="fragment" -->
* Final and const <!-- .element: class="fragment" -->
* Generational garbage collection and allocation <!-- .element: class="fragment" -->

---

### Still not convinced?

---

Using Dart, we can create:

* Mobile apps (using Flutter)
* Webapps compiled to JavaScript
* Server-side applications (cli)

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

```javascript
class ReactView extends React.Component {
  render() {
    return <h1>{this.props.text}</h1>;
  }
}
```

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

![](content/images/first-app-complex.png)

---

## Widgets, widgets, widgets

Flutter comes with _tons_ of widgets out of the box.

---

### `Text`

Displays text (styled or unstyled)

---

### `Row`/`Column`

Flexible layout widgets for horizontal and vertical directions (based upon the flexbox layout model).

![](content/images/col-row.png) <!-- .element: height="20%" width="50%" -->

---

### `Stack`

A widget that allows us to stack widgets atop each other or relative to each other (based on the web positioning layout model).

![](content/images/stack.png) <!-- .element: height="20%" width="50%" -->

---

### `FloatingActionButton`/`FlatButton`/`IconButton`/Buttons and more

All sorts of buttons for running actions

![](content/images/buttons.png) <!-- .element: height="20%" width="50%" -->

---

### `bottomNavigationBar`

A widget for defining bottom navigation, like tabs, buttons, and more.

![](content/images/bottom-action-buttons.png) <!-- .element: height="20%" width="50%" -->

---

### Waaaayyyy ttttooooo many to list

Much much more...

---

## Testing

Everybody's favorite subject <!-- .element: class="fragment red" -->

---

### Unit testing

Focused on a single piece of code.

---

## Simplest _dart_ test

---

```dart
void main() {
  test('simple unit test', () {
    var answer = 42;
    expect(answer, 42);
  });
}
```

---

## Useful for testing functionality

---

## Integration testing

---

## aka widget testing

---

We'll write our test to target particular parts of our application, reading text, tapping on buttons, and setting expectations.

---

## Simple functional widget test

---

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:translate/main.dart';

void main() {
  testWidgets('item_widget test', (WidgetTester tester) async {
    UniqueKey key = UniqueKey();
    bool tapped = false;

    VoidCallback onPressed = () => tapped = true;

    await tester.pumpWidget(Scaffold(
        body: ItemWidget(key: key, onPressed: onPressed, text: "Test")
    ));
    await tester.tap(find.byKey(key));

    expect(tapped, true);
  });
}
```

---

It's kinda like a person is using the widget... Nice, right?

---

## One doesn't exist?

---

It's pretty easy to create your own native plugins too.

---


## How does this all work?

---

When building native applications, we generally pass the active view down to each of the widgets...

---

<!-- .slide: class="on-white" data-background-color="#fff" -->

![](content/images/view_hierarchy_enclose_2x.png)

---

<!-- .slide: class="on-white" data-background-color="#fff" -->

![](content/images/contents_sub_super_views_2x.png)

---

however...

---

### Flutter reverses this process

Instead of working with mutable, long-lived View objects, every widget is actually an immutable view itself and is passed <span class="pop">upwards</span> through to it's parent.

---

## Why is this important?

Flutter allows us to **declaratively** compose user interfaces rather than imperatively defining how View objects are manipulated at run-time.

---

Flutter is efficient in computing changes to the tree and widgets are mean't to be short-lived objects.

---

## Wanna know more?

<span>Check out the <code>Element</code> and <code>RenderObject</code> types</span> <!-- .element: class="fragment" -->

---

### So why pick dart?

---

## Native compilation through Dart

* Ahead of Time compilation with predictable native code. <!-- .element: class="fragment" data-fragment-index="1" -->
* Dart supports JIT which makes for fast development cycles <!-- .element: class="fragment" data-fragment-index="2" -->
* Dart doesn't need locks, so apps start and feel faster. <!-- .element: class="fragment" data-fragment-index="3" -->
* There's no bridge. Just natively compiled dart code. <!-- .element: class="fragment" data-fragment-index="4" -->
* Dart feels familiar and is easy to learn. <!-- .element: class="fragment" data-fragment-index="5" -->
* Dart is fun <!-- .element: class="fragment" data-fragment-index="6" -->

---

## During development, Flutter uses JIT compilation

---

## During packaging, Flutter uses AOT compilation

---

We get the best of both, fast development cycles and insanely quick execution/start times.

---

## Side-benefit of using Dart

---

<!-- .slide:  -->

Sharing code between the web and mobile

---

If business logic is separated from view logic properly, we can **reuse** our Dart code on the web because Dart compiles to JavaScript and run in-browser.

---

Dart can also be used with the Dart VM so no extra execution environment necessary.

---

Sharing code between mobile and server-side code!

---

## Open-source packages

There are many many dart packages available through [pub.dartlang.org](https://pub.dartlang.org/), which makes getting things done fast and easy.

---

## Integrations

* Redux <!-- .element: class="fragment" -->
* RxJS <!-- .element: class="fragment" -->
* Sqlite <!-- .element: class="fragment" -->
* Firebase everything (db/auth/messaging/more) <!-- .element: class="fragment" -->
* Shared preferences <!-- .element: class="fragment" -->
* Geolocation <!-- .element: class="fragment" -->
* Camera access <!-- .element: class="fragment" -->
* Notifications <!-- .element: class="fragment" -->
* So much more <!-- .element: class="fragment pop" -->

---

### I know what you're thinking...

---

Can we really do anything useful with it?

---

Some incredible examples of real flutter interfaces

---

![](content/images/travel.gif)

---

![](content/images/drinkshop.gif)

---

![](content/images/tasks.gif)

---

![](content/images/animation_guillotine_original.gif)

---

### I didn't even get into:

* Animation <!-- .element: class="fragment" -->
* Futures <!-- .element: class="fragment" -->
* Infinite lists <!-- .element: class="fragment" -->
* Native integration <!-- .element: class="fragment" -->
* Slivers <!-- .element: class="fragment" -->
* Gestures <!-- .element: class="fragment" -->
* <span class="fragment pop">There's SO MUCH MORE</span>

---

[flutter.io](https://flutter.io)

The flutter docs are awesome. Check 'em out!

---

## Questions?

---

## Thanks

[@auser](https://twitter.com/auser)
