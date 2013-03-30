//
//  GameScene.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(id)initWithInputHandler:(id<InputHandler>)inputHandler
{
    self = [super init];
    
    if(self)
    {
        _inputHandler = [inputHandler retain];
    }
    
    return self;
}

-(void)dealloc
{
    [_inputHandler release];
    [super dealloc];
}

@end
