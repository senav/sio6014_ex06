library contact_manager;
import 'dart:html';

part '../model/entity_contact.dart';

void display() {
  TableElement table = document.query('#contactlist');
  for (var contact in contactList) {
    ajouterContactToList(table, contact);
  }
  ButtonElement btn_ajouter = document.query('#btn_ajouter');
  btn_ajouter.onClick.listen(ajouterNouveau);
}

void ajouterContactToList(TableElement table, Contact contact) {
  TableRowElement ligne = table.addRow();
  
  var tableName = new TextInputElement();
  tableName.value = contact.name;
  ligne.insertCell(0).children.add(tableName);

  var tablePhone = new TextInputElement();
  tablePhone.value = contact.phone;
  ligne.insertCell(1).children.add(tablePhone);
  
  var tableCell = new TextInputElement();
  tableCell.value = contact.cell;
  ligne.insertCell(2).children.add(tableCell);
  
  var tableMail = new TextInputElement();
  tableMail.value = contact.mail;
  ligne.insertCell(3).children.add(tableMail);
  
  var btn_delete = new ButtonInputElement();
  btn_delete.onClick.listen(supprimerContact);
  btn_delete.value = 'supprimer';
  ligne.insertCell(4).children.add(btn_delete);
}

void ajouterNouveau(Event e) {
  
  TextInputElement nouveauNom = document.query('#name');
  TextInputElement nouveauPhone = document.query('#phone');
  TextInputElement nouveauCell = document.query('#cell');
  TextInputElement nouveauMail = document.query('#mail');
  
    if (nouveauNom.validity.valid && nouveauPhone.validity.valid && nouveauCell.validity.valid && nouveauMail.validity.valid) 
    {
        
      if(nouveauNom.value == "" && (nouveauPhone.value == "" || nouveauMail.value == "") && nouveauCell.value == ""){
        //*todo message d'erreur
        
      }
        else
      {  
          var name = nouveauNom.value;
          var phone = nouveauPhone.value;
          var mail = nouveauMail.value;
          var cell = nouveauCell.value;
        
          TableElement table = document.query('#contactlist');
          var contact = new Contact(name, phone, cell, mail);
          ajouterContactToList(table, contact);
          
          nouveauNom.value = "";
          nouveauPhone.value = "";
          nouveauMail.value = "";
          nouveauCell.value = "";
          
          e.preventDefault();
      }    
   }
}

void supprimerContact(Event e) {
    Element cell = e.target;
    TableRowElement row = cell.parent.parent;
    TableElement table = row.parent.parent;
    table.deleteRow(table.rows.indexOf(row));
}

void main() {
  init();
  display();
}


