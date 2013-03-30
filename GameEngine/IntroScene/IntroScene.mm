//
//  IntroScene.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-26.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "IntroScene.h"
#import "IntroductionLayer.h"

@implementation IntroScene

-(id)initWithInputHandler:(id<InputHandler>)inputHandler
{
    self = [super initWithInputHandler:inputHandler];
    
    if(self)
    {
        _introductionLayer = [[IntroductionLayer alloc]initWithInputHandler:inputHandler];
        [self addChild:_introductionLayer];
    }
    
    return self;
}

-(void)dealloc
{
    [_introductionLayer release];
    [super dealloc];
}

@end
