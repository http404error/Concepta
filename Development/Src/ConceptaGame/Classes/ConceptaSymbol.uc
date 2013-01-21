class ConceptaSymbol extends InterpActor;

var ConceptaPawn theplayer;

simulated function PostBeginPlay()
{	
	local ConceptaPawn A;
	
	Super.PostBeginPlay();
	
	foreach AllActors(class'ConceptaPawn', A)  {
		theplayer = A;
		`log("I'm alive!");
	}
}
	
event Tick (float DeltaTime)
{
	SetRotation(theplayer.GetViewRotation());
}
	
	
	
defaultproperties
{
bStatic=false //redundant with InterpActor
bNoDelete=false
bDestroyProjectilesOnEncroach=false
bStopOnEncroach=false

Begin Object /*Class=StaticMeshComponent */Name=StaticMeshComponent0
    StaticMesh=StaticMesh'ConceptaAssets.Mesh.flat_Plane'
	BlockRigidBody=false
	LightEnvironment=MyLightEnvironment
	bUsePrecomputedShadows=FALSE
End Object
}