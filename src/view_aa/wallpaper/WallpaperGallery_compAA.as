package view_aa.wallpaper
{
	import d2armor.display.ImageAA;
	import d2armor.display.StateAA;
	import d2armor.display.StateFusionAA;
	
	import model.wallpaperVo;
	
public class WallpaperGallery_compAA extends StateAA {
	
	public function WallpaperGallery_compAA( data:Vector.<wallpaperVo> ) {
		m_data = data;
	}
	
	public function setValue( v:Number ) : void {
		var index_A:int;
		var index_B:int;
		var state_A:Wallpaper_compAA;
		var state_B:Wallpaper_compAA;
		var i:int;
		var l:int;
		
		m_value = v;
		this.getFusion().x = -m_value * this.getRoot().getWindow().rootWidth / 2;
		
		index_A = int(m_value);
		index_B = int(m_value + 1);
		
		state_A = m_stateList[index_A];
		state_A.setClipRatio(1 + int(m_value) - m_value);
		
		state_B = m_stateList[index_B];
		if(state_B) {
			state_B.setClipRatio(m_value - int(m_value));
		}
		
//		if(refleshAll){
//			l = index_A - 1;
//			while(i < l) {
//				state_A = m_stateList[i];
//				state_A.setClipRatio(0);
//				i++;
//			}
//		}
	}
	
	override public function onEnter() : void
	{
		var i:int;
		var l:int;
		var vo:wallpaperVo;
		var stateFN:StateFusionAA;
		var state_A:Wallpaper_compAA;
		
		l = m_data.length;
		while(i < l) {
			vo = m_data[i];
			stateFN = new StateFusionAA;
			this.getFusion().addNodeAt(stateFN, 0);
			stateFN.x = i * 1080 / 2;
			state_A = m_stateList[i] = new Wallpaper_compAA("common/img/" + vo.resImg);
			stateFN.setState(state_A);
//			img_A.alpha = 0.3
			i++;
		}
		
		
	}
	
	
	private var m_value:Number;
	private var m_data:Vector.<wallpaperVo>;
	private var m_stateList:Array = [];
	
	
}
}