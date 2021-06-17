using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Blog.Implementation.Commands
{
    public static class CoverImage
    {
       
        private static string apiPath = Directory.GetCurrentDirectory();
        private static string path = Path.Combine(apiPath, "wwwroot", "images");
        public static string UploadCoverImage(IFormFile image)
        {
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(image.FileName);

            var newFileName = guid + extension;

            var uploadPath = Path.Combine(path, newFileName);

            using (var fileStream = new FileStream(uploadPath, FileMode.Create))
            {
                image.CopyTo(fileStream);
            }

            return newFileName;
        }

        public static string UpdateCoverImage(IFormFile image, string fileName)
        {
            var deletePath = Path.Combine(path, fileName);
            if (File.Exists(deletePath))
                File.Delete(deletePath);
            return UploadCoverImage(image);
        }
    }
}
