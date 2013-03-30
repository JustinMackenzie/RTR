//
//  HowScene.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "HowScene.h"
#import "HowLayer.h"

@implementation HowScene

-(id)initWithInputHandler:(id<InputHandler>)inputHandler
{
    self = [super initWithInputHandler:inputHandler];
    
    if(self)
    {
        _howLayer = [[HowLayer alloc]initWithInputHandler:inputHandler];
        
        [self addChild:_howLayer];
    }
    
    return self;
}

-(void)dealloc
{
    [_howLayer release];
    [super dealloc];
}

@end
