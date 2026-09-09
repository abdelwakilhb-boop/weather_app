class GetDays {
 String getDays(int dayNum){
   List<String> days = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ];

    return days[dayNum-1];
    
      }
}