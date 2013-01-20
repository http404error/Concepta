class ConceptaPawn extends GamePawn
	config(Game);

/*simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	Mesh.SetScale3D(vect(20,20,20));
}*/

	
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
GroundSpeed=280
AirSpeed=280

Begin Object Class=SkeletalMeshComponent Name=SMC0
    SkeletalMesh=SkeletalMesh'ConceptaAssets.Mesh.TinyBall'
	bOwnerNoSee=false
	Scale=10
End Object