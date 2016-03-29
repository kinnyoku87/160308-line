package view_aa.transition
{
	import d2armor.animate.ATween;
	import d2armor.animate.TweenMachine;
	import d2armor.display.FusionAA;
	import d2armor.display.TransitionAA;
	
	import view_aa.ViewConfig;
	import view_aa.desktop.Desktop_StateAA;
	import view_aa.lock.Lock_StateAA;

public class Lock2Desktop_TransitionAA extends TransitionAA
{
	
	override public function onTransferOut() : void
	{
		var fusion_A:FusionAA;
		var fusion_B:FusionAA;
		var tween_A:ATween;
		
		m_stateA = this.getA() as Lock_StateAA;
		m_stateB = this.getB() as Desktop_StateAA;
		
		m_stateA.getRoot().getWindow().getTouch().touchEnabled = false;
		
		fusion_A = m_stateA.getFusion2();
		tween_A = TweenMachine.to(fusion_A, ViewConfig.DURA1, {scaleX:1.05, scaleY:1.05,alpha:0});
		tween_A.onComplete = function() :void {
			fusion_A.kill();
		}
		
	}
	
	override public function onTransferIn() : void{
		var fusion_B:FusionAA;
		var tween_A:ATween;
		
		fusion_B = m_stateB.getFusion2();
		tween_A = TweenMachine.from(fusion_B, ViewConfig.DURA1, {scaleX:1.1, scaleY:1.1,alpha:0});
		tween_A.onComplete = function() :void {
			m_stateB.getRoot().getWindow().getTouch().touchEnabled = true;
		}
	}
	
	
	private var m_stateA:Lock_StateAA;
	private var m_stateB:Desktop_StateAA;
		
}
}