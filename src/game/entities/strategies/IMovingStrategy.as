package game.entities.strategies
{
    public interface IMovingStrategy
    {
        function update(timer:Number):void;

        function dispose():void;
    }
}
