//
//  CommandManager.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-20.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "CommandManager.h"
#import "Queue.h"

@implementation CommandManager

-(id)init
{
	self = [super init];
    
	if (self)
    {
        _commandQueue = [[Queue alloc]init];
	}
    
	return self;
}

-(void)PlaceCommand:(id<Command>)command
{
    [_commandQueue enqueue:command];
}

-(void)update:(float)dt
{
    while (![_commandQueue isEmpty])
    {
        [[_commandQueue dequeue] Execute];
    }
}

-(void)dealloc
{
    [_commandQueue release];
    [super dealloc];
}


@end
