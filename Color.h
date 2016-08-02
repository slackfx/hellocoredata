//
//  Color.h
//  HelloCoreData
//
//  Created by Fernando Xavier on 01/08/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface Color : NSManagedObject

- (UIColor *) derivedColor;

@end

NS_ASSUME_NONNULL_END

#import "Color+CoreDataProperties.h"
