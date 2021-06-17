using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.DataAccess.Configurations
{
    public class CommentConfiguration : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.Property(x => x.Message)
                .IsRequired();

            builder.HasMany(c => c.CommentPosts)
                .WithOne(cp => cp.Comment)
                .HasForeignKey(cp => cp.CommentId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(c => c.CommentVotes)
                .WithOne(cp => cp.Comment)
                .HasForeignKey(cp => cp.CommentId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
