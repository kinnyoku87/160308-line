package view_aa.transition
{
	import d2armor.animate.ATween;
	import d2armor.animate.TweenMachine;
	import d2armor.display.FusionAA;
	import d2armor.display.TransitionAA;
	
	import view_aa.ViewConfig;
	import view_aa.desktop.Desktop_StateAA;
	import view_aa.lock.Lock_StateAA;
	import view_aa.wallpaper.Wallpaper_StateAA;
	
	public class Lock2Wp_TransitionAA extends TransitionAA
	{
		
		override public function onTransferOut() : void
		{
			var fusion_A:FusionAA;
			var fusion_B:FusionAA;
			var tween_A:ATween;
			
			m_stateA = this.getA() as Lock_StateAA;
			m_stateB = this.getB() as Wallpaper_StateAA;
			
			m_stateA.m_fusionA.kill();
		}
		
		override public function onTransferIn() : void{
			m_stateB.m_fusion = m_stateA.m_fusion;
			
			//trace(m_stateA.m_finalValue, m_stateA.m_tweenValue);
			m_stateB.m_galleryState = m_stateA.m_galleryState;
			m_stateB.scrollVo = m_stateA.scrollVo;
			
			m_stateB.m_decorState.setValue(m_stateB.scrollVo.m_finalValue);
		}
		
		
		private var m_stateA:Lock_StateAA;
		private var m_stateB:Wallpaper_StateAA;
		
	}
}

