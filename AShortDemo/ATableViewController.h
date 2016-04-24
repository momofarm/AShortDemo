//
//  ATableViewController.h
//  AShortDemo
//


#import <UIKit/UIKit.h>

@interface ATableViewController : UITableViewController
{
    UITableView *tableview;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
