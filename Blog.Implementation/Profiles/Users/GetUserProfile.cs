using AutoMapper;
using Blog.Application.DataTransfer.Users;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Profiles.Users
{
    public class GetUserProfile : Profile
    {
        public GetUserProfile()
        {
            CreateMap<User, ReadUserDto>();
            //.ForMember(dto => dto.UserUseCase,opt => opt.MapFrom(x =>x.UserUseCases.Select(y => y.UseCaseId).ToList()))
            //.ForMember(dto => dto.Posts, opt=>opt.MapFrom(x=>x.Posts.Select(p=>p.Title).ToList()));

            CreateMap<ReadUserDto, User>();
                //.ForMember(x => x.Posts, opt => opt.Ignore())
                //.ForMember(x => x.UserUseCases, opt => opt.Ignore()); 
        }
    }
}
