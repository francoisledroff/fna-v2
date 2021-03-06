package com.adobe.txi.todo.list
{
	import com.adobe.txi.todo.domain.TodoItem;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TransformGestureEvent;
	
	import mx.events.IndexChangedEvent;
	
	import spark.components.Button;
	import spark.components.DataGroup;
	import spark.components.Label;
	import spark.components.MobileItemRenderer;
	import spark.effects.Fade;
	import spark.events.IndexChangeEvent;

	[Event(name="deleteTodoItem", type="com.adobe.txi.todo.list.DeleteTodoItemEvent")]
	public class TodoItemRenderer extends MobileItemRenderer
	{
		private var deleteButton:Button;

		public function TodoItemRenderer()
		{
			super();

			addEventListener(TransformGestureEvent.GESTURE_SWIPE, gestureSwipeHandler, false, int.MAX_VALUE, true);
		}

		private function get isDeleteButtonVisible():Boolean
		{
			return deleteButton && deleteButton.visible == true ? true : false;
		}

		private function gestureSwipeHandler(event:TransformGestureEvent):void
		{
			//only consider swipe to right 
			if (event.offsetX == 1)
			{
				if (isDeleteButtonVisible)
				{
					hideDeleteButton();
				}
				else
				{
					showDeleteButton();
				}
			}
		}

		private function showDeleteButton():void
		{
			if (!deleteButton)
			{
				createDeferredDeleteButton();
				layoutDeferredDeleteButton();
			}

			deleteButton.visible=true;
		}

		private function hideDeleteButton():void
		{
			if (deleteButton)
			{
				deleteButton.visible=false;
			}
		}

		private function createDeferredDeleteButton():void
		{
			deleteButton=new Button();
			deleteButton.addEventListener(MouseEvent.CLICK, deleteButtonClickHandler, false,0,true);
			
			deleteButton.label="Delete";
			deleteButton.setStyle("backgroundColor", 0xFF0000);
			deleteButton.width=130;
			deleteButton.height=50;

			var fadeIn:Fade=new Fade();
			fadeIn.duration=800;
			fadeIn.target=deleteButton;
			fadeIn.alphaFrom=0;
			fadeIn.alphaTo=1;

			var fadeOut:Fade=new Fade();
			fadeOut.duration=800;
			fadeOut.target=deleteButton;
			fadeOut.alphaFrom=1;
			fadeOut.alphaTo=0;

			deleteButton.setStyle("showEffect", fadeIn);
			deleteButton.setStyle("addedEffect", fadeIn);
			deleteButton.setStyle("hideEffect", fadeOut);

			addChild(deleteButton);
		}
		
		private function deleteButtonClickHandler(event:MouseEvent):void
		{
			dispatchEvent(new DeleteTodoItemEvent(TodoItem(data)));
		}

		private function layoutDeferredDeleteButton():void
		{
			if (deleteButton)
			{
				var viewWidth:Number=unscaledWidth - getStyle("paddingLeft") + getStyle("paddingRight");
				var viewHeight:Number=unscaledHeight - getStyle("paddingTop") - getStyle("paddingBottom");

				var deleteBtnX:Number=viewWidth - deleteButton.width - 10;
				var deleteBtnY:Number=getStyle("paddingTop") + Math.round((viewHeight - deleteButton.height) / 2);

				deleteButton.x=Math.round(deleteBtnX);
				deleteButton.y=Math.round(deleteBtnY);
			}
		}
	}
}