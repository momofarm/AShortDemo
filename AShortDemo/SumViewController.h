//
//  SumViewController.h
//  AShortDemo
//
//  Created by momofarm on 4/24/16.
//  Copyright © 2016 Chen Kuanfu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SumViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    
    IBOutlet UITableView *tableview;
    IBOutlet UIPageControl *pgCtrol;
    IBOutlet UIImageView *imgView;
}


@end
