//
//  AppDelegate.h
//  AShortDemo
//


#import <UIKit/UIKit.h>

#import "FeedPuller.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray *aryUDN;
    NSMutableArray *aryLTN;
    NSMutableArray *aryApple;
    NSMutableArray *arySummary;
}


@property (strong, nonatomic) UIWindow *window;
@property NSMutableArray *aryUDN;
@property NSMutableArray *aryLTN;
@property  NSMutableArray *aryApple;

@property NSMutableArray *arySummary;

@end

