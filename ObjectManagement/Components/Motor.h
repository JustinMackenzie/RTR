//
//  Motor.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Component.h"

@class Vector2f;

@interface Motor : Component
{
    Vector2f *_velocity;
}

-(id)initWithGameObject:(GameObject *)gameObject AndVeclocity:(Vector2f *)velocity;
-(Vector2f *)Velocity;
-(void)SetVelocity:(Vector2f *)velocity;

@end
