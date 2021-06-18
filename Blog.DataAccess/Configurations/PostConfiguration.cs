using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.DataAccess.Configurations
{
    public class PostConfiguration : IEntityTypeConfiguration<Post>
    {
        public void Configure(EntityTypeBuilder<Post> builder)
        {
            builder.Property(x => x.Cover)
                .IsRequired()
                .HasMaxLength(255);
            
            builder.Property(x => x.Title)
                .IsRequired()
                .HasMaxLength(255);

            builder.Property(x => x.Description)
                .IsRequired();

            //builder.Property(x => x.IsPublished)
            //    .IsRequired().HasDefaultValue(false);

            //builder.Property(x => x.PublishedAt)
            //    .IsRequired();

            //relationships
            builder.HasMany(u => u.PostComments)
                .WithOne(c => c.Post)
                .HasForeignKey(c => c.PostId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
