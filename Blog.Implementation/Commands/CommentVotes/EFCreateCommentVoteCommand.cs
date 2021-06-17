using AutoMapper;
using Blog.Application;
using Blog.Application.Commands.CommentVotes;
using Blog.Application.DataTransfer.CommentVotes;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.CommentVotes;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.CommentVotes
{
    public class EFCreateCommentVoteCommand : ICreateCommentVoteCommand
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;
        private readonly CreateCommentVoteValidator _validator;

        public EFCreateCommentVoteCommand(BlogContext context, IMapper mapper, IApplicationActor actor, CreateCommentVoteValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _actor = actor;
            _validator = validator;
        }

        public int Id => 16;

        public string Name => "Create Vote for Comment";

        public void Execute(CommentVoteDto request)
        {
            _validator.ValidateAndThrow(request);
            var v = _context.Votes.Where(x => x.Comment.Id == request.CommentId && x.UserId == request.UserId).FirstOrDefault();

            if (v != null && v.Mark > 0 && v.Mark <= 5)
            {
                var vote = _mapper.Map<Vote>(request);

                _context.Votes.Add(vote);
                _context.SaveChanges();
            }
        }
    }
}
