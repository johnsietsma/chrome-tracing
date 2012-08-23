using System.Runtime.InteropServices;

public static class EventTracer {

    [DllImport ("__Internal")]
    public static extern void StartTracing();

    [DllImport ("__Internal")]
    public static extern void StopTracing();

}
