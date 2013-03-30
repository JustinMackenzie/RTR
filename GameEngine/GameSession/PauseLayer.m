//
//  PauseLayer.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-17.
//
//

#import "PauseLayer.h"

@implementation PauseLayer

-(void)BuildLayer
{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    
    CCMenuItemImage *continueButton = [CCMenuItemImage itemWithNormalImage:@"continue.png" selectedImage:nil target:_inputHandler selector:@selector(BackPressed:)];
    
    CCMenuItemImage *restartButton = [CCMenuItemImage itemWithNormalImage:@"restart.png" selectedImage:nil target:_inputHandler selector:@selector(RestartPressed:)];
    
    CCMenuItemImage *quitButton = [CCMenuItemImage itemWithNormalImage:@"quit.png" selectedImage:nil target:_inputHandler selector:@selector(QuitPressed:)];
    
    CCMenu *pauseMenu = [CCMenu menuWithItems:continueButton, restartButton, quitButton, nil];
    [pauseMenu alignItemsVerticallyWithPadding:screenSize.height * 0.1f];
    pauseMenu.position = ccp(screenSize.width * 0.5f, screenSize.height * 0.35);
    
    [self addChild:[CCLayerColor layerWithColor:ccc4(0, 0, 0, 100)]];
    [self addChild:pauseMenu];
}

@end
