using AutoMapper;
using Blog.Application.Commands.Categories;
using Blog.Application.DataTransfer.Categories;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators;
using Blog.Implementation.Validators.Categories;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Categories
{
    public class EFCreateCategoryCommand : ICreateCategoryCommand
    {
        private readonly BlogContext _context; 
        private readonly CreateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EFCreateCategoryCommand(BlogContext context, CreateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 1;

        public string Name => "Create New Category";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = _mapper.Map<Category>(request);

            _context.Categories.Add(category);

            _context.SaveChanges();
        }
    }
}
