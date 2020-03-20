package  {
	
	import flash.display.MovieClip;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TransformGestureEvent;
	import flash.events.Event;
	
	
	public class AllLevels extends MovieClip {
		private var Swipepage:Number = 1;
		private var Totalpage:Number = 3;
		private var DistanceX:int = 0;
		private var time:Number = 0;
		
		public function AllLevels() {
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			addEventListener(TransformGestureEvent.GESTURE_SWIPE,MovePage);
		}
		
		private function MovePage(e:TransformGestureEvent):void
		{
			if(e.offsetX == 1){
				if(Swipepage > 1){
					Swipepage--;
					CheckDistance(Swipepage);
					addEventListener(Event.ENTER_FRAME,startMove);
					time = 0;
				}
			}else if(e.offsetX == -1){
				if(Swipepage<Totalpage){
					Swipepage++;
					CheckDistance(Swipepage);
					addEventListener(Event.ENTER_FRAME,startMove);
					time = 0;
				}
			}
		}
		
		private function CheckDistance(number:int):void
		{
			switch(number){
				case 1: DistanceX = 400;
				        break;
				case 2: DistanceX = -400;
				        break;
				case 3: DistanceX = -1200;
				        break;
				/*case 4: DistanceX = -2000;
				        break;*/
			}
		}
		
		private function startMove(e:Event):void
		{
			x = x + (DistanceX - x) * 0.3;
			time++;
			if(time == 20){
				removeEventListener(Event.ENTER_FRAME,startMove);
				time = 0;
			}
		}
	}
	
}
