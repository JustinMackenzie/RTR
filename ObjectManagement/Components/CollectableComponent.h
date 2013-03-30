//
//  CollectableComponent.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-17.
//
//

#import "Component.h"
#import "Updatable.h"
#import "b2World.h"

@class Collectables;
@class Sprite;
@class Transform;
@class Motor;

@interface CollectableComponent : Component <Updatable>
{
    Collectables *_collectable;
    Sprite *_sprite;
    Transform *_transform;
    Motor *_motor;
}

-(id)initWithGameObject:(GameObject *)gameObject World:(b2World *)world Transform:(Transform *)transform Sprite:(Sprite *)sprite Motor:(Motor *)motor;

-(BOOL)Hit;

@end
