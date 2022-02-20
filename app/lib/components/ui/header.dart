import 'package:flutter/material.dart';

class ItemData {
  final String label;
  final void Function() onPressed;

  const ItemData(this.label, this.onPressed);
}

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({Key? key}) : super(key: key);

  void exit(BuildContext context) {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Row(children: [
        HeaderItem(label: 'Arquivo', data: [
          ItemData('Novo serviço', () => print('new-service-path')),
          ItemData('Sair', () {
            exit(context);
          }),
        ]),
        HeaderItem(label: 'Editar', data: [
          ItemData('Desfazer', () => print('new-service-path')),
          ItemData('Refazer', () => print('new-service-path')),
          ItemData('Preferências', () => print('new-service-path')),
        ]),
        HeaderItem(label: 'Executar', data: [
          ItemData('Iniciar', () => print('new-service-path')),
          ItemData('Parar', () => print('new-service-path'))
        ]),
        HeaderItem(
            label: 'Terminal',
            data: [ItemData('Novo terminal', () => print('new-service-path'))]),
        HeaderItem(
            label: 'Ajuda',
            data: [ItemData('Sobre', () => print('new-service-path'))]),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(24.0);
}

class HeaderItem extends StatelessWidget {
  final String label;
  final List<ItemData> data;

  const HeaderItem({required this.label, required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: PopupMenuButton(
              tooltip: label,
              child: Text(label,
                  style: Theme.of(context).appBarTheme.toolbarTextStyle),
              itemBuilder: (BuildContext context) {
                return data
                    .map((ItemData d) => PopupMenuItem(
                        height: 24.0, onTap: d.onPressed, child: Text(d.label)))
                    .toList();
              }),
        ),
      ),
    );
  }
}
