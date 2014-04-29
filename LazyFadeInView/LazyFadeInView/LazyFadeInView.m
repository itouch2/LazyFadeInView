//
//  LazyFadeInView.m
//  LazyFadeInView
//
//  Created by Tu You on 14-4-20.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "LazyFadeInView.h"
#import "LazyFadeInLayer.h"

#define __layer ((LazyFadeInLayer *)self.layer)

#define LAYER_ACCESSOR(accessor, ctype) \
- (ctype)accessor { \
return [__layer accessor]; \
}

#define LAYER_MUTATOR(mutator, ctype) \
- (void)mutator (ctype)value { \
[__layer mutator value]; \
}

#define LAYER_RW_PROPERTY(accessor, mutator, ctype) \
LAYER_ACCESSOR (accessor, ctype) \
LAYER_MUTATOR (mutator, ctype)

@implementation LazyFadeInView

LAYER_RW_PROPERTY(numberOfLayers, setNumberOfLayers:, NSUInteger)
LAYER_RW_PROPERTY(interval, setInterval:, CFTimeInterval)
LAYER_RW_PROPERTY(textFont, setTextFont:, UIFont *)
LAYER_RW_PROPERTY(textColor, setTextColor:, UIColor *)
LAYER_RW_PROPERTY(text,setText:,NSString *)

+ (Class)layerClass
{
    return [LazyFadeInLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.layer.contentsScale = [UIScreen mainScreen].scale;
    }
    return self;
}
@end
