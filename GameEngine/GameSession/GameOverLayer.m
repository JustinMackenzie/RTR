//
//  GameOverLayer.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "GameOverLayer.h"

@implementation GameOverLayer

-(void)BuildLayer
{
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    
    CCMenuItemImage *restartButton = [CCMenuItemImage itemWithNormalImage:@"restart.png" selectedImage:nil target:_inputHandler selector:@selector(RestartPressed:)];
    
    CCMenuItemImage *quitButton = [CCMenuItemImage itemWithNormalImage:@"quit.png" selectedImage:nil target:_inputHandler selector:@selector(QuitPressed:)];
    
    CCMenu *pauseMenu = [CCMenu menuWithItems:restartButton, quitButton, nil];
    [pauseMenu alignItemsVerticallyWithPadding:screenSize.height * 0.05f];
    pauseMenu.position = ccp(screenSize.width * 0.5f, screenSize.height * 0.35);
    
    CCSprite *gameOver = [CCSprite spriteWithFile:@"gameover.png"];
    gameOver.position = ccp(screenSize.width * 0.5f, screenSize.height * 0.6f);
    
    
    [self addChild:[CCLayerColor layerWithColor:ccc4(0, 0, 0, 100)]];
    [self addChild:pauseMenu];
    [self addChild:gameOver];
}

@end
