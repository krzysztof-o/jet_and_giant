package utlis
{
	import flash.external.ExternalInterface;

	public function log(...args):void
	{
		CONFIG::DEBUG
		{
			if (ExternalInterface.available)
				ExternalInterface.call.apply(null, ["console.log"].concat(args));
		}
	}
}

