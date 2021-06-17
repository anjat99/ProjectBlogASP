using AutoMapper;
using Blog.Application.DataTransfer.Categories;
using Blog.Application.Exceptions;
using Blog.Application.Queries.Categories;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Categories
{
    public class EFGetCategoryQuery : IGetCategoryQuery
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;

        public EFGetCategoryQuery(BlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 5;

        public string Name => "Single Category";

        public ReadCategoryDto Execute(int search)
        {
            var cat = _context.Categories.Find(search);

            if (cat == null)
            {
                throw new EntityNotFoundException(search, typeof(Category));
            }

            var category = _context.Categories.Include(x => x.Posts).Where(x => x.Id == search).FirstOrDefault();

            var result = _mapper.Map<ReadCategoryDto>(category);

            return result;
        }
    }
}
