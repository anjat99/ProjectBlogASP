using Blog.Application.DataTransfer.Categories;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Categories
{
    public class CreateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public CreateCategoryValidator(BlogContext context)
        {
            RuleFor(c => c.Name).NotEmpty().WithMessage("The name of category is required.")
                                .MinimumLength(3).WithMessage("Min length of name is 3 characters")
                                .Must(name => !context.Categories.Any(c => c.Name == name))
                                .WithMessage("Category Name must be unique");
        }
    }
}
