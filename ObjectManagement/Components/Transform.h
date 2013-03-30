//
//  Transform.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Component.h"

@class Vector2f;

@interface Transform : Component
{
    Vector2f *_position;
    Vector2f *_scale;
    float _rotation;
}

-(id)initWithGameObject:(GameObject *)gameObject Position:(Vector2f *)position Scale:(Vector2f *)scale Rotation:(float)rotation;
-(id)initWithGameObject:(GameObject *)gameObject Position:(Vector2f *)position;

-(Vector2f *)Position;
-(Vector2f *)Scale;
-(float)Rotation;
-(void)SetPosition:(Vector2f *)position;
-(void)SetScale:(Vector2f *)scale;
-(void)SetRotation:(float)rotation;

@end
