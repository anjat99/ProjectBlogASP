using AutoMapper;
using Blog.Application.Commands.Categories;
using Blog.Application.DataTransfer.Categories;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Categories;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Categories
{
    public class EFUpdateCategoryCommand : IUpdateCategoryCommand
    {
        private readonly BlogContext _context;
        private readonly UpdateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdateCategoryCommand(BlogContext context, UpdateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 3;

        public string Name => "Updating Existing Category";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var cat = _context.Categories.Find(request.Id);

            if (cat == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Category));
            }

            var category = _context.Categories.Where(x => x.Id == request.Id).FirstOrDefault();
            _mapper.Map(request, category);

            _context.SaveChanges();
        }
    }
}
