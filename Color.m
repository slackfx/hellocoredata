//
//  Color.m
//  HelloCoreData
//
//  Created by Fernando Xavier on 01/08/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import "Color.h"
#import "UIKit/UIKit.h"

@implementation Color

- (UIColor *) derivedColor {
    return [UIColor colorWithRed:self.red green:self.green blue:self.blue alpha:1.0];
}

@end
