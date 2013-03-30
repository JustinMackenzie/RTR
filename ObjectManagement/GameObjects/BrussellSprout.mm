//
//  BrussellSprout.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "BrussellSprout.h"
#import "Sprite.h"
#import "Motor.h"
#import "Transform.h"
#import "ThrownObjectComponent.h"

@implementation BrussellSprout

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position World:(b2World *)world Velocity:(Vector2f *)velocity
{
    self = [super initWithTag:tag Position:position];
    
    if(self)
    {
        Sprite *sprite = [[Sprite alloc] initWithGameObject:self];
        [sprite AddSprite:[CCSprite spriteWithFile:@"Nbs.png"] Key:@"Body"];
        [self AddComponent:[sprite autorelease]];
        
        [self AddComponent:[[[Motor alloc] initWithGameObject:self AndVeclocity:velocity] autorelease]];
        [self AddComponent:[[[ThrownObjectComponent alloc] initWithGameObject:self Transform:(Transform *)[self GetComponent:@"Transform"] Sprite:sprite Motor:(Motor *)[self GetComponent:@"Motor"] World:world] autorelease]];
        
    }
    
    return self;
}

@end
