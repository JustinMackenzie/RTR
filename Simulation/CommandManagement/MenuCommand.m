//
//  MenuCommand.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "MenuCommand.h"
#import "GameStateManager.h"

@implementation MenuCommand

-(id)initWithReciever:(GameStateManager *)reciever
{
    self = [super init];
    
    if(self)
    {
        _reciever = [reciever retain];
    }
    
    return self;
}

-(void)dealloc
{
    [_reciever release];
    [super dealloc];
}

@end
