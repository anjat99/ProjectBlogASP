using Blog.Application.Commands.Categories;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Categories
{
    public class EFDeleteCategoryCommand : IDeleteCategoryCommand
    {
        private readonly BlogContext _context;

        public EFDeleteCategoryCommand(BlogContext context)
        {
            _context = context;
        }

        public int Id => 2;

        public string Name => "Deleting Existing Category";

        public void Execute(int request)
        {
            var category = _context.Categories.Find(request);

            if (category == null)
            {
                throw new EntityNotFoundException(request, typeof(Category));
            }

            if (category.Posts.Any())
            {
                throw new ConflictBetweenEntititesException(request, typeof(Category));
            }

            //category.IsDeleted = true;
            //category.DeletedAt = DateTime.UtcNow;
            //category.IsActive = false;
            category.SoftDelete();

            _context.SaveChanges();
        }
    }
}
