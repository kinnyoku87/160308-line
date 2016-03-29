package view_aa
{
	import d2armor.display.AAFacade;
	import d2armor.display.ViewAA;
	
	import view_aa.desktop.Desktop_StateAA;
	import view_aa.lock.Lock_StateAA;
	import view_aa.res.Res_StateAA;
	import view_aa.transition.Lock2Desktop_TransitionAA;
	import view_aa.transition.Lock2Wp_TransitionAA;
	import view_aa.wallpaper.Wallpaper_StateAA;

public class Entry_ViewAA extends ViewAA
{

	override public function onViewAdded():void {
		
		AAFacade.setTransition(Lock_StateAA, Desktop_StateAA, Lock2Desktop_TransitionAA);
		AAFacade.setTransition(Lock_StateAA, Wallpaper_StateAA, Lock2Wp_TransitionAA);
		
//		this.getViewFusion().setState(new Res_StateAA(new Wallpaper_StateAA));
		this.getViewFusion().setState(new Res_StateAA(new Lock_StateAA));
	}
	
	
}
}