part of contact_manager;

class Contact {
  var name, phone, cell, mail;
  Contact(this.name, this.phone, this.cell, this.mail){}
}

var contactList = new List();

init() {
  contactList.add(new Contact("Contact 1", "555-2387", "666-2387", "contact1_mail@dartmail.com"));
  contactList.add(new Contact("Contact 2", "555-9138", "666-9138", "contact2_mail@dartmail.com"));
  contactList.add(new Contact("Contact 3", "555-0043", "666-0043", "contact3_mail@dartmail.com"));
  contactList.add(new Contact("Contact 4", "555-0256", "666-0256", "contact4_mail@dartmail.com"));
}