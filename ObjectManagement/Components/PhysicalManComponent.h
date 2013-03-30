//
//  PhysicalManComponent.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-02-28.
//
//

#import "Component.h"
#import "Box2D.h"
#import "Updatable.h"

@class PhysicalMan;
@class Transform;
@class Sprite;
@class CharacterStateManager;

@interface PhysicalManComponent : Component <Updatable>
{
    PhysicalMan *_physicalMan;
    Transform *_transform;
    Sprite *_sprite;
    CharacterStateManager *_characterStateManager;
}

-(id)initWithGameObject:(GameObject *)gameObject World:(b2World *)world Transform:(Transform *)transform Sprite:(Sprite *)sprite CharacterState:(CharacterStateManager *)manager;

-(void)Jump;

-(void)DoubleJump;

@end
