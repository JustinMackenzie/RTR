//
//  Transform.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Transform.h"
#import "Vector2f.h"

@implementation Transform

-(id)initWithGameObject:(GameObject *)gameObject Position:(Vector2f *)position Scale:(Vector2f *)scale Rotation:(float)rotation
{
    self = [super initWithGameObject:gameObject Name:@"Transform"];
    
    if(self)
    {
        _position = [position retain];
        _scale = [scale retain];
        _rotation = rotation;
    }
    
    return self;
}

-(id)initWithGameObject:(GameObject *)gameObject Position:(Vector2f *)position
{
    
    return [self initWithGameObject:gameObject Position:position Scale:[[Vector2f alloc]initWithX:1.0f And:1.0f] Rotation:0];
}

-(Vector2f *)Position
{
    return _position;
}

-(Vector2f *)Scale
{
    return _scale;
}

-(float)Rotation
{
    return _rotation;
}

-(void)SetPosition:(Vector2f *)position
{
    if(_position)
    {
        [_position autorelease];
    }
    
    _position = [position retain];
}

-(void)SetScale:(Vector2f *)scale
{
    if(_scale)
    {
        [_scale autorelease];
    }
    
    _scale = [scale retain];
}

-(void)SetRotation:(float)rotation
{
    _rotation = rotation;
}

-(void)dealloc
{
    [_position release];
    [_scale release];
    [super dealloc];
}

@end
