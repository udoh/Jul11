//
//  View.m
//  Jul11
//
//  Created by Udo Hoppenworth on 7/10/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "View.h"
#import "SubView1.h"
#import "SubView2.h"
#import "SubView3.h"
#import "SubView4.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        subViews = [NSArray arrayWithObjects:
                    [[SubView1 alloc] initWithFrame: self.bounds],
                    [[SubView2 alloc] initWithFrame:self.bounds],
                    [[SubView3 alloc] initWithFrame:self.bounds],
                    [[SubView4 alloc] initWithFrame:self.bounds],
                 nil
                 ];
        
        currentView = 0;
        [self addSubview:[subViews objectAtIndex:currentView]];
        self.userInteractionEnabled = YES;
    }
    return self;
}

//- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
//    [self previousImage];
//}

- (void)nextImage {
    
    NSUInteger newIndex = 0;
    
    if (currentView < subViews.count-1) {
        newIndex = currentView + 1;
    } else {
        newIndex = 0;
    }
    
    [UIView transitionFromView: [subViews objectAtIndex: currentView]
                        toView: [subViews objectAtIndex: newIndex]
                      duration: 0.75
                       options: UIViewAnimationOptionTransitionFlipFromLeft
                    completion: NULL
     ];
    
    currentView = newIndex;
}

- (void)previousImage {
    
//    NSUInteger newIndex = (currentView + 1) % subViews.count;
    
    NSUInteger newIndex = 0;
    
    if (currentView == 0) {
        newIndex = subViews.count - 1;
    } else {
        newIndex = currentView - 1;
    }
    
    [UIView transitionFromView: [subViews objectAtIndex: currentView]
                        toView: [subViews objectAtIndex: newIndex]
                      duration: 0.75
                       options: UIViewAnimationOptionTransitionFlipFromTop
                    completion: NULL
     ];
    
    currentView = newIndex;
}


@end
