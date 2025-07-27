# Hospital-
an simple Hospital system with dart
abstract class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

class Patient extends Person {
  String medicalHistory;
  List<Appointment> appointments = [];

  Patient(String name, int age, this.medicalHistory) : super(name, age) {
    appointments = [];
  }

  void addAppointment(Appointment appointment) {
    appointments.add(appointment);
  }
}

class Staff extends Person {
  String role;
  Department department;

  Staff(String name, int age, this.role, this.department) : super(name, age);
}

class Doctor extends Staff {
  String specialization;

  Doctor(
    String name,
    int age,
    String role,
    Department department,
    this.specialization,
  ) : super(name, age, role, department);
}

class Nurse extends Staff {
  Nurse(String name, int age, String role, Department department)
    : super(name, age, role, department);
}

class Department {
  String name;
  List<Doctor> doctors = [];
  List<Nurse> nurses = [];

  Department(this.name) {
    doctors = [];
    nurses = [];
  }

  void addDoctor(Doctor doctor) {
    doctors.add(doctor);
  }

  void addNurse(Nurse nurse) {
    nurses.add(nurse);
  }
}

class Appointment {
  Patient patient;
  Doctor doctor;
  DateTime dateTime;

  Appointment(this.patient, this.doctor, this.dateTime);
}

class Billing {
  List<Item> items=[];

  Billing() {
    items = [];
  }

  void addItem(Item item) {
    items.add(item);
  }

  double generateInvoice() {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}

class Item {
  String description;
  double price;

  Item(this.description, this.price);
}

class Hospital {
  List<Department> departments=[];
  List<Patient> patients=[];
  List<Staff> staff=[];

  Hospital() {
    departments = [];
    patients = [];
    staff = [];
  }

  void addDepartment(Department department) {
    departments.add(department);
  }

  void registerPatient(Patient patient) {
    patients.add(patient);
  }

  void addStaff(Staff staffMember) {
    staff.add(staffMember);
  }
}

void main() {
  Hospital hospital = Hospital();

  
  Department cardiology = Department("Cardiology");
  hospital.addDepartment(cardiology);

  
  Doctor doctor = Doctor("Dr. ahmed", 45, "Doctor", cardiology, "Cardiologist");
  hospital.addStaff(doctor);

  Patient patient = Patient("anan", 30, "No known allergies");
  hospital.registerPatient(patient);

  
  Appointment appointment = Appointment(patient, doctor, DateTime.now());
  patient.addAppointment(appointment);

  
  Billing billing = Billing();
  billing.addItem(Item("Consultation", 100.0));
  billing.addItem(Item("Lab Test", 50.0));
  double totalInvoice = billing.generateInvoice();

  print("Total Invoice: \$${totalInvoice}");
}
