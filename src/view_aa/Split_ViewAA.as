package view_aa
{
	import d2armor.display.ViewAA;
	
	import view_aa.res.Res_StateAA;
	import view_aa.split.Split_StateAA;
	
	public class Split_ViewAA extends ViewAA
	{
		
		override public function onViewAdded():void {
			
			
			this.getViewFusion().setState(new Res_StateAA(new Split_StateAA));
		}
		
		
	}
}