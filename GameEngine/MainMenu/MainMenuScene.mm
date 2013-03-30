//
//  MainMenuScene.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "MainMenuScene.h"
#import "MainMenuLayer.h"

@implementation MainMenuScene

-(id)initWithInputHandler:(id<InputHandler>)inputHandler
{
    self = [super initWithInputHandler:inputHandler];
    
    if(self)
    {
        _mainMenuLayer = [[MainMenuLayer alloc]initWithInputHandler:inputHandler];
        
        [self addChild:_mainMenuLayer];
    }
    
    return self;
}

-(void)dealloc
{
    [_mainMenuLayer release];
    [super dealloc];
}

@end
