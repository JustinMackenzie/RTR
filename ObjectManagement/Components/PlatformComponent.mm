//
//  PlatformComponent.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "PlatformComponent.h"
#import "SteppingStone.h"
#import "Transform.h"
#import "Motor.h"
#import "Sprite.h"
#import "Vector2f.h"

@implementation PlatformComponent

-(id)initWithGameObject:(GameObject *)gameObject Transform:(Transform *)transform Sprite:(Sprite *)sprite Motor:(Motor *)motor World:(b2World *)world Size:(int)size
{
    self = [super initWithGameObject:gameObject Name:@"PlatformComponent"];
    
    if(self)
    {
        _transform = [transform retain];
        _sprite = [sprite retain];
        _motor = [motor retain];
        _steppingStone = [[SteppingStone alloc]initWithWorld:world];
        
        [_steppingStone createPlatformsInWorld:world S1:[_sprite GetSprite:@"Body"] size:size location:ccp([[_transform Position] X], [[_transform Position] Y]) Speed:[[_motor Velocity] X]];
    }
    
    return self;
}
         
-(BOOL)isOffScreen
{
    if([_steppingStone isOffScreen])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)update:(float)dt
{
    [_steppingStone updateMovement:dt];
    [_transform SetPosition:[[[Vector2f alloc]initWithX:[_steppingStone getPosition].x And:[_steppingStone getPosition].y]autorelease]];
}

-(void)dealloc
{
    [_transform release];
    [_sprite release];
    [_motor release];
    [_steppingStone release];
    [super dealloc];
}

@end
