//
//  AppDelegate.m
//  AShortDemo
//
/*
 For anyone want to use these, just take it and use it at yourown
 I'd spend more time preparing for tests like Amazon or Google (yeah, lots of algorithm .... and fu*king math)
 
 I don't understand why Taiwanese HR / or some random interview officer want me to take some real demo of my work.
 
 this piece of shi* does not represent my work, it will just become 1 of million apps on app store and 
 benefit NO ONE, really no one.

 need to take some of these to prove I am a programmer, this is really piece of crap....
*/


#import "AppDelegate.h"
#import "FeedPuller.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


NSString *strUDN = @"http://udn.com/udnrss/latest.xml";
NSString *strLTN = @"http://news.ltn.com.tw/rss/focus.xml";
NSString *strApple = @"http://www.appledaily.com.tw/rss/newcreate/kind/rnews/type/new";

@synthesize aryLTN, aryUDN, aryApple, arySummary;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSMutableArray *UDN = [[[FeedPuller sharedMgr] parse:strUDN] mutableCopy];
    NSMutableArray *LTN = [[[FeedPuller sharedMgr] parse:strLTN] mutableCopy];
    NSMutableArray *Apple = [NSMutableArray array]; //[[[FeedPuller sharedMgr] parse:strApple] mutableCopy];
    
    aryUDN = UDN;
    aryLTN = LTN;
    aryApple = Apple;
    
    // this is just for the demo use, if want a better summary, need to use keyword extraction and clustering system
    // right now, i don't have time for that
    
    //  let's do it in a cheap way
    NSMutableArray *summaryArray = [NSMutableArray array];
    
    [summaryArray addObjectsFromArray:[UDN subarrayWithRange:NSMakeRange(0, 5)]];
    [summaryArray addObjectsFromArray:[LTN subarrayWithRange:NSMakeRange(0, 5)]];
    //[summaryArray addObjectsFromArray:[Apple subarrayWithRange:NSMakeRange(0, 5)]];
    
    arySummary = summaryArray;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
 

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}

/*
    UDN rss: http://udn.com/udnrss/latest.xml
    LTN http://news.ltn.com.tw/rss/focus.xml
    apple http://www.appledaily.com.tw/rss/newcreate/kind/rnews/type/new
 
 */

@end
