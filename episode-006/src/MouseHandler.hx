import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.Event;


class MouseHandler extends Sprite
{
	
	private var hitPoint:Float;
	private var startPos:Float;
	private var endPos:Float;
	private var lastVal:Float;

	public function new()
	{
		super();
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
		
		endPos = 0;
		startPos = 0;
	}
	
	private function onMouseOver(e:MouseEvent):Void
	{
		removeEventListener(MouseEvent.ROLL_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(MouseEvent.ROLL_OUT, onMouseOut);	
	}
	
	private function onMouseOut(e:MouseEvent)
	{
		removeEventListener(MouseEvent.ROLL_OUT, onMouseOut);
		addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}
	private function onMouseDown(e:MouseEvent)
	{	
		removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		
		hitPoint = e.stageY;
		startPos = endPos;
	}
	
	private function onMouseUp(e:MouseEvent)
	{	
		stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}
	
	private function onMouseMove(e:MouseEvent)
	{	

	}

}