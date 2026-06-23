package{
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.Event;
    public class imgSprite extends Sprite{
        public var loaded:Boolean = false;
        public function imgSprite(path:String){
            var img:Loader = new Loader();
            var imageRequest:URLRequest = new URLRequest(path);
            img.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
            img.load(imageRequest);
            function onImageLoaded(event:Event):void {
                addChild(img);
                loaded = true;
            }
        }
    }
}