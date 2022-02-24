import 'package:app/app/utils.dart';
import 'package:app/components/pages/home/edit-service/edit_service.dart';
import 'package:flutter/material.dart';

class ItemData {
  final String label;
  final void Function() onPressed;

  const ItemData(this.label, this.onPressed);
}

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String path, {Object? arguments}) onNavigate;

  const AppHeader({required this.onNavigate, Key? key}) : super(key: key);

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
          ItemData('Novo serviço', () {
            onNavigate(EditServicePage.newRoute);
          }),
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

class PageHeader extends StatelessWidget {
  final String title;
  final bool backPath;
  final Widget? action;

  const PageHeader(
      {required this.title, this.backPath = false, this.action, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                backPath
                    ? IconButton(
                        onPressed: () {
                          Navigator.of(context).maybePop();
                        },
                        icon: const Icon(Icons.keyboard_arrow_left))
                    : Container(),
                Text(title,
                    style: const TextStyle(
                        fontSize: 36.0, fontWeight: FontWeight.bold)),
              ],
            ),
            action ?? Container()
          ],
        ),
        const Divider()
      ],
    );
  }
}
