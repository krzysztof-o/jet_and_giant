package game.entitymanager
{
	import Box2D.Collision.b2Manifold;
	import Box2D.Collision.b2WorldManifold;
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2ContactImpulse;
	import Box2D.Dynamics.b2ContactListener;

	import game.entities.Bomb;
	import game.entities.Ground;

	public class ContactListener extends b2ContactListener
	{
		public function ContactListener()
		{
			super();
		}

		public override function PreSolve(contact:b2Contact, oldManifold:b2Manifold):void
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

		public function checkBombHitsGround(bodyA:b2Body, bodyB:b2Body):Boolean
		{
			return entitiesCollide(Bomb, Ground, bodyA, bodyB);
		}
	}
}
