//
//  Jul11AppDelegate.m
//  Jul11
//
//  Created by Udo Hoppenworth on 7/10/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "Jul11AppDelegate.h"
#import "View.h"

@implementation Jul11AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    view = [[View alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [self.window addSubview:view];
    [self.window makeKeyAndVisible];
    
    
    // set up and play audio
    
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle == nil) {
        NSLog(@"could not get the main bundle");
        return YES;
    }
    
    //The path is the filename.
    NSString *path =
    [bundle pathForResource: @"purplehaze" ofType: @"m4a"];
    if (path == nil) {
        NSLog(@"could not get the path");
        return YES;
    }
    NSLog(@"path == \"%@\"", path);
    
    NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
    NSLog(@"url == \"%@\"", url);
    
    NSError *error = nil;
    player = [[AVAudioPlayer alloc]
              initWithContentsOfURL: url error: &error];
    if (player == nil) {
        NSLog(@"error == %@", error);
        return YES;
    }
    
    player.volume = 0.5;	// make this changeable via pan (up/down) gesture
    player.numberOfLoops = 0;

    if (![player prepareToPlay]) {
        NSLog(@"could not prepare to play");
        return YES;
    }
    
    if (![player play]) {
        NSLog(@"could not play");
    }
    
    // add the gesture recognizers to the view

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleVolumeChangeGesture:)];
    [pan setDelegate:self];
    [view addGestureRecognizer:pan];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [swipe setDelegate:self];
    [view addGestureRecognizer:swipe];
    
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [swipe setDelegate:self];
    [view addGestureRecognizer:swipe];

    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    player.currentTime = 0;
    
    if (![player prepareToPlay]) {
        NSLog(@"could not prepare to play");
    }
    
    if (![player play]) {
        NSLog(@"could not play");
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [player stop];
}

// handle gesture events

- (void)handleVolumeChangeGesture:(UIPanGestureRecognizer *)gesture {
    
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:view];
        player.volume -= translation.y / 200;
        [gesture setTranslation:CGPointZero inView:view];
        if (player.volume < 0) player.volume = 0;
        if (player.volume > 1.0) player.volume = 1.0;
        
    }
}

- (void)swipe:(UISwipeGestureRecognizer *)recognizer {
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
		NSLog(@"right swipe recognized");
        [view nextImage];
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"left swipe recognized");
        [view previousImage];
    }
}

// enable the pan and swipe gesture recognizers to co-exist

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


@end
