//
//  Sprite.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "Sprite.h"

@implementation Sprite

-(id)initWithGameObject:(GameObject *)gameObject
{
    self = [super initWithGameObject:gameObject Name:@"Sprite"];
    
    if(self)
    {
        _dictionary = [NSMutableDictionary new];
    }
    
    return self;
}

-(void)AddSprite:(CCSprite *)sprite Key:(NSString *)key
{
    [_dictionary setValue:sprite forKey:key];
}

-(CCSprite *)GetSprite:(NSString *)key
{
    return [_dictionary valueForKey:key];
}

-(NSArray *)GetAllSprites
{
    return [_dictionary allValues];
}

-(void)dealloc
{
    [_dictionary release];
    [super dealloc];
}

@end
