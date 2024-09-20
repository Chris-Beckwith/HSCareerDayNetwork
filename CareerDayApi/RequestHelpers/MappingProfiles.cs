using AutoMapper;
using CareerDayApi.DTOs;
using CareerDayApi.Entities;

namespace CareerDayApi.RequestHelpers
{
    public class MappingProfiles : Profile
    {
        public MappingProfiles()
        {
            CreateMap<CreateSpeakerDto, Speaker>();
            CreateMap<UpdateSpeakerDto, Speaker>();
            CreateMap<UpdateSchoolDto, School>();
            CreateMap<UpdateCareerDto, Career>();
            CreateMap<UpdateCareerSetDto, CareerSet>();
            CreateMap<UpdateStudentDto, Student>();
            CreateMap<UpdateClassroomDto, Classroom>();
        }
    }
}