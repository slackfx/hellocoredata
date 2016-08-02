//
//  Color+CoreDataProperties.h
//  HelloCoreData
//
//  Created by Fernando Xavier on 01/08/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Color.h"

NS_ASSUME_NONNULL_BEGIN

@interface Color (CoreDataProperties)

@property (nonatomic) float red;
@property (nonatomic) float green;
@property (nonatomic) float blue;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
