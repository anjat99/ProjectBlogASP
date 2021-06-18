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
    public class EFUpdateCommentVoteCommand : IUpdateCommentVoteCommand
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;
        private readonly UpdateCommentVoteValidator _validator;

        public EFUpdateCommentVoteCommand(BlogContext context, IMapper mapper, IApplicationActor actor, UpdateCommentVoteValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _actor = actor;
            _validator = validator;
        }

        public int Id => 17;

        public string Name => "Update Vote for Comment";

        public void Execute(UpdateCommentVoteDto request)
        {
            _validator.ValidateAndThrow(request);
            var v = _context.Votes.Where(x => x.Comment.Id == request.CommentId).FirstOrDefault();
            request.UserId = _actor.Id;

            if (v != null && v.Mark > 0 && v.Mark <= 5)
            {
                var vote = _mapper.Map<Vote>(request);

                _context.Votes.Add(vote);
                _context.SaveChanges();
            }

          
        }
    }
}
