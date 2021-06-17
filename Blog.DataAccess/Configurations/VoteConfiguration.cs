using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.DataAccess.Configurations
{
    public class VoteConfiguration : IEntityTypeConfiguration<Vote>
    {
        public void Configure(EntityTypeBuilder<Vote> builder)
        {
            builder.Property(x => x.Mark)
                .IsRequired(false);

            //builder.Property(x => x.CommentId)
            //   .IsRequired();

            //builder.Property(x => x.UserId)
            //    .IsRequired();
        }
    }
}
