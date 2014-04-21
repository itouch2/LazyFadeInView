//
//  LazyFadeInLayer.m
//  LazyFadeInView
//
//  Created by Tu You on 14-4-20.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "LazyFadeInLayer.h"

@interface LazyFadeInLayer ()

@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) NSAttributedString *attributedString;
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
    
    
    
    [_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    
}

- (void)frameUpdate:(id)sender
{
    
}

@end
