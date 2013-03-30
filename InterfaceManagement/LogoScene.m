//
//  LogoScene.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-18.
//
//

#import "LogoScene.h"
#import "LogoLayer.h"

@implementation LogoScene

-(id)initWithInputHandler:(id<InputHandler>)inputHandler
{
    self = [super initWithInputHandler:inputHandler];
    
    if(self)
    {
        _logoLayer = [[LogoLayer alloc]initWithInputHandler:inputHandler];
        [self addChild:_logoLayer];
    }
    
    return self;
}

-(void)dealloc
{
    [_logoLayer release];
    [super dealloc];
}

@end
