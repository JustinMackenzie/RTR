//
//  ThrownObject.cpp
//  RTR_newPhysics
//
//  Created by Scott van Heesch on 13-03-11.
//
//

#include "ThrownObject.h"

@implementation ThrownObject


-(id)initWithWorld:(b2World *)world
{
    self = [super init];
    
    if(self)
    {
        _world = world;
    }
    
    totalTime = 0;
    projectileFired=true;


    return self;
}

-(void)createProjectileInWorld:(b2World *)theWorld S1:(CCSprite*)S1 location:(CGPoint)location Speed:(float)speed{
    
    startingLocation = location;
    _location = location;
    
    box = [self createProjectileAtLocation:theWorld withSprite:S1 location:ccp(location.x, location.y) withSize:CGSizeMake(0.3, 0.3) friction:1 restitution:0.1f density:50];
    
    randNum = arc4random() % 9;
    randPosNeg = arc4random() % 2;
    
    if (randPosNeg == 0) {
        box->ApplyLinearImpulse( b2Vec2(-20*speed,50-10*randNum), box->GetWorldCenter() );
    }
    
    if (randPosNeg == 1){
        box->ApplyLinearImpulse( b2Vec2(-20*speed,50+10*randNum), box->GetWorldCenter() );
    }
    

}
    
    
    


-(void)updateLocation:(float)ticker{
    

    /*randNum = arc4random() % 9;
    randPosNeg = arc4random() % 2;
    
    totalTime = totalTime + ticker;

    
    if (projectileFired==false)
    {
        
        if (randPosNeg == 0) {
        box->ApplyLinearImpulse( b2Vec2(-20*speed,50-10*randNum), box->GetWorldCenter() );
        } 
        
        if (randPosNeg == 1){
        box->ApplyLinearImpulse( b2Vec2(-20*speed,50+10*randNum), box->GetWorldCenter() );
        }
        
        
        projectileFired = true;
        
        
    }
    
    if (totalTime > delay) {
            box->SetLinearVelocity( b2Vec2( 0, 0 ) );
            box->SetTransform( b2Vec2( startingLocation.x, startingLocation.y ), 0 );
            totalTime= 0.0f;
            projectileFired = false;

            
        }*/
    
    b2Vec2 pos = box->GetPosition();
    
    _location = ccp(pos.x, pos.y);
    
}

-(CGPoint)getLocation
{
    return _location;
}


-(b2Body*) createProjectileAtLocation:(b2World*)newWorld withSprite:(CCSprite*)withSprite location:(CGPoint)location withSize:(CGSize)size friction:(float32)friction restitution:(float32)restitution density:(float32)density {
    
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position = b2Vec2(location.x, location.y);
    bodyDef.allowSleep = false;
    bodyDef.gravityScale = 0.5;
    b2Body *body = newWorld->CreateBody(&bodyDef);
    body -> SetUserData(withSprite);
    
    b2PolygonShape shape;
    shape.SetAsBox(size.width, size.height);
    
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &shape;
    
    fixtureDef.density = density;
    fixtureDef.friction = friction;
    fixtureDef.restitution = restitution;
    fixtureDef.filter.groupIndex= -9;
    
    b2Fixture *_fixture;
    _fixture = body->CreateFixture(&fixtureDef);
    return body;
    
}





@end