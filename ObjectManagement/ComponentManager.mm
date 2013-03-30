//
//  ComponentManager.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "ComponentManager.h"
#import "Queue.h"
#import "Component.h"
#import "Sprite.h"
#import "Transform.h"
#import "Vector2f.h"
#import "ObjectSystem.h"
#import "CollectableComponent.h"
#import "Simulator.h"
#import "SessionManager.h"
#import "Value.h"
#import "SimpleAudioEngine.h"

@implementation ComponentManager

-(id)init
{
    self = [super init];
    
    if(self)
    {
        _components = [NSMutableDictionary new];
        _updatables = [NSMutableArray new];
        _newSpriteQueue = [[Queue alloc]init];
        _addQueue = [[Queue alloc]init];
        _removeQueue = [[Queue alloc]init];
        _removeSpriteQueue = [[Queue alloc]init];
    }
    
    return self;
}

-(void)MarkComponentForAddition:(Component *)component
{
    [_addQueue enqueue:component];
}

-(void)MarkComponentForRemoval:(Component *)component
{
    [_removeQueue enqueue:component];
}

-(void)AddComponent:(Component *)component
{
    NSString *name = [component Name];
    
    NSMutableArray *components = [_components valueForKey:name];
    
    if(components == nil)
    {
        components = [NSMutableArray new];
        [components addObject:component];
        [_components setValue:[components autorelease] forKey:name];
    }
    else
    {
        [components addObject:component];
    }
    
    if([name isEqualToString:@"Sprite"])
    {
        [_newSpriteQueue enqueue:component];
    }
    
    if([component conformsToProtocol:@protocol(Updatable)])
    {
        [_updatables addObject:component];
    }
}

-(void)RemoveComponent:(Component *)component
{
    NSString *name = [component Name];
    
    NSMutableArray *components = [_components valueForKey:name];
    
    if(components)
    {
        [components removeObject:component];
    }
    
    if([name isEqualToString:@"Sprite"])
    {
        [_removeSpriteQueue enqueue:component];
    }
    
    if([components conformsToProtocol:@protocol(Updatable)])
    {
        [_updatables removeObject:component];        
    }
}

-(NSArray *)GetComponentsOfType:(NSString *)type
{
    return [_components valueForKey:type];
}

-(NSMutableArray *)GetNewSprites
{
    NSMutableArray *result = [NSMutableArray new];
    
    // Loop through all sprite components in the new sprite queue.
    while (![_newSpriteQueue isEmpty])
    {
        // Get all sprites in the component.
        NSArray *sprites = [(Sprite*)[_newSpriteQueue dequeue] GetAllSprites];
        
        // Add each sprite object to the result.
        for (CCSprite *sprite in sprites)
        {
            [result addObject:sprite];
        }
    }
    
    return [result autorelease];
}

-(NSMutableArray *)GetRemovedSprites
{
    NSMutableArray *result = [NSMutableArray new];
    
    while (![_removeSpriteQueue isEmpty])
    {
        NSArray *sprites = [(Sprite *)[_removeSpriteQueue dequeue] GetAllSprites];
        
        for (CCSprite *sprite in sprites)
        {
            [result addObject:sprite];
        }
    }
    
    return [result autorelease];
}

-(void)update:(float)dt
{
    while (![_addQueue isEmpty])
    {
        [self AddComponent:[_addQueue dequeue]];
    }
    
    while (![_removeQueue isEmpty])
    {
        [self RemoveComponent:[_removeQueue dequeue]];
    }
    
    for (id<Updatable> u in _updatables)
    {
        [u update:dt];
    }
    
    for(Transform *t in [_components objectForKey:@"Transform"])
    {
        if([[t Position] X] < -5)
        {
            [[ObjectSystem SharedObjectSystem] RemoveObject:[t GameObject]];
        }
        
        if([[t Position] Y] < -3)
        {
            [[ObjectSystem SharedObjectSystem]RemoveObject:[t GameObject]];
        }
    }
    
    for ( CollectableComponent *c in [_components objectForKey:@"CollectableComponent"])
    {
        if([c Hit])
        {
            [[[Simulator SharedSimulator]getSessionManager] addScore:[(Value *)[[c GameObject] GetComponent:@"Value"] GetValue]];
            [[ObjectSystem SharedObjectSystem] RemoveObject:[c GameObject]];
            [[SimpleAudioEngine sharedEngine] playEffect:@"Pickup_Coin.wav"];
        }
    }
}

-(void)dealloc
{
    [_components release];
    [_updatables release];
    [_newSpriteQueue release];
    [_addQueue release];
    [_removeQueue release];
    [_removeSpriteQueue release];
    [super dealloc];
}

@end
