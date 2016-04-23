//
//  FeedPuller.h
//  AShortDemo
//
//  Created by momofarm on 4/22/16.
//  Copyright © 2016 Chen Kuanfu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedPuller : NSObject<NSXMLParserDelegate>
{
    
    
}
- (NSArray *)parse:(NSString *)url;

+ (id) sharedMgr;

- (NSArray *) pull:(NSString *)url;

- (NSArray *) highlight:(NSArray *)aryInput;

@property NSArray *aryMatch;

@property BOOL matched;

@property NSUInteger matchIndex;

@property NSMutableSet *resultSet;


@end
