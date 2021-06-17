using AutoMapper;
using Blog.Application.DataTransfer.Categories;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Profiles.Categories
{
    public class GetCategoryProfile : Profile
    {
        public GetCategoryProfile()
        {
            CreateMap<Category, ReadCategoryDto>();
                //.ForMember(
                //dto => dto.Posts,
                //ent => ent.MapFrom(x =>
                //x.Posts.ToList()
                //));

            CreateMap<ReadCategoryDto, Category>();
            //.ForMember(
            //dto => dto.Posts,
            //ent => ent.MapFrom(x =>
            //x.Posts.Select(y => y.Id).ToList()
            //));


        }
    }
}
