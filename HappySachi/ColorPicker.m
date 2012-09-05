//
//  ColorPicker.m
//  HappySachi
//
//  Created by Ben Boral on 5/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ColorPicker.h"

@implementation ColorPicker

-(NSString *)colorNameFromRed:(float) r Green:(float) g Blue:(float) b Pos:(float)sliVal{
    BOOL highRed=(r>0.75);
    BOOL lowRed=(r<0.4);
    BOOL lowGreen=(g<0.18);
    BOOL lowMidGreen=(g>0.18&&g<0.5);
    BOOL midMidGreen=(g>0.5&&g<0.8);
    BOOL highGreen=(g>0.8);
    BOOL lowBlue=(b<0.45);
    BOOL midBlue=(b>0.45&&b<0.8);
    BOOL highBlue=(b>0.8);
    
    
    NSLog(@"rgbs %f  %f  %f %f", r, g , b, sliVal);
    if(highRed){
        if (lowBlue) {
            if(lowGreen){
                return @"red";
            }
            if(lowMidGreen)
            {
                return @"orange";
            }
            if(highGreen)
            {
                return @"yellow";
            }
            if(midMidGreen)
            {
                return @"yellow";
            }
        }
        if(midBlue)
        {
            if(lowGreen)
            {
                return @"fiuscia";
            }
            if(midMidGreen)
            {
                if((r+b+g)>2.35)
                {
                    return @"grey";
                }
                return @"pink";
            }
            if(lowMidGreen)
            {
                return @"pink";
            }
            if(highGreen)
            {
                
            }
        }
        if(highBlue)
        {
            if(highGreen)
            {
                return @"white";
            }
            if(lowGreen)
            {
                
            }
            if(lowMidGreen)
            {
                
            }
            if(highGreen)
            {
                
            }
        }
    }
    else
    {
        if(lowRed)
        {
            if(lowBlue)
            {
                if(lowGreen)
                {
                    return @"black";
                }

                if(midMidGreen)
                {
                    return @"green";
                }
                if(lowMidGreen)
                {
                    
                }
                if(highGreen)
                {
                    
                }
            }
            if(highBlue)
            {
                if (midMidGreen) {
                    return @"blue";
                }
                if(lowGreen)
                {
                    
                }
                if(lowMidGreen)
                {
                    
                }
                if(highGreen)
                {
                    
                }
            }
            if(midBlue)
            {
                if(midMidGreen)
                {
                    if(sliVal>0.5){
                        return @"aqua";
                    }

                    
                    return @"blue";
                }
                if(lowMidGreen)
                {
                    return @"violet";
                }
                if(lowGreen)
                {
                    
                }
                if(highGreen)
                {
                    
                }
            }
        }
        else 
        {
            if(midBlue)
            {
                if(lowMidGreen)
                {
                    if((r+b+g)>1.35&&(r+b+g)<1.384)
                    {
                        return @"violet";
                    }
                    if(((r+b+g)>1.395&&(r+g+b)<1.41)&&sliVal>0.55){
                        return @"fiuscia";
                    }
                    if((r+b+g)>1.260&&(r+g+b)<1.340)
                    {
                        return @"indigo";
                    }
                    if((r+b+g)>1.480&&(r+b+g)<1.5309)
                    {
                        return @"violet";
                    }
                    if((r+b+g)>1.5309&&(r+g+b)<1.535)
                    {
                        return @"indigo";
                    }
                    if((r+b+g)>1.500&&(r+b+g)<1.615)
                    {
                        return @"violet";
                    }
                    if((r+b+g)>1.395&&(r+g+b)<1.41)
                    {
                        return @"indigo";
                    }
                    
                }
                if(midMidGreen)
                {
                    return @"grey";
                }
                if(lowGreen)
                {
                    return @"fiuscia";
                }
                if(highGreen)
                {
                    
                }
            }
            if(lowBlue)
            {
                if(lowMidGreen)
                {
                    if(b<0.2)
                    {
                        return @"black";
                    }
                    return @"brown";
                }
                if(lowGreen)
                {
                    
                }
                if(midMidGreen)
                {
                    return @"green";
                }
                if(highGreen)
                {
                    return @"green";
                }
            }
        }
    }
    
    return @"black";
}



@end
