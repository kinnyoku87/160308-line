package view_aa.split
{
	import d2armor.display.FusionAA;
	import d2armor.display.ImageAA;
	import d2armor.display.NodeAA;
	import d2armor.display.StateAA;
	import d2armor.display.StateFusionAA;
	import d2armor.events.NTouchEvent;

	public class Split_StateAA extends StateAA
	{
		
		override public function onEnter():void {
			var img_A:ImageAA;
			
			m_screen1 = new ImageAA;
			this.getFusion().addNode(m_screen1);
			m_screen1.textureId = "common/img/screen1.png";
			m_screen1.addEventListener(NTouchEvent.CLICK, onSwitch);
			m_screen1.userData = 0;
			
			m_screen2 = new ImageAA;
			this.getFusion().addNode(m_screen2);
			m_screen2.textureId = "common/img/screen2.png";
			m_screen2.y = this.getRoot().getWindow().rootHeight - m_screen2.sourceHeight;
			m_screen2.addEventListener(NTouchEvent.CLICK, onSwitch);
			m_screen2.userData = 1;
			
			m_barFN = new StateFusionAA;
			this.getFusion().addNode(m_barFN);
			m_barState = new Bar_CompAA;
			m_barFN.setState(m_barState);
			m_barFN.y = this.getRoot().getWindow().rootHeight / 2;
			m_barState.setValue(0);
			
			
		}
		
		
		public var m_screen1:ImageAA;
		public var m_screen2:ImageAA;
		public var m_barFN:StateFusionAA;
		public var m_barState:Bar_CompAA;
		
		
		
		private function onSwitch(e:NTouchEvent):void{
			var node_A:NodeAA;
			
			node_A = e.target as NodeAA;
			this.m_barState.setValue(int(node_A.userData));
		}
	}
	
	
}

