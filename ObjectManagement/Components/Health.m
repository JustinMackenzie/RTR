//
//  Health.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "Health.h"

@implementation Health

-(id)initWithGameObject:(GameObject *)gameObject
{
    self = [super initWithGameObject:gameObject Name:@"Health"];
    
    if(self)
    {
        _alive = YES;
    }
    
    return self;
}

-(void)Kill
{
    _alive = NO;
}

-(BOOL)Alive
{
    return _alive;
}

@end
