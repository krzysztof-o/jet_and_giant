   package game
{
    import game.entities.Bomb;
    import game.entities.Bomber;
    import game.entities.Fighter;
    import game.weapon.bullet.Bullet;
	   import game.weapon.bullet.FighterBullet;

	   import utlis.Pool;

    public class Global
    {
        public static var fighter:Fighter;
        public static var bomber:Bomber;

        public static var bulletPool:Pool = new Pool(Bullet);
        public static var bombPool:Pool = new Pool(Bomb);
		public static  var fighterBullerPool:Pool = new Pool(FighterBullet);
    }
}
