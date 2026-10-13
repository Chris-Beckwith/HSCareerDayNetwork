namespace CareerDayApi.Entities
{
    //Unbound
    public class EventPhase
    {
        public int Id { get; set; }
        public string PhaseName { get; set; }
    }

    public enum EventPhaseId
    {
        Setup = 1,
        SurveyInProgress = 2,
        SurveyClosed = 3,
        ScheduleGenerated = 4,
        ScheduleLocked = 5,
        Completed = 6,
        Cancelled = 7
    }
}