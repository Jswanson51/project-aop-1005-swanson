
public aspect TraceAspectSwanson {


    /**
     * Application classes.
     */
    pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);

    /**
     * The methods of those classes.
     */
    pointcut methodToTrace():  classToTrace() &&  execution(* *(..));

    /**
     * Prints trace messages before and after executing methods.
     */
    before(): methodToTrace() {
        System.out.println("[BGN] " + thisJoinPointStaticPart.getSignature() + ", " +
                thisJoinPointStaticPart.getSourceLocation().getLine());
    }

    after(): methodToTrace() {
        System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
    }
}
