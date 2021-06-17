using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Exceptions
{
    public class ConflictBetweenEntititesException : Exception
    {
        public ConflictBetweenEntititesException(int id, Type type)
            : base($"Entity of type {type.Name} with an id of {id} belongs to other Entity!")
        {

        }
    }
}
