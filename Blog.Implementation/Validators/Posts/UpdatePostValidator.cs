using Blog.Application.DataTransfer.Posts;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Posts
{
    public class UpdatePostValidator : AbstractValidator<PostDto>
    {
        private const int maxSize = 2;
        private const int maxSizeMB = maxSize * 1024 * 1024;
        public UpdatePostValidator(BlogContext context)
        {
            RuleFor(x => x.Title)
               .NotEmpty()
               .WithMessage("Title is required.")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Title)
                   .Must((dto, name) => !context.Posts.Any(p => p.Title == name && p.Id != dto.Id))
                .WithMessage(p => $"Post with the title of {p.Title} already exists in database."); 
               }).MinimumLength(3).WithMessage("Title needs to have at least 3characters.");



            RuleFor(x => x.Description)
                //.NotEmpty()
                //.WithMessage("Description is required.")
                .MinimumLength(15).WithMessage("Description needs to have at least 15 characters.");


            

            RuleFor(x => x.Cover.Length)
                .NotNull()
                .LessThanOrEqualTo(maxSizeMB)
                .WithMessage($"File size is larger than {maxSize} MB");

            RuleFor(x => x.Cover.ContentType)
                .NotNull()
                .Must(x => x.Equals("image/jpeg") || x.Equals("image/jpg") || x.Equals("image/png"))
                .WithMessage("Allowed formats are jpeg/jpg/png");

            RuleFor(x => x.CategoryId)
                .NotEmpty()
                .WithMessage("Category is required.").DependentRules(() =>
                {
                    RuleFor(x => x.CategoryId).Must(x =>
                    {
                        return context.Categories.Any(c => c.Id == x);
                    }).WithMessage("Provided category doesn't exist.");
                });

        }
    }
}
