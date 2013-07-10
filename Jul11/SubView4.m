//
//  SubView4.m
//  Jul11
//
//  Created by Udo Hoppenworth on 7/10/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "SubView4.h"

@implementation SubView4

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage *image = [UIImage imageNamed: @"jimi4.jpg"];
        if (image == nil) {
            NSLog(@"could not find the image");
        }
        
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.frame = self.bounds;
        
        [self addSubview:imageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
