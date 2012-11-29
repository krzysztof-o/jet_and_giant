package game.entities
{
    import game.entities.strategies.FighterMovingStrategy;
    import game.entitymanager.Entity;

    public class Fighter extends Entity
    {
        public function Fighter()
        {
            super();
            movingStrategy = new FighterMovingStrategy();
        }
    }
}
