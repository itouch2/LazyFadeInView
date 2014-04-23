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

@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) NSMutableArray *alphaArray;
@property (strong, nonatomic) NSMutableAttributedString *attributedString;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSMutableArray *tmpArray;

@end

@implementation LazyFadeInLayer

@synthesize duration = _duration;
@synthesize numberOfLayers = _numberOfLayers;
@synthesize interval = _interval;


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _duration = 1.2f;
        _numberOfLayers = 4;
        _interval = 0.2;
        _alphaArray = [NSMutableArray array];
        _tmpArray = [NSMutableArray array];
    }
    return self;
}

- (CADisplayLink *)displayLink
{
    if (!_displayLink)
    {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(frameUpdate:)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _displayLink;
}

- (void)setString:(id)string
{
    
    [_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    self.text = string;
    
    [self setupAlphaArray];
    
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)frameUpdate:(id)sender
{
    for (int i = 0; i < self.text.length; ++i)
    {
        float alpha = [_alphaArray[i] floatValue];
        alpha = alpha < 0 ? 0 : alpha;
        alpha = alpha > 1 ? 1 : alpha;
        UIColor *letterColor = [UIColor colorWithWhite:1 alpha:alpha];
        [self.attributedString addAttribute:(NSString *)kCTForegroundColorAttributeName
                                      value:(id)letterColor
                                      range:NSMakeRange(i, 1)];
    }

    self.text = (id)self.attributedString;
}

- (void)setupAlphaArray
{
    [_alphaArray removeAllObjects];
    
    for (int i = 0; i < self.text.length; ++i)
    {
        [_alphaArray addObject:@(MAXFLOAT)];
    }
    
    [self randomAlphaArray];
}

- (void)randomAlphaArray
{
    NSUInteger totalCount = self.text.length;
 
    [_tmpArray removeAllObjects];
    
    for (int i = 0; i < _numberOfLayers; ++i)
    {
        int k = arc4random() % totalCount;
        [_tmpArray addObject:@(k)];
        totalCount -= k;
    }
    
    for (int i = 0; i < _numberOfLayers; ++i)
    {
        int count = [_tmpArray[i] intValue];
        CGFloat alpha = -(i * 0.2);
        while (count)
        {
            int k = arc4random() % totalCount;
            if ([_alphaArray[k] floatValue] > 0.0f)
            {
                _alphaArray[k] = @(alpha);
                count--;
            }
        }
    }
}

@end
