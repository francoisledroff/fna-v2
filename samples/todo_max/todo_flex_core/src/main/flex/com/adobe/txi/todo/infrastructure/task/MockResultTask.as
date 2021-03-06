package com.adobe.txi.todo.infrastructure.task
{
    import org.spicefactory.lib.task.ResultTask;

    /**
     * @author Jens Halm
     */
    public class MockResultTask extends ResultTask
    {


        private var _result:*; //NOPMD

        private var synchronous:Boolean;


        function MockResultTask(result:*, synchronous:Boolean = false) //NOPMD
        {
            _result = result;
            this.synchronous = synchronous;
        }


        protected override function doStart():void
        {
            if (synchronous)
            {
                finishWithResult();
            }
        }


        public function finishWithResult():void
        {
            setResult(_result);
        }

        public function finishWithError():void
        {
            error(_result);
        }



    }
}
