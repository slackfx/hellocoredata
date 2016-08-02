//
//  ColorsListViewController.m
//  HelloCoreData
//
//  Created by Fernando Xavier on 01/08/16.
//  Copyright © 2016 Slackfx. All rights reserved.
//

#import "ColorsListViewController.h"
#import "AppDelegate.h"
#import "Color.h"

@interface ColorsListViewController ()

@end

@implementation ColorsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *plusButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewColor:)];
    self.navigationItem.rightBarButtonItem = plusButton;
    self.colorsArray = [NSMutableArray new];
    
    NSManagedObjectContext *moc = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Color" inManagedObjectContext:moc];
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    NSError *error = nil;
    self.colorsArray = [[moc executeFetchRequest:request error:&error] mutableCopy];
    if (!self.colorsArray) {
        NSLog(@"Failed to load colors");
    }
}

- (IBAction) addNewColor:(id)sender {
    AppDelegate *ad = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = ad.managedObjectContext;
    Color *newColor = (Color *) [NSEntityDescription insertNewObjectForEntityForName:@"Color" inManagedObjectContext: moc];
    
    newColor.red = [self randomColorComponentValue];
    newColor.blue = [self randomColorComponentValue];
    newColor.green = [self randomColorComponentValue];
    
    NSError *error = nil;
    if (![moc save:&error]) {
        NSLog(@"Error saving color: %@", [error localizedDescription]);
    }
    [self.colorsArray addObject:newColor];
    [self.tableView reloadData];
}

- (double) randomColorComponentValue {
    return ((double)arc4random() / 0x100000000);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.colorsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    Color *currentColor = [self.colorsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Red: %.3f Green: %.3f Blue: %.3f", currentColor.red, currentColor.green, currentColor.blue];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
