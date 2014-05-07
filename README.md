# LazyFadeInView
LazyFadeInView is a cool way to animate the apperance of a label. This effect is a clone of [Secret app](https://itunes.apple.com/us/app/secret-speak-freely/id775307543?mt=8). 

## Usage
To use LazyFadeInView, create a `LazyFadeInView` and add it to your view. It will animate to show up once it's text is set.

An example of making a lazy fade in view:

```objective-c
LazyFadeInView *fadeInView = [[LazyFadeInView alloc] initWithFrame:CGRectMake(20, 120, 280, 200)];
self.fadeInView.text = @"Stray birds of summer come to my window to sing and fly away.";
[self.view addSubview:self.fadeInView];
```


## A Quick Peek

![screenshots](https://cloud.githubusercontent.com/assets/4316898/2808172/95280184-cd14-11e3-876b-ac00ba78fbc9.gif)

