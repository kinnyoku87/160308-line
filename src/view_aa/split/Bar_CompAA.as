package view_aa.split
{

	import d2armor.animate.TweenMachine;
	import d2armor.display.ImageAA;
	import d2armor.display.Scale9ImageAA;
	import d2armor.display.StateAA;
	import d2armor.utils.AColor;
		
public class Bar_CompAA extends StateAA {
	
	public function setValue( v:int ) : void {
		var img_A:Scale9ImageAA;
		var img_B:Scale9ImageAA;
		
		if(m_finalValue == v){
			return;
		}
//		if(v <= 0){
//			m_redLine.y = -m_redLine.sourceHeight;
//		}
//		else {
//			m_redLine.y = m_height + m_redLine.sourceHeight;
//		}
		
//		if(v <= 0){
//			m_redLine.y = -6;
//		}
//		else {
//			m_redLine.y = m_height;
//		}
		m_finalValue = v;
		if(v <= 0){
			//m_redLine.textureId = "common/img/barA.png";
			img_A = m_redLine1;
			img_B = m_redLine2;
		}
		else {
			//m_redLine.textureId = "common/img/barB.png";
			img_A = m_redLine2;
			img_B = m_redLine1;
		}
		
//		img_A.scaleY = 1 / 0.7;
//		img_A.width = m_lineMaxLength;
//		img_A.x = (m_width - m_lineMaxLength) / 2;
//		img_A.color = new AColor(0xFF4242);
		
		TweenMachine.to(img_A, 0.1, {scaleY:1/0.7,width:m_lineMaxLength,x:(m_width - m_lineMaxLength) / 2});
		TweenMachine.to(img_A.color, 0.1, {red:1, green:0x42 / 255, blue:0x42 / 255});
		
//		img_B.scaleY = 1.0;
//		img_B.width = m_rawLength;
//		img_B.x = (m_width - m_rawLength) / 2;
//		img_B.color = new AColor(0xFFFFFF);
		
		TweenMachine.to(img_B, 0.1, {scaleY:1.0,width:m_rawLength,x:(m_width - m_rawLength) / 2});
		TweenMachine.to(img_B.color, 0.1, {red:1, green:1, blue:1});
	}
	
	override public function onEnter():void {
		var img_A:ImageAA;
		
		img_A = new ImageAA;
		this.getFusion().addNode(img_A);
		img_A.textureId = "common/img/bar2.png";
		
		m_width = img_A.sourceWidth;
		m_height = img_A.sourceHeight;
		
		
//		img_A = new ImageAA;
//		this.getFusion().addNode(img_A);
//		img_A.textureId = "common/img/bar.png";
//		img_A.x = (m_width - img_A.sourceWidth) / 2;
//		img_A.y = (m_height - img_A.sourceHeight) / 2;
		
		
//		m_redLine = new ImageAA;
//		this.getFusion().addNode(m_redLine);
//		m_redLine.textureId = "common/img/barA.png";
//		m_redLine.x = (m_width - m_redLine.sourceWidth) / 2;
//		m_redLine.y = (m_height - m_redLine.sourceHeight) / 2;
		
		m_redLine1 = new Scale9ImageAA;
		this.getFusion().addNode(m_redLine1);
		m_redLine1.textureId = "common/img/s9bar.png";
		
		m_rawLength = m_redLine1.sourceWidth;
		m_lineMaxLength = m_redLine1.sourceWidth / 0.7;
		
		m_redLine1.color = new AColor(0xFF4242);
		m_redLine1.pivotY = m_redLine1.height / 2;
		m_redLine1.width = m_lineMaxLength;
		m_redLine1.scaleY = 1 / 0.7;
		m_redLine1.x = (m_width - m_redLine1.width) / 2;
		m_redLine1.y = (m_height - m_redLine1.sourceHeight) * 1 / 3 - 1;
		
		m_redLine2 = new Scale9ImageAA;
		this.getFusion().addNode(m_redLine2);
		m_redLine2.color = new AColor(0xFFFFFF);
		m_redLine2.textureId = "common/img/s9bar.png";
		m_redLine2.pivotY = m_redLine2.height / 2;
		m_redLine2.x = (m_width - m_redLine2.width) / 2;
		m_redLine2.y = (m_height - m_redLine2.sourceHeight) * 2 / 3 + 1;
		
		this.getFusion().pivotY = m_height / 2;
	}
	
//	private var m_redLine:ImageAA;
	private var m_redLine1:Scale9ImageAA;
	private var m_redLine2:Scale9ImageAA;
	private var m_rawLength:Number;
	private var m_lineMaxLength:Number;
	
	private var m_width:Number;
	private var m_height:Number;
	
	private var m_finalValue:Number = 0;
}
}