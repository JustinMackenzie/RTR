//
//  AboutScene.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "AboutScene.h"
#import "AboutLayer.h"

@implementation AboutScene

-(id)initWithInputHandler:(id<InputHandler>)inputHandler
{
    self = [super initWithInputHandler:inputHandler];
    
    if(self)
    {
        _aboutLayer = [[AboutLayer alloc]initWithInputHandler:inputHandler];
        
        [self addChild:_aboutLayer];
    }
    
    return self;
}

-(void)dealloc
{
    [_aboutLayer release];
    [super dealloc];
}

@end
