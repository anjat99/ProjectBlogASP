using Blog.Application.DataTransfer.Categories;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.Categories
{
    public interface IUpdateCategoryCommand : ICommand<CategoryDto>
    {
    }
}
