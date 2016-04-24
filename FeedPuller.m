//
//  FeedPuller.m
//  AShortDemo
//


#import "FeedPuller.h"

@implementation FeedPuller

@synthesize matchIndex, titleMatched, linkMatched, resultAry, currentLink, currentTitle;


- (id) init
{
    /*
     NSXMLParser implementation is so *FUC*ING* ugly, Apple please hire some smart guy do wise things.
     */
    
    self = [super init];
    
    if (self)
    {
        
        titleMatched = NO;
        
        linkMatched = NO;
        
        resultAry = [NSMutableArray array];
        
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
    
    if (titleMatched)
    {
        currentTitle = [string copy];
    }
    
    if (linkMatched)
    {
        
        //NSDictionary *d = [NSDictionary dictionaryWithObject:currentTitle forKey:currentLink];
        
        NSMutableDictionary *d = [NSMutableDictionary dictionary];
        
        currentLink = string;
        
        [d setObject:currentTitle forKey:@"title"];
        [d setObject:currentLink forKey:@"link"];
        
        [resultAry addObject:d];
    }
    
    titleMatched = NO;
    
    linkMatched = NO;
}
    
- (NSMutableArray *)parse:(NSString *)url
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    
    [parser setDelegate:self];
    
    [resultAry removeAllObjects];
    
    BOOL b = [parser parse];
    
    if (b)
    {
        NSLog(@"success");
        
        return resultAry;
    }
    else{
        NSLog(@"fail");
    }
    

    return nil;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

    if ([elementName isEqualToString:@"title"])
    {
        titleMatched = YES;
        
    }
    else if ([elementName isEqualToString:@"link"])
    {
        linkMatched = YES;
    }
    

}


- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    
    
}

@end
