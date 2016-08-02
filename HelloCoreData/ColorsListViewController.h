//
//  ColorsListViewController.h
//  HelloCoreData
//
//  Created by Fernando Xavier on 01/08/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorsListViewController : UITableViewController

@property NSMutableArray *colorsArray;

- (IBAction) addNewColor:(id)sender;

@end
