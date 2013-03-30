//
//  JumpCommand.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-27.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "JumpCommand.h"
#import "CharacterStateManager.h"

@implementation JumpCommand

-(id)initWithReciever:(CharacterStateManager *)reciever
{
    self = [super init];
    
    if(self)
    {
        _reciever = [reciever retain];
    }
    
    return self;
}

-(void)Execute
{
    [_reciever Jump];
}

-(void)dealloc
{
    [_reciever release];
    [super dealloc];
}



@end
