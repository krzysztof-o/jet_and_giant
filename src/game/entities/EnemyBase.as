package game.entities
{
    import game.Global;
    import game.enemy.EnemyVO;
    import game.entitymanager.Entity;

    import starling.core.Starling;

    public class EnemyBase extends Entity
    {

        public var vo:EnemyVO;

        public function EnemyBase()
        {
        }

        public function setVO(enemyVO:EnemyVO):void
        {
            vo = enemyVO;
            Global.enemiesManager.enemiesById[vo.id] = this;
            position.x = Starling.current.stage.stageWidth + 100;
            position.y = enemyVO.y;
        }

        override public function dispose():void
        {
            delete Global.enemiesManager.enemiesById[vo.id];
            super.dispose();
        }
    }
}
