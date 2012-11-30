   package game
{
    import game.enemy.FlyingEnemy;
    import game.entities.Bomb;
    import game.entities.Bomber;
       import game.entities.GroundBullet;
       import game.entities.GroundEnemy;
	   import game.entities.fighter.Fighter;
	   import game.entitymanager.EnemiesManager;
    import game.weapon.bullet.Bullet;
	   import game.weapon.bullet.FighterBullet;

	   import utlis.Pool;

    public class Global
    {
        public static var fighter:Fighter;
        public static var bomber:Bomber;

        public static var bulletPool:Pool = new Pool(Bullet);
        public static var bombPool:Pool = new Pool(Bomb);
		public static var fighterBulletPool:Pool = new Pool(FighterBullet);
		public static var groundBulletPool:Pool = new Pool(GroundBullet);
        public static var enemiesPool:Pool = new Pool(FlyingEnemy);
        public static var groundEnemiesPool:Pool = new Pool(GroundEnemy);

        public static var clientServerTimeDifference:Number;
        public static var enemiesManager:EnemiesManager = new EnemiesManager();
        public static var serverTime:Number;

        public static function get currentTime():Number
        {
            return new Date().time;
        }

        public static function get timeWithCorrection():Number
        {
            return Global.currentTime - Global.serverTime - Global.clientServerTimeDifference;
        }
    }
}
