//
//  ThrownObjectComponent.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "Component.h"
#import "b2World.h"
#import "Updatable.h"

@class Transform;
@class ThrownObject;
@class Sprite;
@class Motor;

@interface ThrownObjectComponent : Component <Updatable>
{
    Transform *_transform;
    ThrownObject *_thrownObject;
    Sprite *_sprite;
    Motor *_motor;
}

-(id)initWithGameObject:(GameObject *)gameObject Transform:(Transform *)transform Sprite:(Sprite *)sprite Motor:(Motor *)motor World:(b2World *)world;

@end
