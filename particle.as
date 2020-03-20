package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class particle extends MovieClip {
		var targetX:Number;
		var targetY:Number;
		
		public function particle() {
			// random scale
			this.scaleX = this.scaleY = 0.5*Math.random();
			//random X and Y
			targetX = targetY = 0;
			//make it move to that position
			addEventListener(Event.ENTER_FRAME,MoveToTarget);
		}
		
		public function RepositionParticle(Dir:String,Xn:Number = 200,Yn:Number = 200):void
		{
			if(Dir == "ExploseFromCenter"){
				  targetX = (-(Xn/2) + Math.random() * Xn) + x; //Math.random() * 800;
			     targetY = (-(Yn/2) + Math.random() * Yn) + y; //Math.random() * 480;
			}else if(Dir == "ExploseFromLeft"){
				 targetX = (200 + Math.random() * 200) - x; //Math.random() * 800;
			     targetY = (-50 + Math.random() * 100) + y ; //Math.random() * 480;
			}
			
		}
		private function MoveToTarget(e:Event):void
		{
			var dx = x - targetX;
			var dy = y - targetY;
			x += dx / 10;
			y -= dy / 10;
			alpha -= .1;
			if(alpha < 0){
				if(parent){
					MovieClip(parent).removeChild(this);
				}
				
			}
			
		}
	}
	
}
