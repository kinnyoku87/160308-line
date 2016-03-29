package view_aa.wallpaper
{
	import flash.ui.Keyboard;
	
	import d2armor.activity.Key;
	import d2armor.activity.Touch;
	import d2armor.animate.ATween;
	import d2armor.animate.TweenMachine;
	import d2armor.animate.easing.Quad;
	import d2armor.display.FusionAA;
	import d2armor.display.ImageAA;
	import d2armor.display.StateAA;
	import d2armor.display.StateFusionAA;
	import d2armor.events.AEvent;
	import d2armor.events.NTouchEvent;
	
	import model.ScrollVo;
	import model.wallpaperVo;
	
	import view_aa.abs.AbsGallery_StateAA;
	import view_aa.lock.Lock_StateAA;
	
public class Wallpaper_StateAA extends AbsGallery_StateAA {
	
	
	public function getFusion2() : FusionAA {
		return m_fusion;
	}

	
	
	override public function set value( v:Number ) : void {
		//m_value = v;
		scrollVo.m_tweenValue = v;
		m_galleryState.setValue(scrollVo.m_tweenValue);
		m_decorState.setValue(scrollVo.m_tweenValue);
	}
	
	override public function onEnter():void{
		var stateFusion_A:StateFusionAA;
		var tween_A:ATween;
		
		super.onEnter();
		
		// gallery
//		stateFusion_A = new StateFusionAA;
//		m_fusion.addNode(stateFusion_A);
//		m_galleryState = new WallpaperGallery_compAA(m_data);
//		stateFusion_A.setState(m_galleryState);
		
		// decor
		stateFusion_A = new StateFusionAA;
		m_fusion.addNode(stateFusion_A);
		m_decorState = new WallpaperDecor_compAA(m_data);
		stateFusion_A.setState(m_decorState);
		
		// toolBar
		m_toolBarImg = new ImageAA;
		m_fusion.addNode(m_toolBarImg);
		m_toolBarImg.textureId = "common/img/toolBar.png";
		tween_A = TweenMachine.from(m_toolBarImg, 0.35, {alpha:0,y:80});
		tween_A.easing = Quad.easeOut;
		
		m_keyBack = this.getRoot().getWindow().getKeyboard().getKey(Keyboard.BACK);
		m_keyBack.setPreventDefault(true);
		m_keyBack.addEventListener(AEvent.COMPLETE, onKeyUp);
		
		m_keyBackspace = this.getRoot().getWindow().getKeyboard().getKey(Keyboard.BACKSPACE);
		m_keyBackspace.addEventListener(AEvent.COMPLETE, onKeyUp);
		
	}
	
	
	override public function onExit():void {
		m_keyBack.removeEventListener(AEvent.COMPLETE, onKeyUp);
		m_keyBack.setPreventDefault(false);
		m_keyBackspace.removeEventListener(AEvent.COMPLETE, onKeyUp);
	}
	
	
	
	private var m_keyBack:Key;
	private var m_keyBackspace:Key;
	
	
	public var m_decorState:WallpaperDecor_compAA;
	public var m_toolBarImg:ImageAA;

	
	private function onKeyUp(e:AEvent):void{
		this.getFusion().setState(new Lock_StateAA);
	}
	
	
}
}