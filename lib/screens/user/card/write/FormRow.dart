import 'package:flutter/material.dart';

class FormRow extends StatelessWidget {
  FormRow({required this.title, this.subtitle, this.trailing, this.onTap});

  final Widget title;

  final Widget? subtitle;

  final Widget? trailing;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
          constraints: const BoxConstraints(minHeight: 48),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 17),
                      child: title,
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: DefaultTextStyle(
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 15),
                          child: subtitle!,
                        ),
                      ),
                  ],
                ),
              ),
              if (trailing != null)
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 16),
                  child: IconTheme(
                    data: IconThemeData(
                        color: Theme.of(context).disabledColor, size: 22),
                    child: trailing!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
