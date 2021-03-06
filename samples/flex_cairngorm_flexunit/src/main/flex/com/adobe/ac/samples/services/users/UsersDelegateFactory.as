package com.adobe.ac.samples.services.users
{
	import com.adobe.ac.samples.services.users.impl.StubbedUsersDelegate;
	import com.adobe.ac.samples.services.users.impl.XmlUsersDelegate;
	
	public class UsersDelegateFactory
	{
		public static const STUBBED : String = "stubbed";
		public static const XML : String = "xml";
		
		public static function create( kind : String ) : IUsersDelegate
		{
			var delegate : IUsersDelegate;
			
			switch( kind )
			{
				case XML:
					delegate = new XmlUsersDelegate();
					break;
				case STUBBED:
					delegate = new StubbedUsersDelegate();
					break;
				default:
					throw new Error( "unknown UsersDelegate kind " + kind );
			}
			return delegate;
		}
	}
}