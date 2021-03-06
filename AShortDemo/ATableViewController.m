//
//  ATableViewController.m
//  AShortDemo
//

#import "ATableViewController.h"
#import "AppDelegate.h"
#import "WebViewController.h"
@interface ATableViewController ()

@end

@implementation ATableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    
    
    if ([del.aryApple count] > 0)
    {
        //[del.aryApple removeObjectAtIndex:0];
        
        NSMutableArray *ar =del.aryApple;
        
        [ar removeObjectAtIndex:0];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ReadApple"])
    {
        // Get reference to the destination view controller
        
        WebViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        //[vc setMyObjectHere:object];
        AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        if (del)
        {
            NSMutableDictionary *d =  del.aryApple[tableview.indexPathForSelectedRow.row];
            
            NSString *url = (NSString *)[d objectForKey:@"link"];
            
            vc.url = [url copy];
            
        }
    }
}


- (IBAction)unwindToAppleMenu:(UIStoryboardSegue*)sender
{
    UIViewController *ctrl = sender.sourceViewController;
    // blah blah ....
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    
    
    if ([del.aryApple count] > 0)
    {
        
        return [del.aryApple count];
    }
    
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoLabel" forIndexPath:indexPath];
    
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    
    if (del)
    {
        
        NSDictionary *d = [del.aryApple objectAtIndex:indexPath.row];
        
        //NSLog(@"text is %@\n", [d objectForKey:@"title"]);
        cell.textLabel.text = [d objectForKey:@"title"];
        
    }
        //return [del.aryApple count];
    

    // Configure the cell...
    
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
