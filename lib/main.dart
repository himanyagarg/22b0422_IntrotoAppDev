import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Tracker'),
      ),
      body: Column(
        children: [
          
          SizedBox(height: 20),
          Text('User Name', style: TextStyle(fontSize: 24)),
          SizedBox(height: 10),
          Text('Total Expenses: \$500', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Category 1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpenseScreen(category: 'Category 1'),
                ),
              );
            },
          ),
          
        ],
      ),
    );
  }
}
class ExpenseScreen extends StatelessWidget {
  final String category;

  ExpenseScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses - $category'),
      ),
      body: ListView.builder(
        itemCount: 5, 
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Expense ${index + 1}'),
            subtitle: Text('\$50'), 
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddExpenseScreen(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add New Expense',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(labelText: 'Expense Amount'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 3,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              
              Navigator.pop(context);
            },
            child: Text('Add Expense'),
          ),
        ],
      ),
    );
  }
}
