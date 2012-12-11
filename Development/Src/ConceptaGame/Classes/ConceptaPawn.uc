/**
 * Copyright 1998-2012 Epic Games, Inc. All Rights Reserved.
 */
class ConceptaPawn extends GamePawn
	config(Game);

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	Mesh.SetScale3D(vect(20,20,20));
}

	
simulated function bool CalcCamera(float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV)
{
	local vector start, end, hl, hn;
	local actor a;
	
	start = Location;
	
	if (Controller != none)
	{
		end = Location - Vector(Controller.Rotation) * 192.f;
	}
	else
	{
		end = Location - Vector(Rotation) * 192.f;
	}
	
	a = Trace(hl, hn, end, start, false);
	
	if (a != none)
	{
		out_CamLoc = hl;
	}
	else
	{
		out_CamLoc = end;
	}
	
	out_CamRot = Rotator(Location - out_CamLoc);
	return true;
}
	
	
	
	
defaultproperties
{

LandMovementState=PlayerFlying
GroundSpeed=350
AirSpeed=350

Begin Object Class=SkeletalMeshComponent Name=WPawnSkeletalMeshComponent
    SkeletalMesh=SkeletalMesh'ConceptaAssets.Mesh.TinyBall'
	bOwnerNoSee=false
    //AnimTreeTemplate=AnimTree'CH_AnimHuman_Tree.AT_CH_ Human'
    //PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_C H_Corrupt_Male_Physics'
    //AnimSets(0)=AnimSet'CH_AnimHuman.Anims.K_AnimHuman _BaseMale'
End Object

  Begin Object Class=DynamicSpriteComponent Name=YourSprite
      Sprite=Texture2D'ConceptaAssets.Texture.Green_circle'
    HiddenGame=false
  End Object
  Components.Add(YourSprite)
//components.add(WPawnSkeletalMeshComponent)
}