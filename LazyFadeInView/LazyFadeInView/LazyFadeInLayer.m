//
//  LazyFadeInLayer.m
//  LazyFadeInView
//
//  Created by Tu You on 14-4-20.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "LazyFadeInLayer.h"
#import <CoreText/CoreText.h>

@interface LazyFadeInLayer ()
{
    BOOL _isAnimating;
}

@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) NSMutableArray *alphaArray;
@property (strong, nonatomic) NSMutableAttributedString *attributedString;
<<<<<<< HEAD
@property (strong, nonatomic) NSMutableAttributedString *animatingAttributedString;

=======
>>>>>>> FETCH_HEAD
@property (strong, nonatomic) NSMutableArray *tmpArray;

@property (nonatomic) CFTimeInterval previousTimestamp;

@end

@implementation LazyFadeInLayer

@synthesize duration = _duration;
@synthesize numberOfLayers = _numberOfLayers;
@synthesize interval = _interval;
@synthesize textColor = _textColor, textFont = _textFont;
@synthesize repeat = _repeat, text = _text;

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _duration = 1.f;
        _numberOfLayers = 6;
        _interval = 0.2;
        _alphaArray = [NSMutableArray array];
        _tmpArray = [NSMutableArray array];
<<<<<<< HEAD
        _textFont = [UIFont systemFontOfSize:20.0f];
        _textColor = [UIColor whiteColor];
        _repeat = NO;
        
        self.contentsScale = [[UIScreen mainScreen] scale];
=======
        _attributedString = [[NSMutableAttributedString alloc] init];
>>>>>>> FETCH_HEAD
        self.wrapped = YES;
    }
    return self;
}

<<<<<<< HEAD
- (void)setDuration:(CFTimeInterval)duration
{
    if (duration != _duration) {
        _duration = duration;
        [self _updateAnimation];
    }
}

- (void)setNumberOfLayers:(NSUInteger)numberOfLayers
{
    if (_numberOfLayers != numberOfLayers) {
        _numberOfLayers = numberOfLayers;
        [self _updateAnimation];
    }
}

- (void)setText:(NSString *)text
{
    if (text != _text) {
        _text = text;
        [self _updateAnimation];
    }
}

- (void)setTextColor:(UIColor *)textColor
{
    if (textColor != _textColor) {
        _textColor = textColor;
        [self _updateAnimation];
    }
}

- (void)setRepeat:(BOOL)repeat
{
    if (_repeat != repeat) {
        _repeat = repeat;
        [self _updateAnimation];
    }
}

- (void)setTextFont:(UIFont *)textFont
{
    if (textFont != _textFont) {
        _textFont = textFont;
        [self _updateAnimation];
    }
}

- (BOOL)isAnimating
{
    return _isAnimating;
}

- (void)_updateAnimation
{
    if (self.text && self.text.length != 0) {
        if (self.isAnimating) {
            [self stopAnimating];
        }
        [self startAnimating];
    }
}

- (void)startAnimating
{
    if (self.text.length == 0) {
        return;
    }
    
    [self setupAlphaArray];
    
    self.attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)self.textFont.fontName, self.textFont.pointSize, NULL);
    [self.attributedString addAttribute:(NSString *)kCTFontAttributeName
                                           value:(__bridge id)fontRef
                                           range:NSMakeRange(0, self.text.length)];
    [self.attributedString addAttribute:(NSString *)kCTForegroundColorAttributeName value:(__bridge id)self.textColor.CGColor range:NSMakeRange(0, self.text.length)];
    
    self.previousTimestamp = CFAbsoluteTimeGetCurrent();
    self.animatingAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedString];
    
    _isAnimating = YES;
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(frameUpdate:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopAnimating
{
    _isAnimating = NO;
    self.string = self.attributedString;
    [self.displayLink invalidate];
    self.displayLink = nil;
    
    if (self.repeat) {
        [self startAnimating];
=======
- (void)setText:(NSString *)text
{
    [_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    if (!text)
    {
        _text = @" ";
    }
    else
    {
        _text = text;
    }
    
    _attributedString = [[NSMutableAttributedString alloc] initWithString:_text];
    
    if (_text.length != 0)
    {
        [self setupAlphaArray];
        
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(frameUpdate:)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
>>>>>>> FETCH_HEAD
    }
}

- (void)frameUpdate:(id)sender
{
<<<<<<< HEAD
    CFTimeInterval now = CFAbsoluteTimeGetCurrent();
    CFTimeInterval elapsed = now - self.previousTimestamp;
    
    if (self.duration <= 0 || elapsed > self.duration) {
        [self stopAnimating];
        return;
=======
    [self.attributedString removeAttribute:(NSString *)kCTForegroundColorAttributeName range:NSMakeRange(0, self.text.length)];
    
    BOOL shouldRemoveTimer = YES;
    for (int i = 0; i < self.text.length; ++i)
    {
        float alpha = [_alphaArray[i] floatValue];
        
        alpha = alpha < 0.0 ? 0.0 : alpha;
        alpha = alpha > 1.0 ? 1.0 : alpha;
        
        if (alpha != 1.0)
        {
            shouldRemoveTimer = NO;
        }
        
        UIColor *letterColor = [UIColor colorWithWhite:1 alpha:alpha];
        [self.attributedString addAttribute:(NSString *)kCTForegroundColorAttributeName
                                      value:(id)letterColor.CGColor
                                      range:NSMakeRange(i, 1)];
>>>>>>> FETCH_HEAD
    }

    if (shouldRemoveTimer)
    {
        [_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        _displayLink = nil;
    }
    
<<<<<<< HEAD
    CGFloat timeProportion = elapsed / self.duration;
    
    [self.animatingAttributedString removeAttribute:(NSString *)kCTForegroundColorAttributeName range:NSMakeRange(0, self.text.length)];
    
    BOOL isFinished = YES;
    
    CGFloat toColorAlpha = 0.0f;
    CGFloat toColorR = 0.0f;
    CGFloat toColorG = 0.0f;
    CGFloat toColorB = 0.0f;
    
    [self.textColor getRed:&toColorR green:&toColorG blue:&toColorB alpha:&toColorAlpha];
=======
    CTFontRef helveticaBold = CTFontCreateWithName(CFSTR("HelveticaNeue-Light"), 20.0, NULL);
    [self.attributedString addAttribute:(NSString *)kCTFontAttributeName
                                  value:(__bridge id)helveticaBold
                                  range:NSMakeRange(0, self.text.length)];
>>>>>>> FETCH_HEAD
    
    for (int i = 0; i < self.text.length; ++i)
    {
<<<<<<< HEAD
        CGFloat byColorAlpha = (toColorAlpha - [_alphaArray[i] floatValue]) * timeProportion;
        CGFloat currentColorAlpha = [_alphaArray[i] floatValue] + byColorAlpha;
        if (byColorAlpha <= 0.0f || currentColorAlpha >= toColorAlpha) {
            continue;
        }
        
        isFinished = NO;
=======
        float newAlpha = [_alphaArray[i] floatValue] + (1.0 / 40);
>>>>>>> FETCH_HEAD
        
        UIColor *currentColor = [UIColor colorWithRed:toColorR green:toColorG blue:toColorB alpha:currentColorAlpha];
        [self.animatingAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName
                                      value:(id)currentColor.CGColor
                                      range:NSMakeRange(i, 1)];
    }
    
<<<<<<< HEAD
    if (isFinished) {
        [self stopAnimating];
        return;
    }
    
    self.string = (id)self.animatingAttributedString;
=======
    _alphaArray = tAlpha;
    
    self.string = (id)self.attributedString;
>>>>>>> FETCH_HEAD
}

- (void)setupAlphaArray
{
    if (!self.text.length) {
        return;
    }
    
    if (self.alphaArray.count) {
        if (self.text.length != self.alphaArray.count) {
            [self resetAlphaArray];
        }
    }
    else{
        [self resetAlphaArray];
    }
}

- (void)resetAlphaArray
{
    [self.alphaArray removeAllObjects];
    self.alphaArray = [NSMutableArray arrayWithCapacity:self.text.length];
    for (int i = 0; i < self.text.length; ++i)
    {
        [self.alphaArray addObject:@(MAXFLOAT)];
    }
    
    [self randomAlphaArray];
}

- (void)randomAlphaArray
{
    if (!self.text.length && self.numberOfLayers <= 0) {
        return;
    }
    
    NSUInteger totalCount = self.text.length;
<<<<<<< HEAD

    NSUInteger tTotalCount = totalCount;
    [self.tmpArray removeAllObjects];
    self.tmpArray = [NSMutableArray arrayWithCapacity:self.numberOfLayers];
    
    for (int i = 0; i < self.numberOfLayers; ++i)
=======
    NSUInteger tTotalCount = totalCount;
    [_tmpArray removeAllObjects];
    
    for (int i = 0; i < _numberOfLayers - 1; ++i)
>>>>>>> FETCH_HEAD
    {
        int k = arc4random() % tTotalCount;
        [self.tmpArray addObject:@(k)];
        if (tTotalCount < k) {
            break;
        }
        tTotalCount -= k;
    }
     [_tmpArray addObject:@(tTotalCount)];
    
    
    for (id value in _tmpArray)
    {
        NSLog(@"%@", value);
    }
    
    
    for (int i = 0; i < self.tmpArray.count; ++i)
    {
<<<<<<< HEAD
        int count = [self.tmpArray[i] intValue];
        CGFloat alpha = -(i * 0.2);
=======
        int count = [_tmpArray[i] intValue];
        CGFloat alpha = -(i * 0.25);
>>>>>>> FETCH_HEAD
        while (count)
        {
            int k = arc4random() % totalCount;
            if ([self.alphaArray[k] floatValue] > 0.0f)
            {
                self.alphaArray[k] = @(alpha);
                count--;
            }
        }
    }
    
    for (id value in _alphaArray)
    {
        NSLog(@"%@", value);
    }
}

@end
