import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';

class Contact {
  Contact({this.name, this.email});
  final String name;
  final String email;
}

class ListPage extends StatelessWidget implements HasLayoutGroup {
  ListPage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: layoutGroup,
        layoutType: LayoutType.list,
        onLayoutToggle: onLayoutToggle,
      ),
      body: Container(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
        itemCount: allContacts.length,
        itemBuilder: (BuildContext content, int index) {
          Contact contact = allContacts[index];
          return ContactListTile(contact);
        });
  }
}

class ContactListTile extends ListTile {
  ContactListTile(Contact contact)
      : super(
    title: Text(contact.name),
    subtitle: Text(contact.email),
    leading: CircleAvatar(child: Text(contact.name[0])),
  );
}

List<Contact> allContacts = [
  Contact(name: 'Isa Tusa', email: 'isa.tusa@me.com'),
  Contact(name: 'Racquel Ricciardi', email: 'racquel.ricciardi@me.com'),
  Contact(name: 'Teresita Mccubbin', email: 'teresita.mccubbin@me.com'),
  Contact(name: 'Rhoda Hassinger', email: 'rhoda.hassinger@me.com'),
  Contact(name: 'Carson Cupps', email: 'carson.cupps@me.com'),
  Contact(name: 'Devora Nantz', email: 'devora.nantz@me.com'),
  Contact(name: 'Tyisha Primus', email: 'tyisha.primus@me.com'),
  Contact(name: 'Muriel Lewellyn', email: 'muriel.lewellyn@me.com'),
  Contact(name: 'Hunter Giraud', email: 'hunter.giraud@me.com'),
  Contact(name: 'Corina Whiddon', email: 'corina.whiddon@me.com'),
  Contact(name: 'Meaghan Covarrubias', email: 'meaghan.covarrubias@me.com'),
  Contact(name: 'Ulysses Severson', email: 'ulysses.severson@me.com'),
  Contact(name: 'Richard Baxter', email: 'richard.baxter@me.com'),
  Contact(name: 'Alessandra Kahn', email: 'alessandra.kahn@me.com'),
  Contact(name: 'Libby Saari', email: 'libby.saari@me.com'),
  Contact(name: 'Valeria Salvador', email: 'valeria.salvador@me.com'),
  Contact(name: 'Fredrick Folkerts', email: 'fredrick.folkerts@me.com'),
  Contact(name: 'Delmy Izzi', email: 'delmy.izzi@me.com'),
  Contact(name: 'Leann Klock', email: 'leann.klock@me.com'),
  Contact(name: 'Rhiannon Macfarlane', email: 'rhiannon.macfarlane@me.com'),
];