import 'package:flutter/material.dart';

class SectionCard extends StatefulWidget {
  final String title;
  final Icono icono;
  final void Function() accion;
  final List<Widget> children;
  const SectionCard({
    required this.title,
    required this.icono,
    required this.accion,
    required this.children,
    super.key,
  });

  @override
  State<SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard> {
  IconData? icon;
  @override
  void initState() {
    if (widget.icono == Icono.edit) icon = Icons.edit;
    if (widget.icono == Icono.link) icon = Icons.link;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      height: 200,
      width: 800,
      child: Card(
        elevation: 6.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          child: SelectableRegion(
            focusNode: FocusNode(),
            selectionControls: emptyTextSelectionControls,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    icon == null
                        ? const SizedBox(
                            height: 40,
                          )
                        : IconButton(
                            onPressed: widget.accion,
                            icon: Icon(icon),
                          ),
                  ],
                ),
                ...widget.children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Icono {
  none,
  edit,
  link,
}
