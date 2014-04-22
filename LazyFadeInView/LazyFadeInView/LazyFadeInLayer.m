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

@end

@implementation LazyFadeInLayer

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
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
    // separate the text to serveral parts to lazy fade in
    self.text = string;
    
    
    [_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    
}

- (void)frameUpdate:(id)sender
{
    
    self.text = (id)self.attributedString;
}

- (void)setupAttributedString
{
    for (int i = 0; i < self.text.length; ++i)
    {
        float alpha = 1.0f;
        UIColor *letterColor = [UIColor colorWithWhite:1 alpha:alpha];
        [self.attributedString addAttribute:(NSString *)kCTForegroundColorAttributeName
                                      value:(id)letterColor
                                      range:NSMakeRange(i, 1)];
    }
}

@end
