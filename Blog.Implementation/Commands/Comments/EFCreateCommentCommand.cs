using AutoMapper;
using Blog.Application;
using Blog.Application.Commands.Comments;
using Blog.Application.DataTransfer.Comments;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Comments;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Comments
{
    public class EFCreateCommentCommand : ICreateCommentCommand
    {
        private readonly BlogContext _context;
        private readonly IApplicationActor _actor;
        private readonly CreateCommentValidator _validator;
        private readonly IMapper _mapper;

        public EFCreateCommentCommand(BlogContext context, CreateCommentValidator validator, IMapper mapper, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
            _actor = actor;
        }

        public int Id => 12;

        public string Name => "Create New Comment";

        public void Execute(CommentDto request)
        {
            _validator.ValidateAndThrow(request);

            request.UserId = _actor.Id;
           

            var comment = _mapper.Map<Comment>(request);

            comment.CommentPosts.Add(new PostComment
            {
                PostId = request.PostId.Value
            });

            _context.Comments.Add(comment);
            _context.SaveChanges();
        }
    }
}
