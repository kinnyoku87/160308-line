package view_aa.abs
{
	import d2armor.activity.Touch;
	import d2armor.animate.ATween;
	import d2armor.animate.TweenMachine;
	import d2armor.animate.easing.Quad;
	import d2armor.display.FusionAA;
	import d2armor.display.StateAA;
	import d2armor.events.AEvent;
	import d2armor.events.NTouchEvent;
	
	import model.ScrollVo;
	import model.wallpaperVo;
	
	import view_aa.wallpaper.WallpaperGallery_compAA;

public class AbsGallery_StateAA extends StateAA
{
	public function AbsGallery_StateAA()
	{
	}
	
	
	public function get value() : Number {
		return scrollVo.m_tweenValue;
	}
	
	public function set value( v:Number ) : void {
		//m_value = v;
		scrollVo.m_tweenValue = v;
	}
	
	override public function onEnter():void{
		m_fusion = new FusionAA;
		this.getFusion().addNode(m_fusion);
		m_fusion.pivotX = this.getRoot().getWindow().rootWidth / 2;
		m_fusion.pivotY = this.getRoot().getWindow().rootWidth / 2;
		m_fusion.x = this.getRoot().getWindow().rootWidth / 2;
		m_fusion.y = this.getRoot().getWindow().rootWidth / 2;
		
		
		
		m_fusion.addEventListener(NTouchEvent.PRESS, onPressView);
	}
	
	public var m_fusion:FusionAA;
	
	
	public var m_data:Vector.<wallpaperVo> = new <wallpaperVo>
		[
			new wallpaperVo("txt_tower.png", "wp_tower.png"),
			new wallpaperVo("txt_free.png", "wp_free.png"),
			new wallpaperVo("txt_road.png", "wp_road.png"),
			new wallpaperVo("txt_sheep.png", "wp_sheep.png")
			
		]

	public var m_touch:Touch;
	public var scrollVo:ScrollVo;
	public var m_galleryState:WallpaperGallery_compAA;
	
	private function onPressView(e:NTouchEvent):void{
		m_touch = e.touch;
		
		m_touch.addEventListener(AEvent.CHANGE, onTouchChanged);
		m_touch.addEventListener(AEvent.COMPLETE, onTouchComplete);
	}
	
	private function onTouchChanged(e:AEvent):void{
		var touch_A:Touch;
		var deltaX:Number;
		var valueOffset:Number;
		
		scrollVo.m_tweenValue = scrollVo.m_finalValue;
		touch_A = e.target as Touch;
		deltaX = touch_A.rootX - touch_A.prevRootX;
		valueOffset = -deltaX / this.getRoot().getWindow().rootWidth;
		scrollVo.m_finalValue += valueOffset;
		
		this.doCalcGalleryValue();
	}
	
	private function onTouchComplete(e:AEvent):void{
		var touch_A:Touch;
		
		touch_A = e.target as Touch;
		
		scrollVo.m_tweenValue = scrollVo.m_finalValue;
		if(touch_A.velocityX < -150) {
			scrollVo.m_finalValue = int(scrollVo.m_finalValue + 1);
		}
		else if(touch_A.velocityX > 150) {
			scrollVo.m_finalValue = int(scrollVo.m_finalValue);
		}
		else {
			if(Math.round(scrollVo.m_finalValue) > scrollVo.m_finalValue) {
				scrollVo.m_finalValue = int(scrollVo.m_finalValue + 1);
			}
			else{
				scrollVo.m_finalValue = int(scrollVo.m_finalValue);
			}
		}
		//(m_value);
		this.doCalcGalleryValue();
	}
	
	private function doCalcGalleryValue() : void {
		var tween_A:ATween;
		
		if(scrollVo.m_finalValue < 0) {
			scrollVo.m_finalValue = 0;
		}
		else if(scrollVo.m_finalValue > scrollVo.m_numItems - 1) {
			scrollVo.m_finalValue = scrollVo.m_numItems - 1;
		}
		
		tween_A = TweenMachine.to(this, 0.3, {value:scrollVo.m_finalValue});
		tween_A.easing = Quad.easeOut;
		//this.value = m_value;
		
	}
}
}