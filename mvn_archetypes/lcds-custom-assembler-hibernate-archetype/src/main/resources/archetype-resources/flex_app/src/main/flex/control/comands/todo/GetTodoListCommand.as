package ${groupId}.control.comands.todo
{
	import ${groupId}.services.todo.TodoDelegate;
	
	public class GetTodoListCommand extends BaseTodoCommand 
	{
		override protected function callDelegate():void
		{
			var delegate : TodoDelegate = new TodoDelegate(this);			
			delegate.getTodoList();
		}
		
		override public function result( event : Object ) : void
		{				
			this.todoPModel.onResultGetTodoList(event);			
		}		
	
		override public function fault( event : Object ) : void
		{
			this.todoPModel.onFaultGetTodoList(event);
		}
	}
}