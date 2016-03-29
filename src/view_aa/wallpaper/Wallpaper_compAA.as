package view_aa.wallpaper
{
	import flash.geom.Rectangle;
	
	import d2armor.display.ClipFusionAA;
	import d2armor.display.ImageAA;
	import d2armor.display.StateAA;
	
public class Wallpaper_compAA extends StateAA
{
	public function Wallpaper_compAA( resWp:String, forLock:Boolean = false ) {
		this.resWp = resWp;
		this.forLock = forLock;
	}
	

	public function setClipRatio( v:Number ) : void {
		clipRect.width = 540 + 540 * v;
		clipFN.clipRect = clipRect;
	}
	
	override public function onEnter() : void
	{
		var img_A:ImageAA;
		
		
		clipFN = new ClipFusionAA;
		this.getFusion().addNode(clipFN);
		
		// wp
		img_A = new ImageAA;
		clipFN.addNode(img_A);
		img_A.textureId = resWp;
		
		// mask top
		img_A = new ImageAA;
		clipFN.addNode(img_A);
		img_A.textureId = forLock ? "common/img/maskTop1.png" : "common/img/maskTop2.png";
		
		// mask bottom
		img_A = new ImageAA;
		clipFN.addNode(img_A);
		img_A.textureId = "common/img/maskBottom.png";
		
		
	}
	
	
	private var clipFN:ClipFusionAA;
	private var clipRect:Rectangle = new Rectangle(0, 0, 1080, 1920);
	private var resWp:String;
	private var forLock:Boolean;
	private var m_value:Number;
	
}
}