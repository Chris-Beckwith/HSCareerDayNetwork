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
        }
    }
}