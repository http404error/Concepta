class MyPawn extends UTPawn;
    
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
Begin Object Class=SkeletalMeshComponent Name=WPawnSkeletalMeshComponent
    SkeletalMesh=SkeletalMesh'ConceptaAssets.Skeletal.TinyBall'
    //AnimTreeTemplate=AnimTree'CH_AnimHuman_Tree.AT_CH_ Human'
    //PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_C H_Corrupt_Male_Physics'
    //AnimSets(0)=AnimSet'CH_AnimHuman.Anims.K_AnimHuman _BaseMale'
End Object

    Begin Object Class=SpriteComponent Name=Sprite
        Sprite=Texture2D'ConceptaAssets.Symbol.A'
        HiddenGame=false
        HiddenEditor=false
        SpriteCategoryName="Symbol"
    End Object
    Components.Add(Sprite)
//components.add(WPawnSkeletalMeshComponent)
}