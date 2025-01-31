# overlay_loading_progress

A flutter widget of overlay loading progress Indicator. You can easily customize as you want.

**If you are looking for a more versatile solution, check out my new package [overlay_kit](https://pub.dev/packages/overlay_kit), which includes advanced features and improvements.**

Website example >> https://loadingprogress.mustafaturkmen.dev


## Usage

It has a very easy to use.

add this line to pubspec.yaml

```yaml

   dependencies:
     overlay_loading_progress: ^1.0.2

```

import package

```dart

   import 'package:overlay_loading_progress/overlay_loading_progress.dart';

```

Start it with
```dart
   OverlayLoadingProgress.start(context);
```

Stop it with
```dart
   OverlayLoadingProgress.stop();
```

## Complete Example
```dart
   OverlayLoadingProgress.start(context);
   await Future.delayed(const Duration(seconds: 3));
   OverlayLoadingProgress.stop();
```

![gif_1](https://user-images.githubusercontent.com/49743631/167276311-b96b6f22-adda-489b-a2a6-f1c467dccb60.gif)


## Use With Gif
```dart
   OverlayLoadingProgress.start(context,
     gifOrImagePath: 'assets/loading.gif',
   );
   await Future.delayed(const Duration(seconds: 3));
   OverlayLoadingProgress.stop();
```

![gif_2](https://user-images.githubusercontent.com/49743631/167276327-6b83530c-f361-4850-9162-c46e0d006164.gif)


## Use With Custom Widget
```dart
   OverlayLoadingProgress.start(context,
     widget: Container(
       width: MediaQuery.of(context).size.width / 4,
       padding: EdgeInsets.all(MediaQuery.of(context).size.width / 13),
       child: const AspectRatio(
                aspectRatio: 1,
                child: const CircularProgressIndicator(),
             ),
         ),
   );
   await Future.delayed(const Duration(seconds: 3));
   OverlayLoadingProgress.stop();
```

