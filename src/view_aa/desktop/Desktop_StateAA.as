package view_aa.desktop
{
	import flash.ui.Keyboard;
	
	import d2armor.activity.Key;
	import d2armor.display.FusionAA;
	import d2armor.display.ImageAA;
	import d2armor.display.StateAA;
	import d2armor.events.AEvent;
	import d2armor.events.AKeyboardEvent;
	
	import view_aa.lock.Lock_StateAA;

public class Desktop_StateAA extends StateAA
{
	public function getFusion2() : FusionAA {
		return m_fusion;
	}

	override public function onEnter():void{
		var img_A:ImageAA;
		
		
		m_fusion = new FusionAA;
		this.getFusion().addNode(m_fusion);
		m_fusion.pivotX = this.getRoot().getWindow().rootWidth / 2;
		m_fusion.pivotY = this.getRoot().getWindow().rootWidth / 2;
		m_fusion.x = this.getRoot().getWindow().rootWidth / 2;
		m_fusion.y = this.getRoot().getWindow().rootWidth / 2;
		
		img_A = new ImageAA;
		img_A.textureId = "common/img/desktop.png";
		m_fusion.addNode(img_A);
		
		img_A = new ImageAA;
		img_A.textureId = "common/img/statusBar.png";
		m_fusion.addNode(img_A);
		
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
	
	
	private var m_fusion:FusionAA;
	private var m_keyBack:Key;
	private var m_keyBackspace:Key;
	
	
	private function onKeyUp(e:AEvent):void{
		this.getFusion().setState(new Lock_StateAA);
	}
	
}
}