package game.entitymanager
{
	import Box2D.Collision.b2Manifold;
	import Box2D.Collision.b2WorldManifold;
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2ContactImpulse;
	import Box2D.Dynamics.b2ContactListener;

	import game.enemy.FlyingEnemy;

	import game.entities.Bomb;
	import game.entities.Ground;
	import game.entities.GroundEnemy;
	import game.entities.fighter.Fighter;
	import game.weapon.bullet.Bullet;
	import game.weapon.bullet.FighterBullet;

	public class ContactListener extends b2ContactListener
	{
		public function ContactListener()
		{
			super();
		}

		public override function BeginContact(contact:b2Contact):void
		{
			var bodyA:b2Body = contact.GetFixtureA().GetBody();
			var bodyB:b2Body = contact.GetFixtureB().GetBody();
			if(checkBombHitsGround(bodyA, bodyB))
			{
				if(bodyA.GetDefinition().userData is Bomb)
				{
					(bodyA.GetDefinition().userData as Bomb).detonate();
				}
				else
				{
					(bodyB.GetDefinition().userData as Bomb).detonate();
				}
			}

			if(checkBombsHitsGroundEnemy(bodyA, bodyB))
			{
				if(bodyA.GetDefinition().userData is Bomb)
				{
					(bodyA.GetDefinition().userData as Bomb).detonate();
					(bodyB.GetDefinition().userData as GroundEnemy).detonate();
				}
				else
				{
					(bodyB.GetDefinition().userData as Bomb).detonate();
					(bodyA.GetDefinition().userData as GroundEnemy).detonate();
				}
			}

  			if(checkBulletHitsFlyingEnemy(bodyA, bodyB))
  			{
				if(bodyA.GetDefinition().userData is FlyingEnemy)
				{
					(bodyA.GetDefinition().userData as FlyingEnemy).detonate();
				}
				else
				{
					(bodyB.GetDefinition().userData as FlyingEnemy).detonate();

				}
			}

			if(checkBylletHitsFighter(bodyA, bodyB))
			{
				if(bodyA.GetDefinition().userData is Fighter)
				{
					(bodyA.GetDefinition().userData as Fighter).detonate();
				}
				else
				{
					(bodyB.GetDefinition().userData as Fighter).detonate();

				}
			}

		}

		public function entitiesCollide(typeA:Class, typeB:Class, bodyA:b2Body, bodyB:b2Body):Boolean
		{
			if(bodyA.GetDefinition().userData is typeA &&
					bodyB.GetDefinition().userData is typeB)
			{
				return true;
			}
			if(bodyB.GetDefinition().userData is typeA &&
					bodyA.GetDefinition().userData is typeB)
			{
				return true;
			}
			return false;
		}

		public function  checkBylletHitsFighter(bodyA:b2Body, bodyB:b2Body):Boolean
		{
			if(bodyA.GetDefinition().userData is FighterBullet || bodyB.GetDefinition().userData is FighterBullet)
			{
				return false;
			}


			return entitiesCollide(Fighter, Bullet,bodyA,bodyB);
		}
		public function checkBulletHitsFlyingEnemy(bodyA:b2Body, bodyB:b2Body):Boolean
		{
			return entitiesCollide(FlyingEnemy, FighterBullet,bodyA,bodyB);
		}

		public function checkBombsHitsGroundEnemy(bodyA:b2Body, bodyB:b2Body):Boolean
		{
			return entitiesCollide(Bomb,  GroundEnemy, bodyA, bodyB);
		}

		public function checkBombHitsGround(bodyA:b2Body, bodyB:b2Body):Boolean
		{
			return entitiesCollide(Bomb, Ground, bodyA, bodyB);
		}
	}
}
