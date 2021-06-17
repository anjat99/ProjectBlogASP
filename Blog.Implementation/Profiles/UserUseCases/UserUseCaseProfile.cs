using AutoMapper;
using Blog.Application.DataTransfer.UserUseCases;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles.UserUseCases
{
    public class UserUseCaseProfile : Profile
    {
        public UserUseCaseProfile()
        {
            CreateMap<UserUseCase, UserUseCaseDto>();
            CreateMap<UserUseCaseDto, UserUseCase>();
        }
    }
}
