package view_aa.lock {
	import com.greensock.motionPaths.Direction;
	
	import d2armor.animate.ATween;
	import d2armor.animate.TweenMachine;
	import d2armor.display.FusionAA;
	import d2armor.display.ImageAA;
	import d2armor.display.NodeAA;
	import d2armor.display.StateAA;
	import d2armor.display.StateFusionAA;
	import d2armor.enum.EDirection;
	import d2armor.events.AEvent;
	import d2armor.events.ATouchEvent;
	import d2armor.events.NTouchEvent;
	import d2armor.gesture.GestureFacade;
	import d2armor.gesture.LongPressGestureRecognizer;
	import d2armor.gesture.MultiPressGestureRecognizer;
	import d2armor.gesture.SwipeGestureRecognizer;
	
	import model.ScrollVo;
	
	import view_aa.abs.AbsGallery_StateAA;
	import view_aa.desktop.Desktop_StateAA;
	import view_aa.wallpaper.WallpaperGallery_compAA;
	import view_aa.wallpaper.Wallpaper_StateAA;
	import view_aa.wallpaper.Wallpaper_compAA;

public class Lock_StateAA extends AbsGallery_StateAA {
	
	public function getFusion2() : FusionAA {
		return m_fusion;
	}
	
	override public function set value( v:Number ) : void {
		//m_value = v;
		scrollVo.m_tweenValue = v;
		m_galleryState.setValue(scrollVo.m_tweenValue);
	}

	override public function onEnter():void {
		var img_A:ImageAA;
		var stateFN:StateFusionAA;
		var stateFusion_A:StateFusionAA;
		
		super.onEnter();
		
		if(!scrollVo) {
			this.scrollVo = new ScrollVo;
		}
		
		// gallery
		stateFusion_A = new StateFusionAA;
		m_fusion.addNode(stateFusion_A);
		m_galleryState = new WallpaperGallery_compAA(m_data);
		stateFusion_A.setState(m_galleryState);
		
//		stateFN = new StateFusionAA;
//		m_fusion.addNode(stateFN);
//		stateFN.setState(new Wallpaper_compAA("common/img/wp_tower.png", true));
		
		m_fusionA = new FusionAA;
		m_fusion.addNode(m_fusionA);
		
		img_A = new ImageAA;
		img_A.textureId = "common/img/statusBar.png";
		m_fusionA.addNode(img_A);
		
		img_A = new ImageAA;
		m_fusionA.addNode(img_A);
		img_A.textureId = "common/img/time.png";
		
		
		img_A = new ImageAA;
		m_fusionA.addNode(img_A);
		img_A.textureId = "common/img/camera.png";
		
		
		m_tipImg = new ImageAA;
		m_fusionA.addNode(m_tipImg);
		m_tipImg.textureId = "common/img/swipeToUnlock.png";
		
		m_fusion.addEventListener(NTouchEvent.CLICK, onTip);
		
		var reco_A:LongPressGestureRecognizer;
		var reco_M:MultiPressGestureRecognizer;
		var reco_B:SwipeGestureRecognizer;
		
		reco_A = GestureFacade.recognize(m_fusion, LongPressGestureRecognizer) as LongPressGestureRecognizer;
		reco_A.addEventListener(AEvent.COMPLETE, onTransferToWp);
		//reco_A.setDelay(1.0);
		
		reco_M = GestureFacade.recognize(m_fusion, MultiPressGestureRecognizer) as MultiPressGestureRecognizer;
		reco_M.addEventListener(AEvent.COMPLETE, onTransferToWp);
		
		
		SwipeGestureRecognizer.setDistance(80);
		
		reco_B = GestureFacade.recognize(m_fusion, SwipeGestureRecognizer) as SwipeGestureRecognizer;
		reco_B.addEventListener(AEvent.COMPLETE, onTransferToDesktop);
	}
	
	override public function onExit():void{
		GestureFacade.unrecognizeAll(m_fusion);
		m_fusion.removeEventListener(NTouchEvent.CLICK, onTip);
		
		
		
		
	}
	
	
	
	public var m_isLongPressTip:Boolean;
	public var m_fusionA:FusionAA;
	public var m_tipImg:ImageAA;
	public var m_tipImg_A:ImageAA;
	
	
	private function onTip(e:NTouchEvent):void {
		var tween_A:ATween;
		
		m_isLongPressTip = !m_isLongPressTip;
		
		tween_A = TweenMachine.to(m_tipImg, 0.25, {y:m_tipImg.y - 30, alpha:0});
		tween_A.onComplete = function() : void {
			(tween_A.getTarget() as NodeAA).kill();
		}
		
		m_tipImg = new ImageAA;
		m_fusionA.addNode(m_tipImg);
		m_tipImg.textureId = m_isLongPressTip ? "common/img/longPressToWp.png" : "common/img/swipeToUnlock.png";
		TweenMachine.from(m_tipImg, 0.25, {y:m_tipImg.y + 40, alpha:0});
	}
	
	private function onTransferToWp(e:AEvent):void {
		this.getFusion().setState(new Wallpaper_StateAA);
	}
	
	private function onTransferToDesktop(e:AEvent):void {
		var reco_B:SwipeGestureRecognizer; 
		
		reco_B = e.target as SwipeGestureRecognizer;
		if(reco_B.getDirection() == EDirection.UP) {
			this.getFusion().setState(new Desktop_StateAA);
		}
		else if(reco_B.getDirection() == EDirection.DOWN) {
			this.getFusion().setState(new Wallpaper_StateAA);
		}
	}
	
	
	
}
}