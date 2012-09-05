//
//  MySlider.m
//  HappySachi
//
//  Created by Ben Boral on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MySlider.h"

@implementation MySlider




- (BOOL) pointInside:(CGPoint)point withEvent:(UIEvent*)event {
    CGRect bounds = self.bounds;
    bounds = CGRectInset(bounds, -0.5*self.currentThumbImage.size.width, -0.5*self.currentThumbImage.size.height);
    return CGRectContainsPoint(bounds, point);
}



@end
