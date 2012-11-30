package game.entitymanager
{
	import Box2D.Collision.b2Manifold;
	import Box2D.Collision.b2WorldManifold;
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2ContactImpulse;
	import Box2D.Dynamics.b2ContactListener;

	import game.entities.Bomb;

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
		}
	}
}
