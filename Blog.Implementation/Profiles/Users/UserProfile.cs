using AutoMapper;
using Blog.Application.DataTransfer.Users;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Profiles.Users
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<User, UserDto>()
                .ForMember(dto => dto.UserUseCases, opt => opt.MapFrom(x => x.UserUseCases.Select(y => y.UseCaseId).ToList()));

            CreateMap<UserDto, User>();
        }
    }
}
