//
//  ThrownObject.h
//  RTR_newPhysics
//
//  Created by Scott van Heesch on 13-03-11.
//
//




#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "PhysicalMan.h"




@interface ThrownObject : NSObject {
    b2World *_world;
    b2Body *box;
    bool projectileFired;
    float timeSinceFired;
    float totalTime;
    int randNum;
    int randPosNeg;
    int projectileQue;
    
    CGPoint startingLocation;
    CGPoint _location;
 
}

-(CGPoint)getLocation;

-(id)initWithWorld:(b2World *)world;

-(void)createProjectileInWorld:(b2World*)theWorld S1:(CCSprite*)S1 location:(CGPoint)location Speed:(float)speed;

-(void)updateLocation:(float)ticker;

@end
