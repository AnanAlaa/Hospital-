// Abstract class representing a person
abstract class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

// Class representing a Patient
class Patient extends Person {
  String medicalHistory;
  List<Appointment> appointments = [];

  Patient(String name, int age, this.medicalHistory) : super(name, age) {}

  void addAppointment(Appointment appointment) {
    appointments.add(appointment);
  }
}

// Class representing a Doctor
class Doctor extends Person {
  String specialization;
  Department department;

  Doctor(String name, int age, this.specialization, this.department)
    : super(name, age);
}

// Class representing a Department
class Department {
  String name;
  List<Doctor> doctors = [];

  Department(this.name) {}

  void addDoctor(Doctor doctor) {
    doctors.add(doctor);
  }
}

// Class representing an Appointment
class Appointment {
  Patient patient;
  Doctor doctor;
  DateTime dateTime;

  Appointment(this.patient, this.doctor, this.dateTime);
}

// Class representing Billing
class Billing {
  List<String> items = [];
  double total = 0.0;

  Billing() {
    items;
    total;
  }

  void addItem(String item, double price) {
    items.add(item);
    total += price;
  }

  void generateInvoice() {
    print("Invoice:");
    for (var item in items) {
      print(item);
    }
    print("Total: \$${total}");
  }
}

// Class representing the Hospital
class Hospital {
  List<Department> departments = [];
  List<Patient> patients = [];

  Hospital() {
    departments = [];
    patients = [];
  }

  void addDepartment(Department department) {
    departments.add(department);
  }

  void registerPatient(Patient patient) {
    patients.add(patient);
  }
}

// Example usage
void main() {
  // Create hospital
  Hospital hospital = Hospital();

  // Create departments
  Department cardiology = Department("Cardiology");
  Department pediatrics = Department("Pediatrics");

  // Add departments to hospital
  hospital.addDepartment(cardiology);
  hospital.addDepartment(pediatrics);

  // Create doctors
  Doctor doctor1 = Doctor("Dr. Smith", 45, "Cardiologist", cardiology);
  Doctor doctor2 = Doctor("Dr. Jones", 38, "Pediatrician", pediatrics);

  // Add doctors to departments
  cardiology.addDoctor(doctor1);
  pediatrics.addDoctor(doctor2);

  // Create a patient
  Patient patient1 = Patient("John Doe", 30, "No known allergies");

  // Register patient
  hospital.registerPatient(patient1);

  // Create an appointment
  Appointment appointment1 = Appointment(patient1, doctor1, DateTime.now());
  patient1.addAppointment(appointment1);

  // Create billing
  Billing billing = Billing();
  billing.addItem("Consultation Fee", 100.0);
  billing.addItem("Lab Test", 50.0);

  // Generate invoice
  billing.generateInvoice();
}
