namespace CareerDayApi.Entities
{
    public class Session
    {
        public int Id { get; set; }
        public Classroom Classroom { get; set; }
        public List<Student> Students { get; set; } = [];
        public List<Speaker> Speakers { get; set; } = [];
        public int Period { get; set; }
        public Career Subject { get; set; }

        public void AddStudent(Student student)
        {
            if (Students.All(newStudent => newStudent.Id != student.Id)) {
                Students.Add(student);
            }
        }

        public void RemoveStudent(int studentId)
        {
            var student = Students.FirstOrDefault(student => student.Id == studentId);
            if (student == null) return;
            Students.Remove(student);
        }
    }
}