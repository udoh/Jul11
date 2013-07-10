//
//  View.h
//  Jul11
//
//  Created by Udo Hoppenworth on 7/10/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView {
    NSArray *subViews;
    NSUInteger currentView;
}

- (void)nextImage;
- (void)previousImage;

@end
