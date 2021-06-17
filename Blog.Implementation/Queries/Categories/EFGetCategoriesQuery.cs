using AutoMapper;
using Blog.Application.DataTransfer.Categories;
using Blog.Application.Queries;
using Blog.Application.Queries.Categories;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Categories
{
    public class EFGetCategoriesQuery : IGetCategoriesQuery 
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;

        public EFGetCategoriesQuery(BlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 4;

        public string Name => "Category Search";

        public PagedResponse<CategoryDto> Execute(CategorySearch search)
        {
            var query = _context.Categories.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            //var skipCount = search.PerPage * (search.Page - 1);

            //var response = new PagedResponse<CategoryDto>
            //{
            //    CurrentPage = search.Page,
            //    ItemsPerPage = search.PerPage,
            //    TotalCount = query.Count(),
            //    Items = query.Skip(skipCount).Take(search.PerPage).Select(t => new CategoryDto
            //    {
            //        Id = t.Id,
            //        Name = t.Name
            //    }).ToList()
            //};

            //return response;
           return query.Paged<CategoryDto, Category>(search, _mapper);
        }
    }
}
