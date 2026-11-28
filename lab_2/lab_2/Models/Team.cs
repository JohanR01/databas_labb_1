using System.ComponentModel.DataAnnotations;

namespace lab_2.Models
{
   public class Team
    {
        [Required]
        public int TeamsID {get; set;}
        public string Name {get; set;}
        public string Country {get; set;}
    }
}