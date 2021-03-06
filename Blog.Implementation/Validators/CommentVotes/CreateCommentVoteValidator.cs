using Blog.Application.DataTransfer.CommentVotes;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Validators.CommentVotes
{
    public class CreateCommentVoteValidator : AbstractValidator<CommentVoteDto>
    {
        public CreateCommentVoteValidator()
        {

            RuleFor(x => x.CommentId).NotEmpty();

            RuleFor(x => x.UserId).NotEmpty();

            RuleFor(x => x.Mark)
                .NotEmpty().GreaterThanOrEqualTo(1).WithMessage("Value of vote has to be greater or equal than 1").LessThanOrEqualTo(5).WithMessage("Value of vote has to be less or equal than 5");
                //.ExclusiveBetween(1,6)
                //.WithMessage("Mark must be in the range between 1 and 5");
        }
    }
}
