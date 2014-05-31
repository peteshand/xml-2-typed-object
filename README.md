xml-2-typed-object
==================

XML2VO.as is an as3 utility to parse xml into a type object

The following is an example of how to use XML2VO.as util to quickly map data from xml into a typed object.

<pre lang="actionscript3">
private var loader:URLLoader;
private var exampleVO:ExampleVO;

private function init():void 
{
	exampleVO = new ExampleVO();
	var url:String = "config.xml";
	loader = new URLLoader();
	var request:URLRequest = new URLRequest(url);
	loader.addEventListener(Event.COMPLETE, OnLoadComplete);
	loader.load(request);
}
</pre>
First you'll need to load and embed your xml object.

<pre lang="actionscript3">
private function OnLoadComplete(e:Event):void 
{
	XML2VO.map(XML(loader.data), exampleVO);
}
</pre>
Then on load complete simply call XML2VO.map and pass in the xml data along with the object you'd like the data mapped to.
<br/>
example source xml is as follows:
<pre lang="xml">
<?xml version="1.0" encoding="utf-8" ?>
<data>
	<arrayExample>1, 3.2, test</arrayExample>
	<intExample>60</intExample>
	<numberExample>30.45</numberExample>
	<stringExample>http://google.com</stringExample>
	<uintExample>0xded6ce</uintExample>
	<vectorExample>0xded6ce, 0xd1d6e0, 0xcddce2</vectorExample>
	<xmlExample>
		<item id="123">
			<img>test.jpg</img>
		</item>
	</xmlExample>
</data>
</pre>

and ExampleVO is as follows:
<pre lang="actionscript3">
package  
{
	public class ExampleVO 
	{
		public var arrayExample:Array;
		public var intExample:int;
		public var numberExample:Number;
		public var stringExample:String;
		public var uintExample:uint;
		public var vectorExample:Vector.<uint>;
		public var xmlExample:XML;
	}
}
</pre>
<br/>
<pre lang="actionscript3">
private function OnLoadComplete(e:Event):void 
{
	XML2VO.map(XML(loader.data), exampleVO);
	MonsterDebugger.initialize(exampleVO);
}
</pre>
By using <a href="http://www.demonsterdebugger.com/">MonsterDebugger</a> to display the content of exampleVO you can see that the xml data has successfully been mapped into our as3 object.
<a href="http://blog.peteshand.net/wp-content/uploads/2014/05/monsterDebugger.jpg"><img class="alignnone size-full wp-image-2512" src="http://blog.peteshand.net/wp-content/uploads/2014/05/monsterDebugger.jpg" alt="monsterDebugger" width="540" height="250" /></a>
