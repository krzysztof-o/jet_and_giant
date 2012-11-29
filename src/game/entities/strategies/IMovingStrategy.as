package game.entities.strategies
{
    public interface IMovingStrategy
    {
        function update(timer:int):void;

        function dispose():void;
    }
}
