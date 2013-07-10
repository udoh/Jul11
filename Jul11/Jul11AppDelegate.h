//
//  Jul11AppDelegate.h
//  Jul11
//
//  Created by Udo Hoppenworth on 7/10/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
@class View;

@interface Jul11AppDelegate : UIResponder <UIApplicationDelegate, UIGestureRecognizerDelegate> {
    View *view;
    UIWindow *_window;
    AVAudioPlayer *player;
}

@property (strong, nonatomic) UIWindow *window;

@end
