//
//  TouchLayer.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "TouchLayer.h"

@implementation TouchLayer

-(id)initWithInputHandler:(id<InputHandler>)inputHandler
{
    self = [super init];
    
    if(self)
    {
        _inputHandler = [inputHandler retain];
        isTouchEnabled_ = YES;
        [self BuildLayer];
    }
    
    return self;
}

-(void)BuildLayer
{
    //Abstract method.
}

-(void)dealloc
{
    [_inputHandler release];
    [super dealloc];
}

@end
