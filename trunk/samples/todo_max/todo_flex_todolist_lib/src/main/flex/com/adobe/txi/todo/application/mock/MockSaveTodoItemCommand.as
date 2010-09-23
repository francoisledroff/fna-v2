package com.adobe.txi.todo.application.mock
{
	import com.adobe.txi.todo.application.SaveTodoItemMessage;
	import com.adobe.txi.todo.domain.TodoModel;
	import com.adobe.txi.todo.infrastructure.task.MockASyncResultTask;
	
	import org.spicefactory.lib.task.Task;

	public class MockSaveTodoItemCommand
	{
		[Inject]
		public var todoModel:TodoModel;
		
		public function execute(message:SaveTodoItemMessage):Task
		{
			if( message.todoItem.id == null )
			{				
				message.todoItem.id = (todoModel.todos.length + 1).toString();				
			}
			
			return new MockASyncResultTask( message.todoItem );
		}
		
		public function result(result:Object, message:SaveTodoItemMessage):void
		{
			//NOTHING
		}
	}
}