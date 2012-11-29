package utlis
{
    import flash.external.ExternalInterface;

    public function log(...args):void
    {
        if (ExternalInterface.available)
        {
            ExternalInterface.call.apply(null, ["console.log"].concat(args));
        }
    }
}

