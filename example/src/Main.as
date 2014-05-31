package 
{
	import blaze.utils.xml.XML2VO;
	import com.demonsters.debugger.MonsterDebugger;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author P.J.Shand
	 */
	public class Main extends Sprite 
	{
		private var loader:URLLoader;
		private var exampleVO:ExampleVO;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			exampleVO = new ExampleVO();
			var url:String = "config.xml";
			loader = new URLLoader();
			var request:URLRequest = new URLRequest(url);
			loader.addEventListener(Event.COMPLETE, OnLoadComplete);
			loader.load(request);
		}
		
		private function OnLoadComplete(e:Event):void 
		{
			XML2VO.map(XML(loader.data), exampleVO);
			
			trace("arrayExample = " + exampleVO.arrayExample);
			trace("intExample = " + exampleVO.intExample);
			trace("numberExample = " + exampleVO.numberExample);
			trace("stringExample = " + exampleVO.stringExample);
			trace("uintExample = " + "0x" + exampleVO.uintExample.toString(16));
			trace("vectorExample = " + exampleVO.vectorExample);
			trace("xmlExample = " + exampleVO.xmlExample);
			
			MonsterDebugger.initialize(exampleVO);
		}
	}
}