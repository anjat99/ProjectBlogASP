using Blog.Application;
using Blog.Application.Commands.Posts;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Posts
{
    public class EFDeletePostCommand : IDeletePostCommand
    {
        private readonly BlogContext _context;
        private readonly IApplicationActor _actor;

        public EFDeletePostCommand(BlogContext context, IApplicationActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 8;

        public string Name => "Deleting Existing Post";

        public void Execute(int request)
        {
            var post = _context.Posts.Find(request);

            if (post == null)
            {
                throw new EntityNotFoundException(request, typeof(Post));
            }

            if (_actor.Id != post.UserId)
            {
                throw new ForbiddenAccessException(_actor, this.Name);
            }

            //post.IsDeleted = true;
            //post.DeletedAt = DateTime.UtcNow;
            //post.IsActive = false;

            post.SoftDelete();

            _context.SaveChanges();
        }
    }
}
