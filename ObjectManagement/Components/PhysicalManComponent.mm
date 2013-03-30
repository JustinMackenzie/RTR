//
//  PhysicalManComponent.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-02-28.
//
//

#import "PhysicalManComponent.h"
#import "PhysicalMan.h"
#import "Transform.h"
#import "Sprite.h"
#import "Vector2f.h"
#import "CharacterStateManager.h"
#import "SimpleAudioEngine.h"

@implementation PhysicalManComponent

-(id)initWithGameObject:(GameObject *)gameObject World:(b2World *)world Transform:(Transform *)transform Sprite:(Sprite *)sprite CharacterState:(CharacterStateManager *)manager
{
    self = [super initWithGameObject:gameObject Name:@"PhysicalMan"];
    
    if(self)
    {
        _transform = [transform retain];
        _sprite = [sprite retain];
        _physicalMan = [[PhysicalMan alloc]initWithWorld:world Position:ccp([[_transform Position] X], [[_transform Position] Y])];
        
        [_physicalMan createCharacterInWorld:world LL:[_sprite GetSprite:@"LeftUpperLeg"] RL:[_sprite GetSprite:@"RightUpperLeg"] LLL:[_sprite GetSprite:@"LeftLowerLeg"] LRL:[_sprite GetSprite:@"RightLowerLeg"] B:[_sprite GetSprite:@"Body"] H:[_sprite GetSprite:@"Head"] LA:[_sprite GetSprite:@"LeftUpperArm"] RA:[_sprite GetSprite:@"RightUpperArm"] LLA:[_sprite GetSprite:@"LeftLowerArm"] LRA:[_sprite GetSprite:@"RightLowerArm"]];
        
        _characterStateManager = [manager retain];
    }
    
    return self;
}

-(void)Jump
{
    [_physicalMan moveSetVertVelocity:8.0f];
    [[SimpleAudioEngine sharedEngine] playEffect:@"Jump.wav"];
}

-(void)DoubleJump
{
    [_physicalMan moveSetVertVelocity:6.0f];
}

-(void)update:(float)dt
{
    [_physicalMan updateMovement:dt];
    
    if([_physicalMan canJump])
    {
        [_characterStateManager Done];
    }
    
    [_transform SetPosition:[[[Vector2f alloc]initWithX:_physicalMan.Position.x And:_physicalMan.Position.y] autorelease]];
}

-(void)dealloc
{
    [_transform release];
    [_physicalMan release];
    [_sprite release];
    [_characterStateManager release];
    [super dealloc];
}

@end
