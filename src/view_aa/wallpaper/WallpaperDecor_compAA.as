package view_aa.wallpaper {
	import d2armor.display.ImageAA;
	import d2armor.display.StateAA;
	
	import model.wallpaperVo;

public class WallpaperDecor_compAA extends StateAA
{
	
	public function WallpaperDecor_compAA( data:Vector.<wallpaperVo> ) {
		m_data = data;
	}
	
	
	public function setValue( v:Number ) : void {
		var index_A:int;
		var index_B:int;
		var img_A:ImageAA;
		var img_B:ImageAA;
		
		
		m_value = v;
		
		this.getFusion().x = -m_value * this.getRoot().getWindow().rootWidth;

		index_A = int(m_value);
		index_B = int(m_value + 1);
		img_A = m_imgList[index_A];
		img_A.alpha = 1 + int(m_value) - m_value;
		img_B = m_imgList[index_B];
		if(img_B) {
			img_B.alpha = m_value - int(m_value);
		}
		
	}
	
	override public function onEnter() : void
	{
		var i:int;
		var l:int;
		var vo:wallpaperVo;
		var img_A:ImageAA;
		
		l = m_data.length;
		while(i < l) {
			vo = m_data[i];
			img_A = m_imgList[i] = new ImageAA;
			this.getFusion().addNodeAt(img_A, 0);
			img_A.x = 1080 * i;
			img_A.textureId = "common/img/" + vo.resText;
			//			img_A.alpha = 0.3
			i++;
		}
		
		
	}
	
	
	private var m_value:Number;
	private var m_data:Vector.<wallpaperVo>;
	private var m_imgList:Array = [];
	
	
}
}