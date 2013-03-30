//
//  Coin.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "Coin.h"
#import "Value.h"
#import "Sprite.h"
#import "CollectableComponent.h"
#import "Motor.h"

@implementation Coin

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position World:(b2World *)world Value:(int)value Velocity:(Vector2f *)velocity
{
    self = [super initWithTag:tag Position:position];
    
    if(self)
    {
        Sprite *sprite = [[Sprite alloc]initWithGameObject:self];
        [sprite AddSprite:[CCSprite spriteWithFile:@"Ncoin.png"] Key:@"Body"];
        [self AddComponent:[sprite autorelease]];

        [self AddComponent:[[[Value alloc]initWithGameObject:self Value:value] autorelease]];
        
        [self AddComponent:[[[Motor alloc]initWithGameObject:self AndVeclocity:velocity] autorelease]];
        
        [self AddComponent:[[[CollectableComponent alloc]initWithGameObject:self World:world Transform:(Transform *)[self GetComponent:@"Transform"] Sprite:sprite Motor:(Motor *)[self GetComponent:@"Motor"]] autorelease]];
    }
    
    return self;
}

@end
