$(document).ready(function() {
    // Calculate the date that is 18 years ago
    var maxDate = new Date();
    maxDate.setFullYear(maxDate.getFullYear() - 18); // Subtract 18 years from current date
  
    // Initialize the datepicker with the maxDate set to 18 years ago
    $('#account_date_of_birth').datepicker({
      changeYear: true,
      changeMonth: true,
      yearRange: '1900:' + maxDate.getFullYear(), // Allow year range from 1900 to the calculated max year
      maxDate: maxDate, // Set maxDate to 18 years ago
      dateFormat: 'yy-mm-dd', // You can change the date format if needed
    });
  });
  