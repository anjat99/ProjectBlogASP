using Blog.Application.DataTransfer.Categories;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Categories
{
    public class UpdateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public UpdateCategoryValidator(BlogContext context)
        {
            RuleFor(c => c.Name).NotEmpty().MinimumLength(3)
                                .Must((dto, name) => !context.Categories.Any(c => c.Name == name && c.Id != dto.Id))
                                .WithMessage(c => $"Category with the name of {c.Name} already exists.");
        }
    }
}
