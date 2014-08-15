require './lib/dr'
require './lib/specialty'
require './lib/insurance'
require './lib/patient'

DB = PG.connect({:dbname => 'dr_office'})

def main_menu
  loop do
    system 'clear'
    puts "***DOCTOR'S OFFICE***"
    puts "Type '1' to add a patient"
    puts "Type '2' to add a doctor"
    puts "Type 'p' to list all patients"
    puts "Type 'd' to list all doctors"
    puts "Type 'a' to assign a doctor to a patient"
    puts "Type 'x' to exit the Doctor's Office database"

    user_input = gets.chomp

    if user_input == '1'
      add_patient
    elsif user_input == '2'
      add_doctor
    elsif user_input == 'p'
      list_patients
    elsif user_input == 'd'
      list_doctors
    elsif user_input == 'a'
      assign_doctor
    elsif user_input == 'x'
      exit
    else
      "Not a valid input."
      main_menu
    end
  end
end
main_menu
