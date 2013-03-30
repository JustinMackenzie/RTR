//
//  ThrownObjectComponent.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "ThrownObjectComponent.h"
#import "Transform.h"
#import "Sprite.h"
#import "ThrownObject.h"
#import "Motor.h"
#import "Vector2f.h"

@implementation ThrownObjectComponent

-(id)initWithGameObject:(GameObject *)gameObject Transform:(Transform *)transform Sprite:(Sprite *)sprite Motor:(Motor *)motor World:(b2World *)world
{
    self = [super initWithGameObject:gameObject Name:@"ThrownObjectComponent"];
    
    if(self)
    {
        _transform = [transform retain];
        _sprite = [sprite retain];
        _motor = [motor retain];
        _thrownObject = [[ThrownObject alloc]initWithWorld:world];
        [_thrownObject createProjectileInWorld:world S1:[_sprite GetSprite:@"Body"] location:ccp([[_transform Position] X], [[_transform Position] Y]) Speed:([[_motor Velocity] X] * 2.0f)];
    }
    
    return self;
}

-(void)update:(float)dt
{
    [_thrownObject updateLocation:dt];
    [_transform SetPosition:[[[Vector2f alloc]initWithX:[_thrownObject getLocation].x And:[_thrownObject getLocation].y]autorelease]];
}

-(void)dealloc
{
    [_transform release];
    [_sprite release];
    [_motor release];
    [_thrownObject release];
    [super dealloc];
}

@end
