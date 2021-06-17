using AutoMapper;
using Blog.Application;
using Blog.Application.Commands.Comments;
using Blog.Application.DataTransfer.Comments;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Comments;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Comments
{
    public class EFUpdateCommentCommand : IUpdateCommentCommand
    {
        private readonly BlogContext _context;
        private readonly UpdateCommentValidator _validator;
        private readonly IApplicationActor _actor;
        private readonly IMapper _mapper;

        public EFUpdateCommentCommand(BlogContext context, UpdateCommentValidator validator, IApplicationActor actor, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
            _mapper = mapper;
        }

        public int Id => 14;

        public string Name => "Updating Existing Comment";

        public void Execute(UpdateCommentDto request)
        {
            _validator.ValidateAndThrow(request);

            var comment = _context.Comments.Find(request.Id);
            if (comment == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Comment));
            }

            if (_actor.Id != comment.UserId)
            {
                throw new ForbiddenAccessException(_actor, this.Name);
            }

            var commentQuery = _context.Comments.Where(x => x.Id == request.Id).FirstOrDefault();

            _mapper.Map(request, commentQuery);

            _context.SaveChanges();
        }
    }
}
