//
//  Tubby.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-02-24.
//
//

#import "Tubby.h"
#import "Transform.h"
#import "CharacterStateManager.h"
#import "CharacterStateObserver.h"
#import "PhysicalManComponent.h"
#import "Sprite.h"
#import "Health.h"

@implementation Tubby

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position World:(b2World *)world
{
    self = [super initWithTag:@"Tubby" Position:position];
    
    if(self)
    {
        
        CharacterStateManager *stateManager = [[[CharacterStateManager alloc]initWithGameObject:self] autorelease];
        CharacterStateObserver *observer = [[[CharacterStateObserver alloc]initWithSubject:stateManager]autorelease];
        [stateManager Attach:observer];
        [self AddComponent:stateManager];
        
        
        Sprite *sprite = [[[Sprite alloc]initWithGameObject:self] autorelease];
        [sprite AddSprite:[CCSprite spriteWithFile:@"NHead.png"] Key:@"Head"];
        [sprite AddSprite:[CCSprite spriteWithFile:@"Nbody.png"] Key:@"Body"];
        [sprite AddSprite:[CCSprite spriteWithFile:@"upperarm.png"] Key:@"LeftUpperArm"];
        [sprite AddSprite:[CCSprite spriteWithFile:@"lowerarm.png"] Key:@"LeftLowerArm"];
        [sprite AddSprite:[CCSprite spriteWithFile:@"upperarm.png"] Key:@"RightUpperArm"];
        [sprite AddSprite:[CCSprite spriteWithFile:@"lowerarm.png"] Key:@"RightLowerArm"];
        [sprite AddSprite:[CCSprite spriteWithFile:@"upperLeg.png"] Key:@"LeftUpperLeg"];
        [sprite AddSprite:[CCSprite spriteWithFile:@"lowerLeg.png"] Key:@"LeftLowerLeg"];
        [sprite AddSprite:[CCSprite spriteWithFile:@"upperLeg.png"] Key:@"RightUpperLeg"];
        [sprite AddSprite:[CCSprite spriteWithFile:@"lowerLeg.png"] Key:@"RightLowerLeg"];
        [self AddComponent:sprite];
        
        
        PhysicalManComponent *physicalMan = [[[PhysicalManComponent alloc]initWithGameObject:self World:world Transform:(Transform *)[self GetComponent:@"Transform"] Sprite:sprite CharacterState:stateManager] autorelease];
        [self AddComponent:physicalMan];
        
        
        [self AddComponent:[[Health alloc] initWithGameObject:self]];
        
    }
    
    return self;
}

-(void)Jump
{
    [(PhysicalManComponent *)[self GetComponent:@"PhysicalMan"] Jump];
}

-(void)DoubleJump
{
    [(PhysicalManComponent *)[self GetComponent:@"PhysicalMan"] DoubleJump];
}

@end
