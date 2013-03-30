//
//  Value.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-16.
//
//

#import "Value.h"

@implementation Value

-(id)initWithGameObject:(GameObject *)gameObject Value:(int)value
{
    self = [super initWithGameObject:gameObject Name:@"Value"];
    
    if(self)
    {
        _value = value;
    }
    
    return self;
}

-(int)GetValue
{
    return _value;
}

@end
