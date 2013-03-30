//
//  Platform.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "Platform.h"
#import "Sprite.h"
#import "PlatformComponent.h"
#import "Transform.h"
#import "Motor.h"
#import "Vector2f.h"

@implementation Platform

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position Speed:(float)speed World:(b2World *)world Size:(int)size
{
    self = [super initWithTag:tag Position:position];
    
    if(self)
    {
        Sprite *sprite = [[Sprite alloc]initWithGameObject:self];
        
        switch (size)
        {
            case 1:
                [sprite AddSprite:[CCSprite spriteWithFile:@"platform1.png"] Key:@"Body"];
                break;
                
            case 2:
                [sprite AddSprite:[CCSprite spriteWithFile:@"platform2.png"] Key:@"Body"];
                break;
                
            case 3:
                [sprite AddSprite:[CCSprite spriteWithFile:@"platform3.png"] Key:@"Body"];
                break;
                
            case 4:
                [sprite AddSprite:[CCSprite spriteWithFile:@"platform4.png"] Key:@"Body"];
                break;
                
            default:
                break;
        }
        
        [self AddComponent:[sprite autorelease]];
        
        [self AddComponent:[[[Motor alloc] initWithGameObject:self AndVeclocity:[[Vector2f alloc] initWithX:speed And:0]] autorelease]];
        
        [self AddComponent:[[[PlatformComponent alloc]initWithGameObject:self Transform:(Transform *)[self GetComponent:@"Transform"] Sprite:sprite Motor:(Motor *)[self GetComponent:@"Motor"] World:world Size:size] autorelease]];
    }
    
    return self;
}

@end
