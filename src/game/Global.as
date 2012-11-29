package game
{
    import game.entities.Bomber;
    import game.entities.Fighter;
    import game.weapon.bullet.Bullet;

    import utlis.Pool;

    public class Global
    {
        public static var fighter:Fighter;
        public static var bomber:Bomber;

        public static var bulletPool:Pool = new Pool(Bullet);
    }
}
