package game.entities
{
    import game.enemy.EnemyVO;
    import game.entitymanager.Entity;

    import starling.core.Starling;

    public class EnemyBase extends Entity
    {

        protected var vo:EnemyVO;

        public function EnemyBase()
        {
        }

        public function setVO(enemyVO:EnemyVO):void
        {
            vo = enemyVO;
            position.x = Starling.current.stage.stageWidth;
            position.y = enemyVO.y;
        }
    }
}
