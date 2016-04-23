//
//  FeedPuller.m
//  AShortDemo
//
//  Created by momofarm on 4/22/16.
//  Copyright © 2016 Chen Kuanfu. All rights reserved.
//

#import "FeedPuller.h"
#import <libxml2/libxml/parser.h>
#import <libxml2/libxml/tree.h>

@implementation FeedPuller

@synthesize aryMatch, matchIndex, matched, resultSet;

- (id) init
{
    self = [super init];
    
    if (self)
    {
        aryMatch = [NSArray arrayWithObjects: @"link", @"title", nil];
        
        matched = NO;
        
        resultSet = [NSMutableSet set];
        
    }
    
    return self;
}

+ (id) sharedMgr
{
    static FeedPuller *mgr = nil;
    static dispatch_once_t t;
    dispatch_once(&t, ^{
        
        mgr = [[self alloc] init];
    });
    
    return mgr;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    if (matched)
    {
        NSString *strname = [aryMatch objectAtIndex:matchIndex];
        
        NSString *strValue = string;
        
        //make a pair 
        NSLog(string);
        
        NSDictionary *d = [NSDictionary dictionaryWithObject:strValue forKey:strname];
        
        [resultSet addObject:d];
    }
    
    matched = NO;
}
    
- (NSArray *)parse:(NSString *)url
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    
    [parser setDelegate:self];
    
    BOOL b = [parser parse];
    
    if (b)
    {
        //NSLog(@"success");
        
    }
    else{
        //NSLog(@"fail");
    }
    
    //    NSError *er = [NSError new];
//    
//    NSString *strData = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&er];
//    
//    const char *content = [strData cStringUsingEncoding:NSUTF8StringEncoding];
//    
//    xmlDocPtr doc; /* the resulting document tree */
//    
//    /*
//     * The document being in memory, it have no base per RFC 2396,
//     * and the "noname.xml" argument will serve as its base.
//     */
//    /*
//     xmlReadMemory		(const char *buffer,
//     int size,
//     const char *URL,
//     const char *encoding,
//     int options);
//     
//     */
//    
//    doc = xmlReadMemory(content, [strData length], "noname.xml", NULL, 0);
//    if (doc == NULL) {
//        NSLog(@"Failed to parse document\n");
//    }
//    
//    NSXMLParser
//    xmlFreeDoc(doc);
//
//    
    return nil;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

    for (NSString *match in aryMatch) {
        if ([elementName isEqualToString:match])
        {
            matched = YES;
            matchIndex = [aryMatch indexOfObject:match];
            
            //NSDictionary *dic =
        }
        
    }
    
    
}


- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    
    
}

- (NSArray *) highlight:(NSArray *)aryInput
{
    
    return nil;
}

@end
