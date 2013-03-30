//
//  PhysicalMan.m
//  RTR_newPhysics
//
//  Created by Scott van Heesch on 13-01-28.
//
//

#import "PhysicalMan.h"

@implementation PhysicalMan

@synthesize Position = _position;

-(id)initWithWorld:(b2World *)world Position:(CGPoint)position
{
    self = [super init];
    
    if(self)
    {
        _world = world;
        _position = position;
    }
    
    return self;
}


-(void)createCharacterInWorld:(b2World *)theWorld  LL:(CCSprite*)LL RL:(CCSprite*)RL LLL:(CCSprite*)LLL LRL:(CCSprite*)LRL B:(CCSprite*)B H:(CCSprite*)H LA:(CCSprite*)LA RA:(CCSprite*)RA LLA:(CCSprite*)LLA LRA:(CCSprite*)LRA{
    
    
    b2BodyDef mainBodyDef;
    mainBodyDef.type = b2_dynamicBody;
    mainBodyDef.position.Set((_position.x), _position.y);
    
    mainBody = theWorld->CreateBody(&mainBodyDef);
    
    mainBody -> SetUserData(B);
    
    b2CircleShape bodyCircle;
    bodyCircle.m_radius = 0.7;
    
    
    
    b2FixtureDef bodyCircleFDef;
    bodyCircleFDef.filter.groupIndex =-10;
    bodyCircleFDef.shape= &bodyCircle;
    bodyCircleFDef.density =1;
    bodyCircleFDef.restitution = 1;
    bodyCircleFDef.friction = 1;
    
    mainBody->CreateFixture(&bodyCircleFDef);
    
    
    
    
    head = [self createCircleWithJoint:_world withSprite:(H) location:ccp(_position.x,_position.y+1.0) radius:0.4 bodyType:b2_dynamicBody angularDamp:10 linearDamp:10 collisionGroup:-10 density:1 connectingBody:mainBody enableMotor:false enableLimit:true motorSpeed:0 jointPlace:ccp(_position.x,_position.y+0.3) lowerAngle:-20 upperAngle:20 maxTorque:1];
    
    
    
    
    //Anchor for main character
    
    b2BodyDef worldAnchorDef;
    worldAnchorDef.type=b2_kinematicBody;
    worldAnchorDef.position.Set(_position.x, (_position.y+0.7));
    worldAnchor = theWorld->CreateBody(&worldAnchorDef);
    
    //NEXT 6 LINES CAN BE DELEATED SAFELY FOR RELEASE...i think...
    
    b2CircleShape anchorCircle;
    anchorCircle.m_radius = 0.1f;
    
    b2FixtureDef anchorCircleDef;
    anchorCircleDef.filter.groupIndex =-10;
    anchorCircleDef.isSensor = false;
    
    anchorCircleDef.shape = &anchorCircle;
    
    worldAnchor->CreateFixture(&anchorCircleDef);
    
    //now do anchor joint
    
    
    b2DistanceJointDef anchorJointDef;
    anchorJointDef.Initialize(worldAnchor,mainBody,b2Vec2(_position.x,(_position.y+0.7)),b2Vec2((_position.x),(_position.y+0.7)));
    
    anchorJointDef.collideConnected = false;
    anchorJointDef.frequencyHz = 2.0f;
    anchorJointDef.dampingRatio = 0.1f;
    b2DistanceJoint *anchorJoint;
    anchorJoint = (b2DistanceJoint*)_world->CreateJoint(&anchorJointDef);
    
    //END OF ANCHOR
    
    
    
    //START OF Ground SENSOR -> used to ensure tubby stays above ground / platforms
    
    b2BodyDef groundDef;
    groundDef.type = b2_dynamicBody;
    groundDef.position = b2Vec2((_position.x), (_position.y-1.0f));
    //bodySDef.allowSleep = true;
    groundSensor = theWorld->CreateBody(&groundDef);
    
    b2PolygonShape groundShape;
    groundShape.SetAsBox(0.7f, 0.5f);
    
    b2FixtureDef groundFixtureDef;
    groundFixtureDef.filter.groupIndex =-10;
    groundFixtureDef.shape = &groundShape;
    groundFixtureDef.isSensor = true;
    
    groundSensor->CreateFixture(&groundFixtureDef);
    
    
    b2RevoluteJointDef groundSensorJointDef;
    groundSensorJointDef.Initialize(groundSensor, worldAnchor, b2Vec2(((_position.x)), ((_position.y+2.0f))));
    b2RevoluteJoint *groundSensorJoint;
    groundSensorJoint = (b2RevoluteJoint*)_world->CreateJoint(&groundSensorJointDef);
    
    
    //end ground Sensor
    
    
    
    //START OF JUMP SENSOR - used to check if tubby is on platform before jumping
    
    b2BodyDef jumpDef;
    jumpDef.type = b2_dynamicBody;
    jumpDef.position = b2Vec2((_position.x), (_position.y-1.6f));
    //bodySDef.allowSleep = true;
    jumpSensor = theWorld->CreateBody(&jumpDef);
    
    b2PolygonShape jumpShape;
    jumpShape.SetAsBox(0.7f, 0.1f);
    
    b2FixtureDef jumpFixtureDef;
    jumpFixtureDef.filter.groupIndex =-10;
    jumpFixtureDef.shape = &jumpShape;
    jumpFixtureDef.isSensor = true;
    
    jumpSensor->CreateFixture(&jumpFixtureDef);
    
    
    
    b2RevoluteJointDef jumpSensorJointDef;
    jumpSensorJointDef.Initialize(jumpSensor, worldAnchor, b2Vec2(((_position.x)), ((_position.y+2.0f))));
    
    b2RevoluteJoint *jumpSensorJoint;
    jumpSensorJoint = (b2RevoluteJoint*)_world->CreateJoint(&jumpSensorJointDef);
    
    
    
    //end JUMP Sensor
    
    
    
    
    
    
    
    
    /////tubby box sensor -> stops collectables from hittingjump sensor
    
    b2BodyDef boxDef;
    boxDef.type = b2_dynamicBody;
    boxDef.position = b2Vec2((_position.x), (_position.y-1.1f));
    
    boxSensor = theWorld->CreateBody(&boxDef);
    
    b2PolygonShape boxShape;
    boxShape.SetAsBox(0.8f, 0.7f);
    
    b2FixtureDef boxFixtureDef;
    boxFixtureDef.filter.groupIndex =-10;
    boxFixtureDef.shape = &boxShape;
    boxFixtureDef.isSensor = true;
    
    boxSensor->CreateFixture(&boxFixtureDef);
    
    
    
    b2RevoluteJointDef boxSensorJointDef;
    boxSensorJointDef.Initialize(boxSensor, worldAnchor, b2Vec2(((_position.x)), ((_position.y+2.0f))));
    
    b2RevoluteJoint *boxSensorJoint;
    boxSensorJoint = (b2RevoluteJoint*)_world->CreateJoint(&boxSensorJointDef);
    
    
    ///end box sensor
    
    
    
    
    
    
    /// CHANGE enablemotor TO TRUE AFTER BUILDING
    
    rightLeg = [self createBoxWithJoint:_world withSprite:(RL) location:ccp(_position.x-0.1f, _position.y-0.7f) size:CGSizeMake(0.8, 0.5) bodyType:b2_dynamicBody angularDamp:1 linearDamp:1 collisionGroup:-10 density:1 connectingBody:mainBody enableMotor:true enableLimit:true motorSpeed:0 jointPlace:ccp(_position.x-0.1f, _position.y-0.2f) lowerAngle:-60 upperAngle:60 maxTorque:20];
    
    
    lowerRightLeg = [self createBoxWithJoint:_world withSprite:(LRL) location:ccp(_position.x-0.1f,_position.y-1.1f) size:CGSizeMake(0.6, 0.5) bodyType:b2_dynamicBody angularDamp:1 linearDamp:1 collisionGroup:-10 density:1 connectingBody:rightLeg->GetBodyA() enableMotor:false enableLimit:true motorSpeed:1 jointPlace:ccp(_position.x+0.1f,_position.y-0.8f) lowerAngle:0 upperAngle:50 maxTorque:1];
    
    leftLeg = [self createBoxWithJoint:_world withSprite:(LL) location:ccp(_position.x-0.1f, _position.y-0.7f) size:CGSizeMake(0.8, 0.5) bodyType:b2_dynamicBody angularDamp:1 linearDamp:1 collisionGroup:-10 density:1 connectingBody:mainBody enableMotor:true enableLimit:true motorSpeed:0 jointPlace:ccp(_position.x-0.1f, _position.y-0.2f) lowerAngle:-60 upperAngle:60 maxTorque:20];
    
    lowerLeftLeg = [self createBoxWithJoint:_world withSprite:(LLL) location:ccp(_position.x-0.1f,_position.y-1.1f) size:CGSizeMake(0.6, 0.5) bodyType:b2_dynamicBody angularDamp:1 linearDamp:1 collisionGroup:-10 density:1 connectingBody:leftLeg->GetBodyA() enableMotor:false enableLimit:true motorSpeed:1 jointPlace:ccp(_position.x+0.1f,_position.y-0.8f) lowerAngle:0 upperAngle:50 maxTorque:1];
    
    
    rightArm = [self createBoxWithJoint:_world withSprite:(RA) location:ccp(_position.x,_position.y+0.1) size:CGSizeMake(0.6, 0.6) bodyType:b2_dynamicBody angularDamp:1 linearDamp:1 collisionGroup:-10 density:1 connectingBody:mainBody enableMotor:true enableLimit:false motorSpeed:0 jointPlace:ccp(_position.x,_position.y+0.2) lowerAngle:0 upperAngle:100 maxTorque:10];
    
    lowerRightArm = [self createBoxWithJoint:_world withSprite:(LRA) location:ccp(_position.x,_position.y-0.3) size:CGSizeMake(0.5, 0.6) bodyType:b2_dynamicBody angularDamp:1 linearDamp:1 collisionGroup:-10 density:1 connectingBody:rightArm->GetBodyA() enableMotor:false enableLimit:true motorSpeed:0 jointPlace:ccp(_position.x,_position.y-0.2) lowerAngle:-90 upperAngle:0 maxTorque:1];
    
    
    //leftArm = [self createBoxWithJoint:_world withSprite:(LA) location:ccp(_position.x,_position.y+0.1) size:CGSizeMake(0.6, 0.6) bodyType:b2_dynamicBody angularDamp:1 linearDamp:1 collisionGroup:-10 density:1 connectingBody:mainBody enableMotor:true enableLimit:false motorSpeed:0 jointPlace:ccp(_position.x,_position.y+0.2) lowerAngle:0 upperAngle:100 maxTorque:10];
    
    //lowerLeftArm = [self createBoxWithJoint:_world withSprite:(LLA) location:ccp(_position.x,_position.y-0.3) size:CGSizeMake(0.5,0.6) bodyType:b2_dynamicBody angularDamp:1 linearDamp:1 collisionGroup:-10 density:1 connectingBody:leftArm->GetBodyA() enableMotor:false enableLimit:true motorSpeed:0 jointPlace:ccp(_position.x,_position.y-0.2) lowerAngle:-90 upperAngle:0 maxTorque:1];
    
    
}










-(void) updateMovement:(float)ticker{
    
    
    const float GRAVITY = -9.81f;
    
    const int RUNSPEED= 10;
    
    // RUNNING
    tick = tick + RUNSPEED*ticker;
    if (tick > 6.3) {
        tick = 0;
    }
    
    rightLeg->SetMotorSpeed(2*RUNSPEED*cosf(tick));
    leftLeg->SetMotorSpeed(2*RUNSPEED*cosf(tick+3.15));
    
    //leftArm->SetMotorSpeed(6*RUNSPEED*cosf(tick));
    rightArm->SetMotorSpeed(6*RUNSPEED*cosf(tick+3.15));
    //END RUNNING
    
    
    
    velocity = velocity + GRAVITY*ticker;
    
    
    b2ContactEdge* groundSensorEdge = groundSensor->GetContactList();
    
    while (groundSensorEdge)
    {
        b2Contact* contact = groundSensorEdge->contact;
        
        if (contact->IsTouching()) {
            [self standUp];
            break;
        }
        groundSensorEdge = groundSensorEdge->next;
    }
    
    while (!groundSensorEdge) {
        if (manStandingUp == true) {
            [self stopVert];
            manStandingUp = false;
            break;
        }
        break;
    }
    
    
    b2ContactEdge* jumpSensorEdge = jumpSensor->GetContactList();
    
    while (jumpSensorEdge)
    {
        b2Contact* contact = jumpSensorEdge->contact;
        
        if (contact->IsTouching()) {
            manCanJump = true;
            manCanDoubleJump = true;
            if (velocity < 1) { //sometimes sensor stops the jump before it can happen so added this
                velocity = 0.0f;
            }
            break;
        }
        jumpSensorEdge = jumpSensorEdge->next;
    }
    
    while (!jumpSensorEdge) {
        manCanJump = false;
        [self moveSetVertVelocity:velocity];
        break;
    }
    
    
    bodyPos = worldAnchor->GetPosition();
    
    self.Position = ccp(bodyPos.x, bodyPos.y);
}

-(bool)canJump
{
    return manCanJump && manCanDoubleJump;
}


-(void) standUp{
    manStandingUp = true;
    mainBody->SetLinearVelocity(b2Vec2(0.0f,4.0f));
    worldAnchor->SetLinearVelocity(b2Vec2(0.0f,4.0f));
    groundSensor->SetLinearVelocity(b2Vec2(0.0f,4.0f));
    jumpSensor->SetLinearVelocity(b2Vec2(0.0f,4.0f));
    
}

-(void) moveSetVertVelocity:(float)jumpVelocity {
    
    velocity = jumpVelocity;
    mainBody->SetLinearVelocity(b2Vec2(0.0f,jumpVelocity));
    worldAnchor->SetLinearVelocity(b2Vec2(0.0f,jumpVelocity));
    groundSensor->SetLinearVelocity(b2Vec2(0.0f,jumpVelocity));
    jumpSensor->SetLinearVelocity(b2Vec2(0.0f,jumpVelocity));
}

-(void) stopVert {
    velocity = 0.0f;
    worldAnchor->SetLinearVelocity(b2Vec2(0.0f,0.0f));
    groundSensor->SetLinearVelocity(b2Vec2(0.0f,0.0f));
    jumpSensor->SetLinearVelocity(b2Vec2(0.0f,0.0f));
    
}


-(bool) getCanJump{
    return manCanJump;
}

-(bool) getCanDoublejump {
    return manCanDoubleJump;
}

-(void)setCanDoubleJump:(bool)canDJ{
    manCanDoubleJump = canDJ;
}






-(b2RevoluteJoint*) createBoxWithJoint:(b2World*)newWorld withSprite:(CCSprite*)withSprite location:(CGPoint)location size:(CGSize)size bodyType:(b2BodyType)bodyType angularDamp:(float)angularDamp linearDamp:(float)linearDamp collisionGroup:(int)collisionGroup density:(float)density connectingBody:(b2Body*)connectingBody enableMotor:(bool)enableMotor enableLimit:(bool)enableLimit motorSpeed:(int)motorSpeed jointPlace:(CGPoint)jointPlace lowerAngle:(int)lowerAngle upperAngle:(int)upperAngle maxTorque:(int)maxTorque {
    
    b2BodyDef bodyDef;
    bodyDef.type = bodyType;
    bodyDef.linearDamping = linearDamp;
    bodyDef.angularDamping = angularDamp;
    bodyDef.position = b2Vec2(location.x, location.y);
    bodyDef.allowSleep = false;
    b2Body *body = _world->CreateBody(&bodyDef);
    body -> SetUserData(withSprite);
    
    b2PolygonShape shape;
    shape.SetAsBox(size.width/2, size.height/2);
    
    b2FixtureDef shapeDef;
    shapeDef.filter.groupIndex = collisionGroup;
    shapeDef.shape = &shape;
    shapeDef.density = density;
    shapeDef.friction = 0;
    b2Fixture *bodyFix;
    bodyFix = body->CreateFixture(&shapeDef);
    
    //now do joint
    b2RevoluteJointDef jointDef;
    jointDef.Initialize(body, connectingBody, b2Vec2((jointPlace.x), (jointPlace.y)));
    jointDef.enableMotor = enableMotor;
    jointDef.enableLimit = enableLimit;
    jointDef.motorSpeed = motorSpeed;
    jointDef.lowerAngle  = CC_DEGREES_TO_RADIANS(lowerAngle);
    jointDef.upperAngle  = CC_DEGREES_TO_RADIANS(upperAngle);
    jointDef.maxMotorTorque = maxTorque;
    b2RevoluteJoint *joint;
    joint = (b2RevoluteJoint*)_world->CreateJoint(&jointDef);
    
    return joint;
    
}



-(void) createCircle:(b2World*)newWorld location:(CGPoint)location radius:(float)radius friction:(float32)friction restitution:(float32)restitution density:(float32)density bodyType:(b2BodyType)bodyType{
    
    
    
    b2BodyDef circleDef;
    circleDef.type = bodyType;
    circleDef.position.Set(location.x/PTM_RATIO, location.y/PTM_RATIO);
    b2Body *body = newWorld->CreateBody(&circleDef);
    
    b2CircleShape circle;
    circle.m_radius = radius/PTM_RATIO;
    
    b2FixtureDef circleFDef;
    circleFDef.shape= &circle;
    circleFDef.density =density;
    circleFDef.restitution = restitution;
    circleFDef.friction = friction;
    
    body->CreateFixture(&circleFDef);
}

-(b2RevoluteJoint*) createCircleWithJoint:(b2World*)newWorld withSprite:(CCSprite*)withSprite location:(CGPoint)location radius:(float)radius bodyType:(b2BodyType)bodyType angularDamp:(float)angularDamp linearDamp:(float)linearDamp collisionGroup:(int)collisionGroup density:(float)density connectingBody:(b2Body*)connectingBody enableMotor:(bool)enableMotor enableLimit:(bool)enableLimit motorSpeed:(int)motorSpeed jointPlace:(CGPoint)jointPlace lowerAngle:(int)lowerAngle upperAngle:(int)upperAngle maxTorque:(int)maxTorque {
    
    b2BodyDef bodyDef;
    bodyDef.type = bodyType;
    bodyDef.linearDamping = linearDamp;
    bodyDef.angularDamping = angularDamp;
    bodyDef.position = b2Vec2(location.x, location.y);
    bodyDef.allowSleep = false;
    b2Body *body = _world->CreateBody(&bodyDef);
    body -> SetUserData(withSprite);
    
    b2CircleShape circle;
    circle.m_radius = radius;
    
    b2FixtureDef shapeDef;
    shapeDef.filter.groupIndex = collisionGroup;
    shapeDef.shape = &circle;
    shapeDef.density = density;
    b2Fixture *bodyFix;
    bodyFix = body->CreateFixture(&shapeDef);
    
    //now do joint
    b2RevoluteJointDef jointDef;
    jointDef.Initialize(body, connectingBody, b2Vec2((jointPlace.x), (jointPlace.y)));
    jointDef.enableMotor = enableMotor;
    jointDef.enableLimit = enableLimit;
    jointDef.motorSpeed = motorSpeed;
    jointDef.lowerAngle  = CC_DEGREES_TO_RADIANS(lowerAngle);
    jointDef.upperAngle  = CC_DEGREES_TO_RADIANS(upperAngle);
    jointDef.maxMotorTorque = maxTorque;
    b2RevoluteJoint *joint;
    joint = (b2RevoluteJoint*)_world->CreateJoint(&jointDef);
    
    return joint;
    
}


-(void) createBox:(b2World*)newWorld location:(CGPoint)location size:(CGSize)size friction:(float32)friction restitution:(float32)restitution density:(float32)density bodyType:(b2BodyType)bodyType {
    
    b2BodyDef bodyDef;
    bodyDef.type = bodyType;
    bodyDef.position = b2Vec2(location.x/PTM_RATIO, location.y/PTM_RATIO);
    bodyDef.allowSleep = false;
    b2Body *body = newWorld->CreateBody(&bodyDef);
    
    b2PolygonShape shape;
    shape.SetAsBox(size.width/2/PTM_RATIO, size.height/2/PTM_RATIO);
    
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &shape;
    fixtureDef.density = density;
    fixtureDef.friction = friction;
    fixtureDef.restitution = restitution;
    
    body->CreateFixture(&fixtureDef);
}

-(void) dealloc {
    
    //delete _world;
    //_world = NULL;
    
    _world->DestroyBody(mainBody);
    
    _world->DestroyBody(worldAnchor);
    _world->DestroyBody(groundSensor);
    _world->DestroyBody(jumpSensor);
    
    _world->DestroyBody(leftLeg->GetBodyA());
    _world->DestroyBody(rightLeg->GetBodyA());
    _world->DestroyBody(leftArm->GetBodyA());
    _world->DestroyBody(rightArm->GetBodyA());
    
    _world->DestroyBody(lowerLeftLeg->GetBodyA());
    _world->DestroyBody(lowerRightLeg->GetBodyA());
    _world->DestroyBody(lowerLeftArm->GetBodyA());
    _world->DestroyBody(lowerRightArm->GetBodyA());
    
    _world->DestroyBody(head->GetBodyA());
    
    [super dealloc];
}

@end

