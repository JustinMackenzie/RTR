//
//  PlatformComponent.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "Component.h"
#import "b2World.h"
#import "Updatable.h"

@class SteppingStone;
@class Transform;
@class Motor;
@class Sprite;

@interface PlatformComponent : Component <Updatable>
{
    SteppingStone *_steppingStone;
    Transform *_transform;
    Motor *_motor;
    Sprite *_sprite;
}

-(id)initWithGameObject:(GameObject *)gameObject Transform:(Transform *)transform Sprite:(Sprite *)sprite Motor:(Motor *)motor World:(b2World *)world Size:(int)size;

-(BOOL)isOffScreen;

@end
