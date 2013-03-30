//
//  Motor.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Motor.h"
#import "Vector2f.h"

@implementation Motor

-(id)initWithGameObject:(GameObject *)gameObject AndVeclocity:(Vector2f *)velocity
{
    self = [super initWithGameObject:gameObject Name:@"Motor"];
    
    if(self)
    {
        _velocity = [velocity retain];
    }
    
    return self;
}

-(Vector2f *)Velocity
{
    return _velocity;
}

-(void)SetVelocity:(Vector2f *)velocity
{
    if(_velocity)
    {
        [_velocity autorelease];
    }

    _velocity = [velocity retain];
}

-(void)dealloc
{
    [_velocity release];
    [super dealloc];
}

@end
