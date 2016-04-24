//
//  FeedPuller.h
//  AShortDemo
//


#import <Foundation/Foundation.h>

@interface FeedPuller : NSObject<NSXMLParserDelegate>
{
    
    
}
- (NSMutableArray *)parse:(NSString *)url;

+ (id) sharedMgr;

@property BOOL titleMatched;
@property BOOL linkMatched;

@property NSUInteger matchIndex;

@property NSMutableArray *resultAry;

@property NSString *currentTitle;
@property NSString *currentLink;

@end
