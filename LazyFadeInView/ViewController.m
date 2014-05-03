//
//  ViewController.m
//  LazyFadeInView
//
//  Created by Tu You on 14-4-20.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "ViewController.h"
#import "LazyFadeInView.h"

static NSString * const kStrayBirds = @"Stray birds of summer come to my window to sing and fly away. And yellow leaves of autumn, which have no songs, flutter and fall there with a sign. O Troupe of little vagrants of the world, leave your footprints in my words.";

static NSString * const kChinesePoem = @"惟江上之清风，与山间之明月，耳得之而为声，目遇之而成色。取之无禁，用之不竭。是造物者之无尽藏也，而吾与子之所共适。";

@interface ViewController ()

@property (strong, nonatomic) LazyFadeInView *fadeInView;
@property (assign, nonatomic) BOOL flag;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    LazyFadeInView *fade = [[LazyFadeInView alloc] initWithFrame:CGRectMake(10, 100, 300, 200)];
    fade.textColor = [UIColor whiteColor];
    fade.text = @"Stray birds of summer come to my window to sing and fly away. And yellow leaves of autumn, which have no songs, flutter and fall there with a sign. O Troupe of little vagrants of the world, leave your footprints in my words.";
    [self.view addSubview:fade];
    self.view.backgroundColor = [UIColor blackColor];
    self.fadeInView = fade;
}

- (IBAction)setTextBtnClicked:(id)sender
{
    if (_flag)
    {
        self.fadeInView.text = kStrayBirds;
        _flag = !_flag;
    }
    else
    {
        self.fadeInView.text = kChinesePoem;
        _flag = !_flag;
    }
}

- (IBAction)colorSwitched:(id)sender
{
    if (((UISwitch *)sender).on == YES)
    {
        self.view.backgroundColor = [UIColor colorWithRed:0.24 green:0.48 blue:0.82 alpha:1];
    }
    else
    {
        self.view.backgroundColor = [UIColor blackColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
