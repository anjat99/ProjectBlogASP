using Blog.Application;
using Blog.Application.Commands.Comments;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Comments
{
    public class EFDeleteCommentCommand : IDeleteCommentCommand
    {
        private readonly BlogContext _context;
        private readonly IApplicationActor _actor;

        public EFDeleteCommentCommand(BlogContext context, IApplicationActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 13;

        public string Name => "Deleting Existing Command";

        public void Execute(int request)
        {
            var comment = _context.Comments.Find(request);

            if (comment == null)
            {
                throw new EntityNotFoundException(request, typeof(Comment));
            }

            if (_actor.Id != comment.UserId)
            {
                throw new ForbiddenAccessException(_actor, this.Name);
            }

            comment.SoftDelete();

            _context.SaveChanges();
        }
    }
}
