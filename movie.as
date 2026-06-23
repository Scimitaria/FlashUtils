package{
    import flash.events.Event;
    import flash.display.Sprite;
    import imgSprite;

    public class movie extends Sprite{
        private var frames:Array = new Array();
        private var frameCount:int = 0;
        private var current:int = 0;
        private var count:int = 0;
        public var loop:Boolean = false;
        public var killAtEnd:Boolean = true;

        public function movie(...sprites){
            for each(var s:* in sprites) frames.push(s is Sprite ? s : new imgSprite(s));
            frameCount = frames.length;
            addChild(frames[current]);
            addEventListener(Event.ENTER_FRAME,waitForLoad);
        }
        private function waitForLoad(event:Event):void{
            for each(var f:* in frames){
                if(f is imgSprite && !f.loaded)
                    return;
            }
            removeEventListener(Event.ENTER_FRAME, waitForLoad);
        }

        public function go(frame:int):void{
            removeChild(frames[current]);
            current=frame;
            addChild(frames[current]);
        }
        public function increment(event:Event):void{
            var next:int = current+1;
            if(next>=frameCount){
                if(loop) go(0);
                else {
                    stop();
                    if(killAtEnd) addEventListener(Event.ENTER_FRAME,destroy);
                    return;
                }
            } else go(next);
        }
        public function stop():void{
            removeEventListener(Event.ENTER_FRAME,increment);
        }
        public function start():void{
            addEventListener(Event.ENTER_FRAME,increment);
        }
        public function destroy(event:Event):void{
            removeChild(frames[current]);
            if(parent) parent.removeChild(this);
            removeEventListener(Event.ENTER_FRAME,destroy);
        }
        public function gotoAndStop(frame:int):void{
            go(frame);
            stop();
        }
        public function gotoAndStart(frame:int):void{
            go(frame);
            start();
        }

        public function addFrame(...sprites):void{
            for each(var s:* in sprites) {
                frames.push(s is Sprite ? s : new imgSprite(s));
                frameCount++;
            }
        }
        public function deleteFrame(...del):void{
            if(frameCount==0){
                trace("WARNING: Attempting to delete frames from empty movie");
                return;
            }
            if(del.length==0){
                frames.pop();
                frameCount--;
                return;
            }
            for each(var i:* in del){
                if(i is int){
                    frames.splice(i,1);
                    frameCount--;
                } else if(i is Sprite){
                    frames.splice(frames.indexOf(i),1);
                    frameCount--;
                } else trace("WARNING: incorrect input type for deleteFrame");
            }
        }
    }
}