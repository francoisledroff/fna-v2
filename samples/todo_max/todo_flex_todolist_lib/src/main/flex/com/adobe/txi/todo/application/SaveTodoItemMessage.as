package com.adobe.txi.todo.application
{
	import com.adobe.txi.todo.domain.TodoItem;

	public class SaveTodoItemMessage
	{
		public var todoItem:TodoItem;
		
		public function SaveTodoItemMessage(todoItem:TodoItem)
		{
			this.todoItem = todoItem;
		}
	}
}