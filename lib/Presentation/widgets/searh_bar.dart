import 'package:flutter/material.dart';

class SearchBarCustoms extends StatefulWidget {
  const SearchBarCustoms({super.key});

  @override
  State<SearchBarCustoms> createState() => _SearchBarCustomsState();
}

class _SearchBarCustomsState extends State<SearchBarCustoms> {

  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            // padding: const WidgetStatePropertyAll<EdgeInsets>(
            //     EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              Tooltip(
                message: 'Change brightness mode',
                child: IconButton(
                  isSelected: isDark,
                  onPressed: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  icon: const Icon(Icons.wb_sunny_outlined),
                  selectedIcon: const Icon(Icons.brightness_2_outlined),
                ),
              )
            ],
          );
        }, suggestionsBuilder:
        (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
            });
          },
        );
      });
    });
  }
}
