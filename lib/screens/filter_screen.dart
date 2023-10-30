import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  Function saveFilter;
  Map<String, bool> filter;
  FiltersScreen({required this.filter, required this.saveFilter});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filter['gluten'] as bool;
    _lactoseFree = widget.filter['lactose'] as bool;
    _vegan = widget.filter['vegan'] as bool;
    _vegetarian = widget.filter['vegetarian'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final f = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilter(f);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: const Text('Gluten-free'),
                subtitle: const Text('Only include gluten-free meals'),
                value: _glutenFree,
                onChanged: (value) => {
                  setState(() {
                    _glutenFree = value;
                  })
                },
              ),
              SwitchListTile(
                title: const Text('Latose-free'),
                subtitle: const Text('Only include latose-free meals'),
                value: _lactoseFree,
                onChanged: (value) => {
                  setState(() {
                    _lactoseFree = value;
                  })
                },
              ),
              SwitchListTile(
                title: const Text('Vegan'),
                subtitle: const Text('Only include vegan meals'),
                value: _vegan,
                onChanged: (value) => {
                  setState(() {
                    _vegan = value;
                  })
                },
              ),
              SwitchListTile(
                title: const Text('Vegetarian'),
                subtitle: const Text('Only include vegetarian meals'),
                value: _vegetarian,
                onChanged: (value) => {
                  setState(() {
                    _vegetarian = value;
                  })
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
