import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  const FormSection(
      {super.key, required this.children, this.header, this.footer});

  final List<Widget> children;

  final Widget? header;

  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: [
          if (header != null)
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.fromLTRB(16, 0, 10, 4),
              constraints: const BoxConstraints(minHeight: 36),
              child: DefaultTextStyle(
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                child: header!,
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: Theme.of(context).dividerColor),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              children: List.generate(
                children.isEmpty ? 0 : children.length * 2 - 1,
                (i) => i.isOdd
                    ? const Divider(height: 1, thickness: 1)
                    : children[i ~/ 2],
              ),
            ),
          ),
          if (footer != null)
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(16, 4, 10, 0),
              constraints: const BoxConstraints(minHeight: 36),
              child: DefaultTextStyle(
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                child: footer!,
              ),
            ),
        ],
      ),
    );
  }
}
