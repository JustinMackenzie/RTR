//
//  CollectableComponent.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-17.
//
//

#import "CollectableComponent.h"
#import "Transform.h"
#import "Sprite.h"
#import "Colletables.h"
#import "Vector2f.h"
#import "Motor.h"

@implementation CollectableComponent

-(id)initWithGameObject:(GameObject *)gameObject World:(b2World *)world Transform:(Transform *)transform Sprite:(Sprite *)sprite Motor:(Motor *)motor
{
    self = [super initWithGameObject:gameObject Name:@"CollectableComponent"];
    
    if(self)
    {
        _transform = [transform retain];
        _sprite = [sprite retain];
        _collectable = [[Collectables alloc]initWithWorld:world];
        _motor = [motor retain];
        [_collectable createCollectablesInWorld:world S1:[_sprite GetSprite:@"Body"] location:ccp([[_transform Position] X], [[_transform Position] Y]) speed:[[_motor Velocity] X]];
    }
    
    return self;
}

-(void)update:(float)dt
{
    [_collectable updateMovementSpeed:dt];
    [_transform SetPosition:[[Vector2f alloc]initWithX:[_collectable getPosition].x And:[_collectable getPosition].y]];
}

-(BOOL)Hit
{
    if([_collectable Hit])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)dealloc
{
    [_collectable release];
    [_transform release];
    [_sprite release];
    [super dealloc];
}

@end
